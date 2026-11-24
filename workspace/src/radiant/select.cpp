#include "stdafx.h"
#include <afxtempl.h>
#include <math.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"

struct radmat_t
{
    int handle;
    const char *name;
};

struct patch_def_t
{
    int pad[2];
    int contents;
    int surface;
    unsigned char pad_10[8];
    radmat_t *mat[2];
};

struct patch_t
{
    patch_def_t *def;
    unsigned char pad0[2];
    unsigned char field06;
};

struct winding_t
{
    int numpoints;
    float points[1][3];
};

struct texdef_t
{
    radmat_t *mat;
    float scale[2];
    float shift[2];
    float rotate;
    float crossterm;
};

struct face_t
{
    float planepts[3][3];
    texdef_t texdef[2];
    unsigned char pad0[0x78 - 0x5c];
    int contents;
    int surface;
    unsigned char pad1[0x20];
    winding_t *winding;
    unsigned char pad2[4];
};

struct entity_t;
struct brushdef_t
{
    unsigned char pad_00[8];
    entity_t *owner;
    unsigned char pad0[0x20 - 0xc];
    float mins[3];
    float maxs[3];
    int faceCount;
    face_t *faces;
    unsigned char pad1[2];
    short version;
    patch_def_t *patch;
};

struct faceInst_t { int field_00, field_04, field_08; };
struct eclass_t { int pad_00; const char *name; int fixedsize; unsigned char pad_0c[0x148]; int *model; unsigned char pad_158[8]; int nShowFlags; };
struct epair_t;
struct entity_t { unsigned char pad_00[0x50]; eclass_t *eclass; eclass_t *modelClass; unsigned char pad_58[0x64 - 0x58]; epair_t *epairs; };
struct brush_t;
struct prefab_t;
struct entityInst_t
{
    entityInst_t *prev;
    entityInst_t *next;
    entity_t *def;
    unsigned char pad_0c[0xc];
    brush_t *ownerNext;
    unsigned char pad_1c[0x34 - 0x1c];
    void *modelInst;

    prefab_t *prefab;
    brush_t *ownerHead() { return ownerNext; }
    brush_t *ownerEnd() { return (brush_t *)((char *)this + 0xc); }
};
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entityInst_t *owner;
    unsigned char pad0[8];
    brushdef_t *def;
    int faceCount;
    faceInst_t *faces;
    patch_t *patch;
    short version;
    unsigned char hiddenBrush;
};
struct prefab_t { unsigned char pad_00[0xc]; brush_t head; };
struct trace_t { brush_t *brush; faceInst_t *face; float dist; bool selected; int field_10[3]; };

extern brush_t selected_brushes;
extern brush_t active_brushes;
extern int g_nUpdateBits;

class CXYWnd
{
public:
    unsigned char pad_00[0xf4];
    int m_nViewType;
};
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
class CSelectObject;
struct qeglobals_t { unsigned char pad_00[0x18]; int d_gridsize; unsigned char pad_1c[0x5c - 0x1c]; HWND d_hwndStatus; unsigned char pad_60[0x8070 - 0x60]; int d_num_move_points; float *d_move_points[4096]; unsigned char pad_c074[0x6cb84 - 0xc074]; int d_select_count; brush_t *d_select_order[2]; unsigned char pad_6cb90[0x6cb9c - 0x6cb90]; int d_select_mode; CSelectObject *selectObject; };
extern qeglobals_t g_qeglobals;
extern "C" void FUN_0041b190(CMainFrame *self);
void FUN_0042beb0();
extern CMainFrame *dword_01233488;
extern int DAT_011298b0;
extern int DAT_011298b4;

void FUN_0046e4a0()
{
    int mode = DAT_011298b0;
    DAT_011298b0 = 0;
    if (mode == 0xb)
        FUN_0041b190(dword_01233488);
    else if (mode == 0xa)
        FUN_0042beb0();
    DAT_011298b4 = 0;
}


// 12-byte selected face record: brush, face, index
struct SelFace
{
    brush_t *brush;
    faceInst_t *face;
    int index;
};
extern CArray<SelFace, const SelFace &> g_SelectedFaces;
struct SelArrAccess : CArray<SelFace, const SelFace &>
{
    void Free()
    {
        if (m_pData)
        {
            delete[] (unsigned char *)m_pData;
            m_pData = NULL;
        }
        m_nSize = 0;
        m_nMaxSize = 0;
    }
};

extern int DAT_01129894;
extern int DAT_01129898;
extern brush_t *DAT_0112989c[2];
extern bool DAT_0112993c;
extern bool DAT_0112993d;
extern int DAT_01234694;
extern entityInst_t *DAT_012334ec;
extern float DAT_010bcd38[3];
extern float DAT_010bcd44[3];
extern int g_nUpdateBits;
void FUN_004592f0(brush_t *b);
void FUN_00459210(brush_t *b, brush_t *list);
void FUN_0045a830(brush_t *b);
void FUN_00452b00(CXYWnd *xy);
void FUN_00424b10();
void FUN_0042f5d0();
void Brush_Free(brush_t *b);
void FUN_004678c0(entityInst_t *e);
int FUN_00477ba0(int iItem, eclass_t *pec);
void FUN_0041a010(int dir, int grid);
void FUN_00470a50(float mins[3], float maxs[3]);
trace_t FUN_0046eca0(const float *origin, const float *dir, int flags);

// set the drag mode, leaving the old patch modes (mode in esi in retail)
void FUN_0046e4e0(int mode)
{
    int old = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = mode;
    if (mode == 11 || old == 11)
        FUN_0041b190(dword_01233488);
    if (mode != 10 && old == 10)
        FUN_0042beb0();
}


// brush->owner->def->modelClass->model hit test (retail frame 0x50080)
struct orientation_t { float origin[3]; float axis[3][3]; };
struct faceRender_t;
void FUN_004650b0(entity_t *ent, orientation_t *or);
void OrientationPosToLocal(const orientation_t *or, const float *world, float *local);
void OrientationDirToLocal(const orientation_t *or, const float *world, float *local);
bool FUN_00465d80(entity_t *ent, const char *key);
char *ValueForKey(epair_t *&e, const char *key);
bool FUN_00436bc0(const float *tri0, const float *org, int mode, const float *tri1, const float *pt, const float *nrm, float *outT, float *outU, float *outV);
bool FUN_00436dc0(const float *origin, const float *dir, patch_t *patch, float *dist, int a, int b, int c, float *normal);
faceRender_t *FUN_00458fa0(brush_t *b, const float *origin, const float *dir, float *dist, float *outNormal);
bool FUN_0045b420(brush_t *b);
int PlaneFromPoints(float plane[4], const float a[3], const float b[3], const float c[3]);
void FUN_0046fbe0(bool bDeselectFaces);
extern int (__cdecl *dword_0059c4a0)(int handle, float (*verts)[3], int maxVerts, unsigned short *indices, int maxIndices);
void OrientationDirToWorld(const orientation_t *orient, const float *dir, float *out);
class CPrefsDlg;
extern CPrefsDlg *dword_01233b64;
extern entityInst_t *DAT_012334ec;
void FUN_0046ea90(const float *origin, const float *dir, int flags, trace_t *t, brush_t *list);
bool FUN_0044f630(brushdef_t *b);
extern int DAT_01128d90;

