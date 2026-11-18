#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"
#include "../common/texturevecs.h"
#define MAX_POINTS_ON_WINDING 64
struct radmat_t { void *handle; const char *name; int pad_08[3]; int width; int height; };
struct texdef_t { radmat_t *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; };
struct facePlane_t { vec3_t normal; int type; double dist; };
struct winding_t { int pointCount; vec3_t points[4]; }; struct brushVertex_t { vec3_t xyz; int faceIndex[3]; };
struct face_t { vec3_t planepts[3]; texdef_t texdef[2]; texdef_t lmTexdef; int contents; int toolFlags; facePlane_t plane; int field_98; int field_9c; winding_t *w; unsigned int color; };
struct entity_t; struct patchMesh_t; struct patch_t; struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct brushdef_t { brushdef_t *oprev; brushdef_t *onext; entity_t *owner; int pad_0c[4]; int refCount; vec3_t mins; vec3_t maxs; int faceCount; face_t *faces; bool modelFailed; char pad_41; short version; patchMesh_t *patch; };
struct brush_t { brush_t *prev; brush_t *next; entity_t *owner; brush_t *ownerNext; brush_t *ownerPrev; brushdef_t *def; int faceCount; faceRender_t *faces; patch_t *patch; short version; unsigned char field_26; unsigned char pad_27; };
struct qeglobals_t { unsigned char pad0[0x18]; int d_gridsize; unsigned char pad1[0x6c060]; int activeMaterial; unsigned char pad2[0xaf4]; int d_exclude; unsigned char pad3[0x24]; int d_select_mode; };
struct orientation_t { vec3_t origin; vec3_t axis[3]; };
#define CrossProduct(a,b,c) ((c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
extern qeglobals_t g_qeglobals;
extern void * (*R_AllocStaticSurface)(void *matHandle, int vertCount, const vec3_t *xyz, const vec3_t *sTangent, const vec3_t *tTangent, const vec3_t *normals, const vec2_t *st, const unsigned int *colors);
extern void (*R_FreeStaticSurface)(void *matHandle, int vertCount, void *vertHandle);
extern bool FUN_00439620(const vec3_t v1, const vec3_t v2);
extern void FUN_0043fbc0(vec2_t outSize, vec4_t texMat[2], const vec3_t normal, float planeDist, vec2_t outShift, float *outRotate, float *outCrossterm);
extern winding_t *Winding_BaseForPlane(const facePlane_t *p);
extern winding_t * Winding_Clone(const winding_t *w);
extern winding_t * Winding_Reverse(winding_t *w);
extern winding_t *FUN_00448280(winding_t *in, const facePlane_t *split, int keepon);
extern int IntersectPlanes(const float **plane, vec3_t xyz); extern int PlaneFromPoints(vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c);
extern void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out); extern void OrientationDirToWorld(const orientation_t *orient, const float *dir, float *out);
extern void FUN_004884a0(const float **planes, float xyz[3], float snap, float epsilon);
extern bool FUN_00494360(const vec3_t planepts[3], float out[4][4]); extern void FUN_00494400(vec4_t out, vec3_t a, vec3_t b, vec3_t c);
extern void Sys_Printf(const char *fmt, ...); extern void Error(const char *error, ...);
extern int FUN_0045f860(const brushdef_t *b, const vec3_t point, float epsilon);
extern brush_t selected_brushes;
#include <malloc.h>
struct eclass_t { eclass_t *next; char *name; int fixedsize; vec3_t mins; vec3_t maxs; float color[4]; unsigned char pad_34[0x160 - 0x34]; int flags_160; };
struct entity_t { unsigned char pad_00[8]; void *def; brush_t brushes; void *model; char *field_38; unsigned char pad_3c[0x50 - 0x3c]; eclass_t *eclass; int pad_54; vec3_t origin; struct epair_t *epairs; };
extern char *ValueForKey(epair_t *&e, const char *key);
extern void FUN_00465bf0(entity_t *e, const char *key, const char *value);
struct patchMesh_t { void *def; };
struct patch_t { patchMesh_t *def; short pad_04; unsigned char selected; };
#define brush_assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)
static const float brush_colorWhite[4] = { 1.0f, 1.0f, 1.0f, 1.0f };
extern void * __fastcall FUN_00440840(const char *name);
extern bool FUN_00465d80(entity_t *e, const char *key);
extern void GetVectorForKey(entity_t *e, const char *key, float *out);
extern void FUN_0047a760(const char *fmt, ...);
extern patch_t *FUN_004392a0(patchMesh_t *def);
extern void FUN_0042f660(patchMesh_t *p);
extern void FUN_004393c0(patchMesh_t *p);
extern void FUN_0042f790(patch_t *p);
extern void FUN_004592f0(brush_t *b);
extern int FUN_00477ba0(int iItem, eclass_t *pec);
extern void FUN_0043dff0();
extern void __stdcall FUN_0043cf80(void *dlg);
extern HWND dword_0109fdb4;
extern char dword_01234a38[];
class CTextureBar : public CDialogBar { public: void FUN_0043f460(); };
class CMainFrame { public: unsigned char pad_00[0x2b8]; CTextureBar m_wndTextureBar; };
extern CMainFrame *g_pParentWnd;
class CPatchDialog : public CDialog { public: void GetPatchInfo(); };
extern CPatchDialog g_PatchDialog;
extern int FUN_00434880(patchMesh_t *p);
extern void FUN_00467240(brushdef_t *b);
extern void FUN_004671b0(void *owner, brushdef_t *def);
int VecNCompareCustomEpsilon(const float *v0, const float *v1, float epsilon, int coordCount);
extern void FUN_0045a220(brushdef_t *b, bool snap);
extern winding_t *FUN_00455660(int faceIndex, const brushVertex_t *verts, int count, const brushdef_t *b);
extern void FUN_00475350();
extern char *dword_01233b64;
extern winding_t * Winding_Alloc(int points);
extern void Sys_MarkMapModified();
extern void (*FUN_0059c468)(const float *inColor, unsigned int *outColor);
extern char *va(const char *format, ...);
extern brushdef_t *BrushDef_CloneNoWinding(const brushdef_t *b);
extern void BrushDef_Free(brushdef_t *def);
extern bool FUN_004481e0(const winding_t *w1, const winding_t *w2, const vec3_t normal1, const vec3_t normal2, float dist1, float dist2);
#line 37
brush_t *Brush_Alloc()
{
    brush_t *b = new brush_t;
    memset(b, 0, sizeof(brush_t));
    return b;
}

