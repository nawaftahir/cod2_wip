#include "stdafx.h"
#include "Pmesh.h"
#include <malloc.h>
#include "../universal/com_math.h"

// Retail 0x00425810 / 10 B, Q3Radiant source counterpart.
int Patch_MemorySize(patchMesh_t *patch)
{
    return _msize(patch);
}

// Candidate at retail 0x00425840 / 197 bytes (NOT VERIFIED).
// Q3Radiant's indexed InterpolateInteriorPoints is the ancestor.
// CoD2 additionally tests bit 1 of the control word at +0x34.
// Trial 934dea58: prior reference-local form emitted 193/197 bytes,
// 43% normalized match, first differing byte +0x7.
void InterpolateInteriorPoints(patchMesh_t *p)
{
    int i, j, k;
    int next, prev;

    for (i = 0; i < p->width; i += 2)
    {
        next = (i == p->width - 1) ? 1 : (i + 1) % p->width;
        prev = (i == 0) ? p->width - 2 : i - 1;

        for (j = 0; j < p->height; j++)
        {
            if ((p->ctrl[i][j].flags_34 & 2) == 0)
            {
                for (k = 0; k < 3; k++)
                {
                    p->ctrl[i][j].xyz[k] =
                        (p->ctrl[next][j].xyz[k] +
                         p->ctrl[prev][j].xyz[k]) * 0.5f;
                }
            }
        }
    }
}

void Patch_CalcBounds(patchMesh_t *patch, vec3_t &mins, vec3_t &maxs, bool enlarge)
{
    ClearBounds(mins, maxs);
    ++patch->version;
    for (int w = 0; w < patch->width; ++w)
    {
        for (int h = 0; h < patch->height; ++h)
        {
            AddPointToBounds(patch->ctrl[w][h].xyz, mins, maxs);
        }
    }
    if (enlarge)
    {
        for (int axis = 0; axis < 3; ++axis)
        {
            if (maxs[axis] - mins[axis] < 8.0f)
            {
                float minimum = (mins[axis] + maxs[axis]) * 0.5f - 4.0f;
                mins[axis] = minimum;
                maxs[axis] = minimum + 8.0f;
            }
        }
    }
}

float Patch_WidthDistanceTo(patchMesh_t *patch, int count)
{
    float length = 0;
    for (int i = 0; i < count; ++i)
    {
        vec3_t delta;
        VectorSubtract(patch->ctrl[i+1][0].xyz, patch->ctrl[i][0].xyz, delta);
        // This component order preserves the retail floating-point result.
        length += I_sqrt(delta[1]*delta[1] + delta[0]*delta[0] + delta[2]*delta[2]);
    }
    return length;
}

float Patch_HeightDistanceTo(patchMesh_t *patch, int count)
{
    float length = 0;
    for (int i = 0; i < count; ++i)
    {
        vec3_t delta;
        VectorSubtract(patch->ctrl[0][i+1].xyz, patch->ctrl[0][i].xyz, delta);
        length += I_sqrt(delta[1]*delta[1] + delta[0]*delta[0] + delta[2]*delta[2]);
    }
    return length;
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00434100() {}