bool FUN_0046e520(const float *org, const float *dir, brush_t *brush, float *dist, float *normal)
{
    float verts[0x4000][3];
    unsigned short indices[0x10000];
    orientation_t orient;
    float angles[3];
    float lorg[3], ldir[3], tmp[3];
    float plane[4];
    float t;

#line 61
    assert(brush->owner->def->modelClass);
    assert(brush->owner->def->modelClass->model);
    assert(brush->owner->def->modelClass->model[1]);
    int count = dword_0059c4a0(brush->owner->def->modelClass->model[1], verts, 0x4000, indices, 0x10000);
    if (count == 0)
        return true;
    entity_t *ent = brush->owner->def;
    if (!FUN_00465d80(ent, "angles"))
    {
        angles[0] = 0;
        angles[1] = 0;
        angles[2] = 0;
    }
    else
        sscanf(ValueForKey(ent->epairs, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
    AngleVectors(angles, orient.axis[0], tmp, orient.axis[2]);
    orient.origin[0] = ((float *)ent)[22];
    orient.origin[1] = ((float *)ent)[23];
    orient.origin[2] = ((float *)ent)[24];
    orient.axis[1][0] = 0.0f - tmp[0];
    orient.axis[1][1] = 0.0f - tmp[1];
    orient.axis[1][2] = 0.0f - tmp[2];
    OrientationPosToLocal(&orient, org, lorg);
    char *scaleStr = ValueForKey(brush->owner->def->epairs, "modelscale");
    if (scaleStr)
    {
        float scale = (float)atof(scaleStr);
        if (scale > 0.0f)
        {
            float inv = 1.0f / scale;
            lorg[0] *= inv;
            lorg[1] *= inv;
            lorg[2] *= inv;
        }
    }
    OrientationDirToLocal(&orient, dir, ldir);
    float best = 3.402823466e+38F;
    for (int i = 0; i < count; i += 3)
    {
        unsigned short *tri = &indices[i];
        if (FUN_00436bc0(verts[tri[0]], verts[tri[1]], 0, verts[tri[2]], lorg, ldir, &t, 0, 0) && !(best <= t))
        {
            if (normal)
            {
                PlaneFromPoints(plane, verts[tri[0]], verts[tri[2]], verts[tri[1]]);
                normal[0] = plane[0];
                normal[1] = plane[1];
                normal[2] = plane[2];
            }
            best = t;
        }
    }
    if (best == 3.402823466e+38F)
        return false;
    *dist = best;
    return true;
}

// actor/model/patch aware brush hit test (dir in esi in retail)
faceInst_t *FUN_0046e930(const float *dir, const float *origin, int flags, brush_t *brush, float *dist, float *normal)
{
    orientation_t orient;
    float ldir[3], lorg[3];
    trace_t tr;

    faceInst_t *hit = (faceInst_t *)FUN_00458fa0(brush, origin, dir, dist, normal);
    if (hit)
    {
        if (brush->patch)
        {
            if (!(flags & 0x100) && !FUN_00436dc0(origin, dir, brush->patch, dist, 0, 0, 0, normal))
                return NULL;
            return hit;
        }
        entityInst_t *inst = brush->owner;
        if (!inst->prefab)
        {
            if (inst->modelInst && (((int *)dword_01233b64)[179] & 0x10000))
            {
                if ((flags & 4) && !_strnicmp(inst->def->eclass->name, "actor", 5))
                    return hit;
                return FUN_0046e520(origin, dir, brush, dist, normal) ? hit : NULL;
            }
            return hit;
        }
        FUN_004650b0(inst->def, &orient);
        OrientationDirToLocal(&orient, dir, ldir);
        OrientationPosToLocal(&orient, origin, lorg);
        tr.dist = 262144.0f;
        FUN_0046ea90(lorg, ldir, flags, &tr, &inst->prefab->head);
        if (tr.dist != 262144.0f)
        {
            *dist = tr.dist;
            if (normal)
                OrientationDirToWorld(&orient, (float *)tr.field_10, normal);
            return hit;
        }
        return NULL;
    }
    return hit;
}

// Q3 Test_Ray list walk (list head in edi in retail)
void FUN_0046ea90(const float *origin, const float *dir, int flags, trace_t *t, brush_t *list)
{
    bool selected = list == &selected_brushes;

    for (brush_t *brush = list->next; brush != list; brush = brush->next)
    {
        if ((flags & 4) && brush->owner != DAT_012334ec && !(brush->owner->def->eclass->nShowFlags & 0x10))
            continue;
#line 2574 ".\\XYWnd.cpp"
        assert(brush);
#line 178 ".\\select.cpp"
        if (brush->hiddenBrush || FUN_0044f630(brush->def))
            continue;
        assert(brush->def->owner == brush->owner->def);
        eclass_t *ec = brush->owner->def->eclass;
        if (!(ec->nShowFlags & 0x10) && (((flags >> 8) & 2) && ec->fixedsize || ((flags >> 8) & 4) && FUN_0045b420(brush)))
            continue;
        if (brush->patch && (!((int *)dword_01233b64)[178] || (flags & 0x10)))
            continue;
        if (((int *)dword_01233b64)[117] && strstr(brush->def->faces[0].texdef[DAT_01128d90].mat->name, "sky"))
            continue;
        float dist;
        float normal[3];
        faceInst_t *hit = FUN_0046e930(dir, origin, flags, brush, &dist, normal);
        if (hit && dist > 0.0f && dist < t->dist)
        {
            t->field_10[0] = ((int *)normal)[0];
            t->field_10[1] = ((int *)normal)[1];
            t->field_10[2] = ((int *)normal)[2];
            t->face = hit;
            t->dist = dist;
            t->brush = brush;
            t->selected = selected;
        }
    }
}

// Q3 Test_Ray; returns the closest hit (retail returns trace_t through a hidden pointer)
trace_t FUN_0046eca0(const float *origin, const float *dir, int flags)
{
    trace_t t;
    float dist;

    memset(&t, 0, sizeof(t));
    t.dist = 262144.0f;
    if (flags & 0x40)
    {
        CPtrArray array;
        brush_t *pToSelect = (selected_brushes.next == &selected_brushes) ? NULL : selected_brushes.next;
        FUN_0046fbe0(true);
        for (brush_t *brush = active_brushes.next; brush != &active_brushes; brush = brush->next)
        {
#line 2574 ".\\XYWnd.cpp"
            assert(brush);
#line 450 ".\\select.cpp"
            if (!brush->hiddenBrush && !FUN_0044f630(brush->def) && (!brush->patch || (((int *)dword_01233b64)[178] && !(flags & 0x10))))
            {
                if (FUN_0046e930(dir, origin, flags, brush, &dist, NULL))
                    array.Add(brush);
            }
        }
        if (array.GetSize() > 0)
        {
            int i;
            for (i = 0; i < array.GetSize(); i++)
            {
                if (array[i] == pToSelect)
                    break;
            }
            if (i < array.GetSize())
                pToSelect = (brush_t *)array[i > 0 ? i - 1 : array.GetSize() - 1];
            else
                pToSelect = (brush_t *)array[0];
        }
        if (pToSelect)
        {
            t.field_10[0] = 0;
            t.field_10[1] = 0;
            t.field_10[2] = 0x3f800000;
            t.face = (faceInst_t *)FUN_00458fa0(pToSelect, origin, dir, &dist, (float *)t.field_10);
            t.dist = dist;
            t.brush = pToSelect;
            t.selected = false;
            return t;
        }
    }
    if (!(flags & 1))
        FUN_0046ea90(origin, dir, flags, &t, &active_brushes);
    if (!(flags & 2))
        FUN_0046ea90(origin, dir, flags, &t, &selected_brushes);
    if ((flags & 4) && !t.brush)
        return FUN_0046eca0(origin, dir, flags - 4);
    return t;
}

// Q3 Test_Ray retried at the four diagonal 1-unit offsets
trace_t FUN_0046ef10(const float *origin, const float *dir, int flags)
{
    trace_t t;
    float o[3];

    t = FUN_0046eca0(origin, dir, flags);
    if (!t.brush)
    {
        o[0] = origin[0] + 1;
        o[1] = origin[1] + 1;
        o[2] = origin[2];
        t = FUN_0046eca0(o, dir, flags);
        if (!t.brush)
        {
            o[0] = origin[0] + 1;
            o[1] = origin[1] - 1;
            o[2] = origin[2];
            t = FUN_0046eca0(o, dir, flags);
            if (!t.brush)
            {
                o[0] = origin[0] - 1;
                o[1] = origin[1] + 1;
                o[2] = origin[2];
                t = FUN_0046eca0(o, dir, flags);
                if (!t.brush)
                {
                    o[0] = origin[0] - 1;
                    o[1] = origin[1] - 1;
                    o[2] = origin[2];
                    return FUN_0046eca0(o, dir, flags);
                }
            }
        }
    }
    return t;
}

// Q3 Select_Brush
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView)
{
    float mins[3], maxs[3], size[3];
    entityInst_t *e;
    brush_t *b, *next;

#line 335
    assert(g_SelectedFaces.GetSize() == 0 || brush->patch);
    if (DAT_01129898 < 2)
        DAT_0112989c[DAT_01129898] = brush;
    DAT_01129898++;
    e = brush->owner;
#line 347
    assert(e);
    if (e != DAT_012334ec && bComplete)
    {
        for (b = active_brushes.next; b != &active_brushes; b = next)
        {
            next = b->next;
            if (b->owner == e)
            {
                FUN_004592f0(b);
                FUN_00459210(b, &selected_brushes);
            }
        }
    }
    else
    {
        FUN_004592f0(brush);
        FUN_00459210(brush, &selected_brushes);
    }
    if (bStatus)
    {
        CString strStatus;
        FUN_00470a50(mins, maxs);
        size[0] = maxs[0] - mins[0];
        size[1] = maxs[1] - mins[1];
        size[2] = maxs[2] - mins[2];
        strStatus.Format("Selection X:: %.1f  Y:: %.1f  Z:: %.1f", size[0], size[1], size[2]);
        dword_01233488->SetStatusText(2, strStatus);
    }
    if (bPositionView)
        FUN_00452b00(dword_01233488->ActiveXY());
}

// select every face of a brush (a patch brush is moved whole)
void FUN_0046f2c0(brush_t *brush)
{
    FUN_0045a830(brush);
    if (brush->patch)
    {
        FUN_004592f0(brush);
        FUN_00459210(brush, &selected_brushes);
        return;
    }
    for (int i = 0; i < brush->faceCount; i++)
    {
        faceInst_t *face = &brush->faces[i];
        int j;
        for (j = 0; j < g_SelectedFaces.GetSize(); j++)
        {
            if (face == g_SelectedFaces[j].face)
                break;
        }
        if (j < g_SelectedFaces.GetSize())
        {
#line 412
            assert(brush == g_SelectedFaces.GetAt(j).brush);
        }
        else
        {
            SelFace selFace;
            selFace.brush = brush;
            selFace.face = face;
            selFace.index = i;
#line 424
            assert(selFace.brush->version == selFace.brush->def->version);
            g_SelectedFaces.Add(selFace);
        }
    }
}

// deselect every face of a brush
void FUN_0046f430(brush_t *brush)
{
    if (brush->patch)
    {
        FUN_004592f0(brush);
        FUN_00459210(brush, &active_brushes);
        return;
    }
    for (int i = 0; i < brush->faceCount; i++)
    {
        faceInst_t *face = &brush->faces[i];
        for (int j = 0; j < g_SelectedFaces.GetSize(); j++)
        {
            if (face == g_SelectedFaces[j].face)
            {
                g_SelectedFaces.RemoveAt(j);
                break;
            }
        }
    }
}

// rebuild the selected face list from the selected brushes
void FUN_0046f4f0()
{
    brush_t *b, *next;

    for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (b->patch == NULL)
        {
            FUN_0046f430(b);
            for (int i = 0; i < b->faceCount; i++)
            {
                SelFace selFace;
                selFace.brush = b;
                selFace.face = &b->faces[i];
                selFace.index = i;
                FUN_0045a830(b);
#line 488
                assert(selFace.face == &selFace.brush->faces[selFace.index]);
#line 489
                assert(selFace.brush->version == selFace.brush->def->version);
                g_SelectedFaces.Add(selFace);
            }
        }
    }
    for (b = selected_brushes.next; b != &selected_brushes; b = next)
    {
        next = b->next;
        if (b->patch == NULL)
        {
            FUN_004592f0(b);
            FUN_00459210(b, &active_brushes);
        }
    }
    DAT_01129898 = 0;
    if (DAT_01234694)
        FUN_00424b10();
}