brushdef_t *BrushDef_Alloc()
{
    brushdef_t *def = new brushdef_t;
    memset(def, 0, sizeof(brushdef_t));
    return def;
}

void FaceRender_Free(faceRender_t *f)
{
    if (f->vertHandle) {
        assert(f->matHandle);
        (*R_FreeStaticSurface)(f->matHandle, f->vertCount, f->vertHandle);
        f->matHandle = NULL;
        f->vertCount = 0;
        f->vertHandle = NULL;
    }
}

void Face_FreeWinding(face_t *f)
{
    assert(f);
    if (f->w) {
        delete f->w;
        f->w = NULL;
    }
}

extern void Face_GetTextureVecs(const face_t *f, float texVecs[2][4]);
#line 125
bool Face_WriteMaya(const faceRender_t *face, const face_t *def, const orientation_t *orient, FILE *file, bool writeUV, float scale)
{
    assert(face);
    assert(def);
    assert(def->texdef[g_qeglobals.activeMaterial].radMat);
    winding_t *w = def->w;
    if (!w)
        return false;
    vec3_t normal;
    float texVecs[2][4];
    OrientationDirToWorld(orient, def->plane.normal, normal);
    Face_GetTextureVecs(def, texVecs);
    radmat_t *radMat = def->texdef[g_qeglobals.activeMaterial].radMat;
    assert(radMat);
    assert(w->pointCount <= MAX_POINTS_ON_WINDING);
    if (g_qeglobals.d_exclude & 0x2000)
    {
        if (strstr(radMat->name, "caulk") || strstr(radMat->name, "nodraw_decal"))
            return false;
    }
    unsigned char colors[MAX_POINTS_ON_WINDING][4];
    vec3_t normals[MAX_POINTS_ON_WINDING];
    vec2_t st[MAX_POINTS_ON_WINDING];
    vec3_t xyz[MAX_POINTS_ON_WINDING];
    fprintf(file, "\t\t$strPolyInfo = `polyCreateFacet -ch off -tx 1 -s 1");
    for (int i = w->pointCount - 1; i >= 0; --i)
    {
        OrientationPosToWorld(orient, w->points[i], xyz[i]);
        normals[i][0] = normal[0];
        normals[i][1] = normal[1];
        normals[i][2] = normal[2];
        st[i][0] = texVecs[0][0] * w->points[i][0] + texVecs[0][1] * w->points[i][1] + texVecs[0][2] * w->points[i][2] + texVecs[0][3];
        *(unsigned int *)colors[i] = def->color;
        st[i][1] = texVecs[1][0] * w->points[i][0] + texVecs[1][1] * w->points[i][1] + texVecs[1][2] * w->points[i][2] + texVecs[1][3];
        fprintf(file, " -p %f %f %f", w->points[i][0] * scale, w->points[i][1] * scale, w->points[i][2] * scale);
    }
    fprintf(file, "`;\r\n");
    if (writeUV)
    {
        for (int i = w->pointCount - 1; i >= 0; --i)
            fprintf(file, "\t\tpolyEditUV -r false -u %f -v %f ($strPolyInfo[0]).map[%d];\r\n", st[i][0], st[i][1], i);
    }
    return true;
}

void FUN_00454610(face_t *f, const winding_t *w)
{
    if (w)
        f->w = Winding_Clone(w);
    else
        f->w = NULL;
}

#line 185
face_t *Face_AllocArray(int count)
{
    assert(count > 0);
    face_t *f = new face_t[count];
    memset(f, 0, count * sizeof(face_t));
    return f;
}

