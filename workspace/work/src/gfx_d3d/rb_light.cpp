// Light grid lookup, packed colors and light visibility history.
#include "gfx.h"
#include <stddef.h>
#include <universal/com_math.h>

extern const dvar_t *r_showMissingLightGrid;
extern const dvar_t *r_showLightGrid;
extern const dvar_t *r_vc_makelog;
extern GfxBackEndData *backEndData;
extern byte *s_vc_log;
extern int s_vc_logCount;
void R_AddDebugBox(DebugGlobals *debug, const float *mins, const float *maxs, const float *color);
typedef char gridLayoutCheck[(sizeof(GfxLightGridPoint) == 8
    && offsetof(GfxLightGridPoint, xyzLowBitsAndSunVisible) == 4
    && offsetof(GfxLightGridPoint, colorsIndex) == 6
    && sizeof(GfxLightGridColors) == 24
    && sizeof(GfxLightGrid) == 16
    && offsetof(GfxBackEndData, debugGlobals) == 0x249d18
    && offsetof(refimport_t, CM_BoxSightTrace) == 0x168) ? 1 : -1];

// PINNED 10035fb0: a miss returns the predecessor, including -1.
bool RB_FindGridPoint(const GfxLightGrid *grid, int x, int y, int z, int *index)
{
    unsigned int high = ((((unsigned int)x & ~3U) << 11) | ((unsigned int)y & ~3U)) << 8;
    high |= (unsigned int)(z >> 2);
    byte low = (byte)(((((unsigned int)x << 2) | (y & 3)) << 2 | (z & 3)) << 2);
    int bottom = 0;
    int top = grid->pointCount - 1;
    while (bottom <= top)
    {
        int middle = (top + bottom) >> 1;
        const GfxLightGridPoint *point = &grid->points[middle];
        int compare = (int)(point->xyzHighBits - high);
        if (!compare)
        {
            compare = (point->xyzLowBitsAndSunVisible - low) & ~1;
            if (!compare)
            {
                *index = middle;
                return true;
            }
        }
        if (compare < 0)
            bottom = middle + 1;
        else
            top = middle - 1;
    }
    *index = top;
    return false;
}

// PINNED 10036100: three groups of eight coefficients, not RGB per direction.
void RB_AccumulateGridColors(vec4_t *out, const GfxLightGridColors *colors, float weight)
{
    weight *= 1.0f / 255.0f;
    float *destination = &out[0][0];
    for (int group = 0; group < 3; ++group)
        for (int coefficient = 0; coefficient < 8; ++coefficient)
        {
            *destination += colors->rgb[group][coefficient] * weight;
            ++destination;
        }
}

// PINNED 100361e0.
void RB_ScaleGridColors(vec4_t *out, float scale)
{
    out[0][0] *= scale; out[0][1] *= scale; out[0][2] *= scale; out[0][3] *= scale;
    out[1][0] *= scale; out[1][1] *= scale; out[1][2] *= scale; out[1][3] *= scale;
    out[2][0] *= scale; out[2][1] *= scale; out[2][2] *= scale; out[2][3] *= scale;
    out[3][0] *= scale; out[3][1] *= scale; out[3][2] *= scale; out[3][3] *= scale;
    out[4][0] *= scale; out[4][1] *= scale; out[4][2] *= scale; out[4][3] *= scale;
    out[5][0] *= scale; out[5][1] *= scale; out[5][2] *= scale; out[5][3] *= scale;
}

// PINNED 100362d0.
void RB_DefaultGridColors(vec4_t *out)
{
    out[0][0] = 0.0f; out[0][1] = 1.0f; out[0][2] = 0.0f; out[0][3] = 1.0f;
    out[1][0] = 0.0f; out[1][1] = 1.0f; out[1][2] = 0.0f; out[1][3] = 1.0f;
    out[2][0] = 0.0f; out[2][1] = 0.0f; out[2][2] = 1.0f; out[2][3] = 1.0f;
    out[3][0] = 0.0f; out[3][1] = 0.0f; out[3][2] = 1.0f; out[3][3] = 1.0f;
    out[4][0] = 0.0f; out[4][1] = 0.0f; out[4][2] = 0.0f; out[4][3] = 0.0f;
    out[5][0] = 1.0f; out[5][1] = 1.0f; out[5][2] = 1.0f; out[5][3] = 1.0f;
}