// Q3 Select_Ray: pick a brush or face under the ray and toggle its selection
void FUN_0046f6b0(const float *origin, const float *dir, int flags)
{
    trace_t t;
    SelFace selFace;
    entityInst_t *e;
    brush_t *b, *next;
    int mode, i;

    t = FUN_0046eca0(origin, dir, flags);
    if (!t.brush)
        return;
    mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
    g_qeglobals.selectObject = NULL;

    if ((flags & 8) && t.brush->patch == NULL)
    {
#line 534
        assert(t.face);
        if (t.brush->owner->def->eclass->fixedsize)
            return;
        FUN_0046f4f0();
        for (i = 0; i < g_SelectedFaces.GetSize(); i++)
        {
            if (t.face == g_SelectedFaces[i].face)
            {
                if (DAT_0112993c)
                    return;
                g_SelectedFaces.RemoveAt(i);
                DAT_0112993d = true;
                g_nUpdateBits = -1;
                return;
            }
        }
        if (DAT_0112993d)
            return;
        selFace.brush = t.brush;
        selFace.face = t.face;
        selFace.index = t.face - t.brush->faces;
#line 567
        assert(selFace.index >= 0 && selFace.index < t.brush->faceCount);
#line 568
        assert(selFace.brush->version == selFace.brush->def->version);
        g_SelectedFaces.Add(selFace);
        DAT_0112993c = true;
    }
    else if (g_SelectedFaces.GetSize() != 0 && t.brush->patch == NULL)
    {
        e = t.brush->owner;
        for (i = 0; i < g_SelectedFaces.GetSize(); i++)
        {
            if (t.face == g_SelectedFaces[i].face)
            {
                if (DAT_0112993c)
                    return;
                if (e && e != DAT_012334ec && (GetAsyncKeyState(VK_MENU) & 0x8000))
                {
                    for (b = active_brushes.next; b != &active_brushes; b = next)
                    {
                        next = b->next;
                        if (b->owner == e)
                            FUN_0046f430(b);
                    }
                }
                else
                    FUN_0046f430(t.brush);
                DAT_0112993d = true;
                g_nUpdateBits = -1;
                return;
            }
        }
        if (DAT_0112993d)
            return;
        if (!e || e == DAT_012334ec || !(GetAsyncKeyState(VK_MENU) & 0x8000))
        {
            FUN_0046f2c0(t.brush);
            DAT_0112993c = true;
            g_nUpdateBits = -1;
            return;
        }
        for (b = active_brushes.next; b != &active_brushes; b = next)
        {
            next = b->next;
            if (b->owner == e)
                FUN_0046f2c0(b);
        }
        DAT_0112993c = true;
    }
    else if (!t.selected)
    {
        if (DAT_0112993d)
            return;
        FUN_0046f0b0(t.brush, (GetKeyState(VK_MENU) & 0x8000) != 0, true, true);
        DAT_0112993c = true;
        g_nUpdateBits = -1;
        return;
    }
    else
    {
        if (DAT_0112993c)
            return;
        e = t.brush->owner;
        if (e && e != DAT_012334ec && (GetAsyncKeyState(VK_MENU) & 0x8000))
        {
            for (b = selected_brushes.next; b != &selected_brushes; b = next)
            {
                next = b->next;
                if (b->owner == e)
                {
                    FUN_004592f0(b);
                    FUN_00459210(b, &active_brushes);
                }
            }
        }
        else
        {
            FUN_004592f0(t.brush);
            FUN_00459210(t.brush, &active_brushes);
        }
        if (DAT_01234694)
            FUN_00424b10();
        DAT_0112993d = true;
    }
    g_nUpdateBits = -1;
}


// Q3 Select_Deselect
void FUN_0046fbe0(bool bDeselectFaces)
{
    FUN_0042f5d0();
    DAT_01129894++;
    DAT_01129898 = 0;
    g_qeglobals.d_num_move_points = 0;
    brush_t *b = selected_brushes.next;
    if (bDeselectFaces)
        ((SelArrAccess &)g_SelectedFaces).Free();
    if (b != &selected_brushes)
    {
        int mode = g_qeglobals.d_select_mode;
        g_qeglobals.d_select_mode = 0;
        if (mode == 11)
            FUN_0041b190(dword_01233488);
        else if (mode == 10)
            FUN_0042beb0();
        g_qeglobals.selectObject = NULL;
        for (int i = 0; i < 3; i++)
        {
            if (b->def->mins[i] < b->def->maxs[i])
            {
                DAT_010bcd38[i] = b->def->mins[i];
                DAT_010bcd44[i] = b->def->maxs[i];
            }
        }
        selected_brushes.next->prev = &active_brushes;
        selected_brushes.prev->next = active_brushes.next;
        active_brushes.next->prev = selected_brushes.prev;
        active_brushes.next = selected_brushes.next;
        selected_brushes.prev = selected_brushes.next = &selected_brushes;
        FUN_00477ba0(-1, NULL);
    }
    g_nUpdateBits = -1;
}

void FUN_0045e1a0(brushdef_t *b, const float move[3], bool bSnap);