// pad
// pad
// pad
// pad
// pad
void Face_FreeArray(face_t *f, int count)
{
    assert(f);
    assert(count >= 0);
    for (int i = 0; i < count; ++i)
        Face_FreeWinding(&f[i]);
    delete[] f;
}

// pad
// pad
// pad
faceRender_t *FaceRender_AllocArray(int count)
{
    assert(count > 0);
    faceRender_t *f = new faceRender_t[count];
    memset(f, 0, count * sizeof(faceRender_t));
    return f;
}

// pad
// pad
// pad
// pad
// pad
void FaceRender_FreeArray(brush_t *b, faceRender_t *f, int count)
{
    assert(b);
    assert(f);
    assert(count >= 0);
    for (int i = 0; i < count; ++i)
    {
        if (f[i].vertHandle)
        {
            assert(b->faces);
            (*R_FreeStaticSurface)(f[i].matHandle, f[i].vertCount, f[i].vertHandle);
        }
    }
    delete[] f;
}

void FUN_00454960(const face_t *src, face_t *dst)
{
    memcpy(dst->texdef, src->texdef, sizeof(dst->texdef));
    memcpy(&dst->lmTexdef, &src->lmTexdef, sizeof(dst->lmTexdef));
    dst->color = src->color;
    dst->contents = src->contents;
    dst->toolFlags = src->toolFlags;
    memcpy(dst->planepts, src->planepts, sizeof(dst->planepts));
}

void FUN_004549b0(const face_t *src, face_t *dst)
{
    memcpy(dst->texdef, src->texdef, sizeof(dst->texdef));
    memcpy(&dst->lmTexdef, &src->lmTexdef, sizeof(dst->lmTexdef));
    dst->color = src->color;
    dst->contents = src->contents;
    dst->toolFlags = src->toolFlags;
    memcpy(dst->planepts, src->planepts, sizeof(dst->planepts));
    memcpy(&dst->plane, &src->plane, 0x20);
    if (src->w)
        dst->w = Winding_Clone(src->w);
    else
        dst->w = NULL;
}

#line 269
void Face_GetTextureVecs(const face_t *f, float texVecs[2][4])
{
    const texdef_t *td = &f->texdef[g_qeglobals.activeMaterial];
    assert(td->radMat);
    BuildTextureVecs(f->plane.normal, td->scale, td->shift, td->rotate, td->crossterm, texVecs);
}

void Face_MakePlane(face_t *f)
{
    vec3_t d1, d2;
    VectorSubtract(f->planepts[0], f->planepts[1], d1);
    VectorSubtract(f->planepts[2], f->planepts[1], d2);
    f->plane.normal[0] = d2[2] * d1[1] - d2[1] * d1[2];
    f->plane.normal[1] = d1[2] * d2[0] - d2[2] * d1[0];
    f->plane.normal[2] = d2[1] * d1[0] - d1[1] * d2[0];
    if (FUN_00439620(f->plane.normal, vec3_origin))
        printf("WARNING: brush plane with no normal\n");
    Vec3Normalize(f->plane.normal);
    f->plane.dist = f->plane.normal[2] * f->planepts[1][2] + f->plane.normal[1] * f->planepts[1][1] + f->plane.normal[0] * f->planepts[1][0];
}
#line 320
void FacePlane_ToVec4(const facePlane_t *p, float out[4])
{
    out[0] = p->normal[0];
    out[1] = p->normal[1];
    out[2] = p->normal[2];
    out[3] = (float)p->dist;
}

typedef int (*BrushVertexCallback)(brushdef_t *b, const int *indices, const vec3_t xyz, int acc, void *a5, void *a6);

int Brush_ForEachVertex(brushdef_t *b, BrushVertexCallback cb, void *a5, void *a6)
{
    int faceIndex[3];
    vec3_t xyz;
    float planeVecs[3][4];
    const float *planes[3] = { planeVecs[0], planeVecs[1], planeVecs[2] };
    // pad
    // pad
    // pad
    int acc = 0;
    for (faceIndex[0] = 0; faceIndex[0] < b->faceCount - 2; ++faceIndex[0])
    {
        FacePlane_ToVec4(&b->faces[faceIndex[0]].plane, planeVecs[0]);
        for (faceIndex[1] = faceIndex[0] + 1; faceIndex[1] < b->faceCount - 1; ++faceIndex[1])
        {
            FacePlane_ToVec4(&b->faces[faceIndex[1]].plane, planeVecs[1]);
            for (faceIndex[2] = faceIndex[1] + 1; faceIndex[2] < b->faceCount; ++faceIndex[2])
            {
                FacePlane_ToVec4(&b->faces[faceIndex[2]].plane, planeVecs[2]);
                if (IntersectPlanes(planes, xyz))
                {
                    FUN_004884a0(planes, xyz, 0.25f, 0.01f);
                    acc = cb(b, faceIndex, xyz, acc, a5, a6);
                }
            }
        }
    }
    return acc;
}

