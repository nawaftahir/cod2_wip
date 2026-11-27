#include <windows.h>
#include "../universal/assertive.h"

struct eclass_t { unsigned char pad[8]; int fixedsize; };
struct entity_s_def { unsigned char pad[0x50]; eclass_t *eclass; };
struct entity_s { unsigned char pad[8]; entity_s_def *def; };
struct winding_t;
struct plane_t { float normal[3]; int type; double dist; };
struct radmat_t { int pad0; const char *name; unsigned char pad[0x14]; int compileFlags; int surfaceFlags; };
struct texdef_t { radmat_t *radMat; unsigned char pad[24]; };
struct face_t { float planepts[3][3]; texdef_t texdef[3]; unsigned char pad[8]; plane_t plane; unsigned char pad0[8]; winding_t *w; unsigned char pad1[4]; };
struct brush_t { unsigned char pad0[8]; entity_s_def *owner; unsigned char pad1[0x2c]; int faceCount; face_t *faces; unsigned char pad2[4]; void *patch; };
struct selbrush_t { selbrush_t *prev; selbrush_t *next; entity_s *owner; unsigned char pad0[8]; brush_t *def; int faceCount; unsigned char pad1[4]; void *patch; unsigned char pad2[2]; unsigned char hiddenBrush; };
struct qeglobals_t { unsigned char pad0[0x18]; int d_gridsize; unsigned char pad1[0x6c060]; int activeMaterial; };
extern qeglobals_t g_qeglobals;
extern selbrush_t selected_brushes;
extern int g_nUpdateBits;
struct brushdef_t; struct entity_t;
void FUN_00455cf0(brushdef_t *b, const face_t *f, brushdef_t **front, brushdef_t **back);
void FUN_00467240(brushdef_t *b);
void FUN_00458af0(brushdef_t *b);
brush_t *FUN_00458440(brushdef_t *def, entity_t *owner);
void FUN_00459210(brush_t *b, brush_t *list);
void Brush_Free(brush_t *b);
void FUN_0045f8b0()
{
    selbrush_t *b, *next;
    for (b = selected_brushes.next; b != &selected_brushes; b = next)
    {
        next = b->next;
        entity_s *owner = b->owner;
        brush_t *def = b->def;
        assert(b->owner->def == b->def->owner);
        if (def->owner->eclass->fixedsize || b->patch || b->hiddenBrush)
            continue;
        for (int i = 0; i < def->faceCount; i++)
        {
            face_t *f = &def->faces[i];
            float grid = (float)g_qeglobals.d_gridsize;
            face_t split = *f;
            float move[3];
            move[0] = grid * f->plane.normal[0];
            move[1] = grid * f->plane.normal[1];
            move[2] = grid * f->plane.normal[2];
            for (int j = 0; j < 3; j++)
            {
                split.planepts[j][0] -= move[0];
                split.planepts[j][1] -= move[1];
                split.planepts[j][2] -= move[2];
            }
            brushdef_t *front, *back;
            FUN_00455cf0((brushdef_t *)def, &split, &front, &back);
            if (back)
            {
                FUN_00467240(back);
                FUN_00458af0(back);
            }
            if (front)
            {
                FUN_00459210(FUN_00458440(front, (entity_t *)owner), (brush_t *)&selected_brushes);
            }
        }
        Brush_Free((brush_t *)b);
    }
    g_nUpdateBits = -1;
}







// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
// padding for deferred CSG_MakeHollow, Brush_MergeList, CSG_Merge
void Brush_GetFaceFlags(brush_t *def, int *outAnySurface, int *outAllSurface, int *outAnyCompile, int *outAllCompile)
{
    assert(def);
    assert(!def->patch);
    int anySurface = 0;
    int allSurface = -1;
    int anyCompile = 0;
    int allCompile = -1;

    for (int faceIndex = 0; faceIndex < def->faceCount; faceIndex++)
    {
        assert(def->faces[faceIndex].texdef[g_qeglobals.activeMaterial].radMat);
        radmat_t *radMat = def->faces[faceIndex].texdef[g_qeglobals.activeMaterial].radMat;
        anySurface |= radMat->surfaceFlags;
        allSurface &= radMat->surfaceFlags;
        anyCompile |= radMat->compileFlags;
        allCompile &= radMat->compileFlags;
    }
    if (outAnySurface)
        *outAnySurface = anySurface;
    if (outAllSurface)
        *outAllSurface = allSurface;
    if (outAnyCompile)
        *outAnyCompile = anyCompile;
    if (outAllCompile)
        *outAllCompile = allCompile;
}
// padding for spacing
// padding for spacing
// padding for spacing
// padding for spacing
// padding for spacing
// padding for spacing
bool Brush_IsFixedOrPatch(brush_t *def)
{
    assert(def);
    assert(def->owner);
    assert(def->owner->eclass);
    if (def->owner->eclass->fixedsize)
        return true;
    return def->patch ? true : false;
}

char Brush_FaceFlags_Check80(brush_t *def)
{
    int allCompile;
    Brush_GetFaceFlags(def, NULL, NULL, NULL, &allCompile);
    char c = allCompile & 0x80;
    return !c;
}

bool Brush_IsFiltered(brush_t *def)
{
    int anySurface, allSurface, allCompile;
    Brush_GetFaceFlags(def, &anySurface, &allSurface, NULL, &allCompile);
    if (!(anySurface & 0x20000000))
    {
        if (allSurface & 1)
            return true;
    }
    return false;
}

#include <stdlib.h>
#include <string.h>
extern winding_t *Winding_Clone(const winding_t *w);
extern int FUN_00448550(const winding_t *in, const float normal[3], double dist, float epsilon, winding_t **front, winding_t **back);
struct brushdef_t;
extern void FUN_00459430(brushdef_t *b, face_t *f, radmat_t *mat);
struct qtexture_s;
extern qtexture_s *__fastcall FUN_00440840(char *name);
extern void FUN_0047a5b0(const char *fmt, ...);
bool FUN_00460470(winding_t *w, const plane_t *plane, brush_t *skip, selbrush_t *node, int faceIndex);

bool FUN_00460440(brush_t *skip, brush_t *b)
{
    if (b == skip)
        return true;
    if (Brush_IsFixedOrPatch(b))
        return true;
    return !Brush_IsFiltered(b);
}

bool FUN_00460470(winding_t *w, const plane_t *plane, brush_t *skip, selbrush_t *node, int faceIndex)
{
    if (!w)
        return false;
    for (;;)
    {
        for (;; node = node->next)
        {
            if (node == &selected_brushes)
            {
                free(w);
                return true;
            }
            brush_t *b = node->def;
            if (b == skip || Brush_IsFixedOrPatch(b))
                continue;
            int anySurface, allSurface, allCompile;
            Brush_GetFaceFlags(b, &anySurface, &allSurface, NULL, &allCompile);
            if (!(anySurface & 0x20000000) && (allSurface & 1))
                break;
        }
        for (;;)
        {
#line 407
            assert(faceIndex >= 0 && faceIndex < node->def->faceCount);
            face_t *f = &node->def->faces[faceIndex];
            winding_t *front, *back;
            int side = FUN_00448550(w, f->plane.normal, f->plane.dist, 0.01f, &front, &back);
            free(w);
            w = back;
            if (FUN_00460470(front, plane, skip, node->next, 0))
            {
                if (w)
                    free(w);
                return true;
            }
            if (side == 2)
            {
                float d = f->plane.normal[0] * plane->normal[0] + f->plane.normal[1] * plane->normal[1] + f->plane.normal[2] * plane->normal[2];
                if (d > 0.0f)
                    break;
            }
            faceIndex++;
            if (!w)
                return false;
            if (faceIndex == node->def->faceCount)
            {
                free(w);
                return false;
            }
        }
        faceIndex = 0;
        if (!w)
            return false;
        node = node->next;
    }
}



bool FUN_00460690(face_t *face, brush_t *b)
{
    if (face->w)
    {
        if (!FUN_00460470(Winding_Clone(face->w), &face->plane, b, selected_brushes.next, 0))
            return false;
    }
    FUN_00459430((brushdef_t *)b, face, (radmat_t *)FUN_00440840("caulk"));
    return true;
}