// Q3 Select_Move
void FUN_0046fd50(float *delta, int bSnap)
{
    brush_t *b;
    float vMin[3], vMax[3];
    CString strStatus;

    for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
        FUN_0045e1a0(b->def, delta, bSnap != 0);

    FUN_00470a50(vMin, vMax);
    strStatus.Format("Origin X:: %.1f  Y:: %.1f  Z:: %.1f", vMin[0], vMax[1], vMax[2]);
    dword_01233488->SetStatusText(2, strStatus);
}

void ClearBounds(float mins[3], float maxs[3]);
void ExpandBounds(const float addedmins[3], const float addedmaxs[3], float mins[3], float maxs[3]);

extern bool DAT_0058fbed;
void FUN_00452e30(CXYWnd *xy);
void FUN_00452f50(CXYWnd *xy);

void FUN_0045e0b0(brushdef_t *b);
void FUN_0045a220(brushdef_t *b, bool snap);
void FUN_00475350();
void Sys_MarkMapModified();
void FUN_00443f50(brushdef_t *brush);
void FUN_004433b0();
void Undo_GeneralStart(char *operation);
void Undo_End();
void Undo_AddBrush(brushdef_t *brush);
void FUN_00459530(brushdef_t *b, face_t *f, const texdef_t *td);
void FUN_004598b0(brushdef_t *b, const texdef_t *td);
void FUN_004593c0(brushdef_t *b, face_t *face, const texdef_t *td);
void FUN_004597f0(brushdef_t *b, const texdef_t *td, int a, int c, bool flag);
void FUN_004596a0(brushdef_t *b, face_t *f, int scale);
void FUN_00459920(brushdef_t *b, int size);

// 0x0046ff10 (953 B): set the texture of the selected faces or brushes, with undo
void FUN_0046ff10(const texdef_t *td, int flags)
{
    int selCount = g_SelectedFaces.GetSize();
    const char *name;
    if (selCount == 0)
    {
        if (selected_brushes.next == &selected_brushes)
            return;
        name = "set brush textures";
    }
    else
        name = "set face textures";
    FUN_004433b0();
    Undo_GeneralStart((char *)name);
    for (int i = 0; i < selCount; i++)
    {
        SelFace selFace = g_SelectedFaces[i];
        Undo_AddBrush(selFace.brush->def);
#line 828
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
        assert(selFace.brush->faceCount == selFace.brush->def->faceCount);
        FUN_004593c0(selFace.brush->def, &selFace.brush->def->faces[selFace.index], td);
        FUN_0045a220(selFace.brush->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        selFace.brush->def->version++;
        FUN_0045e0b0(selFace.brush->def);
        FUN_00443f50(selFace.brush->def);
        FUN_0045a830(selFace.brush);
#line 839
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
    }
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->owner->def->eclass->fixedsize)
        {
            Undo_AddBrush(b->def);
            FUN_004597f0(b->def, td, flags, 0, true);
            FUN_00443f50(b->def);
        }
    }
    Undo_End();
    g_nUpdateBits = -1;
}

// 0x004702d0 (957 B): set the texture mapping mode of the selection, with undo
void FUN_004702d0(const texdef_t *td)
{
    int selCount = g_SelectedFaces.GetSize();
    const char *name;
    if (selCount == 0)
    {
        if (selected_brushes.next == &selected_brushes)
            return;
        name = "set brush texture mapping";
    }
    else
        name = "set face texture mapping";
    FUN_004433b0();
    Undo_GeneralStart((char *)name);
    for (int i = 0; i < selCount; i++)
    {
        SelFace selFace = g_SelectedFaces[i];
        Undo_AddBrush(selFace.brush->def);
#line 875
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
        assert(selFace.brush->faceCount == selFace.brush->def->faceCount);
        FUN_00459530(selFace.brush->def, &selFace.brush->def->faces[selFace.index], td);
        FUN_0045a220(selFace.brush->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        selFace.brush->def->version++;
        FUN_0045e0b0(selFace.brush->def);
        FUN_00443f50(selFace.brush->def);
        FUN_0045a830(selFace.brush);
#line 886
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
    }
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->owner->def->eclass->fixedsize)
        {
            Undo_AddBrush(b->def);
            FUN_004598b0(b->def, td);
            FUN_00443f50(b->def);
        }
    }
    Undo_End();
    g_nUpdateBits = -1;
}

// 0x00470690 (960 B): set the sample size of the selection, with undo
void FUN_00470690(int size)
{
    int selCount = g_SelectedFaces.GetSize();
    const char *name;
    if (selCount == 0)
    {
        if (selected_brushes.next == &selected_brushes)
            return;
        name = "set brush samplesize";
    }
    else
        name = "set face samplesize";
    FUN_004433b0();
    Undo_GeneralStart((char *)name);
    for (int i = 0; i < selCount; i++)
    {
        SelFace selFace = g_SelectedFaces[i];
        Undo_AddBrush(selFace.brush->def);
#line 922
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
        assert(selFace.brush->faceCount == selFace.brush->def->faceCount);
        FUN_004596a0(selFace.brush->def, &selFace.brush->def->faces[selFace.index], size);
        FUN_0045a220(selFace.brush->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        selFace.brush->def->version++;
        FUN_0045e0b0(selFace.brush->def);
        FUN_00443f50(selFace.brush->def);
        FUN_0045a830(selFace.brush);
#line 933
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
    }
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->owner->def->eclass->fixedsize)
        {
            Undo_AddBrush(b->def);
            FUN_00459920(b->def, size);
            FUN_00443f50(b->def);
        }
    }
    Undo_End();
    g_nUpdateBits = -1;
}

// Q3 Select_Clone: copy, paste, nudge by one grid step
void FUN_0046fe50()
{
#line 793
    assert(dword_01233488->ActiveXY());
    DAT_0058fbed = false;
    FUN_00452e30(dword_01233488->ActiveXY());
    FUN_00452f50(dword_01233488->ActiveXY());
    FUN_0041a010(2, g_qeglobals.d_gridsize);
    FUN_0041a010(3, g_qeglobals.d_gridsize);
    DAT_0058fbed = true;
    g_nUpdateBits = -1;
}

void FUN_00470a50(float mins[3], float maxs[3])
{
    ClearBounds(mins, maxs);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        ExpandBounds(b->def->mins, b->def->maxs, mins, maxs);
}

class CPrefsDlg { public: unsigned char pad_00[0x248]; BOOL m_bNoClamp; };
extern CPrefsDlg *dword_01233b64;
void FUN_0046fb30();
void FUN_00470c00(float mid[3]);
void FUN_0045f340(brush_t *b, float *matrix, int a, int c, float d, bool flip, float *origin);
void FUN_00470c50(float *mid);
struct patchMesh_t; void FUN_0042f840(patchMesh_t *p, const float *center, const float *scale, bool bRebuild);
void FUN_00475350();
void FUN_0045a220(brushdef_t *b, bool snap);
bool FUN_0044f5d0(brush_t *b);
void AxisClear(float axis[3][3]);
void SinCosDegrees(float angle, float *sinOut, float *cosOut);
extern float DAT_0109fdfc[3];
extern void Sys_MarkMapModified();
void Sys_Printf(const char *text, ...);

// bounds of the selection, folding in the selected face windings
void FUN_00470ab0(float mins[3], float maxs[3])
{
    int n = g_SelectedFaces.GetSize();

    if (n <= 0)
    {
        FUN_00470a50(mins, maxs);
        return;
    }
    for (int i = 0; i < n; i++)
    {
        SelFace &sf = g_SelectedFaces[i];
        face_t *faces = sf.brush->def->faces;
        for (int j = 0; j < faces[0].winding->numpoints; j++)
        {
            float *pt = faces[sf.index].winding->points[j];
            if (pt[0] < mins[0])
                mins[0] = pt[0];
            if (pt[0] > maxs[0])
                maxs[0] = pt[0];
            if (pt[1] < mins[1])
                mins[1] = pt[1];
            if (pt[1] > maxs[1])
                maxs[1] = pt[1];
            if (pt[2] < mins[2])
                mins[2] = pt[2];
            if (pt[2] > maxs[2])
                maxs[2] = pt[2];
        }
    }
}

void FUN_00470c00(float mid[3])
{
    float bounds[2][3];
    FUN_00470a50(bounds[0], bounds[1]);
    for (int i = 0; i < 3; i++)
        mid[i] = (bounds[1][i] + bounds[0][i]) * 0.5f;
}

