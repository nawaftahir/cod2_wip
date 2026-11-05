#include "stdafx.h"
#include "Pmesh.h"
#include <malloc.h>
#include <string.h>
#include "../universal/com_math.h"

// Retail 0x00425770, 152 bytes; exact relocation-normalized MATCH
// in the isolated MSVC 7.1 trial 42070900634. Material lookup uses ECX
// argument, as established by retail disassembly.
// Retail 0x00425770 / 152 B -- unverified real initialization candidate.
// Class storage and string values come from retail disassembly. Material
// resolver 0x00440840 is a cross-lane dependency: the symbol name is provisional.
extern void * __fastcall FUN_00440840(const char *name);

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

// Retail 0x00425810 (10 bytes); relocation-normalized MATCH in CI trial 42066152684.
int Patch_MemorySize(patchMesh_t *patch)
{
    return _msize(patch);
}

// Retail 0x00425820 (29 bytes); relocation-normalized MATCH in CI 42067258788.
// Original symbol name is unknown. No ABI annotations or artificial callers.
void FUN_00425820(patchMesh_t *patch, int mode, bool enabled, float value)
{
    if (mode == 1)
    {
        patch->flag_382f = enabled;
        if (enabled)
            patch->value_3834 = value;
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

// Retail 0x0042b6d0, 14 B. Isolated exact MATCH in run 42070669799.
float FUN_0042b6d0(int unused1, int unused2,
                    float offset, float factor, float scale)
{
    return factor * scale + offset;
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00434100() {}