// PINNED 10036320: retail deliberately consumes the predecessor on a miss.
bool RB_GetNearestGridColors(const GfxLightGrid *grid, int x, int y, int z,
    vec4_t *out, float *sunVisibility)
{
    if ((rgp.world && r_showMissingLightGrid->current.enabled) || !grid->pointCount)
        return false;
    int index;
    RB_FindGridPoint(grid, x, y, z, &index);
    const GfxLightGridPoint *point = &grid->points[index];
    RB_AccumulateGridColors(out, &grid->colors[point->colorsIndex], 1.0f);
    *sunVisibility = (point->xyzLowBitsAndSunVisible & 1) ? 1.0f : 0.0f;
    return true;
}

// PINNED 10035bd0: six-byte records in the existing history allocation.
bool RB_InsertGridVisLog(int index, unsigned short x, unsigned short y, unsigned short z)
{
    if (s_vc_logCount >= 0x400000)
        return false;
    memmove(s_vc_log + (index + 1) * 6, s_vc_log + index * 6,
        (s_vc_logCount - index) * 6);
    ((unsigned short *)s_vc_log)[index * 3] = x;
    ((unsigned short *)s_vc_log)[index * 3 + 1] = y;
    ((unsigned short *)s_vc_log)[index * 3 + 2] = z;
    ++s_vc_logCount;
    return true;
}

// PINNED 10035c40: existing keys do not consume capacity.
int RB_GridVisLogIndex(int x, int y, int z, int insert)
{
    int top = s_vc_logCount - 1;
    int bottom = 0;
    while (bottom <= top)
    {
        int middle = (bottom + top) >> 1;
        const unsigned short *entry = (const unsigned short *)(s_vc_log + middle * 6);
        int compare = x - entry[0];
        if (!compare)
        {
            compare = y - entry[1];
            if (!compare)
            {
                compare = z - entry[2];
                if (!compare)
                    return middle;
            }
        }
        if (compare < 0)
            top = middle - 1;
        else
            bottom = middle + 1;
    }
    if (insert && RB_InsertGridVisLog(bottom, x, y, z))
        return bottom;
    return -1;
}

// PINNED 10035a50.
void RB_DrawGridPointBox(const float *origin, float radius, const float *color)
{
    vec3_t mins, maxs;
    for (int axis = 0; axis < 3; ++axis)
        mins[axis] = origin[axis] - radius;
    for (int axis = 0; axis < 3; ++axis)
        maxs[axis] = origin[axis] + radius;
    R_AddDebugBox(&backEndData->debugGlobals, mins, maxs, color);
}

// PINNED 10035940.
void RB_DrawGridSampleBox(const float *origin)
{
    vec3_t mins, maxs;
    for (int axis = 0; axis < 3; ++axis)
        mins[axis] = origin[axis] - 0.5f;
    for (int axis = 0; axis < 3; ++axis)
        maxs[axis] = origin[axis] + 0.5f;
    R_AddDebugBox(&backEndData->debugGlobals, mins, maxs, colorBlue);
}

// PINNED 100359c0: integer wrapping precedes signed conversion to float.
void RB_DrawGridCellBox(int x, int y, int z)
{
    vec3_t mins, maxs;
    mins[0] = (float)(int)(((unsigned int)x - 4096U) << 5);
    mins[1] = (float)(int)(((unsigned int)y - 4096U) << 5);
    mins[2] = (float)(int)(((unsigned int)z - 2048U) << 6);
    maxs[0] = mins[0] + 32.0f;
    maxs[1] = mins[1] + 32.0f;
    maxs[2] = mins[2] + 64.0f;
    R_AddDebugBox(&backEndData->debugGlobals, mins, maxs, colorWhite);
}