void Brush_MakeFacePlanes(brushdef_t *b)
{
    for (int i = 0; i < b->faceCount; ++i)
        Face_MakePlane(&b->faces[i]);
}
#line 410
void Winding_BestAxes(const vec3_t normal, int *axis0, int *axis1)
{
    int best = 0;
    if (fabs(normal[0]) < fabs(normal[1]))
        best = 1;
    if (fabs(normal[best]) < fabs(normal[2]))
        best = 2;
    *axis0 = (~best) & 1;
    *axis1 = (~best) & 2;
}

float Winding_TriangleArea2D(const vec3_t a, const vec3_t b, const vec3_t c, int i, int j)
{
    return (c[j] - b[j]) * a[i] + (b[j] - a[j]) * c[i] + (a[j] - c[j]) * b[i];
}

// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
// pad
void Winding_InsertEdgePoint(winding_t *w, const vec3_t point, int i, int j, int index0, int index1)
{
    assert(w->points[index0][i] != w->points[index1][i] || w->points[index0][j] != w->points[index1][j]);
    float di = w->points[index1][i] - w->points[index0][i];
    float dj = w->points[index1][j] - w->points[index0][j];
    int axis;
    float delta;
    if (fabs(di) >= fabs(dj))
    {
        axis = i;
        delta = di;
    }
    else
    {
        axis = j;
        delta = dj;
    }
    if (delta > 0.0f)
    {
        assert(w->points[index0][axis] < w->points[index1][axis]);
        if (point[axis] < w->points[index0][axis])
            VectorCopy(point, w->points[index0]);
        else if (point[axis] > w->points[index1][axis])
            VectorCopy(point, w->points[index1]);
    }
    else
    {
        assert(w->points[index0][axis] > w->points[index1][axis]);
        if (point[axis] > w->points[index0][axis])
            VectorCopy(point, w->points[index0]);
        else if (point[axis] < w->points[index1][axis])
            VectorCopy(point, w->points[index1]);
    }
}

// pad
// pad
// pad
// pad
// pad
// pad
void Winding_AddPointOrdered(winding_t *w, const vec3_t point, int i, int j)
{
    int bestIndex = -1;
    float bestArea = FLT_MAX;
    int prev = w->pointCount - 1;
    for (int k = 0; k < w->pointCount; ++k)
    {
        float area = Winding_TriangleArea2D(w->points[prev], point, w->points[k], i, j);
        if (bestArea > area)
        {
            bestArea = area;
            bestIndex = k;
        }
        prev = k;
    }
    assert(bestIndex >= 0);
    if (bestArea >= -0.001f)
    {
        if (bestArea <= 0.001f)
            Winding_InsertEdgePoint(w, point, i, j, (w->pointCount + bestIndex - 1) % w->pointCount, bestIndex);
        return;
    }
    memmove(&w->points[bestIndex + 1], &w->points[bestIndex], (w->pointCount - bestIndex) * sizeof(vec3_t));
    VectorCopy(point, w->points[bestIndex]);
    w->pointCount++;
}

float FUN_004554e0(const winding_t *w, const float *normal, int *i0, int *i1, int *i2)
{
    vec3_t vb, va, vc;
    *i0 = 0;
    *i1 = 1;
    *i2 = 2;
    float areaBest = 0.0f;
    for (int k = 2; k < w->pointCount; ++k)
    {
        for (int j = 1; j < k; ++j)
        {
            VectorSubtract(w->points[k], w->points[j], vb);
            for (int i = 0; i < j; ++i)
            {
                VectorSubtract(w->points[i], w->points[j], va);
                Vec3Cross(va, vb, vc);
                float area = (float)fabs(DotProduct(vc, normal));
                if (area > areaBest)
                {
                    areaBest = area;
                    *i0 = i;
                    *i1 = j;
                    *i2 = k;
                }
            }
        }
    }
    return areaBest;
}

void FUN_00455950(brushdef_t *b)
{
    if (*(int *)(dword_01233b64 + 0x248) != 0)
        return;
    for (int i = 0; i < b->faceCount; ++i)
    {
        face_t *f = &b->faces[i];
        for (int j = 0; j < 3; ++j)
            for (int k = 0; k < 3; ++k)
                f->planepts[j][k] = (float)floor(f->planepts[j][k] + 0.5f);
    }
}

void FUN_004559f0(brushdef_t *b, bool snap, bool markMap)
{
    FUN_0045a220(b, snap);
    if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
        FUN_00475350();
    if (markMap)
        Sys_MarkMapModified();
    b->version++;
}

#line 701
face_t *Face_Alloc(brushdef_t *b, const face_t *f)
{
    assert(b);
    assert(f);
    // pad
    face_t *faceList = Face_AllocArray(b->faceCount + 1);
    brush_assert1(faceList);
    memcpy(faceList, b->faces, b->faceCount * sizeof(face_t));
    faceList[b->faceCount] = *f;
    FUN_00454610(&faceList[b->faceCount], f->w);
    for (int i = 0; i < b->faceCount; ++i)
        b->faces[i].w = NULL;
    if (b->faces)
        Face_FreeArray(b->faces, b->faceCount);
    b->faceCount++;
    b->faces = faceList;
    return &faceList[b->faceCount - 1];
}

