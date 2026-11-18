#include "stdafx.h"
#include <math.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"

struct patchMesh_t;
struct patch_t { patchMesh_t *def; };
struct eclass_t { eclass_t *next; char *name; int fixedsize; };
struct entitydef_t { unsigned char pad_00[0x50]; eclass_t *eclass; };
struct entity_t { unsigned char pad_00[8]; entitydef_t *def; };
struct brushdef_t { unsigned char pad_00[0x20]; vec3_t mins; vec3_t maxs; unsigned char pad_38[0x0a]; short version; patchMesh_t *patch; };
struct brush_t { brush_t *prev; brush_t *next; entity_t *owner; unsigned char pad_0c[8]; brushdef_t *def; unsigned char pad_18[8]; patch_t *patch; };
class CSelectObject
{
public:
    virtual void vfunc_00() = 0;
    virtual void vfunc_04() = 0;
    virtual void vfunc_08() = 0;
    virtual void vfunc_0c() = 0;
    virtual void vfunc_10() = 0;
    virtual void vfunc_14() = 0;
    virtual void vfunc_18() = 0;
    virtual void updateSelection(float x, float y, float z) = 0;
};
struct qeglobals_t { unsigned char pad_00[0x18]; int d_gridsize; unsigned char pad_1c[0x8070 - 0x1c]; int d_num_move_points; float *d_move_points[4096]; unsigned char pad_c074[0x6cb9c - 0xc074]; int d_select_mode; CSelectObject *selectObject; };
class CXYWnd { public: unsigned char pad_00[0xf4]; int m_nViewType; };
class CMainFrame
{
public:
    void FUN_00417cf0();
    void SetStatusText(int nPane, const char *pText)
    {
        if (pText && nPane <= 5 && nPane > 0)
        {
            m_strStatus[nPane] = pText;
            FUN_00417cf0();
        }
    }
    CXYWnd *ActiveXY() { return m_pActiveXY; }

    unsigned char pad_00[0x7a4];
    CString m_strStatus[6];
    unsigned char pad_7bc[0x7e0 - 0x7bc];
    CXYWnd *m_pActiveXY;
};

extern qeglobals_t g_qeglobals;
extern brush_t selected_brushes;
extern CMainFrame *g_pParentWnd;
extern unsigned g_nUpdateBits;
extern bool g_bRotateMode;
extern bool g_bScaleMode;
extern bool g_bPatchBendMode;
extern int g_nScaleHow;
extern float g_vRotation[3];
extern vec3_t vPressStart;
extern vec3_t pressdelta;
extern void Sys_Printf(const char *fmt, ...);
extern void FUN_00470d80(float x, float y, float z);
extern void FUN_0046fd50(const vec3_t move, int a2);
extern void FUN_0042bf10(const vec3_t move);
extern int FUN_00455ee0(brushdef_t *b, const vec3_t vertex, const vec3_t delta, vec3_t end, bool bSnap);
extern void FUN_004559f0(brushdef_t *b, bool snap, bool markMap);
extern bool FUN_0042fb50(patchMesh_t *p, const vec3_t delta, const vec3_t move);
extern int FUN_00449760();
extern void FUN_00433f20();
extern void FUN_00433ed0();
extern void Select_RotateAxis(int axis, float deg, bool bPaint, bool bMouse);

#define SCALE_X 0x01
#define SCALE_Y 0x02
#define SCALE_Z 0x04
#define MAX_BRUSH_SIZE 262144

void AxializeVector(float *v)
{
    float a[3];
    int i;

    if (!v[0] && !v[1])
        return;
    if (!v[1] && !v[2])
        return;
    if (!v[0] && !v[2])
        return;

    for (i = 0; i < 3; i++)
        a[i] = (float)fabs(v[i]);
    if (a[0] > a[1] && a[0] > a[2])
        i = 0;
    else if (a[1] > a[0] && a[1] > a[2])
        i = 1;
    else
        i = 2;

    float o = v[i];
    v[0] = 0;
    v[1] = 0;
    v[2] = 0;
    if (o < 0)
        v[i] = -1;
    else
        v[i] = 1;
}