// PINNED 10035ac0: an unset corner bit avoids the collision query entirely.
bool RB_IsGridPointVisible(const GfxLightGridPoint *point, unsigned int corner,
    const float *pointOrigin, const float *sampleOrigin)
{
    if (!(point->needsTrace & (byte)(1U << (corner & 31))))
    {
        if (r_showLightGrid->current.enabled)
            RB_DrawGridPointBox(pointOrigin, 0.9f, colorGreen);
        return true;
    }
    vec3_t direction, end;
    VectorSubtract(sampleOrigin, pointOrigin, direction);
    Vec3Normalize(direction);
    for (int axis = 0; axis < 3; ++axis)
        end[axis] = pointOrigin[axis] + direction[axis] * 0.01f;
    if (ri.CM_BoxSightTrace(0, sampleOrigin, end, vec3_origin, vec3_origin, 0, 0x2001))
    {
        if (r_showLightGrid->current.enabled)
            RB_DrawGridPointBox(pointOrigin, 1.1f, colorRed);
        return false;
    }
    if (r_showLightGrid->current.enabled)
        RB_DrawGridPointBox(pointOrigin, 1.0f, colorYellow);
    return true;
}

// PINNED 10036040: logging precedes lookup; callers still see trace rejection.
const GfxLightGridPoint *RB_GetValidGridPoint(const GfxLightGrid *grid,
    int x, int y, int z, unsigned int corner, const float *sampleOrigin)
{
    if (r_vc_makelog->current.integer)
        RB_GridVisLogIndex(x, y, z, true);
    int index;
    if (!RB_FindGridPoint(grid, x, y, z, &index))
        return 0;
    vec3_t origin;
    origin[0] = (float)(int)(((unsigned int)x - 4096U) << 5);
    origin[1] = (float)(int)(((unsigned int)y - 4096U) << 5);
    origin[2] = (float)(int)(((unsigned int)z - 2048U) << 6);
    if (!RB_IsGridPointVisible(&grid->points[index], corner, origin, sampleOrigin))
        return 0;
    return &grid->points[index];
}

/* PINNED 100363a0. Reuse the existing biased rounding helper; exact FP
   instruction spelling remains unaccepted and its assembly is not C++ credit. */
float RB_GetLightingAtPoint(const GfxLightGrid *grid, const float *sampleOrigin, vec4_t *out)
{
    int cell[3];
    float weights[3][2];
    for (int axis = 0; axis < 3; ++axis)
    {
        float shifted = sampleOrigin[axis] + 131072.0f;
        cell[axis] = I_fround(shifted - 0.5f) >> (axis == 2 ? 6 : 5);
        weights[axis][1] = shifted * (axis == 2 ? 0.015625f : 0.03125f) - cell[axis];
        weights[axis][0] = 1.0f - weights[axis][1];
    }
    if (r_showLightGrid->current.enabled)
    {
        RB_DrawGridCellBox(cell[0], cell[1], cell[2]);
        RB_DrawGridSampleBox(sampleOrigin);
    }
    memset(out, 0, 6 * sizeof(vec4_t));
    float totalWeight = 0.0f;
    float sunWeight = 0.0f;
    for (unsigned int corner = 0; corner < 8; ++corner)
    {
        const GfxLightGridPoint *point = RB_GetValidGridPoint(grid,
            cell[0] + (corner & 1), cell[1] + ((corner >> 1) & 1),
            cell[2] + ((corner >> 2) & 1), corner, sampleOrigin);
        if (!point)
            continue;
        float weight = weights[1][(corner >> 1) & 1] * weights[2][(corner >> 2) & 1]
            * weights[0][corner & 1];
        totalWeight += weight;
        RB_AccumulateGridColors(out, &grid->colors[point->colorsIndex], weight);
        if (point->xyzLowBitsAndSunVisible & 1)
            sunWeight += weight;
    }
    if (totalWeight < 0.98f)
    {
        if (totalWeight == 0.0f)
        {
            if (!RB_GetNearestGridColors(grid,
                cell[0] + (weights[0][1] > 0.5f), cell[1] + (weights[1][1] > 0.5f),
                cell[2] + (weights[2][1] > 0.5f), out, &sunWeight))
                RB_DefaultGridColors(out);
        }
        else
        {
            float inverseWeight = 1.0f / totalWeight;
            sunWeight *= inverseWeight;
            RB_ScaleGridColors(out, inverseWeight);
        }
    }
    return sunWeight;
}