#line 724
void Brush_RemoveFace(brushdef_t *b, int faceIndex)
{
    assert(b);
    assert(faceIndex >= 0 && faceIndex < b->faceCount);
    Face_FreeWinding(&b->faces[faceIndex]);
    b->faceCount--;
    for (; faceIndex < b->faceCount; ++faceIndex)
        b->faces[faceIndex] = b->faces[faceIndex + 1];
}
#line 743
void Brush_RemoveEmptyFaces(brushdef_t *b)
{
    for (int i = 0; i < b->faceCount; )
    {
        if (!b->faces[i].w)
            Brush_RemoveFace(b, i);
        else
            ++i;
    }
}

bool FUN_00455e20(const brushdef_t *b)
{
    for (int i = 0; i < b->faceCount; ++i)
    {
        if (!b->faces[i].w)
            continue;
        for (int j = 0; j < b->faceCount; ++j)
        {
            if (i == j || !b->faces[j].w)
                continue;
            if (FUN_004481e0(b->faces[i].w, b->faces[j].w, b->faces[i].plane.normal, b->faces[j].plane.normal, (float)b->faces[i].plane.dist, (float)b->faces[j].plane.dist))
                return false;
        }
    }
    return true;
}

#line 1110
void Texdef_SetDefault(texdef_t *td, int layer, float scale)
{
    radmat_t *mat = (radmat_t *)FUN_00440840(layer == 1 ? "lightmap_gray" : "case");
    td->radMat = mat;
    float h = (float)mat->height * scale;
    float w = (float)mat->width * scale;
    td->scale[1] = h;
    td->scale[0] = w;
    td->shift[0] = 0;
    td->shift[1] = 0;
    td->rotate = 0;
    td->crossterm = 0;
}

void Face_SetDefaultTexdefs(face_t *f, int skipLayer, float scale)
{
    for (int i = 0; i < 2; ++i)
    {
        if (i != skipLayer)
            Texdef_SetDefault(&f->texdef[i], i, scale);
    }
}

void Brush_SetDefaultTexdefs(brushdef_t *b, int skipLayer, float scale)
{
    for (int i = 0; i < b->faceCount; ++i)
        Face_SetDefaultTexdefs(&b->faces[i], skipLayer, scale);
}

#line 1420
void FUN_00457bd0(brushdef_t *b)
{
    float color[4];
    unsigned int packed;

#line 1422
    assert(b);
    entity_t *owner = b->owner;
    if (owner && owner->eclass && owner->eclass->fixedsize)
    {
        if (FUN_00465d80(owner, "_color"))
        {
            GetVectorForKey(owner, "_color", color);
            color[3] = 1.0f;
        }
        else
        {
            color[0] = owner->eclass->color[0];
            color[1] = owner->eclass->color[1];
            color[2] = owner->eclass->color[2];
            color[3] = owner->eclass->color[3];
        }
    }
    else
    {
        color[0] = 1.0f;
        color[1] = 1.0f;
        color[2] = 1.0f;
        color[3] = 1.0f;
    }
    (*FUN_0059c468)(color, &packed);
    for (int i = 0; i < b->faceCount; ++i)
        b->faces[i].color = packed;
    b->version++;
}

brushdef_t *Brush_CreateFromTexdef(eclass_t *eclass, const texdef_t *td)
{
    unsigned int color;
    (*FUN_0059c468)(eclass ? eclass->color : brush_colorWhite, &color);
    brushdef_t *b = BrushDef_Alloc();
    b->faceCount = 6;
    if (eclass && (eclass->flags_160 & 1))
        b->faceCount = 8;
    b->faces = Face_AllocArray(b->faceCount);
    for (int i = 0; i < b->faceCount; ++i)
    {
        face_t *f = &b->faces[i];
        f->texdef[0] = *td;
        f->color = color;
        f->contents &= ~0x08002084;
    }
    for (int i = 0; i < b->faceCount; ++i)
        Face_SetDefaultTexdefs(&b->faces[i], 0, 16.0f);
    return b;
}

