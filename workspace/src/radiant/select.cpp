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
};

struct face_t
{
    unsigned char pad0[0x78];
    int contents;
    int surface;
    unsigned char pad1[0x28];
};

struct brush_def_t
{
    unsigned char pad0[0x3c];
    face_t *faces;
    unsigned char pad1[4];
    patch_def_t *patch;
};

struct brush_t
{
    brush_t *prev;
    brush_t *next;
    unsigned char pad0[0xc];
    brush_def_t *def;
    int faceCount;
    unsigned char pad1[4];
    patch_t *patch;
    unsigned char pad2[2];
    unsigned char hiddenBrush;
};

extern brush_t selected_brushes;
extern brush_t active_brushes;
extern int g_nUpdateBits;

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

// 12-byte element, contents unknown (only the size is pinned by the retail copies)
struct SelFace
{
    int field00;
    int field04;
    int field08;
};

template class CArray<SelFace, const SelFace &>;
