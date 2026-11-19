#include "stdafx.h"
#include <afxtempl.h>
#include "../universal/assertive.h"

struct patch_def_t
{
    int pad[2];
    int contents;
    int surface;
};

struct patch_t
{
    patch_def_t *def;
    unsigned char pad0[2];
    unsigned char field06;
};

struct face_t
{
    unsigned char pad0[0x78];
    int contents;
    int surface;
    unsigned char pad1[0x28];
};

struct brushdef_t
{
    unsigned char pad0[0x20];
    float mins[3];
    float maxs[3];
    unsigned char pad2[4];
    face_t *faces;
    unsigned char pad1[2];
    short version;
    patch_def_t *patch;
};

struct faceInst_t { int field_00, field_04, field_08; };
struct eclass_t { unsigned char pad_00[8]; int fixedsize; };
struct entity_t { unsigned char pad_00[0x50]; eclass_t *eclass; };
struct entityInst_t { entityInst_t *prev; entityInst_t *next; entity_t *def; unsigned char brushes[0xc]; void *field_18; };
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
struct trace_t { brush_t *brush; faceInst_t *face; float dist; bool selected; int field_10[3]; };

extern brush_t selected_brushes;
extern brush_t active_brushes;
extern int g_nUpdateBits;

class CXYWnd;
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
struct qeglobals_t { unsigned char pad_00[0x8070]; int d_num_move_points; float *d_move_points[4096]; unsigned char pad_c074[0x6cb9c - 0xc074]; int d_select_mode; CSelectObject *selectObject; };
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
void FUN_00458c00(brush_t *b);
void FUN_004678c0(entityInst_t *e);
int FUN_00477ba0(int iItem, eclass_t *pec);
void FUN_0041a010(int dir, int grid);
void FUN_00470a50(float mins[3], float maxs[3]);
extern trace_t FUN_0046eca0(const float *origin, const float *dir, int flags);

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
            if (g_SelectedFaces[j].face == face)
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
            if (g_SelectedFaces[j].face == face)
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

void FUN_00470a50(float mins[3], float maxs[3])
{
    ClearBounds(mins, maxs);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        ExpandBounds(b->def->mins, b->def->maxs, mins, maxs);
}

void FUN_00470c00(float mid[3])
{
    float bounds[2][3];
    FUN_00470a50(bounds[0], bounds[1]);
    for (int i = 0; i < 3; i++)
        mid[i] = (bounds[1][i] + bounds[0][i]) * 0.5f;
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

template class CArray<SelFace, const SelFace &>;