void Brush_InitSolid(brushdef_t *b, const vec3_t mins, const vec3_t maxs, eclass_t *eclass)
{
    for (int i = 0; i < 3; ++i)
    {
        if (maxs[i] < mins[i])
            FUN_0047a760("Brush_InitSolid: backwards");
    }
    vec3_t pts[4][2];
    if (eclass && (eclass->flags_160 & 1))
    {
        vec3_t mid;
        mid[0] = (mins[0] + maxs[0]) * 0.5f;
        mid[1] = (maxs[1] + mins[1]) * 0.5f;
        mid[2] = (mins[2] + maxs[2]) * 0.5f;
        pts[0][0][0] = mins[0];
        pts[0][0][1] = mins[1];
        pts[1][0][0] = mins[0];
        pts[1][0][1] = maxs[1];
        pts[2][0][0] = maxs[0];
        pts[2][0][1] = maxs[1];
        pts[3][0][0] = maxs[0];
        pts[3][0][1] = mins[1];
        for (int i = 0; i < 4; ++i)
            pts[i][0][2] = mid[2];
        for (int i = 0; i < 4; ++i)
        {
            face_t *f = &b->faces[i];
#line 1509
            assert(f);
            f->planepts[0][0] = mid[0]; f->planepts[0][1] = mid[1]; f->planepts[0][2] = maxs[2];
            VectorCopy(pts[i][0], f->planepts[1]);
            VectorCopy(pts[(i + 1) & 3][0], f->planepts[2]);
        }
        for (int i = 0; i < 4; ++i)
        {
            face_t *f = &b->faces[i + 4];
#line 1517
            assert(f);
            f->planepts[0][0] = mid[0]; f->planepts[0][1] = mid[1]; f->planepts[0][2] = mins[2];
            VectorCopy(pts[(i + 1) & 3][0], f->planepts[1]);
            VectorCopy(pts[i][0], f->planepts[2]);
        }
        return;
    }
    pts[0][0][0] = mins[0];
    pts[0][0][1] = mins[1];
    pts[1][0][0] = mins[0];
    pts[1][0][1] = maxs[1];
    pts[2][0][0] = maxs[0];
    pts[2][0][1] = maxs[1];
    pts[3][0][0] = maxs[0];
    pts[3][0][1] = mins[1];
    for (int i = 0; i < 4; ++i)
    {
        pts[i][0][2] = mins[2];
        pts[i][1][0] = pts[i][0][0];
        pts[i][1][1] = pts[i][0][1];
        pts[i][1][2] = maxs[2];
    }
    for (int i = 0; i < 4; ++i)
    {
        face_t *f = &b->faces[i];
        int j = (i + 1) & 3;
        VectorCopy(pts[j][1], f->planepts[0]);
        VectorCopy(pts[i][1], f->planepts[1]);
        VectorCopy(pts[i][0], f->planepts[2]);
    }
    VectorCopy(pts[0][1], b->faces[4].planepts[0]);
    VectorCopy(pts[1][1], b->faces[4].planepts[1]);
    VectorCopy(pts[2][1], b->faces[4].planepts[2]);
    VectorCopy(pts[2][0], b->faces[5].planepts[0]);
    VectorCopy(pts[1][0], b->faces[5].planepts[1]);
    VectorCopy(pts[0][0], b->faces[5].planepts[2]);
}

#line 1571
void Brush_RemoveFromEntity(brush_t *b, entity_t *owner)
{
    assert(b);
    if (b->owner)
    {
#line 1577
        assert(b->ownerNext);
        assert(b->ownerPrev);
        b->ownerNext->ownerPrev = b->ownerPrev;
        b->ownerPrev->ownerNext = b->ownerNext;
        b->ownerNext = NULL;
        b->ownerPrev = NULL;
        b->owner = NULL;
    }
    else
    {
#line 1588
        assert(!b->ownerNext);
        assert(!b->ownerPrev);
    }
#line 1592
    brush_assert1(b->owner == NULL);
    brush_assert1(b->ownerNext == NULL);
    brush_assert1(b->ownerPrev == NULL);
    if (owner)
    {
        b->owner = owner;
        b->ownerNext = owner->brushes.ownerNext;
        owner->brushes.ownerNext->ownerPrev = b;
        owner->brushes.ownerNext = b;
        b->ownerPrev = &owner->brushes;
    }
}

brush_t *FUN_00458440(brushdef_t *def, entity_t *owner)
{
#line 1610
    assert(def);
    assert(owner);
    assert(def->owner == owner->def);
    brush_t *b = new brush_t;
    memset(b, 0, sizeof(brush_t));
    b->def = def;
    b->version = def->version - 1;
    def->refCount++;
    if (b->def->patch)
    {
        b->patch = FUN_004392a0(b->def->patch);
#line 1622
        brush_assert1(b->patch->def == b->def->patch);
    }
    Brush_RemoveFromEntity(b, owner);
#line 1626
    brush_assert1(b->owner == owner);
    brush_assert1(b->owner->def == b->def->owner);
    return b;
}

brushdef_t *BrushDef_Create(const vec3_t mins, const vec3_t maxs, eclass_t *eclass, const texdef_t *td)
{
    brushdef_t *def = Brush_CreateFromTexdef(eclass, td);
    Brush_InitSolid(def, mins, maxs, eclass);
    return def;
}

void FUN_00458af0(brushdef_t *def)
{
#line 1780
    assert(def);
    assertMsg((def->refCount == 0), "(def->refCount) = %i", def->refCount);
    patchMesh_t *patch = def->patch;
    if (patch)
        FUN_0042f660(patch);
    face_t *faces = def->faces;
    if (faces)
        Face_FreeArray(faces, def->faceCount);
#line 1789
    assert(def->onext == NULL);
    delete def;
}

int Face_MemorySize(const face_t *f)
{
    int size = sizeof(face_t);
    if (f->w)
        size += (int)_msize(f->w);
    return size;
}