// 0x004619c0
void MoveSelection(vec3_t move)
{
    int i, success;
    brush_t *b;
    CString strStatus;
    vec3_t vTemp, vTemp2, end;

    if (!move[0] && !move[1] && !move[2])
        return;

    move[0] = (g_nScaleHow & SCALE_X) ? 0 : move[0];
    move[1] = (g_nScaleHow & SCALE_Y) ? 0 : move[1];
    move[2] = (g_nScaleHow & SCALE_Z) ? 0 : move[2];

    if (g_bRotateMode || g_bPatchBendMode)
    {
        for (i = 0; i < 3; i++)
        {
            if (move[i] != 0)
            {
                move[i] /= g_qeglobals.d_gridsize;
                move[i] = FUN_00449760() * move[i];
            }
        }
        if (g_qeglobals.d_gridsize == 1)
        {
            for (i = 0; i < 3; i++)
            {
                if (move[i] != 0)
                    move[i] *= 0.1f;
            }
        }

        float fDeg = -move[2];
        float fAdj = move[2];
        int nAxis = 0;
        if (g_pParentWnd->ActiveXY()->m_nViewType == 2)
        {
            fDeg = -move[1];
            fAdj = move[1];
            nAxis = 2;
        }
        else if (g_pParentWnd->ActiveXY()->m_nViewType == 1)
        {
            fDeg = move[2];
            fAdj = move[2];
            nAxis = 1;
        }
        else
            nAxis = 0;

        g_vRotation[nAxis] += fAdj;
        strStatus.Format("%s x:: %.1f  y:: %.1f  z:: %.1f", g_bPatchBendMode ? "Bend angle" : "Rotation", g_vRotation[0], g_vRotation[1], g_vRotation[2]);
        g_pParentWnd->SetStatusText(2, strStatus);

        if (g_bPatchBendMode)
        {
            FUN_00433f20();
            Select_RotateAxis(nAxis, fDeg * 2, false, true);
            FUN_00433ed0();
            Select_RotateAxis(nAxis, fDeg, false, true);
        }
        else
        {
            Select_RotateAxis(nAxis, fDeg, false, true);
        }
        return;
    }

    if (g_bScaleMode)
    {
        vec3_t v;
        v[0] = v[1] = v[2] = 1.0;
        if (move[1] > 0)
        {
            v[0] = 1.1f;
            v[1] = 1.1f;
            v[2] = 1.1f;
        }
        else if (move[1] < 0)
        {
            v[0] = 0.9f;
            v[1] = 0.9f;
            v[2] = 0.9f;
        }
        FUN_00470d80((g_nScaleHow & SCALE_X) ? 1.0 : v[0],
                     (g_nScaleHow & SCALE_Y) ? 1.0 : v[1],
                     (g_nScaleHow & SCALE_Z) ? 1.0 : v[2]);
        g_nUpdateBits |= 0xffffffff;
        return;
    }

    vec3_t vDistance;
    VectorSubtract(pressdelta, vPressStart, vDistance);
    strStatus.Format("Distance x: %.1f  y: %.1f  z: %.1f", vDistance[0], vDistance[1], vDistance[2]);
    g_pParentWnd->SetStatusText(3, strStatus);

    if (g_qeglobals.d_select_mode == 9)
    {
        if (g_qeglobals.selectObject)
            g_qeglobals.selectObject->updateSelection(move[0], move[1], move[2]);
        return;
    }

    if (g_qeglobals.d_num_move_points || g_qeglobals.d_select_mode == 5)
    {
        if (g_qeglobals.d_select_mode == 5)
        {
            Sys_Printf("MoveSelection for sel_area: should never happen, tell a coder\n");
            return;
        }
        if (g_qeglobals.d_select_mode == 4)
        {
            FUN_0042bf10(move);
            return;
        }
        if (g_qeglobals.d_select_mode == 1)
        {
            success = true;
            for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
                success &= FUN_00455ee0(b->def, g_qeglobals.d_move_points[0], move, end, true);
            if (success)
                VectorCopy(end, g_qeglobals.d_move_points[0]);
            return;
        }
        for (i = 0; i < g_qeglobals.d_num_move_points; i++)
            VectorAdd(g_qeglobals.d_move_points[i], move, g_qeglobals.d_move_points[i]);
        for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
        {
            VectorCopy(b->def->maxs, vTemp);
            VectorSubtract(vTemp, b->def->mins, vTemp);
            FUN_004559f0(b->def, true, true);
            for (i = 0; i < 3; i++)
                if (b->def->mins[i] >= b->def->maxs[i]
                || b->def->maxs[i] - b->def->mins[i] > MAX_BRUSH_SIZE)
                    break;
            if (i != 3)
                break;
            if (b->patch)
            {
                VectorCopy(b->def->maxs, vTemp2);
                VectorSubtract(vTemp2, b->def->mins, vTemp2);
                VectorSubtract(vTemp2, vTemp, vTemp2);
#line 710
                assert(b->def->patch == b->patch->def);
                if (!FUN_0042fb50(b->patch->def, vTemp2, move))
                {
                    b = NULL;
                    break;
                }
            }
        }
        if (b != &selected_brushes)
        {
            Sys_Printf("Brush dragged backwards, move canceled\n");
            for (i = 0; i < g_qeglobals.d_num_move_points; i++)
                VectorSubtract(g_qeglobals.d_move_points[i], move, g_qeglobals.d_move_points[i]);
            for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
                FUN_004559f0(b->def, true, true);
        }
    }
    else
    {
        FUN_0046fd50(move, 0);
    }
}
