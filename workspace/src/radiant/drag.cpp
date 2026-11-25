#include "stdafx.h"
#include <math.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"

struct patchMesh_t { unsigned char pad_00[0x18]; int field_18[1]; unsigned char pad_1c[0x3822 - 0x1c]; short version; };
struct patch_t { patchMesh_t *def; };
struct eclass_t { eclass_t *next; char *name; int fixedsize; };
struct entitydef_t { unsigned char pad_00[0x50]; eclass_t *eclass; };
struct entity_t { unsigned char pad_00[8]; entitydef_t *def; };
struct brushdef_t { unsigned char pad_00[0x20]; vec3_t mins; vec3_t maxs; unsigned char pad_38[4]; void *faces; unsigned char pad_40[2]; short version; patchMesh_t *patch; };
struct faceInst_t { int field_00, field_04, field_08; };
struct brush_t { brush_t *prev; brush_t *next; entity_t *owner; unsigned char pad_0c[8]; brushdef_t *def; int faceCount; faceInst_t *faces; patch_t *patch; short version; };
struct trace_t { brush_t *brush; faceInst_t *face; float dist; bool selected; int field_10[3]; };
class CSelectObject
{
public:
    virtual void vfunc_00() = 0;
    virtual void vfunc_04() = 0;
    virtual void vfunc_08() = 0;
    virtual void addPoint(float x, float y, float z) = 0;
    virtual void vfunc_10() = 0;
    virtual void vfunc_14() = 0;
    virtual void vfunc_18() = 0;
    virtual void updateSelection(float x, float y, float z) = 0;
    int selectPointByRay(float ox, float oy, float oz, float dx, float dy, float dz, bool single);
};
struct qeglobals_t { unsigned char pad_00[0x18]; int d_gridsize; unsigned char pad_1c[0x24 - 0x1c]; vec3_t field_24; vec3_t field_30; unsigned char pad_3c[0x5c - 0x3c]; HWND d_hwndStatus; unsigned char pad_60[0x8070 - 0x60]; int d_num_move_points; float *d_move_points[4096]; unsigned char pad_c074[0x6cb9c - 0xc074]; int d_select_mode; CSelectObject *selectObject; };
class CXYWnd { public: unsigned char pad_00[0x60]; float field_60; unsigned char pad_64[0xf4 - 0x64]; int m_nViewType; void FUN_0044c5c0(int x, int y, float origin[3], float dir[3]); };
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
extern void FUN_0046fd50(float *move, int bSnap);
extern void FUN_0042bf10(const float *move);
extern int FUN_00455ee0(brushdef_t *b, const vec3_t vertex, const vec3_t delta, vec3_t end, bool bSnap);
extern void FUN_004559f0(brushdef_t *b, bool snap, bool markMap);
extern bool FUN_0042fb50(const float *delta, patchMesh_t *p, const float *anchor);
extern int FUN_00449760();
extern void FUN_00433f20();
extern void FUN_00433ed0();
extern void Select_RotateAxis(int axis, float deg, bool bPaint, bool bMouse);
extern "C" void FUN_0041b190(CMainFrame *self);
void FUN_0042beb0(void);
void FUN_0042b870(int buttons, const float *origin, const float *dir);
class CPrefsDlg { public: unsigned char pad_00[0x1d0]; int field_1d0; int field_1d4; unsigned char pad_1d8[0x220 - 0x1d8]; int field_220; unsigned char pad_224[0x248 - 0x224]; BOOL m_bNoClamp; unsigned char pad_24c[0x27c - 0x24c]; int field_27c; unsigned char pad_280[0x2b0 - 0x280]; int field_2b0; };
extern CPrefsDlg *g_PrefsDlg;
extern int drag_ok;
extern int drag_first;
extern int pressx, pressy;
extern vec3_t drag_xvec, drag_yvec;
extern bool DAT_0109fe5f;
extern bool DAT_012334ba;
extern bool DAT_0112993c;
extern bool DAT_0112993d;
extern void (*g_pfnDragRect)(int, int, int, int, float *);
extern int DAT_011298dc, DAT_011298e0, DAT_011298e4, DAT_011298e8;
extern vec3_t DAT_011298a4;
extern int DAT_005909f8;
extern int DAT_01128d90;
extern int DAT_01128da8;
extern void FUN_004433b0(void);
extern void Undo_GeneralStart(char *operation);
struct selbrush_t;
extern void Undo_AddBrushList(selbrush_t *list);
extern void Undo_End(void);
extern void FUN_00443f80(selbrush_t *list);
extern void FUN_0046e4a0(void);
extern trace_t FUN_0046eca0(const float *origin, const float *dir, int flags);
extern void FUN_0046f6b0(const float *origin, const float *dir, int flags);
extern void FUN_004758e0(const float *origin, const float *dir, unsigned int buttons);
extern void FUN_00475790(const float *origin, const float *dir);
extern void FUN_004755b0(const float *origin, const float *dir);
extern void FUN_0045a030(brushdef_t *b, const float *origin, const float *dir, bool shear);
struct face_t;
struct texdef_t;
struct radmat_t;
extern void FUN_00459ae0(brushdef_t *b, face_t *face, bool shear);
extern void FUN_00437730(const float *origin, const float *dir);
extern bool FUN_004532a0();
extern bool FUN_00401d30(void *dlg);
extern bool FUN_00401f70(void *dlg);
extern bool OnlyPatchesSelected();
extern bool FUN_0042bd90();
extern char g_CurveEditDlg[];
extern void FUN_00434630(const float *planes, bool bAdd);
extern void FUN_00434810(const void *planes, bool bAdd);
extern void FUN_00471160(const float *mins, const float *maxs, bool inside);
extern bool FUN_004379f0(patchMesh_t *p, float *out);
extern void FUN_00441a40(void *texdef, void *tex);
extern void FUN_0043e400();
extern void UpdatePatchInspector();
extern void FUN_00424b10();
extern void FUN_004597f0(brushdef_t *b, void *tex, int a, int c, bool flag);
extern void FUN_004593c0(brushdef_t *b, face_t *face, const texdef_t *tex);
extern void FUN_00459430(brushdef_t *b, face_t *face, radmat_t *mat);
extern void FUN_0045a220(brushdef_t *b, bool snap);
extern void FUN_00475350();
extern void Sys_MarkMapModified();
extern int DAT_01234694;
extern float FUN_004396d0(const vec3_t v);

