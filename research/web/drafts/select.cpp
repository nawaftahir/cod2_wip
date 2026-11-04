// Experimental select.cpp reconstruction grounded in retail 0x473810/0x473940.
// These field offsets are from the retail disassembly, not assumed Q3 layouts.
// No new game credit is taken until the linked executable matches.
#include "stdafx.h"
#include <string.h>
#include <stddef.h>

struct BrushMaterialEntry {
    void *field_00;
    const char *name;
    unsigned char field_08[0x1c - 8];
};
struct BrushMaterialSlot {
    BrushMaterialEntry *material;
    unsigned char field_04[0x1c - 4];
};
struct BrushFace {
    unsigned char field_00[0x24];
    BrushMaterialSlot slots[4];
    unsigned char field_94[0xa8 - 0x94];
};
struct BrushGeometry {
    unsigned char field_00[0x3c];
    BrushFace *faces;
    unsigned char field_40[2];
    unsigned short revision;
};
struct BrushEntity {
    unsigned char field_00[0x38];
    void *field_38;
};
struct SelectionLink {
    SelectionLink *prev;
    SelectionLink *next;
    BrushEntity *owner;
    unsigned char field_0c[8];
    BrushGeometry *geometry;
    int faceCount;
    unsigned char field_1c[4];
    void *patch;
};

typedef char s_assert_next[(offsetof(SelectionLink,next)==4)?1:-1];
typedef char s_assert_owner[(offsetof(SelectionLink,owner)==8)?1:-1];
typedef char s_assert_geom[(offsetof(SelectionLink,geometry)==0x14)?1:-1];
typedef char s_assert_count[(offsetof(SelectionLink,faceCount)==0x18)?1:-1];
typedef char s_assert_patch[(offsetof(SelectionLink,patch)==0x20)?1:-1];
typedef char s_assert_face[(sizeof(BrushFace)==0xa8)?1:-1];
typedef char s_assert_rev[(offsetof(BrushGeometry,revision)==0x42)?1:-1];

extern SelectionLink selected_brushes;
extern SelectionLink active_brushes;
extern void Select_Deselect(int);
extern int g_nUpdateBits;
extern int g_activeMaterialSlot;
extern int g_selectionStyle;
extern void FUN_0046b070(SelectionLink *);
extern void FUN_0046b5b0();
extern void FUN_00468910(void *, int);
extern void *g_selectedGeometryHead;
extern bool FUN_00435760(BrushGeometry *, const char *, const char *, bool);
extern void *FUN_00440840(const char *);
extern void FUN_00459430(BrushGeometry *, void *);
extern void FUN_0045a220(BrushGeometry *, int);
extern void FUN_00475350();
extern void FUN_0047a3c0();

bool FindReplaceTextures(const char *, const char *, bool, bool, bool);

static bool FindReplaceTexture_Brush(SelectionLink *brush, bool recurse, const char *find,
                              const char *replace, bool force)
{
    bool replaced = false;
    if (brush->owner->field_38 && recurse) {
        FUN_0046b070(brush);
        replaced = FindReplaceTextures(find, replace, false, force, recurse);
        if (replaced)
            FUN_00468910(&g_selectedGeometryHead, 0);
        FUN_0046b5b0();
    } else {
        BrushGeometry *geometry = brush->geometry;
        if (brush->patch) {
            if (FUN_00435760(geometry, find, replace, force))
                replaced = true;
        }
        BrushFace *face = geometry->faces;
        for (int i=0; i<brush->faceCount; ++i,++face) {
            if (force || _stricmp(face->slots[g_activeMaterialSlot].material->name, find)==0) {
                void *mat = FUN_00440840(replace);
                FUN_00459430(geometry, mat);
                replaced = true;
            }
        }
    }
    FUN_0045a220(brush->geometry, 1);
    if (g_selectionStyle == 1 || g_selectionStyle == 2)
        FUN_00475350();
    FUN_0047a3c0();
    ++brush->geometry->revision;
    g_nUpdateBits |= 1;
    return replaced;
}

bool FindReplaceTextures(const char *find, const char *replace,
                         bool selectedOnly, bool force, bool recurse)
{
    SelectionLink *list;
    if (selectedOnly)
        list=&selected_brushes;
    else {
        list=&active_brushes;
        Select_Deselect(1);
    }
    bool replaced = false;
    for (SelectionLink *brush=list->next; brush!=list; brush=brush->next) {
        if (FindReplaceTexture_Brush(brush,recurse,find,replace,force))
            replaced = true;
    }
    g_nUpdateBits |= 1;
    return replaced;
}

extern "C" void FUN_00474540() {}
