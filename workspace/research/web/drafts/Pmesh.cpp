#include "stdafx.h"
#include "Pmesh.h"
#include <malloc.h>
#include <string.h>
#include <math.h>
#include "../universal/com_math.h"

// Retail 0x00425770 / 152 B -- unverified real initialization candidate.
// Class storage and string values come from retail disassembly. Material
// resolver 0x00440840 is a cross-lane dependency: the symbol name is provisional.
extern void *FUN_00440840(const char *name);

patchMesh_t *MakeNewPatch()
{
    patchMesh_t *patch = new patchMesh_t;
    patch->width = 0;
    patch->height = 0;
    patch->field_08 = 0;
    patch->type_10 = 0;
    patch->value_3834 = 0.0f;
    patch->style_14 = 8;
    patch->image_18 = FUN_00440840("case");
    patch->lightmap_1c = FUN_00440840("lightmap_gray");

    memset(patch->ctrl, 0, sizeof(patch->ctrl));
    for (int w = 0; w < 16; ++w)
    {
        for (int h = 0; h < 16; ++h)
        {
            patch->ctrl[w][h].color_28[2] = 255;
            patch->ctrl[w][h].color_28[1] = 255;
            patch->ctrl[w][h].color_28[0] = 255;
            patch->ctrl[w][h].color_28[3] = 255;
        }
    }
    patch->cache_3824 = NULL;
    patch->cache_3828 = NULL;
    patch->version = 0;
    patch->field_382e = 0;
    return patch;
}

// Retail 0x00425810 / 10 B, Q3Radiant source counterpart.
int Patch_MemorySize(patchMesh_t *patch)
{
    return _msize(patch);
}

// Unverified 0x00425820 / 29 B. Actual retail behavior derives from
// the direct store to patch+0x382f, and conditional dword store to +0x3834.
// Caller/actual argument convention and original name are still unknown.
void FUN_00425820(patchMesh_t *patch, int mode, bool enabled, float value)
{
    if (mode == 1)
    {
        patch->flag_382f = enabled;
        if (enabled)
            patch->value_3834 = value;
    }
}

// Trial 3, 0x00425840 / 197 B, unverified.
// Preserve the target's three explicit component stores and the 0x38
// stride naturally through the typed control array; no register tricks.
// Previous variants: 193/197 (43%) and 203/197 (28%).
// Only retail caller: 0x428e70 Patch_BrushToMesh at 0x4290fe.
void InterpolateInteriorPoints(patchMesh_t *p)
{
    for (int i = 0; i < p->width; i += 2)
    {
        const int next = (i == p->width - 1) ? 1 : (i + 1) % p->width;
        const int prev = (i == 0) ? p->width - 2 : i - 1;
        float *pointZ = &p->ctrl[i][0].xyz[2];

        for (int j = 0; j < p->height; ++j)
        {
            if ((p->ctrl[i][j].flags_34 & 2) == 0)
            {
                pointZ[-2] = (p->ctrl[next][j].xyz[0] +
                              p->ctrl[prev][j].xyz[0]) * 0.5f;
                pointZ[-1] = (p->ctrl[prev][j].xyz[1] +
                              p->ctrl[next][j].xyz[1]) * 0.5f;
                pointZ[0] = (p->ctrl[prev][j].xyz[2] +
                              p->ctrl[next][j].xyz[2]) * 0.5f;
            }
            pointZ += sizeof(PatchControl) / sizeof(float);
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

// Retail 0x00439600 / 27 B; disassembly/decompiler indicate
// fabs of a float promoted to double and rounded back to float.
// Source hypothesis: normal scalar floating-point absolute value.
// This function is called from the Patch_GenericMesh family.
float FUN_00439600(float value)
{
    return (float)fabs((double)value);
}