typedef char entityLightingLayoutCheck[(offsetof(GfxEntity, renderFxFlags) == 4
    && offsetof(GfxEntity, origin) == 0x3c
    && offsetof(GfxWorld, lightGrid) == 0x11c
    && sizeof(GfxEntityLighting) == 104
    && offsetof(r_backEndGlobals_t, viewCount) == 0x3b4) ? 1 : -1];
extern r_backEndGlobals_t backEnd;

// PINNED 100366b0: publish viewCount before sampling, with no missing-world guard.
void RB_SetupEntityLighting(const GfxEntity *entity, GfxEntityLighting *lighting)
{
    lighting->viewCount = backEnd.viewCount;
    vec3_t origin;
    if (entity->renderFxFlags & 0x80)
        VectorCopy(entity->lighting.origin, origin);
    else
    {
        VectorCopy(entity->origin, origin);
        origin[2] += 4.0f;
    }
    lighting->sunVisibility = RB_GetLightingAtPoint(&rgp.world->lightGrid, origin, lighting->colorForDir);
}

// PINNED Win 1.0 light fitting helpers 10036720--1003766b.
// Names are descriptive; Mac's monolithic draft is not a PC function boundary.

static const vec3_t lightBasis[8] = {
    {0.0f, 0.0f, -1.0f},
    {0.942809045f, 0.0f, 0.333333343f},
    {-0.471404523f, 0.816496551f, 0.333333343f},
    {0.471404523f, 0.816496551f, 0.333333343f},
    {-0.471404523f, -0.816496551f, -0.333333343f},
    {0.471404523f, -0.816496551f, -0.333333343f},
    {-0.942809045f, 0.0f, -0.333333343f},
    {0.0f, 0.0f, 1.0f}
};

static void RB_InterleaveLightColors(const float *colors, vec3_t *error)
{
    for (int i = 0; i < 8; ++i)
    {
        error[i][0] = colors[i];
        error[i][1] = colors[8 + i];
        error[i][2] = colors[16 + i];
    }
}

static void RB_AverageLightColors(const float *colors, float *average)
{
    average[0] = 0.0f;
    average[1] = 0.0f;
    average[2] = 0.0f;
    for (int i = 0; i < 8; ++i)
    {
        average[0] += colors[i];
        average[1] += colors[8 + i];
        average[2] += colors[16 + i];
    }
    average[0] *= 0.125f;
    average[1] *= 0.125f;
    average[2] *= 0.125f;
}

static inline float RB_LightErrorIntensity(const float *color)
{
    float blue = color[2] * 0.114f;
    float red = color[0] * 0.299f;
    float green = color[1] * 0.587f;
    return blue + red + green;
}