// middle of the selection snapped to the grid, or the true middle when no-clamp is set
void FUN_00470c50(float *mid)
{
    float mins[3], maxs[3];

    if (dword_01233b64->m_bNoClamp)
    {
        FUN_00470c00(mid);
        return;
    }
    FUN_00470a50(mins, maxs);
    for (int i = 0; i < 3; i++)
        {
        float t = floor((mins[i] + maxs[i]) * 0.5f / g_qeglobals.d_gridsize);
        mid[i] = g_qeglobals.d_gridsize * t;
    }
}

// apply a transform to every selected brush
void FUN_00470ce0(float *origin, float *matrix, int bSnap, int nAxis, float fDeg, bool bFlip)
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        FUN_0045f340(b, matrix, bSnap, nAxis, fDeg, bFlip, origin);
}

// mirror the selection about one axis through its middle
void FUN_00470d30(int axis)
{
    float matrix[3][3], mid[3];

    FUN_00470c50(mid);
    AxisClear(matrix);
    matrix[axis][axis] = -1.0f;
    FUN_00470ce0(mid, matrix[0], 1, 0, 0.0f, true);
    g_nUpdateBits = -1;
}

// Q3 Select_Scale
void FUN_00470d80(float x, float y, float z)
{
    float scale[3], mid[3];

    FUN_00470c50(mid);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (b->patch == NULL)
        {
            for (int i = 0; i < b->faceCount; i++)
            {
                float *p = b->def->faces[i].planepts[0];
                int j = 3;
                do
                {
                    p[0] = p[0] - mid[0];
                    p[1] = p[1] - mid[1];
                    p[2] = p[2] - mid[2];
                    p[0] = x * p[0];
                    p[1] = y * p[1];
                    p[2] = z * p[2];
                    p[0] = mid[0] + p[0];
                    p[1] = mid[1] + p[1];
                    p[2] = mid[2] + p[2];
                    p += 3;
                    j--;
                } while (j != 0);
            }
            FUN_0045a220(b->def, false);
            if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
                FUN_00475350();
            Sys_MarkMapModified();
            b->def->version++;
        }
        else
        {
            scale[0] = x;
            scale[1] = y;
            scale[2] = z;
#line 1066
            assert(b->patch->def == b->def->patch);
            FUN_0042f840((patchMesh_t *)b->def->patch, mid, scale, true);
        }
    }
}

// Q3 Select_RotateAxis
void FUN_00470ef0(int axis, float deg, bool bUpdate, bool bMouse)
{
    float matrix[3][3], origin[3], s, c;

    if (deg == 0.0f)
        return;
    if (!bMouse)
        FUN_00470c50(origin);
    else
    {
        origin[0] = DAT_0109fdfc[0];
        origin[1] = DAT_0109fdfc[1];
        origin[2] = DAT_0109fdfc[2];
    }
    deg = -deg;
    SinCosDegrees(deg, &s, &c);
    AxisClear(matrix);
    if (axis == 0)
    {
        matrix[1][2] = -s;
        matrix[2][1] = s;
        matrix[2][2] = c;
        matrix[1][1] = c;
    }
    else if (axis == 1)
    {
        matrix[2][0] = -s;
        matrix[0][0] = c;
        matrix[0][2] = s;
        matrix[2][2] = c;
    }
    else if (axis == 2)
    {
        matrix[0][1] = -s;
        matrix[0][0] = c;
        matrix[1][0] = s;
        matrix[1][1] = c;
    }
    FUN_00470ce0(origin, matrix[0], !bMouse, axis, deg, false);
    if (bUpdate)
        g_nUpdateBits = -1;
}

// Q3 Select_CompleteTall: select every brush inside the volume of the single selected brush
void FUN_00470ff0()
{
    float mins[3], maxs[3];
    brush_t *b, *next;
    int d1, d2, mode;

    b = selected_brushes.next;
    if (b == &selected_brushes || b->next != &selected_brushes)
    {
        Sys_Printf("Error: you must have a single brush selected\n");
        return;
    }
    if (b->owner->def->eclass->fixedsize)
    {
        Sys_Printf("Error: you cannot manipulate fixed size entities\n");
        return;
    }
    mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
    g_qeglobals.selectObject = NULL;
    mins[0] = b->def->mins[0];
    mins[1] = b->def->mins[1];
    mins[2] = b->def->mins[2];
    maxs[0] = b->def->maxs[0];
    maxs[1] = b->def->maxs[1];
    maxs[2] = b->def->maxs[2];
    FUN_0046fb30();
    d1 = dword_01233488->ActiveXY()->m_nViewType == 0;
    d2 = (dword_01233488->ActiveXY()->m_nViewType != 2) + 1;
    for (b = active_brushes.next; b != &active_brushes; b = next)
    {
        next = b->next;
        if (b->def->maxs[d1] > maxs[d1] || b->def->mins[d1] < mins[d1])
            continue;
        if (b->def->maxs[d2] > maxs[d2] || b->def->mins[d2] < mins[d2])
            continue;
        if (FUN_0044f5d0(b))
            continue;
        FUN_004592f0(b);
        FUN_00459210(b, &selected_brushes);
    }
    g_nUpdateBits = -1;
}

bool FUN_0044f630(brushdef_t *b);
void FUN_00467240(brushdef_t *b);
void FUN_004671b0(brushdef_t *b, entity_t *owner);
void Brush_RemoveFromEntity(brush_t *b, entity_t *e);
char *ValueForKey(epair_t *&e, const char *key);
bool FUN_00465e10(entity_t *e, const char *key, const char *value);
void FUN_0046fbe0(bool bDeselectFaces);

// select (or deselect) the brushes inside a rectangle in the active view
void FUN_00471160(float *mins, float *maxs, bool bSelect)
{
    brush_t *list, *b, *next;
    int d1, d2;

    d1 = dword_01233488->ActiveXY()->m_nViewType == 0;
    d2 = (dword_01233488->ActiveXY()->m_nViewType != 2) + 1;
    list = bSelect ? &active_brushes : &selected_brushes;
    for (b = list->next; b != list; b = next)
    {
        next = b->next;
        if (b->def->maxs[d1] > maxs[d1] || b->def->mins[d1] < mins[d1])
            continue;
        if (b->def->maxs[d2] > maxs[d2] || b->def->mins[d2] < mins[d2])
            continue;
        if (FUN_0044f5d0(b))
            continue;
        if (bSelect)
        {
            if (DAT_01129898 < 2)
                DAT_0112989c[DAT_01129898] = b;
            DAT_01129898++;
            FUN_004592f0(b);
            FUN_00459210(b, &selected_brushes);
        }
        else
        {
            FUN_004592f0(b);
            FUN_00459210(b, &active_brushes);
        }
    }
    g_nUpdateBits = -1;
}

// Q3 Select_PartialTall: touching the volume in the two view axes
void FUN_00471270()
{
    float mins[3], maxs[3];
    brush_t *b, *next;
    int mode;
    int d1, d2;

    b = selected_brushes.next;
    if (b == &selected_brushes || b->next != &selected_brushes)
    {
        Sys_Printf("Error: you must have a single brush selected\n");
        return;
    }
    if (b->owner->def->eclass->fixedsize)
    {
        Sys_Printf("Error: you cannot manipulate fixed size entities\n");
        return;
    }
    mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
    g_qeglobals.selectObject = NULL;
    mins[0] = b->def->mins[0];
    mins[1] = b->def->mins[1];
    mins[2] = b->def->mins[2];
    maxs[0] = b->def->maxs[0];
    maxs[1] = b->def->maxs[1];
    maxs[2] = b->def->maxs[2];
    FUN_0046fb30();
    d1 = dword_01233488->ActiveXY()->m_nViewType == 0;
    d2 = (dword_01233488->ActiveXY()->m_nViewType != 2) + 1;
    for (b = active_brushes.next; b != &active_brushes; b = next)
    {
        next = b->next;
        if (b->def->mins[d1] > maxs[d1] || b->def->maxs[d1] < mins[d1])
            continue;
        if (b->def->mins[d2] > maxs[d2] || b->def->maxs[d2] < mins[d2])
            continue;
        if (FUN_0044f5d0(b))
            continue;
        FUN_004592f0(b);
        FUN_00459210(b, &selected_brushes);
    }
    g_nUpdateBits = -1;
}

