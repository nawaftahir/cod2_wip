// PINNED PC 1.0 light-grid lookup and packed color helpers; descriptive names.
#include "gfx.h"
#include <stddef.h>

extern const dvar_t *r_showMissingLightGrid;
typedef char gridLayoutCheck[(sizeof(GfxLightGridPoint) == 8
    && offsetof(GfxLightGridPoint, xyzLowBitsAndSunVisible) == 4
    && offsetof(GfxLightGridPoint, colorsIndex) == 6
    && sizeof(GfxLightGridColors) == 24
    && sizeof(GfxLightGrid) == 16) ? 1 : -1];

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