static bool RB_FitDirectionalLight(int lightIndex, vec3_t *error, D3DLIGHT9 *lights)
{
    vec3_t direction = {0.0f, 0.0f, 0.0f};
    vec3_t diffuse;
    vec3_t ambient;
    float errorTotal = 0.0f;
    float totalWeight;
    float remainingError;
    int i;

    for (i = 0; i < 8; ++i)
    {
        float intensity = RB_LightErrorIntensity(error[i]);
        float weight = fabsf(intensity);
        VectorMA(direction, weight, lightBasis[i], direction);
        errorTotal += intensity * intensity;
    }
    if (errorTotal < 0.0008f)
        return false;
    totalWeight = 0.0f;
    Vec3Normalize(direction);
    diffuse[0] = 0.0f;
    diffuse[1] = 0.0f;
    diffuse[2] = 0.0f;
    for (i = 0; i < 8; ++i)
    {
        float dot = lightBasis[i][0] * direction[0]
            + lightBasis[i][2] * direction[2] + lightBasis[i][1] * direction[1];
        // The target's unordered comparison falls through into accumulation.
        if (dot <= 0.01f)
            continue;
        VectorMA(diffuse, dot, error[i], diffuse);
        totalWeight += dot;
    }
    if (totalWeight != 0.0f)
    {
        float scale = 1.0f / totalWeight;
        VectorScale(diffuse, scale, diffuse);
    }
    ambient[0] = ambient[1] = ambient[2] = 0.0f;
    for (i = 0; i < 8; ++i)
    {
        float dot = DotProduct(lightBasis[i], direction);
        if (dot > 0.0f)
        {
            dot = -dot;
            error[i][0] += dot * diffuse[0];
            error[i][1] += dot * diffuse[1];
            error[i][2] += dot * diffuse[2];
        }
        ambient[0] += error[i][0];
        ambient[1] += error[i][1];
        ambient[2] += error[i][2];
    }
    ambient[0] *= 0.125f;
    ambient[1] *= 0.125f;
    ambient[2] *= 0.125f;
    remainingError = 0.0f;
    for (i = 0; i < 8; ++i)
    {
        error[i][0] -= ambient[0];
        error[i][1] -= ambient[1];
        error[i][2] -= ambient[2];
        float intensity = RB_LightErrorIntensity(error[i]);
        remainingError += intensity * intensity;
    }
    // PINNED float bits3ca3d70b, one ULP above the usual0.02f.
    if (errorTotal - remainingError < 0.020000001f)
        return false;
    lights[lightIndex].Ambient.r = ambient[0] * 0.5f;
    lights[lightIndex].Ambient.g = ambient[1] * 0.5f;
    D3DLIGHT9 *light = &lights[lightIndex];
    light->Type = D3DLIGHT_DIRECTIONAL;
    light->Ambient.b = ambient[2] * 0.5f;
    light->Diffuse.r = diffuse[0] * 0.5f;
    light->Diffuse.g = diffuse[1] * 0.5f;
    light->Diffuse.b = diffuse[2] * 0.5f;
    // PINNED float bits358637be, one ULP above the usual1e-6f.
    if (DotProduct(direction, direction) < 0.0000010000001f)
    {
        light->Direction.x = 0.0f;
        light->Direction.y = 0.0f;
        light->Direction.z = 1.0f;
    }
    else
    {
        light->Direction.x = -direction[0];
        light->Direction.y = -direction[1];
        light->Direction.z = -direction[2];
    }
    return true;
}

static int RB_DeriveAmbientEntityLights(const float *colors, float sunVisibility,
    D3DLIGHT9 *lights, int maxLights)
{
    vec3_t average;
    memset(lights, 0, maxLights * sizeof(*lights));
    RB_AverageLightColors(colors, average);
    lights[0].Type = D3DLIGHT_DIRECTIONAL;
    lights[0].Ambient.r = average[0] * 0.5f;
    lights[0].Ambient.g = average[1] * 0.5f;
    lights[0].Ambient.b = average[2] * 0.5f;
    lights[0].Direction.z = 1.0f;
    vec3_t sunColor;
    sunColor[0] = sunVisibility * rgp.world->sunLight.color[0] + rgp.world->sunLight.u.dir.ambientColor[0];
    sunColor[1] = sunVisibility * rgp.world->sunLight.color[1] + rgp.world->sunLight.u.dir.ambientColor[1];
    sunColor[2] = sunVisibility * rgp.world->sunLight.color[2] + rgp.world->sunLight.u.dir.ambientColor[2];
    lights[1].Type = D3DLIGHT_DIRECTIONAL;
    lights[1].Ambient.r = sunColor[0] * 0.5f;
    lights[1].Ambient.g = sunColor[1] * 0.5f;
    lights[1].Ambient.b = sunColor[2] * 0.5f;
    lights[1].Direction.z = 1.0f;
    return 2;
}