// Q3 Select_Touching: touching the volume (one unit of slack) on all three axes
void FUN_004713e0()
{
    float mins[3], maxs[3];
    brush_t *b, *next;
    int mode;
    int i;

    b = selected_brushes.next;
    if (b == &selected_brushes || b->next != &selected_brushes)
    {
        Sys_Printf("Error: you must have a single brush selected\n");
        return;
    }
    if (b->owner->def->eclass->fixedsize)
    {
        Sys_Printf("Error: you cannot manipulate fixed size entities\n");
        return;
    }
    mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
    g_qeglobals.selectObject = NULL;
    mins[0] = b->def->mins[0];
    mins[1] = b->def->mins[1];
    mins[2] = b->def->mins[2];
    maxs[0] = b->def->maxs[0];
    maxs[1] = b->def->maxs[1];
    maxs[2] = b->def->maxs[2];
    FUN_0046fb30();
    for (b = active_brushes.next; b != &active_brushes; b = next)
    {
        next = b->next;
        for (i = 0; i < 3; i++)
        {
            if (maxs[i] + 1 < b->def->mins[i] || mins[i] - 1 > b->def->maxs[i])
                break;
        }
        if (i == 3 && !b->hiddenBrush && !FUN_0044f630(b->def))
        {
            FUN_004592f0(b);
            FUN_00459210(b, &selected_brushes);
        }
    }
    g_nUpdateBits = -1;
}

// Q3 Select_Inside: fully inside the volume
void FUN_00471530()
{
    float mins[3], maxs[3];
    brush_t *b, *next;
    int mode;
    int i;

    b = selected_brushes.next;
    if (b == &selected_brushes || b->next != &selected_brushes)
    {
        Sys_Printf("Error: you must have a single brush selected\n");
        return;
    }
    if (b->owner->def->eclass->fixedsize)
    {
        Sys_Printf("Error: you cannot manipulate fixed size entities\n");
        return;
    }
    mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
    g_qeglobals.selectObject = NULL;
    mins[0] = b->def->mins[0];
    mins[1] = b->def->mins[1];
    mins[2] = b->def->mins[2];
    maxs[0] = b->def->maxs[0];
    maxs[1] = b->def->maxs[1];
    maxs[2] = b->def->maxs[2];
    FUN_0046fb30();
    for (b = active_brushes.next; b != &active_brushes; b = next)
    {
        next = b->next;
        for (i = 0; i < 3; i++)
        {
            if (b->def->maxs[i] > maxs[i] || b->def->mins[i] < mins[i])
                break;
        }
        if (i == 3 && !b->hiddenBrush && !FUN_0044f630(b->def))
        {
            FUN_004592f0(b);
            FUN_00459210(b, &selected_brushes);
        }
    }
    g_nUpdateBits = -1;
}

// select every brush whose entity has the same value for a key as the selected one
void FUN_004718b0(const char *key)
{
    brush_t *brush, *next;
    const char *val;

    brush = selected_brushes.next;
    if (brush == &selected_brushes || brush->next != &selected_brushes)
        return;
    if (brush->owner == DAT_012334ec)
        return;
#line 1410
    assert(brush->owner->def == brush->def->owner);
    val = ValueForKey(brush->owner->def->epairs, key);
    Sys_Printf("Selecting %s %s\n", key, val);
    FUN_0046fbe0(true);
    for (brush = active_brushes.next; brush != &active_brushes; brush = next)
    {
        next = brush->next;
        if (FUN_0044f5d0(brush))
            continue;
#line 1422
        assert(brush->owner);
        if (brush->owner != DAT_012334ec)
        {
#line 1425
            assert(brush->owner->def == brush->def->owner);
            if (FUN_00465e10(brush->owner->def, key, val))
            {
                FUN_004592f0(brush);
                FUN_00459210(brush, &selected_brushes);
            }
        }
    }
    g_nUpdateBits = -1;
}

// select the entities that share the selected entity's targetname
void FUN_00471a70()
{
    FUN_004718b0("targetname");
}

// select the entities that share the selected entity's classname
void FUN_00471a80()
{
    FUN_004718b0("classname");
}


static void FUN_004721a0(int clear, int set)
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        for (int i = 0; i < b->faceCount; i++)
        {
            b->def->faces[i].contents &= ~clear;
            b->def->faces[i].contents |= set;
        }
        if (b->patch)
        {
#line 1745
            assert(b->patch->def == b->def->patch);
            b->patch->def->contents &= ~clear;
            b->patch->def->contents |= set;
        }
    }
    g_nUpdateBits = -1;
}

static void FUN_00472280(int clear, int set)
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        for (int i = 0; i < b->faceCount; i++)
        {
            b->def->faces[i].surface &= ~clear;
            b->def->faces[i].surface |= set;
        }
        if (b->patch)
        {
#line 1771
            assert(b->patch->def == b->def->patch);
            b->patch->def->surface &= ~clear;
            b->patch->def->surface |= set;
        }
    }
    g_nUpdateBits = -1;
}

void FUN_004727a0()
{
    FUN_004721a0(0x8002084, 0);
}

void FUN_004727c0()
{
    FUN_004721a0(0x2080, 0x8000000);
}

void FUN_004727e0()
{
    FUN_004721a0(0, 0x8002080);
}

void FUN_00472800()
{
    FUN_004721a0(0, 0x8000004);
}

void FUN_00472820()
{
    FUN_00472280(0, 0x100);
}

void FUN_00472840()
{
    FUN_00472280(0x100, 0);
}

// callees of the texture and entity commands
struct patchMesh_t;
struct selbrush_t;
struct qtexture_s;
void FUN_004433b0();
void Undo_GeneralStart(char *operation);
void Undo_End();
void Undo_AddBrush(brushdef_t *brush);
void Undo_AddBrushList(selbrush_t *list);
void Undo_AddEntity(entity_t *ent);
void FUN_00443f80(selbrush_t *list);
void FUN_00443f50(brushdef_t *brush);
void FUN_004325d0(patchMesh_t *p, int c);
void FUN_00432430(patchMesh_t *p, float angle);
void FUN_00432800(patchMesh_t *p, float shiftS, float shiftT);
void FUN_004326b0(patchMesh_t *p, float scaleS, float scaleT);
void FUN_0046b070(int);
void FUN_00468910(const char *name, bool use_region);
void FUN_0046b5b0();
bool FUN_00435760(brushdef_t *b, const char *oldName, char *newName, bool bForce);
qtexture_s *__fastcall FUN_00440840(char *name);
void FUN_00459430(brushdef_t *b, face_t *f, radmat_t *mat);
void FUN_0045ef60(brushdef_t *b, float h, float w);
void FUN_0045ebf0(face_t *face, float nHeight, float nWidth, bool useSelection);
bool FUN_00465d80(entity_t *ent, const char *key);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
BOOL FUN_00478090(CString &strKey, CString &strVal);
char *va(const char *format, ...);
bool FindReplaceTextures(const char *find, const char *replace, bool selectedOnly, bool force, bool recurse);
extern int DAT_01128d90;
extern int DAT_01128d94;
extern radmat_t *DAT_01128da8;
extern int dword_0123348c;
extern int dword_010a4508;