int BrushDef_MemorySize(const brushdef_t *b)
{
    int size = sizeof(brushdef_t);
    if (b->patch)
        size += (int)_msize(b->patch);
    for (int i = 0; i < b->faceCount; ++i)
        size += Face_MemorySize(&b->faces[i]);
    return size;
}

// retail takes b in eax and list in edi
void FUN_00459210(brush_t *b, brush_t *list)
{
    if (b->next || b->prev)
        FUN_0047a760("Brush_AddToList: allready linked");
    if (list == &selected_brushes)
    {
        b->prev = list->prev;
        list->prev->next = b;
        list->prev = b;
        b->next = list;
    }
    else
    {
        b->next = list->next;
        list->next->prev = b;
        list->next = b;
        b->prev = list;
    }
    if (list != &selected_brushes)
        return;
    if (b->patch)
        b->patch->selected = 1;
    FUN_00477ba0(-1, NULL);
    if (dword_0109fdb4)
    {
        FUN_0043dff0();
        FUN_0043cf80(dword_01234a38);
    }
    CTextureBar *textureBar = &g_pParentWnd->m_wndTextureBar;
    if (textureBar->GetSafeHwnd())
        textureBar->FUN_0043f460();
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

bool FUN_004592c0(brush_t *b)
{
    for (brush_t *p = selected_brushes.next; p != &selected_brushes; p = p->next)
    {
        if (p == b)
            return true;
    }
    return false;
}

void FUN_004592f0(brush_t *b)
{
    if (!b->next || !b->prev)
        FUN_0047a760("Brush_RemoveFromList: not linked");
    bool selected = FUN_004592c0(b);
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->prev = NULL;
    b->next = NULL;
    if (!selected)
        return;
    if (b->patch)
        b->patch->selected = 0;
    FUN_00477ba0(-1, NULL);
    if (dword_0109fdb4)
    {
        FUN_0043dff0();
        FUN_0043cf80(dword_01234a38);
    }
    CTextureBar *textureBar = &g_pParentWnd->m_wndTextureBar;
    if (textureBar->GetSafeHwnd())
        textureBar->FUN_0043f460();
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

int FUN_0045a150(brushdef_t *b, const int *indices, const vec3_t xyz, int count, void *maxPtr, void *out)
{
    int maxPoints = (int)maxPtr;
    for (int i = 0; i < b->faceCount; ++i)
    {
        if (i == indices[0] || i == indices[1] || i == indices[2])
            continue;
        const facePlane_t *p = &b->faces[i].plane;
        float d = p->normal[0] * xyz[0] + p->normal[1] * xyz[1] + p->normal[2] * xyz[2] - p->dist;
        if (d > 0.01)
            return count;
    }
    if (count == maxPoints)
        Error("More than %i points from plane intersections on %i-sided brush\n", count, b->faceCount);
    brushVertex_t *v = (brushVertex_t *)out + count;
    VectorCopy(xyz, v->xyz);
    v->faceIndex[0] = indices[0];
    v->faceIndex[1] = indices[1];
    v->faceIndex[2] = indices[2];
    return count + 1;
}

void FUN_0045a220(brushdef_t *b, bool snap)
{
    brushVertex_t verts[1024];
    if (snap)
        FUN_00455950(b);
    Brush_MakeFacePlanes(b);
    int count = Brush_ForEachVertex(b, FUN_0045a150, (void *)1024, verts);
    if (count < 4)
        Error("Brush_BuildWindings:  degenerate brush");
    for (int i = 0; i < b->faceCount; ++i)
    {
        face_t *f = &b->faces[i];
        Face_FreeWinding(f);
#line 2413
        assert(f->w == NULL);
        f->w = FUN_00455660(i, verts, count, b);
    }
    b->mins[0] = b->mins[1] = b->mins[2] = 131072.0f;
    b->maxs[0] = b->maxs[1] = b->maxs[2] = -131072.0f;
    for (int i = 0; i < count; ++i)
        AddPointToBounds(verts[i].xyz, b->mins, b->maxs);
}

bool FUN_0045b630(brush_t *b)
{
    for (brush_t *p = selected_brushes.next; p != &selected_brushes; p = p->next)
    {
        if (p == b)
            return true;
    }
    return false;
}

void FUN_0045cc90(float delta)
{
    char buf[32];
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
#line 3294
        assert(b->owner->def == b->def->owner);
        entity_t *e = (entity_t *)b->owner->def;
        if (e->eclass->fixedsize && !_stricmp(e->eclass->name, "light"))
        {
            float v = atof(ValueForKey(e->epairs, "overbrightShift"));
            v += delta;
            if (v > 1.0f)
                v = 1.0f;
            else if (v < 0.0f)
                v = 0.0f;
            sprintf(buf, "%f", v);
            FUN_00465bf0(e, "overbrightShift", buf);
        }
    }
}

void FUN_0045cdc0(float scale)
{
    char buf[32];
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
#line 3323
        assert(b->owner->def == b->def->owner);
        entity_t *e = (entity_t *)b->owner->def;
        if (e->eclass->fixedsize)
        {
            if (!_stricmp(e->eclass->name, "light"))
            {
                float v = atof(ValueForKey(e->epairs, "light"));
                if (v == 0.0f)
                    v = 300.0f;
                v *= scale;
                if (v < 0.0f)
                    v = 0.0f;
                sprintf(buf, "%f", v);
                FUN_00465bf0(e, "light", buf);
            }
            else
            {
                float v = atof(ValueForKey(e->epairs, "radius"));
                if (v == 0.0f)
                    v = 256.0f;
                v *= scale;
                if (v < 0.0f)
                    v = 0.0f;
                sprintf(buf, "%f", v);
                FUN_00465bf0(e, "radius", buf);
            }
        }
    }
}

