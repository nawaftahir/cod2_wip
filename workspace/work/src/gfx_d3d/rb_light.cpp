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
bool RB_FindGridPoint(const GfxLightGrid *grid, int x, int y, int z, int *index);
void RB_AccumulateGridColors(vec4_t *out, const GfxLightGridColors *colors, float weight);
void RB_ScaleGridColors(vec4_t *out, float scale);
void RB_DefaultGridColors(vec4_t *out);
bool RB_GetNearestGridColors(const GfxLightGrid *grid, int x, int y, int z,
    vec4_t *out, float *sunVisibility);
bool RB_InsertGridVisLog(int index, unsigned short x, unsigned short y, unsigned short z);
int RB_GridVisLogIndex(int x, int y, int z, int insert);
void RB_DrawGridPointBox(const float *origin, float radius, const float *color);
void RB_DrawGridSampleBox(const float *origin);
void RB_DrawGridCellBox(int x, int y, int z);
bool RB_IsGridPointVisible(const GfxLightGridPoint *point, unsigned int corner,
    const float *pointOrigin, const float *sampleOrigin);
const GfxLightGridPoint *RB_GetValidGridPoint(const GfxLightGrid *grid,
    int x, int y, int z, unsigned int corner, const float *sampleOrigin);
static int I_ffloor(const float x);
float RB_GetLightingAtPoint(const GfxLightGrid *grid, const float *sampleOrigin, vec4_t *out);

typedef char entityLightingLayoutCheck[(offsetof(GfxEntity, renderFxFlags) == 4
    && offsetof(GfxEntity, origin) == 0x3c
    && offsetof(GfxWorld, lightGrid) == 0x11c
    && sizeof(GfxEntityLighting) == 104
    && offsetof(r_backEndGlobals_t, viewCount) == 0x3b4) ? 1 : -1];
extern r_backEndGlobals_t backEnd;

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

extern const dvar_t *r_vc_makelog;
void Com_StripExtension(const char *in, char *out);

// PINNED10764578/7c: six-byte grid-coordinate entries and entry count.
byte *s_vc_log;
int s_vc_logCount;

// PINNED 10035cd0/670: display unlogged grid points in the backend debug frame.
extern const dvar_t *r_vc_showlog;
int R_CullPointAndRadius(const vec_t *origin, float radius,
    const DpvsPlane *planes, int planeCount);
void R_AddDebugString(DebugGlobals *debug, const float *origin, const float *color,
    float scale, const char *text);
static int I_ffloor(const float x);
float RB_GetLightingAtPoint(const GfxLightGrid *grid, const float *sampleOrigin, vec4_t *out);
void RB_DrawGridSampleBox(const float *origin);
void RB_DrawGridCellBox(int x, int y, int z);
bool RB_IsGridPointVisible(const GfxLightGridPoint *point, unsigned int corner,
    const float *pointOrigin, const float *sampleOrigin);
const GfxLightGridPoint *RB_GetValidGridPoint(const GfxLightGrid *grid,
    int x, int y, int z, unsigned int corner, const float *sampleOrigin);
void RB_DrawGridPointBox(const float *origin, float radius, const float *color);
bool RB_FindGridPoint(const GfxLightGrid *grid, int x, int y, int z, int *index);
void RB_AccumulateGridColors(vec4_t *out, const GfxLightGridColors *colors, float weight);
void RB_ScaleGridColors(vec4_t *out, float scale);
void RB_DefaultGridColors(vec4_t *out);
bool RB_GetNearestGridColors(const GfxLightGrid *grid, int x, int y, int z,
    vec4_t *out, float *sunVisibility);
bool RB_InsertGridVisLog(int index, unsigned short x, unsigned short y, unsigned short z);
int RB_GridVisLogIndex(int x, int y, int z, int insert);
void RB_SetupEntityLighting(const GfxEntity *entity, GfxEntityLighting *lighting);
static void RB_InterleaveLightColors(const float *colors, vec3_t *error);
static void RB_AverageLightColors(const float *colors, float *average);
static inline float RB_LightErrorIntensity(const float *color);
static bool RB_FitDirectionalLight(int lightIndex, vec3_t *error, D3DLIGHT9 *lights);
static int RB_DeriveAmbientEntityLights(const float *colors, float sunVisibility,
    D3DLIGHT9 *lights, int maxLights);