// 0x00472860 (870 B): shift the texture of the selected brushes and faces; patches use thousandths
void FUN_00472860(float x, float y)
{
    int selCount = g_SelectedFaces.GetSize();
    if (selected_brushes.next == &selected_brushes && selCount == 0)
        return;
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        float dx, dy;
        if (b->patch)
        {
            dx = x * 0.001f;
            dy = y * 0.001f;
        }
        else
        {
            dx = (float)(int)x;
            dy = (float)(int)y;
        }
        for (int i = 0; i < b->faceCount; i++)
        {
            b->def->faces[i].texdef[DAT_01128d94].shift[0] += dx;
            b->def->faces[i].texdef[DAT_01128d94].shift[1] += dy;
        }
        FUN_0045a220(b->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        b->def->version++;
        if (b->patch)
        {
#line 1959
            assert(b->patch->def == b->def->patch);
            FUN_00432800((patchMesh_t *)b->patch->def, dx, dy);
        }
    }
    for (int i = 0; i < selCount; i++)
    {
        SelFace selFace = g_SelectedFaces[i];
#line 1969
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
        face_t *f = &selFace.brush->def->faces[selFace.index];
        f->texdef[DAT_01128d94].shift[0] += x;
        f->texdef[DAT_01128d94].shift[1] += y;
        FUN_0045a220(selFace.brush->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        selFace.brush->def->version++;
        FUN_0045a830(selFace.brush);
#line 1978
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
    }
    dword_0123348c |= 1;
}

// 0x00472bd0 (1055 B): mirror the texture of the selection along one axis (0 = x, 1 = y), with undo
void FUN_00472bd0(int axis)
{
    if (selected_brushes.next == &selected_brushes && g_SelectedFaces.GetSize() == 0)
        return;
    const char *name;
    if (axis == 0)
        name = "flip texture x";
    else
    {
#line 2000
        assert(axis == 0 || axis == 1);
        name = "flip texture y";
    }
    FUN_004433b0();
    Undo_GeneralStart((char *)name);
    Undo_AddBrushList((selbrush_t *)&selected_brushes);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        for (int i = 0; i < b->faceCount; i++)
        {
            texdef_t *td = &b->def->faces[i].texdef[DAT_01128d94];
            td->scale[axis] = -td->scale[axis];
            td->shift[axis] = 1.0f - td->shift[axis];
        }
        FUN_0045a220(b->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        b->def->version++;
        if (b->patch)
        {
#line 2014
            assert(b->patch->def == b->def->patch);
            FUN_004325d0((patchMesh_t *)b->patch->def, axis);
        }
    }
    FUN_00443f80((selbrush_t *)&selected_brushes);
    int selCount = g_SelectedFaces.GetSize();
    if (selCount > 0)
    {
        for (int i = 0; i < selCount; i++)
        {
            SelFace selFace = g_SelectedFaces[i];
#line 2024
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
            Undo_AddBrush(selFace.brush->def);
            texdef_t *td = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
            td->scale[axis] = -td->scale[axis];
            FUN_0045a220(selFace.brush->def, true);
            if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
                FUN_00475350();
            Sys_MarkMapModified();
            selFace.brush->def->version++;
            FUN_00443f50(selFace.brush->def);
            FUN_0045a830(selFace.brush);
#line 2034
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
        }
    }
    Undo_End();
    dword_0123348c |= 1;
}

// 0x00472ff0 (1012 B): add to the texture scale of the selection, with undo
void FUN_00472ff0(int x, int y)
{
    if (selected_brushes.next == &selected_brushes && g_SelectedFaces.GetSize() == 0)
        return;
    FUN_004433b0();
    Undo_GeneralStart("scale texture");
    Undo_AddBrushList((selbrush_t *)&selected_brushes);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        for (int i = 0; i < b->faceCount; i++)
        {
            texdef_t *td = &b->def->faces[i].texdef[DAT_01128d94];
            td->scale[0] += (float)x;
            td->scale[1] += (float)y;
        }
        FUN_0045a220(b->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        b->def->version++;
        if (b->patch)
        {
#line 2069
            assert(b->patch->def == b->def->patch);
            FUN_004326b0((patchMesh_t *)b->patch->def, (float)x, (float)y);
        }
    }
    FUN_00443f80((selbrush_t *)&selected_brushes);
    int selCount = g_SelectedFaces.GetSize();
    if (selCount > 0)
    {
        for (int i = 0; i < selCount; i++)
        {
            SelFace selFace = g_SelectedFaces[i];
#line 2079
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
            Undo_AddBrush(selFace.brush->def);
            texdef_t *td = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
            td->scale[0] += (float)x;
            td->scale[1] += (float)y;
            FUN_0045a220(selFace.brush->def, true);
            if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
                FUN_00475350();
            Sys_MarkMapModified();
            selFace.brush->def->version++;
            FUN_00443f50(selFace.brush->def);
            FUN_0045a830(selFace.brush);
#line 2090
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
        }
    }
    Undo_End();
    dword_0123348c |= 1;
}

// 0x004733f0 (1043 B): rotate the texture of the selection by an angle in degrees, with undo
void FUN_004733f0(int angle)
{
    if (selected_brushes.next == &selected_brushes && g_SelectedFaces.GetSize() == 0)
        return;
    FUN_004433b0();
    Undo_GeneralStart("rotate texture");
    Undo_AddBrushList((selbrush_t *)&selected_brushes);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        for (int i = 0; i < b->faceCount; i++)
        {
            texdef_t *td = &b->def->faces[i].texdef[DAT_01128d94];
            td->rotate = (float)(I_fround((float)angle + td->rotate) % 360);
        }
        FUN_0045a220(b->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        b->def->version++;
        if (b->patch)
        {
#line 2124
            assert(b->patch->def == b->def->patch);
            FUN_00432430((patchMesh_t *)b->patch->def, (float)angle);
        }
    }
    FUN_00443f80((selbrush_t *)&selected_brushes);
    int selCount = g_SelectedFaces.GetSize();
    if (selCount > 0)
    {
        for (int i = 0; i < selCount; i++)
        {
            SelFace selFace = g_SelectedFaces[i];
#line 2133
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
            Undo_AddBrush(selFace.brush->def);
            texdef_t *td = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
            td->rotate = (float)(I_fround((float)angle + td->rotate) % 360);
            FUN_0045a220(selFace.brush->def, true);
            if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
                FUN_00475350();
            Sys_MarkMapModified();
            selFace.brush->def->version++;
            FUN_00443f50(selFace.brush->def);
            FUN_0045a830(selFace.brush);
#line 2143
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
        }
    }
    Undo_End();
    dword_0123348c |= 1;
}

// 0x00473810 (301 B): replace one brush's texture (b in ecx, usePrefab in eax in retail)
bool FindReplaceTexture_Brush(brush_t *b, bool usePrefab, const char *find, const char *replace, bool force)
{
    bool found;
    if (b->owner->prefab && usePrefab)
    {
        FUN_0046b070((int)b);
        found = FindReplaceTextures(find, replace, false, force, usePrefab);
        if (found)
            FUN_00468910((const char *)&dword_010a4508, 0);
        FUN_0046b5b0();
    }
    else
    {
        found = false;
        if (b->patch && FUN_00435760(b->def, find, (char *)replace, force))
            found = true;
        for (int i = 0; i < b->faceCount; i++)
        {
            face_t *f = &b->def->faces[i];
            if (force || _stricmp(find, f->texdef[DAT_01128d90].mat->name) == 0)
            {
                FUN_00459430(b->def, f, (radmat_t *)FUN_00440840((char *)replace));
                found = true;
            }
        }
    }
    FUN_0045a220(b->def, true);
    if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
        FUN_00475350();
    Sys_MarkMapModified();
    dword_0123348c |= 1;
    b->def->version++;
    return found;
}

// 0x00473940 (136 B): replace a texture in the selected or all active brushes
bool FindReplaceTextures(const char *find, const char *replace, bool selectedOnly, bool force, bool recurse)
{
    brush_t *list;
    if (selectedOnly)
        list = &selected_brushes;
    else
    {
        list = &active_brushes;
        FUN_0046fbe0(true);
    }
    bool found = false;
    for (brush_t *b = list->next; b != list; b = b->next)
        if (FindReplaceTexture_Brush(b, recurse, find, replace, force))
            found = true;
    dword_0123348c |= 1;
    return found;
}

// 0x004739d0 (658 B): true when a prefab (or a prefab inside it) holds a brush using this material
int FUN_004739d0(brush_t *b, const char *name)
{
    CString unusedA, unusedB;
    brush_t *head = &b->owner->prefab->head;
    for (brush_t *pfb = head->next; pfb != head; pfb = pfb->next)
    {
        if (FUN_0044f5d0(pfb))
            continue;
        if (pfb->patch)
        {
#line 2231
            assert(pfb->patch->def == pfb->def->patch);
            if (_stricmp(name, pfb->patch->def->mat[DAT_01128d90]->name) == 0)
                return 1;
        }
        else if (pfb->owner->prefab)
        {
            if (FUN_004739d0(pfb, name))
                return 1;
        }
        else
        {
            for (int i = 0; i < pfb->def->faceCount; i++)
            {
                if (_stricmp(name, pfb->def->faces[i].texdef[DAT_01128d90].mat->name) == 0)
                    return 1;
            }
        }
    }
    return 0;
}

// 0x00473c70 (725 B): select every active brush that uses the material of the selected face (or the current texture)
void FUN_00473c70(int includePrefabs)
{
    CString unusedA, unusedB;
    radmat_t *mat;
    if (g_SelectedFaces.GetSize() != 0)
    {
        SelFace selFace = g_SelectedFaces[0];
#line 2271
        assert(selFace.face == &selFace.brush->faces[selFace.index]);
        assert(selFace.brush->version == selFace.brush->def->version);
        mat = selFace.brush->def->faces[selFace.index].texdef[DAT_01128d90].mat;
    }
    else
        mat = DAT_01128da8;
    const char *name = mat->name;
    FUN_0046fbe0(true);
    brush_t *next;
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = next)
    {
        next = b->next;
        if (b->hiddenBrush || FUN_0044f630(b->def))
            continue;
        bool match = false;
        if (b->patch)
        {
#line 2286
            assert(b->patch->def == b->def->patch);
            match = _stricmp(name, b->patch->def->mat[DAT_01128d90]->name) == 0;
        }
        else if (b->owner->prefab && includePrefabs)
            match = FUN_004739d0(b, name) != 0;
        else
        {
            for (int i = 0; i < b->def->faceCount; i++)
            {
                if (_stricmp(name, b->def->faces[i].texdef[DAT_01128d90].mat->name) == 0)
                {
                    match = true;
                    break;
                }
            }
        }
        if (match)
        {
            FUN_004592f0(b);
            FUN_00459210(b, &selected_brushes);
        }
    }
}