void FUN_0045cf60(float scale)
{
    char buf[32];
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
#line 3362
        assert(b->owner->def == b->def->owner);
        entity_t *e = (entity_t *)b->owner->def;
        if (e->eclass->fixedsize && (e->eclass->flags_160 & 0x40))
        {
            float v = atof(ValueForKey(e->epairs, "height"));
            if (v == 0.0f)
                v = 128.0f;
            v *= scale;
            if (v < 0.0f)
                v = 0.0f;
            sprintf(buf, "%f", v);
            FUN_00465bf0(e, "height", buf);
        }
    }
}

bool FUN_0045d090(const brushdef_t *b, float *color, const float *defaultColor)
{
    if (!_stricmp(b->owner->eclass->name, "worldspawn"))
        return false;
    char *colorString = ValueForKey(b->owner->epairs, "_color");
#line 3399
    assert(colorString);
    vec3_t c;
    if (sscanf(colorString, "%f %f %f", &c[0], &c[1], &c[2]) == 3)
    {
        color[0] = c[0];
        color[1] = c[1];
        color[2] = c[2];
        color[3] = defaultColor[3];
        return true;
    }
    if (!strncmp(b->owner->eclass->name, "actor", 5))
    {
        if (atoi(ValueForKey(b->owner->epairs, "spawnflags")))
        {
            color[0] = b->owner->eclass->color[0];
            color[1] = 0.8f;
        }
        else
        {
            color[0] = b->owner->eclass->color[0];
            color[1] = b->owner->eclass->color[1];
        }
        color[2] = b->owner->eclass->color[2];
        color[3] = b->owner->eclass->color[3];
        return true;
    }
    if ((b->owner->eclass->flags_160 & 0x20) && !strncmp(b->owner->eclass->name, "node_path", 9))
    {
        entity_t *e = b->owner;
        if (FUN_00465d80(e, "targetname"))
        {
            const char *targetname = ValueForKey(e->epairs, "targetname");
            if (strncmp(targetname, "auto", 4))
            {
                color[1] = 1.0f;
                color[3] = 1.0f;
                color[0] = 0.0f;
                color[2] = 0.0f;
                return true;
            }
        }
    }
    return false;
}

void FUN_0045d240(const brushdef_t *b, const orientation_t *or, vec3_t mins, vec3_t maxs)
{
    vec3_t xyz;
#line 3457
    assert(b);
    assert(or);
    assert(mins);
    assert(maxs);
    for (int i = 0; i < b->faceCount; i++)
    {
        winding_t *w = b->faces[i].w;
        if (!w)
            continue;
        for (int j = 0; j < w->pointCount; j++)
        {
            OrientationPosToWorld(or, w->points[j], xyz);
            if (xyz[0] < mins[0])
                mins[0] = xyz[0];
            if (xyz[0] > maxs[0])
                maxs[0] = xyz[0];
            if (xyz[1] < mins[1])
                mins[1] = xyz[1];
            if (xyz[1] > maxs[1])
                maxs[1] = xyz[1];
            if (xyz[2] < mins[2])
                mins[2] = xyz[2];
            if (xyz[2] > maxs[2])
                maxs[2] = xyz[2];
        }
    }
}

float FUN_0045ebc0(float a, float b)
{
    return a - (float)floor(a / b) * b;
}

void FUN_0045efb0(face_t *f)
{
#line 4163
    assert(f);
    f->lmTexdef = f->texdef[g_qeglobals.activeMaterial];
}

void FUN_0045f010(face_t *f, brushdef_t *b)
{
#line 4170
    assert(f);
    f->texdef[g_qeglobals.activeMaterial] = f->lmTexdef;
    b->version++;
}

// 0x0045f070 (219 B), b in ebx
void FUN_0045f070(brushdef_t *b)
{
#line 4180
    assert(b);
    for (int i = 0; i < b->faceCount; i++)
        FUN_0045efb0(&b->faces[i]);
    if (b->patch)
        FUN_004393c0(b->patch);
}

void FUN_0045f830(const vec3_t a, const vec3_t b, vec3_t out, float t)
{
    out[0] = (b[0] - a[0]) * t + a[0];
    out[1] = (b[1] - a[1]) * t + a[1];
    out[2] = (b[2] - a[2]) * t + a[2];
}