#define MK_ALT 0x20
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

// 0x004609e0
void Drag_Setup(int x, int y, int buttons, const float *xaxis, const float *yaxis, const float *origin, const float *dir)
{
    trace_t t;
    brush_t *b;

    VectorClear(pressdelta);
    VectorCopy(xaxis, drag_xvec);
    pressx = x;
    drag_first = true;
    pressy = y;
    AxializeVector(drag_xvec);
    VectorCopy(yaxis, drag_yvec);
    AxializeVector(drag_yvec);

    if (g_qeglobals.d_select_mode == 8)
    {
        if (g_qeglobals.selectObject)
            g_qeglobals.selectObject->addPoint(origin[0], origin[1], origin[2]);
        else
            FUN_0046e4a0();
        return;
    }
    if (g_qeglobals.d_select_mode == 9)
    {
        if (g_qeglobals.selectObject)
        {
            if (g_qeglobals.selectObject->selectPointByRay(origin[0], origin[1], origin[2], dir[0], dir[1], dir[2], buttons != 4) < 0)
                return;
            drag_ok = true;
            return;
        }
        FUN_0046e4a0();
        g_nUpdateBits = -1;
        FUN_004433b0();
        Undo_GeneralStart("drag object point");
        return;
    }
    if (g_qeglobals.d_select_mode == 4)
    {
        if (GetAsyncKeyState(VK_MENU) & 0x8000)
            drag_ok = g_qeglobals.d_num_move_points > 0;
        else
        {
            FUN_004758e0(origin, dir, buttons);
            if (g_qeglobals.d_num_move_points || g_qeglobals.d_select_mode == 5)
            {
                drag_ok = true;
                DAT_011298dc = DAT_011298e0 = x;
                DAT_011298e4 = DAT_011298e8 = 0;
            }
        }
        g_nUpdateBits = -1;
        FUN_004433b0();
        Undo_GeneralStart("drag curve point");
        Undo_AddBrushList((selbrush_t *)&selected_brushes);
        return;
    }
    if (g_qeglobals.d_select_mode == 11)
    {
        FUN_00437730(origin, dir);
        return;
    }

    g_qeglobals.d_num_move_points = 0;
    if (DAT_005909f8 != 1 && FUN_004532a0() && buttons == 5 || buttons == 6)
    {
        if (GetAsyncKeyState(VK_MENU) & 0x8000)
        {
            g_qeglobals.d_select_mode = ((buttons & 2) | 0x1c) >> 1;
            DAT_011298dc = DAT_011298e0 = x;
            DAT_011298e4 = DAT_011298e8 = 0;
            drag_ok = true;
            g_nUpdateBits = -1;
            return;
        }
    }
    if (selected_brushes.next == &selected_brushes)
    {
        FUN_004433b0();
        Undo_GeneralStart("create brush");
        SendMessage(g_qeglobals.d_hwndStatus, 0x401, 0, (LPARAM)"No selection to drag\n");
        return;
    }
    if (g_qeglobals.d_select_mode == 1)
    {
        FUN_00475790(origin, dir);
        if (g_qeglobals.d_num_move_points)
        {
            drag_ok = true;
            FUN_004433b0();
            Undo_GeneralStart("drag vertex");
            Undo_AddBrushList((selbrush_t *)&selected_brushes);
            return;
        }
    }
    if (g_qeglobals.d_select_mode == 2)
    {
        FUN_004755b0(origin, dir);
        if (g_qeglobals.d_num_move_points)
        {
            drag_ok = true;
            FUN_004433b0();
            Undo_GeneralStart("drag edge");
            Undo_AddBrushList((selbrush_t *)&selected_brushes);
            return;
        }
    }

    t = FUN_0046eca0(origin, dir, 0x101);
    if (!t.selected && (!g_PrefsDlg->field_220 || !(GetAsyncKeyState(VK_MENU) & 0x8000)))
    {
        if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
            return;
        if (selected_brushes.next->next != &selected_brushes)
        {
            for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
                FUN_0045a030(b->def, origin, dir, (buttons & 8) != 0);
        }
        else
            FUN_0045a030(selected_brushes.next->def, origin, dir, (buttons & 8) != 0);
        Sys_Printf("Side stretch\n");
        drag_ok = true;
        FUN_004433b0();
        Undo_GeneralStart("side stretch");
        Undo_AddBrushList((selbrush_t *)&selected_brushes);
        return;
    }

    drag_ok = true;
    FUN_004433b0();
    Undo_GeneralStart("drag selection");
    Undo_AddBrushList((selbrush_t *)&selected_brushes);
    if (buttons == 9)
    {
        Sys_Printf("Shear dragging face\n");
#line 227
        assert(t.brush->version == t.brush->def->version);
#line 228
        assert(t.face - t.brush->faces >= 0 && t.face - t.brush->faces < t.brush->faceCount && t.face == &t.brush->faces[t.face - t.brush->faces]);
        FUN_00459ae0(t.brush->def, (face_t *)((char *)t.brush->def->faces + (t.face - t.brush->faces) * 168), true);
    }
    else if (buttons == 13)
    {
        Sys_Printf("Sticky dragging brush\n");
        for (int i = 0; i < t.brush->faceCount; i++)
            FUN_00459ae0(t.brush->def, (face_t *)((char *)t.brush->def->faces + i * 168), false);
    }
    else
        Sys_Printf("Dragging entire selection\n");
}