// 0x00473f50 (649 B): select every active brush whose entity has the same class (and key value) as the first selected brush
void FUN_00473f50()
{
    CString strKey, strVal;
    brush_t *b = selected_brushes.next;
    if (b->owner != DAT_012334ec)
    {
#line 2333
        assert(b->owner->def == b->def->owner);
        const char *classname = b->owner->def->eclass->name;
        bool hasKey = FUN_00478090(strKey, strVal) != 0;
        Sys_Printf("Selecting all %s(s)\n", classname);
        FUN_0046fbe0(true);
        brush_t *next;
        for (b = active_brushes.next; b != &active_brushes; b = next)
        {
            next = b->next;
            if (b->hiddenBrush || FUN_0044f630(b->def))
                continue;
#line 2346
            assert(b->owner);
            assert(b->owner->def == b->def->owner);
            entity_t *ent = b->owner->def;
            if (_stricmp(ent->eclass->name, classname) == 0)
            {
                if (!hasKey || _stricmp(strVal, ValueForKey(ent->epairs, strKey)) == 0)
                {
                    FUN_004592f0(b);
                    FUN_00459210(b, &selected_brushes);
                }
            }
        }
        dword_0123348c = -1;
    }
}


extern int dword_0123348c;
extern int dword_010a4508;

// 0x004741e0: select-all-of-type command, one brush picks by type, several by class
void FUN_004741e0(int arg)
{
    if (selected_brushes.next != &selected_brushes && selected_brushes.next->next == &selected_brushes)
        FUN_00473f50();
    else
        FUN_00473c70(arg);
    dword_0123348c = -1;
}

// 0x00474230 (782 B): fit the texture of the selection to a number of tiles, with undo
void FUN_00474230(float width, float height, bool flag)
{
    if (selected_brushes.next == &selected_brushes && g_SelectedFaces.GetSize() == 0)
        return;
    FUN_004433b0();
    Undo_GeneralStart("Fit texture");
    Undo_AddBrushList((selbrush_t *)&selected_brushes);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        FUN_0045ef60(b->def, height, width);
        FUN_0045a220(b->def, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        b->def->version++;
    }
    int selCount = g_SelectedFaces.GetSize();
    if (selCount > 0)
    {
        for (int i = 0; i < selCount; i++)
        {
            SelFace selFace = g_SelectedFaces[i];
#line 2400
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
            Undo_AddBrush(selFace.brush->def);
            FUN_0045ebf0(&selFace.brush->def->faces[selFace.index], height, width, flag);
            FUN_0045a220(selFace.brush->def, true);
            if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
                FUN_00475350();
            Sys_MarkMapModified();
            selFace.brush->def->version++;
            FUN_00443f50(selFace.brush->def);
            FUN_0045a830(selFace.brush);
#line 2409
            assert(selFace.face == &selFace.brush->faces[selFace.index]);
            assert(selFace.brush->version == selFace.brush->def->version);
        }
    }
    FUN_00443f80((selbrush_t *)&selected_brushes);
    Undo_End();
    dword_0123348c |= 1;
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00474540() {}

void FUN_00474550(brush_t *list, bool hidden)
{
    for (brush_t *b = list->next; b != list; b = b->next)
        b->hiddenBrush = hidden;
}

void Select_Hide()
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        b->hiddenBrush = true;
    g_nUpdateBits = -1;
}

void FUN_004745a0()
{
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
        b->hiddenBrush = true;
    g_nUpdateBits = -1;
}

extern "C" void FUN_004745d0()
{
    brush_t *b;
    for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
        b->hiddenBrush = false;
    for (b = active_brushes.next; b != &active_brushes; b = b->next)
        b->hiddenBrush = false;
    g_nUpdateBits = -1;
}

void Sys_Printf(const char *fmt, ...);

void Select_Invert()
{
    brush_t *next, *prev;

    Sys_Printf("inverting selection...\n");

    next = active_brushes.next;
    prev = active_brushes.prev;
    if (selected_brushes.next != &selected_brushes)
    {
        active_brushes.next = selected_brushes.next;
        active_brushes.prev = selected_brushes.prev;
        active_brushes.next->prev = &active_brushes;
        active_brushes.prev->next = &active_brushes;
    }
    else
    {
        active_brushes.next = &active_brushes;
        active_brushes.prev = &active_brushes;
    }
    if (next != &active_brushes)
    {
        selected_brushes.next = next;
        selected_brushes.prev = prev;
        selected_brushes.next->prev = &selected_brushes;
        selected_brushes.prev->next = &selected_brushes;
    }
    else
    {
        selected_brushes.next = &selected_brushes;
        selected_brushes.prev = &selected_brushes;
    }

    brush_t *b;
    for (b = active_brushes.next; b != &active_brushes; b = b->next)
    {
        if (b->patch)
            b->patch->field06 = 0;
    }
    for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (b->patch)
            b->patch->field06 = 1;
    }
    g_nUpdateBits = -1;
    Sys_Printf("done.\n");
}

// 0x004749a0 (451 B): select the first active brush whose targetname matches the target of the selected entity
void FUN_004749a0()
{
    if (g_qeglobals.d_select_count != 1)
    {
        SendMessageA(g_qeglobals.d_hwndStatus, SB_SETTEXT, 0, (LPARAM)"Must have 1 entity selected!");
        MessageBeep(MB_ICONASTERISK);
        return;
    }
#line 2564
    assert(g_qeglobals.d_select_order[0]);
    assert(g_qeglobals.d_select_order[0]->owner);
    assert(g_qeglobals.d_select_order[0]->owner->def);
    entity_t *ent = g_qeglobals.d_select_order[0]->owner->def;
    if (!FUN_00465d80(ent, "target"))
        return;
    const char *value = ValueForKey(ent->epairs, "target");
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
    {
#line 2574
        assert(b->owner);
        if (FUN_00465e10(b->owner->def, "targetname", value))
        {
            FUN_0046fbe0(true);
            FUN_0046f0b0(b, true, true, false);
            return;
        }
    }
}

// 0x00474b70 (451 B): select the first active brush whose target matches the targetname of the selected entity
void FUN_00474b70()
{
    if (g_qeglobals.d_select_count != 1)
    {
        SendMessageA(g_qeglobals.d_hwndStatus, SB_SETTEXT, 0, (LPARAM)"Must have 1 entity selected!");
        MessageBeep(MB_ICONASTERISK);
        return;
    }
#line 2599
    assert(g_qeglobals.d_select_order[0]);
    assert(g_qeglobals.d_select_order[0]->owner);
    assert(g_qeglobals.d_select_order[0]->owner->def);
    entity_t *ent = g_qeglobals.d_select_order[0]->owner->def;
    if (!FUN_00465d80(ent, "targetname"))
        return;
    const char *value = ValueForKey(ent->epairs, "targetname");
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
    {
#line 2609
        assert(b->owner);
        if (FUN_00465e10(b->owner->def, "target", value))
        {
            FUN_0046fbe0(true);
            FUN_0046f0b0(b, true, true, false);
            return;
        }
    }
}

template class CArray<SelFace, const SelFace &>;
