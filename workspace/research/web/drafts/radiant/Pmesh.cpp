#include "stdafx.h"
#include "Pmesh.h"
#include "../universal/com_math.h"

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

/*
 * Experimental real-caller context for DialogInfo::ShowInfoDialog.
 * Control-flow shape from Q3Radiant PMESH.CPP; retail global IDs and
 * ABI evidence from 0x00433ad0, 0x00433da0, 0x00434040.
 * All bodies remain trial-only until the unchanged referee matches.
 */
class CMainFrame : public CWnd { public: void UpdatePatchToolbarButtons(); };
extern CMainFrame *g_pParentWnd;
extern bool g_bPatchBendMode, g_bPatchInsertMode, g_bPatchAxisOnRow;
extern bool g_bPatchLowerEdge;
extern int g_nPatchBendState, g_nPatchInsertState, g_nPatchAxisIndex;
extern int g_nBendOriginIndex, g_nUpdateBits;
extern float g_vBendOrigin[3];
extern const char *g_pBendStateMsg[], *g_pInsertStateMsg[];
extern patchMesh_t *SinglePatchSelected();
extern void Patch_Save(patchMesh_t *);
extern void HideInfoDialog();
extern void ShowInfoDialog(const char *);
extern void Patch_BendHandleTAB();
extern void Sys_Printf(const char *, ...);

void Patch_BendToggle()
{
    if (g_bPatchBendMode) {
        g_bPatchBendMode = false;
        HideInfoDialog();
        g_pParentWnd->UpdatePatchToolbarButtons();
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p) {
        Sys_Printf("Must bend a single patch");
        return;
    }
    // Retail +0x10 carries a 0x40 terrain discriminator.
    if (((const unsigned char *)p)[0x10] & 0x40) {
        Sys_Printf("Patch_BendToggle: Bending of terrain curves not implemented\\n");
        return;
    }
    Patch_Save(p);
    g_bPatchBendMode = true;
    g_nPatchBendState = 0;
    g_bPatchAxisOnRow = true;
    g_nPatchAxisIndex = 1;
    ShowInfoDialog(g_pBendStateMsg[0]);
}

void Patch_BendHandleENTER()
{
    if (!g_bPatchBendMode)
        return;
    if (g_nPatchBendState < 3) {
        ++g_nPatchBendState;
        ShowInfoDialog(g_pBendStateMsg[g_nPatchBendState]);
        if (g_nPatchBendState == 1) {
            g_vBendOrigin[0] = g_vBendOrigin[1] = g_vBendOrigin[2] = 0;
            g_nBendOriginIndex = 0;
            Patch_BendHandleTAB();
        } else if (g_nPatchBendState == 2) {
            g_bPatchLowerEdge = true;
        }
    } else {
        Patch_BendToggle();
    }
    g_nUpdateBits = -1;
}

void Patch_InsDelToggle()
{
    if (g_bPatchInsertMode) {
        g_bPatchInsertMode = false;
        HideInfoDialog();
        g_pParentWnd->UpdatePatchToolbarButtons();
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p) {
        Sys_Printf("Must work with a single patch");
        return;
    }
    Patch_Save(p);
    g_bPatchInsertMode = true;
    g_nPatchInsertState = 0;
    g_bPatchAxisOnRow = true;
    g_nPatchAxisIndex = 0;
    ShowInfoDialog(g_pInsertStateMsg[0]);
}