static int RB_DeriveDirectionalEntityLights(const float *colors, float sunVisibility,
    D3DLIGHT9 *lights, int maxLights);
int RB_DeriveEntityLights(vec4_t *colorForDir, float sunVisibility,
    const Material *material, D3DLIGHT9 *lights, int maxLights);
static void BuildGridFilename(const char *baseName, char *filename);
void RB_InitLightVisHistory(const char *bspName);
void RB_SaveLightVisHistory();
void RB_ShowLightVisCachePoints(const GfxViewParms *viewParms,
    const DpvsPlane *planes, int planeCount);

/* PINNED 100363a0. Reuse the existing biased rounding helper; exact FP
   instruction spelling remains unaccepted and its assembly is not C++ credit. */
// Name unconfirmed; retail inlines fsub (0.5 - 2^-30) then fistp, like I_fround.
static int I_ffloor(const float x)
{
    double bias = 0.5 - 1.0 / (1 << 30);
    int result;

    __asm fld x
    __asm fsub bias
    __asm fistp result

    return result;
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

// PINNED 10035bd0: six-byte records in the existing history allocation.
bool RB_InsertGridVisLog(int index, unsigned short x, unsigned short y, unsigned short z)
{
    if (s_vc_logCount >= 0x400000)
        return false;
    memmove(s_vc_log + (index + 1) * 6, s_vc_log + index * 6,
        (s_vc_logCount - index) * 6);
    // PINNED 10035bd0: preserve the three pointer reads and record writes.
    byte *volatile &log = s_vc_log;
    ((unsigned short *)log)[index * 3] = x;
    ((unsigned short *)log)[index * 3 + 1] = y;
    ((unsigned short *)log)[index * 3 + 2] = z;
    ++*(volatile int *)&s_vc_logCount;
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

// Retail 10035cd0 (name from Mac STABS draft).
void RB_ShowLightVisCachePoints(const GfxViewParms *viewParms,
    const DpvsPlane *planes, int planeCount)
{
    if (!s_vc_log)
        return;
    int count = r_vc_showlog->current.integer;
    if (count <= 0)
        return;
    int centerX = I_fround(viewParms->origin[0] - -131072.0f) >> 5;
    int centerY = I_fround(viewParms->origin[1] - -131072.0f) >> 5;
    int centerZ = I_ffloor(viewParms->origin[2] - -131072.0f) >> 6;
    vec3_t origin;
    origin[0] = (float)(int)(((unsigned int)centerX - 4096u) << 5);
    origin[1] = (float)(int)(((unsigned int)centerY - 4096u) << 5);
    origin[2] = (float)(int)(((unsigned int)centerZ - 2048u) << 6);
    for (int dz = -1; dz <= 1; ++dz)
    {
        int z = centerZ + dz;
        if (z < 0 || (int)((unsigned int)z << 6) > 0x80000)
            continue;
        for (int dy = -count; dy <= count; ++dy)
        {
            int y = centerY + dy;
            if (y < 0 || (int)((unsigned int)y << 5) > 0x80000)
                continue;
            for (int dx = -count; dx <= count; ++dx)
            {
                int x = centerX + dx;
                if (x < 0 || (int)((unsigned int)x << 5) > 0x80000)
                    continue;
                if (RB_GridVisLogIndex(x, y, z, 0) >= 0)
                    continue;
                origin[0] = (float)(int)(((unsigned int)x - 4096u) << 5);
                origin[1] = (float)(int)(((unsigned int)y - 4096u) << 5);
                origin[2] = (float)(int)(((unsigned int)z - 2048u) << 6);
                if (R_CullPointAndRadius(origin, 0.0f, planes, planeCount) != 2)
                    R_AddDebugString(&backEndData->debugGlobals, origin,
                        dz == 0 || dz == 1 ? colorGreen : colorYellow, 1.0f, ".");
            }
        }
    }
}

// Name unconfirmed; PINNED 10035f70/58 B: packs a grid cell into the point sort key.
// Uncalled retail copy: RB_FindGridPoint carries its own inlined twin.
void RB_PackGridKey(int x, int y, int z, unsigned int *high, byte *low)
{
    *high = (((((unsigned int)x & ~3U) << 11) | (unsigned int)y) & ~3U) << 8
        | (unsigned int)(z >> 2);
    *low = (byte)(((((unsigned int)x << 2) | (y & 3)) << 2 | (z & 3)) << 2);
}

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

// PINNED 10036100: three groups of eight coefficients, not RGB per direction.
void RB_AccumulateGridColors(vec4_t *out, const GfxLightGridColors *colors, float weight)
{
    const unsigned char *src = &colors->rgb[0][0] + 2;
    weight = weight * (1.0f / 255.0f);
    float *dst = &out[0][0] + 2;
    for (int row = 3; row; row--)
    {
        dst[-2] = (float)src[-2] * weight + dst[-2];
        dst[-1] = (float)src[-1] * weight + dst[-1];
        dst[0] = (float)src[0] * weight + dst[0];
        dst[1] = (float)src[1] * weight + dst[1];
        dst[2] = (float)src[2] * weight + dst[2];
        dst[3] = (float)src[3] * weight + dst[3];
        dst[4] = (float)src[4] * weight + dst[4];
        dst[5] = (float)src[5] * weight + dst[5];
        dst += 8;
        src += 8;
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
    RB_AccumulateGridColors(out, &grid->colors[grid->points[index].colorsIndex], 1.0f);
    if (grid->points[index].xyzLowBitsAndSunVisible & 1)
        *sunVisibility = 1.0f;
    else
        *sunVisibility = 0.0f;
    return true;
}

float RB_GetLightingAtPoint(const GfxLightGrid *grid, const float *sampleOrigin, vec4_t *out)
{
    int cellX, cellY, cellZ;
    float weights[3][2];
    cellX = I_ffloor(sampleOrigin[0] - -131072.0f) >> 5;
    weights[0][1] = (sampleOrigin[0] - -131072.0f) * 0.03125f - cellX;
    weights[0][0] = 1.0f - weights[0][1];
    cellY = I_ffloor(sampleOrigin[1] - -131072.0f) >> 5;
    weights[1][1] = (sampleOrigin[1] - -131072.0f) * 0.03125f - cellY;
    weights[1][0] = 1.0f - weights[1][1];
    cellZ = I_ffloor(sampleOrigin[2] - -131072.0f) >> 6;
    weights[2][1] = (sampleOrigin[2] - -131072.0f) * 0.015625f - cellZ;
    weights[2][0] = 1.0f - weights[2][1];
    if (r_showLightGrid->current.enabled)
    {
        RB_DrawGridCellBox(cellX, cellY, cellZ);
        RB_DrawGridSampleBox(sampleOrigin);
    }
    memset(out, 0, 6 * sizeof(vec4_t));
    float totalWeight = 0.0f;
    float sunWeight = 0.0f;
    for (unsigned int corner = 0; corner < 8; ++corner)
    {
        const GfxLightGridPoint *point = RB_GetValidGridPoint(grid,
            cellX + (corner & 1), cellY + ((corner >> 1) & 1),
            cellZ + ((corner >> 2) & 1), corner, sampleOrigin);
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
                cellX + (weights[0][1] > 0.5f), cellY + (weights[1][1] > 0.5f),
                cellZ + (weights[2][1] > 0.5f), out, &sunWeight))
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

// Name unconfirmed. PINNED 100373c0/17.
bool RB_MaterialUsesAmbientLighting(const Material *material)
{
    const MaterialTechnique *technique = material->techniqueSet->techniques[15];
    if (!technique)
        return false;
    return technique->passArray.dx7[0].ambientLighting;
}

// Name unconfirmed. PINNED 100373e0/49.
void RB_SetAmbientLight(D3DLIGHT9 *light, const float *color)
{
    light->Type = D3DLIGHT_DIRECTIONAL;
    light->Ambient.r = color[0] * 0.5f;
    light->Ambient.g = color[1] * 0.5f;
    light->Ambient.b = color[2] * 0.5f;
    light->Direction.z = 1.0f;
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