// 0x00460fe0
void Drag_Begin(int x, int y, int buttons, const float *xaxis, const float *yaxis, const float *origin, const float *dir, void (*pfnDragRect)(int, int, int, int, float *))
{
    int flags;
    trace_t t;
    int mode;

    g_pfnDragRect = pfnDragRect;
    VectorClear(pressdelta);
    VectorClear(vPressStart);
    drag_ok = false;
    drag_first = true;
    flags = 0;
    if (g_PrefsDlg->field_1d0)
        flags = 0x200;
    if (g_PrefsDlg->field_27c)
        flags |= 0x400;
    if (g_PrefsDlg->field_1d4)
        flags |= 0x800;

#line 323
    assert((buttons & MK_ALT) == 0);

    if (buttons == 5 || buttons == 6)
    {
        if (GetAsyncKeyState(VK_MENU) & 0x8000)
        {
            if (g_qeglobals.d_select_mode != 4)
            {
                if (DAT_005909f8 != 1)
                    Drag_Setup(x, y, buttons, xaxis, yaxis, origin, dir);
                else if (dir[0] && dir[1] && dir[2])
                    FUN_0046f6b0(origin, dir, flags);
                else
                    FUN_0046f6b0(origin, dir, flags | 4);
                return;
            }
        }
        else if (g_qeglobals.d_select_mode != 4)
        {
            if (dir[0] && dir[1] && dir[2])
                FUN_0046f6b0(origin, dir, flags);
            else
                FUN_0046f6b0(origin, dir, flags | 4);
            return;
        }
    }
    else if (buttons == 13)
    {
        if ((GetAsyncKeyState(VK_MENU) & 0x8000) && g_qeglobals.d_select_mode != 4)
        {
            if (dir[0] && dir[1] && dir[2])
                FUN_0046f6b0(origin, dir, flags | 0x40);
            else
                FUN_0046f6b0(origin, dir, flags | 0x44);
            return;
        }
        if (!(GetAsyncKeyState(VK_MENU) & 0x8000) && g_qeglobals.d_select_mode != 4)
        {
            FUN_0046f6b0(origin, dir, 0x208);
            return;
        }
    }

    if ((GetAsyncKeyState(VK_MENU) & 0x8000) && (buttons == 1 || buttons == 2))
    {
        mode = g_qeglobals.d_select_mode;
        if ((mode == 0 || mode == 10) && FUN_00401d30(g_CurveEditDlg))
        {
            if ((OnlyPatchesSelected() || selected_brushes.next == &selected_brushes && FUN_00401f70(g_CurveEditDlg)) && FUN_0042bd90())
            {
                mode = g_qeglobals.d_select_mode;
                g_qeglobals.d_select_mode = 10;
                if (mode == 11)
                    FUN_0041b190(g_pParentWnd);
                drag_ok = true;
            }
            return;
        }
    }

    if (buttons & 1)
    {
        Drag_Setup(x, y, buttons, xaxis, yaxis, origin, dir);
        return;
    }

    int texButtons = (g_PrefsDlg->field_2b0 != 2) ? 0x10 : 0x2;
    if (buttons == texButtons && !(GetAsyncKeyState(VK_MENU) & 0x8000))
    {
        t = FUN_0046eca0(origin, dir, 0x200);
        if (!t.face)
        {
            Sys_Printf("Did not select a texture\n");
            return;
        }
        VectorCopy(t.brush->def->mins, g_qeglobals.field_24);
        VectorCopy(t.brush->def->maxs, g_qeglobals.field_30);
#line 424
        assert(t.face - t.brush->faces >= 0 && t.face - t.brush->faces < t.brush->faceCount && t.face == &t.brush->faces[t.face - t.brush->faces]);
#line 425
        assert(t.brush->version == t.brush->def->version);
        char *f = (char *)t.brush->def->faces + (t.face - t.brush->faces) * 168;
        if (t.brush->patch)
            FUN_004379f0(t.brush->def->patch, (float *)(f + DAT_01128d90 * 28 + 36));
#line 430
        assert((t.brush->patch == NULL && t.brush->def->patch == NULL) || (t.brush->patch->def == t.brush->def->patch));
        FUN_00441a40(f + DAT_01128d90 * 28 + 36, 0);
        FUN_0043e400();
        UpdatePatchInspector();
        return;
    }
    if (buttons == (texButtons | 8) && !(GetAsyncKeyState(VK_MENU) & 0x8000))
    {
        t = FUN_0046eca0(origin, dir, 0);
        if (t.brush)
        {
            if (t.brush->owner->def->eclass->fixedsize == 0)
            {
                FUN_004597f0(t.brush->def, &DAT_01128da8, 1, 1, false);
                g_nUpdateBits = -1;
                return;
            }
            Sys_Printf("Can't change an entity texture\n");
            return;
        }
    }
    else if (buttons == (texButtons | 0xc) && !(GetAsyncKeyState(VK_MENU) & 0x8000))
    {
        t = FUN_0046eca0(origin, dir, 0);
        if (t.brush)
        {
            if (t.brush->owner->def->eclass->fixedsize == 0)
            {
                if (t.brush->patch)
                    FUN_004597f0(t.brush->def, &DAT_01128da8, 1, 0, false);
                else
                {
#line 493
                    assert(t.face - t.brush->faces >= 0 && t.face - t.brush->faces < t.brush->faceCount && t.face == &t.brush->faces[t.face - t.brush->faces]);
#line 494
                    assert(t.brush->version == t.brush->def->version);
                    FUN_004593c0(t.brush->def, (face_t *)((char *)t.brush->def->faces + (t.face - t.brush->faces) * 168), (const texdef_t *)&DAT_01128da8);
                    FUN_0045a220(t.brush->def, true);
                    if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
                        FUN_00475350();
                    Sys_MarkMapModified();
                    t.brush->def->version++;
                }
                g_nUpdateBits = -1;
            }
            else
                Sys_Printf("Can't change an entity texture\n");
            return;
        }
    }
    else if (buttons == (texButtons | 4) && !(GetAsyncKeyState(VK_MENU) & 0x8000))
    {
        Sys_Printf("Set brush face texture but leave info\n");
        t = FUN_0046eca0(origin, dir, 0);
        if (!t.brush)
        {
            Sys_Printf("Didn't hit a brush\n");
            return;
        }
        if (t.brush->owner->def->eclass->fixedsize)
        {
            Sys_Printf("Can't select an entity brush face\n");
            return;
        }
        if (t.brush->patch)
        {
            patchMesh_t *p = t.brush->patch->def;
            p->field_18[DAT_01128d90] = DAT_01128da8;
            p->version++;
            if (DAT_01234694)
            {
                FUN_00424b10();
                g_nUpdateBits = -1;
                return;
            }
            g_nUpdateBits = -1;
            return;
        }
#line 524
        assert(t.face - t.brush->faces >= 0 && t.face - t.brush->faces < t.brush->faceCount && t.face == &t.brush->faces[t.face - t.brush->faces]);
#line 525
        assert(t.brush->version == t.brush->def->version);
        FUN_00459430(t.brush->def, (face_t *)((char *)t.brush->def->faces + (t.face - t.brush->faces) * 168), (radmat_t *)DAT_01128da8);
        g_nUpdateBits = -1;
        return;
    }
    Sys_Printf("Didn't hit a brush\n");
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
                if (!FUN_0042fb50(vTemp2, b->patch->def, move))
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

// patch select modes 0xc..0x11 skip the axis lock and the move
static bool IsPatchSelectMode(int mode)
{
    return mode == 0xe || mode == 0xf || mode == 0x10 || mode == 0x11 || mode == 0xc || mode == 0xd;
}

// 0x004623e0
void Drag_MouseMoved(int x, int y, int buttons, float *origin, float *dir)
{
    vec3_t move, delta;
    int i;

    if (!buttons)
    {
        drag_ok = false;
        DAT_0112993c = false;
        DAT_0112993d = false;
        return;
    }

    if (buttons == MK_SHIFT && !IsPatchSelectMode(g_qeglobals.d_select_mode))
    {
        drag_first = false;
        if (abs(x - pressx) > abs(y - pressy))
            y = pressy;
        else
            x = pressx;
    }

    if (DAT_0112993c || DAT_0112993d)
    {
        if (g_qeglobals.d_select_mode != 4 && !IsPatchSelectMode(g_qeglobals.d_select_mode))
        {
            if (buttons == 5)
                return;
            if (buttons == 9)
            {
                if (GetAsyncKeyState(VK_MENU) & 0x8000)
                    return;
            }
            else if (buttons == 0xd)
                return;
        }
        DAT_0112993c = false;
        DAT_0112993d = false;
        return;
    }

    if (!drag_ok)
        return;

    if ((buttons & MK_SHIFT) && !IsPatchSelectMode(g_qeglobals.d_select_mode))
    {
        drag_first = false;
        if (abs(x - pressx) > abs(y - pressy))
            y = pressy;
        else
            x = pressx;
    }

    if (g_qeglobals.d_select_mode == 10)
    {
        if (!(GetAsyncKeyState(VK_MENU) & 0x8000))
        {
            int mode = g_qeglobals.d_select_mode;
            g_qeglobals.d_select_mode = 0;
            if (mode == 11)
                FUN_0041b190(g_pParentWnd);
            else if (mode == 10)
                FUN_0042beb0();
            drag_ok = false;
            return;
        }
        FUN_0042b870(buttons, origin, dir);
        return;
    }

    for (i = 0; i < 3; i++)
    {
        move[i] = drag_yvec[i] * (y - pressy) + drag_xvec[i] * (x - pressx);
        if (DAT_0109fe5f || DAT_012334ba)
        {
            move[i] *= g_pParentWnd->ActiveXY()->field_60;
            if (FUN_00449760() == 1)
                move[i] *= 0.5;
            else if (FUN_00449760() == 2)
                move[i] *= 0.75;
        }
        if (selected_brushes.next != &selected_brushes && selected_brushes.next->patch && DAT_0109fe5f
            && FUN_00449760() == 1)
            move[i] *= 0.5f;
        else if (!g_PrefsDlg->m_bNoClamp)
            move[i] = floor(move[i] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
    }

    VectorSubtract(move, pressdelta, delta);
    VectorCopy(move, pressdelta);

    if (g_qeglobals.d_select_mode == 5 || IsPatchSelectMode(g_qeglobals.d_select_mode))
    {
        DAT_011298dc = x;
        DAT_011298e4 = y;
        return;
    }
    MoveSelection(delta);
}