static int RB_DeriveDirectionalEntityLights(const float *colors, float sunVisibility,
    D3DLIGHT9 *lights, int maxLights)
{
    vec3_t error[8];
    int lightCount = 0;
    memset(lights, 0, maxLights * sizeof(*lights));
    RB_InterleaveLightColors(colors, error);
    for (; lightCount + 1 < maxLights; ++lightCount)
        if (!RB_FitDirectionalLight(lightCount, error, lights))
            break;
    lights[lightCount].Type = D3DLIGHT_DIRECTIONAL;
    D3DLIGHT9 *light = &lights[lightCount];
    light->Ambient.r = rgp.world->sunLight.u.dir.ambientColor[0] * 0.5f;
    light->Ambient.g = rgp.world->sunLight.u.dir.ambientColor[1] * 0.5f;
    light->Ambient.b = rgp.world->sunLight.u.dir.ambientColor[2] * 0.5f;
    light->Diffuse.r = sunVisibility * rgp.world->sunLight.color[0] * 0.5f;
    light->Diffuse.g = sunVisibility * rgp.world->sunLight.color[1] * 0.5f;
    light->Diffuse.b = sunVisibility * rgp.world->sunLight.color[2] * 0.5f;
    light->Direction.x = -rgp.world->sunLight.position[0];
    light->Direction.y = -rgp.world->sunLight.position[1];
    light->Direction.z = -rgp.world->sunLight.position[2];
    return lightCount + 1;
}

int RB_DeriveEntityLights(vec4_t *colorForDir, float sunVisibility,
    const Material *material, D3DLIGHT9 *lights, int maxLights)
{
    const MaterialTechnique *technique = material->techniqueSet->techniques[15];
    if (technique && technique->passArray.dx7[0].ambientLighting)
        return RB_DeriveAmbientEntityLights((float *)colorForDir, sunVisibility, lights, maxLights);
    return RB_DeriveDirectionalEntityLights((float *)colorForDir, sunVisibility, lights, maxLights);
}

extern const dvar_t *r_vc_makelog;
void Com_StripExtension(const char *in, char *out);

// PINNED10764578/7c: six-byte grid-coordinate entries and entry count.
byte *s_vc_log;
int s_vc_logCount;

static void BuildGridFilename(const char *baseName, char *filename)
{
    Com_StripExtension(baseName, filename);
    if (strlen(filename) + 5 >= 64)
        Com_Error(ERR_DROP, "light grid log filename '%s.grid' is too long\n", filename);
    strcat(filename, ".grid");
}

void RB_InitLightVisHistory(const char *bspName)
{
    char filename[64];
    void *buffer;
    s_vc_log = NULL;
    s_vc_logCount = 0;
    if (!r_vc_makelog->current.integer)
        return;
    s_vc_log = (byte *)ri.Z_MallocInternal(0x1800000);
    if (r_vc_makelog->current.integer != 2)
        return;
    BuildGridFilename(bspName, filename);
    int fileLength = ri.FS_ReadFile(filename, &buffer);
    if (fileLength < 0)
        return;
    if ((unsigned int)fileLength % 6 == 0)
    {
        if ((unsigned int)fileLength > 0x1800000)
            fileLength = 0x1800000;
        memcpy(s_vc_log, buffer, fileLength);
        s_vc_logCount = (unsigned int)fileLength / 6;
    }
    ri.FS_FreeFile(buffer);
}

void RB_SaveLightVisHistory()
{
    char filename[64];
    if (!s_vc_log || !rgp.world)
        return;
    BuildGridFilename(rgp.world->name, filename);
    ri.FS_WriteFile(filename, s_vc_log, s_vc_logCount * 6);
    ri.Z_FreeInternal(s_vc_log);
    s_vc_log = NULL;
    s_vc_logCount = 0;
}
