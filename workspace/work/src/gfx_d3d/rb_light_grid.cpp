// PINNED PC 1.0 light-grid lookup and packed color helpers; descriptive names.
#include "gfx.h"
#include <stddef.h>

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
    for (int direction = 0; direction < 6; ++direction)
        for (int channel = 0; channel < 4; ++channel)
            out[direction][channel] *= scale;
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
    int bottom = 0;
    int top = s_vc_logCount - 1;
    while (bottom <= top)
    {
        int middle = (top + bottom) >> 1;
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
    {
        mins[axis] = origin[axis] - radius;
        maxs[axis] = origin[axis] + radius;
    }
    R_AddDebugBox(&backEndData->debugGlobals, mins, maxs, color);
}

// PINNED 10035940.
void RB_DrawGridSampleBox(const float *origin)
{
    vec3_t mins, maxs;
    for (int axis = 0; axis < 3; ++axis)
    {
        mins[axis] = origin[axis] - 0.5f;
        maxs[axis] = origin[axis] + 0.5f;
    }
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
    const GfxLightGridPoint *point = &grid->points[index];
    if (!RB_IsGridPointVisible(point, corner, origin, sampleOrigin))
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
    if ((signed char)entity->renderFxFlags < 0)
        VectorCopy(entity->lighting.origin, origin);
    else
    {
        VectorCopy(entity->origin, origin);
        origin[2] += 4.0f;
    }
    lighting->sunVisibility = RB_GetLightingAtPoint(&rgp.world->lightGrid, origin, lighting->colorForDir);
}
