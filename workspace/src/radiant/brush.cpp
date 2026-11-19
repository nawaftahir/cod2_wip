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
struct entity_t; struct epair_t; struct patchMesh_t; struct patch_t; struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct brushdef_t { brushdef_t *oprev; brushdef_t *onext; entity_t *owner; int pad_0c[4]; int refCount; vec3_t mins; vec3_t maxs; int faceCount; face_t *faces; bool modelFailed; char pad_41; short version; patchMesh_t *patch; };
struct brush_t { brush_t *prev; brush_t *next; entity_t *owner; brush_t *ownerNext; brush_t *ownerPrev; brushdef_t *def; int faceCount; faceRender_t *faces; patch_t *patch; short version; unsigned char field_26; unsigned char pad_27; };
struct qeglobals_t { unsigned char pad0[0x18]; int d_gridsize; unsigned char pad1[0x6c060]; int activeMaterial; unsigned char pad2[0xaf4]; int d_exclude; unsigned char pad3[0x24]; int d_select_mode; };
struct orientation_t { vec3_t origin; vec3_t axis[3]; };
#define CrossProduct(a,b,c) ((c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
extern qeglobals_t g_qeglobals;
extern void * (*R_AllocStaticSurface)(void *matHandle, int vertCount, const vec3_t *xyz, const vec3_t *sTangent, const vec3_t *tTangent, const vec3_t *normals, const vec2_t *st, const unsigned int *colors);
extern void (*R_FreeStaticSurface)(void *matHandle, int vertCount, void *vertHandle);
extern int FUN_00439620(const vec3_t v1, const vec3_t v2);
extern void FUN_0043fbc0(vec2_t outSize, vec4_t texMat[2], const vec3_t normal, float planeDist, vec2_t outShift, float *outRotate, float *outCrossterm);
extern winding_t *Winding_BaseForPlane(const facePlane_t *p);
extern winding_t * Winding_Clone(const winding_t *w);
extern winding_t * Winding_Reverse(winding_t *w);
extern winding_t *FUN_00448280(winding_t *in, const facePlane_t *split, int keepon);
extern int IntersectPlanes(const float **plane, vec3_t xyz); extern int PlaneFromPoints(vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c);
extern void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out); extern void OrientationDirToWorld(const orientation_t *orient, const float *dir, float *out);
extern void FUN_004884a0(const float **planes, float xyz[3], float snap, float epsilon);
extern bool FUN_00494360(float out[4][4], const vec3_t p0, const vec3_t p1, const vec3_t p2, const facePlane_t *plane); extern void FUN_00494400(vec4_t out, const float sys[4][4], float a, float b, float c);
extern void Sys_Printf(const char *fmt, ...); extern void Error(const char *error, ...);
extern int FUN_0045f860(const vec3_t a, const vec3_t b, float eps);
extern void FUN_00433830(patchMesh_t *p);
extern void FUN_0045ebf0(face_t *f, int h, int w, int a);
extern void *FUN_004267d0(patchMesh_t *p, int layer, int a, int b);
extern void FUN_0045a830(brush_t *b);
extern void FUN_0045a600(brush_t *b);
extern void FUN_0042cc50(patch_t *p);
extern void DeleteKey(epair_t *&e, const char *key);
extern void FUN_004655f0(entity_t *e, const char *key);
extern void FUN_004657a0(entity_t *e, const char *key);
extern brush_t dword_010a44dc, dword_010a44b4, dword_010a448c;
extern int dword_012485bc;
extern char *dword_012485b8;
extern brushdef_t *FUN_00458dc0(const brushdef_t *b);
void FUN_00458af0(brushdef_t *def);
void FUN_00459920(brushdef_t *b, int scale);
void FUN_0045e0b0(brushdef_t *b);
void FUN_0042f970(const texdef_t *td, patchMesh_t *p, int a, int c);
void FUN_0042fad0(patchMesh_t *p, int amount);
#define brush_layer ((&g_qeglobals.activeMaterial)[1])
void FUN_004671b0(brushdef_t *b, entity_t *owner);
extern brush_t selected_brushes;
extern brush_t active_brushes;
extern entity_t *world_entity;
struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts);
bool FUN_0045d090(const brushdef_t *b, float *color, const float *defaultColor);
#include <malloc.h>
struct eclass_t { eclass_t *next; char *name; int fixedsize; vec3_t mins; vec3_t maxs; float color[4]; unsigned char pad_34[0x160 - 0x34]; int flags_160; };
struct entity_t { unsigned char pad_00[8]; void *def; brush_t brushes; void *model; char *field_38; unsigned char pad_3c[0x50 - 0x3c]; eclass_t *eclass; int pad_54; vec3_t origin; struct epair_t *epairs; short field_68; };
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
#include "TextureBar.h"
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
extern bool FUN_00447a50(const facePlane_t *a, const facePlane_t *b, bool flip);
extern bool FUN_00447b50(const vec3_t p1, const vec3_t p2, const vec3_t p3, facePlane_t *plane);
extern bool Point_Equal(const vec3_t p1, const vec3_t p2, float epsilon);
extern void Winding_RemovePoint(winding_t *w, int point);
extern winding_t *FUN_00448a10(const winding_t *f1, const winding_t *f2, const vec3_t planenormal, bool keep);
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


#line 87
void FUN_00453e90(faceRender_t *face, const face_t *def, const orientation_t *orient)
{
    assert(face);
    assert(face->vertHandle == NULL);
    assert(def);
    assert(def->texdef[g_qeglobals.activeMaterial].radMat);
    winding_t *w = def->w;
    if (!w)
        return;
    vec3_t normal;
    float texVecs[2][4];
    OrientationDirToWorld(orient, def->plane.normal, normal);
    Face_GetTextureVecs(def, texVecs);
    radmat_t *radMat = def->texdef[g_qeglobals.activeMaterial].radMat;
#line 99
    assert(radMat);
    assert(radMat->handle);
    assert(w->pointCount <= MAX_POINTS_ON_WINDING);
    unsigned char colors[MAX_POINTS_ON_WINDING][4];
    vec3_t normals[MAX_POINTS_ON_WINDING];
    vec2_t st[MAX_POINTS_ON_WINDING];
    vec3_t xyz[MAX_POINTS_ON_WINDING];
    vec3_t binormal[MAX_POINTS_ON_WINDING];
    vec3_t tangent[MAX_POINTS_ON_WINDING];
    for (int i = 0; i < w->pointCount; ++i)
    {
        OrientationPosToWorld(orient, w->points[i], xyz[i]);
        normals[i][0] = normal[0];
        normals[i][1] = normal[1];
        normals[i][2] = normal[2];
        st[i][0] = texVecs[0][0] * w->points[i][0] + texVecs[0][1] * w->points[i][1] + texVecs[0][2] * w->points[i][2] + texVecs[0][3];
        *(unsigned int *)colors[i] = def->color;
        st[i][1] = texVecs[1][0] * w->points[i][0] + texVecs[1][1] * w->points[i][1] + texVecs[1][2] * w->points[i][2] + texVecs[1][3];
    }
    face->matHandle = radMat->handle;
    face->vertCount = w->pointCount;
    face->vertHandle = (*R_AllocStaticSurface)(face->matHandle, w->pointCount, xyz, tangent, binormal, normals, st, (const unsigned int *)colors);
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
    Vec3Cross(d1, d2, f->plane.normal);
    if (FUN_00439620(f->plane.normal, vec3_origin))
        printf("WARNING: brush plane with no normal\n");
    Vec3Normalize(f->plane.normal);
    f->plane.dist = DotProduct(f->planepts[1], f->plane.normal);
}

void FUN_00454b70(float st[2][3][2], const face_t *f)
{
    for (int i = 0; i < 2; i++)
    {
        float texVecs[2][4];
        BuildTextureVecs(f->plane.normal, f->texdef[i].scale, f->texdef[i].shift, f->texdef[i].rotate, f->texdef[i].crossterm, texVecs);
        for (int j = 0; j < 3; j++)
        {
            st[i][j][0] = DotProduct(f->planepts[j], texVecs[0]) + texVecs[0][3];
            st[i][j][1] = DotProduct(f->planepts[j], texVecs[1]) + texVecs[1][3];
        }
    }
}

void FUN_00454c80(face_t *f, float st[2][3][2], const bool *lock)
{
    float sys[4][4];

    Face_MakePlane(f);
    if (!FUN_00494360(sys, f->planepts[0], f->planepts[1], f->planepts[2], &f->plane))
        return;
    for (int i = 0; i < 2; i++)
    {
        if (!lock[i])
            continue;
        vec4_t texMat[2];
        FUN_00494400(texMat[0], sys, st[i][0][0], st[i][1][0], st[i][2][0]);
        FUN_00494400(texMat[1], sys, st[i][0][1], st[i][1][1], st[i][2][1]);
        FUN_0043fbc0(f->texdef[i].scale, texMat, f->plane.normal, (float)f->plane.dist, f->texdef[i].shift, &f->texdef[i].rotate, &f->texdef[i].crossterm);
    }
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


int FUN_00454f30(const vec3_t *pts, int count, const vec3_t p)
{
    for (int i = 0; i < count; i++)
    {
        if (FUN_0045f860(pts[i], p, 0.01f))
            return 1;
    }
    return 0;
}


int FUN_00454f70(vec3_t *xyz, const brushVertex_t *verts, int count, int faceIndex, int xyzLimit)
{
    int xyzCount = 0;
    for (int i = 0; i < count; ++i)
    {
        if (faceIndex == verts[i].faceIndex[0] || faceIndex == verts[i].faceIndex[1] || faceIndex == verts[i].faceIndex[2])
        {
            if (FUN_00454f30(xyz, xyzCount, verts[i].xyz))
                continue;
            if (xyzCount == xyzLimit)
                Error("Winding point limit (%i) exceeded on brush face", xyzLimit);
            VectorCopy(verts[i].xyz, xyz[xyzCount]);
            ++xyzCount;
        }
    }
    return xyzCount;
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



winding_t *FUN_00455660(int faceIndex, const brushVertex_t *verts, int count, const brushdef_t *b)
{
    vec3_t pts[MAX_POINTS_ON_WINDING];
    int n = FUN_00454f70(pts, verts, count, faceIndex, MAX_POINTS_ON_WINDING);
    if (n < 3)
        return NULL;
    int axis0, axis1;
    const float *facePlane = b->faces[faceIndex].plane.normal;
    Winding_BestAxes(facePlane, &axis0, &axis1);
    winding_t *w = Winding_Alloc(n);
    VectorCopy(pts[0], w->points[0]);
    VectorCopy(pts[1], w->points[1]);
    w->pointCount = 2;
    for (int i = 2; i < n; ++i)
        Winding_AddPointOrdered(w, pts[i], axis0, axis1);
    int t0, t1, t2;
    vec3_t normal;
    if (!(FUN_004554e0(w, facePlane, &t1, &t0, &t2) >= 0.001f))
    {
        delete w;
        return NULL;
    }
    PlaneFromPoints(normal, w->points[t2], w->points[t0], w->points[t1]);
    if (DotProduct(normal, facePlane) < 0.0f)
    {
        winding_t *r = Winding_Reverse(w);
        delete w;
        return r;
    }
    return w;
}


winding_t *FUN_00455800(const brushdef_t *b, const face_t *face)
{
    winding_t *w = Winding_BaseForPlane(&face->plane);
    bool pastSelf = false;
    for (int i = 0; i < b->faceCount && w; ++i)
    {
        const face_t *clip = &b->faces[i];
        if (clip == face)
        {
            pastSelf = true;
            continue;
        }
        if (DotProduct(face->plane.normal, clip->plane.normal) > 0.999f && fabs(face->plane.dist - clip->plane.dist) <= 0.01)
        {
            if (pastSelf)
            {
                delete w;
                return NULL;
            }
            continue;
        }
        facePlane_t back;
        back.normal[0] = -clip->plane.normal[0];
        back.normal[1] = -clip->plane.normal[1];
        back.normal[2] = -clip->plane.normal[2];
        back.dist = -clip->plane.dist;
        w = FUN_00448280(w, &back, 0);
        if (!w)
            return NULL;
    }
    if (w->pointCount < 3)
    {
        delete w;
        printf("unused plane\n");
        return NULL;
    }
    return w;
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


void FUN_00455cf0(brushdef_t *in, const face_t *f, brushdef_t **front, brushdef_t **back)
{
    brushdef_t *b = FUN_00458dc0(in);
    face_t *nf = Face_Alloc(b, f);
    (*FUN_0059c468)(brush_colorWhite, &nf->color);
    FUN_004559f0(b, true, true);
    Brush_RemoveEmptyFaces(b);
    if (b->faceCount >= 4)
    {
        FUN_004671b0(b, in->owner);
        *back = b;
    }
    else
    {
        FUN_00458af0(b);
        *back = NULL;
    }
    b = FUN_00458dc0(in);
    nf = Face_Alloc(b, f);
    vec3_t temp;
    VectorCopy(nf->planepts[0], temp);
    VectorCopy(nf->planepts[1], nf->planepts[0]);
    VectorCopy(temp, nf->planepts[1]);
    (*FUN_0059c468)(brush_colorWhite, &nf->color);
    FUN_004559f0(b, true, true);
    Brush_RemoveEmptyFaces(b);
    if (b->faceCount < 4)
    {
        FUN_00458af0(b);
        *front = NULL;
        return;
    }
    FUN_004671b0(b, in->owner);
    *front = b;
}



bool FUN_00455e20(const brushdef_t *b)
{
    int faceCount = b->faceCount;
    for (int i = 0; i < faceCount; ++i)
    {
        winding_t *w1 = b->faces[i].w;
        if (!w1)
            continue;
        for (int j = 0; j < faceCount; ++j)
        {
            if (i == j || !b->faces[j].w)
                continue;
            if (FUN_004481e0(w1, b->faces[j].w, b->faces[i].plane.normal, b->faces[j].plane.normal, (float)b->faces[i].plane.dist, (float)b->faces[j].plane.dist))
                return false;
        }
    }
    return true;
}

// pad
#line 861
int FUN_00455ee0(brushdef_t *b, const vec3_t vertex, const vec3_t delta, vec3_t end, bool bSnap)
{
    face_t *face, *newface;
    winding_t *w, tmpw;
    vec3_t start, mid;
    facePlane_t plane;
    int movefaces[64];
    int movefacepoints[64];
    int originalFaceIndex[64];
    int i, j, k, faceIndex, numFaces, nummovefaces, result, done;
    float dot, front, back, frac, smallestfrac;

    result = true;
    tmpw.pointCount = 3;
    VectorCopy(vertex, start);
    VectorAdd(vertex, delta, end);
    if (bSnap)
    {
        for (i = 0; i < 3; i++)
            end[i] = floor(end[i] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
    }
    if (Point_Equal(start, end, 0.3f))
        return false;
    for (i = 0; i < b->faceCount; i++)
    {
        originalFaceIndex[i] = i;
        w = b->faces[i].w;
        if (!w)
            continue;
        for (k = 0; k < w->pointCount; k++)
        {
            if (Point_Equal(w->points[k], end, 0.3f))
            {
                VectorCopy(vertex, end);
                return false;
            }
        }
    }
    do
    {
        nummovefaces = 0;
        numFaces = b->faceCount;
        for (faceIndex = 0; faceIndex < numFaces; faceIndex++)
        {
            face = &b->faces[faceIndex];
            w = face->w;
            if (!w)
                continue;
            for (i = 0; i < w->pointCount; i++)
            {
                if (Point_Equal(w->points[i], start, 0.2f))
                    break;
            }
            if (i == w->pointCount)
                continue;
            if (face->w->pointCount <= 3)
            {
                movefacepoints[nummovefaces] = i;
                movefaces[nummovefaces++] = faceIndex;
                continue;
            }
            dot = DotProduct(end, face->plane.normal) - face->plane.dist;
            if (dot > 0.1)
            {
                for (k = i; k < i + w->pointCount - 3; k++)
                {
                    VectorCopy(w->points[i], tmpw.points[0]);
                    VectorCopy(w->points[(k + 1) % w->pointCount], tmpw.points[1]);
                    VectorCopy(w->points[(k + 2) % w->pointCount], tmpw.points[2]);
                    newface = Face_Alloc(b, face);
                    face = &b->faces[faceIndex];
                    brush_assert1(newface == &b->faces[b->faceCount - 1]);
                    originalFaceIndex[b->faceCount - 1] = originalFaceIndex[faceIndex];
                    Face_FreeWinding(newface);
                    newface->w = Winding_Clone(&tmpw);
                    // pad
                    // pad
                    brush_assert1(newface == &b->faces[b->faceCount - 1]);
                    movefaces[nummovefaces] = b->faceCount - 1;
                    movefacepoints[nummovefaces++] = 0;
                    brush_assert1(Point_Equal( start, b->faces[movefaces[nummovefaces - 1]].w->points[movefacepoints[nummovefaces - 1]], 0.2f ));
                }
                VectorCopy(w->points[(w->pointCount + i - 2) % w->pointCount], tmpw.points[0]);
                VectorCopy(w->points[(w->pointCount + i - 1) % w->pointCount], tmpw.points[1]);
                VectorCopy(w->points[i], tmpw.points[2]);
                Face_FreeWinding(face);
                face->w = Winding_Clone(&tmpw);
                movefaces[nummovefaces] = faceIndex;
                movefacepoints[nummovefaces++] = 2;
                // pad
                // pad
                brush_assert1(Point_Equal( start, b->faces[movefaces[nummovefaces - 1]].w->points[movefacepoints[nummovefaces - 1]], 0.2f ));
            }
            else
            {
                VectorCopy(w->points[(w->pointCount + i - 1) % w->pointCount], tmpw.points[0]);
                VectorCopy(w->points[i], tmpw.points[1]);
                VectorCopy(w->points[(i + 1) % w->pointCount], tmpw.points[2]);
                Winding_RemovePoint(w, i);
                newface = Face_Alloc(b, face);
                // pad
                // pad
                // pad
                // pad
                // pad
                brush_assert1(newface == &b->faces[b->faceCount - 1]);
                originalFaceIndex[b->faceCount - 1] = originalFaceIndex[faceIndex];
                Face_FreeWinding(newface);
                newface->w = Winding_Clone(&tmpw);
                // pad
                // pad
                brush_assert1(newface == &b->faces[b->faceCount - 1]);
                movefaces[nummovefaces] = b->faceCount - 1;
                movefacepoints[nummovefaces++] = 1;
                brush_assert1(Point_Equal( start, b->faces[movefaces[nummovefaces - 1]].w->points[movefacepoints[nummovefaces - 1]], 0.2f ));
            }
        }
        VectorCopy(end, mid);
        smallestfrac = 1;
        done = true;
        for (faceIndex = 0; faceIndex < b->faceCount; faceIndex++)
        {
            for (i = 0; i < nummovefaces; i++)
            {
                if (originalFaceIndex[movefaces[i]] == faceIndex)
                    break;
            }
            if (i >= nummovefaces)
                continue;
            for (j = 0; j < nummovefaces; j++)
            {
                if (faceIndex == movefaces[j])
                    break;
            }
            if (j >= nummovefaces)
            {
                memcpy(&plane, &b->faces[originalFaceIndex[faceIndex]].plane, sizeof(facePlane_t));
            }
            else
            {
                k = movefacepoints[j];
                w = b->faces[movefaces[j]].w;
                VectorCopy(w->points[(k + 1) % w->pointCount], tmpw.points[0]);
                VectorCopy(w->points[(k + 2) % w->pointCount], tmpw.points[1]);
                k = movefacepoints[i];
                w = b->faces[movefaces[i]].w;
                VectorCopy(w->points[(k + 1) % w->pointCount], tmpw.points[2]);
                if (!FUN_00447b50(tmpw.points[0], tmpw.points[1], tmpw.points[2], &plane))
                {
                    VectorCopy(w->points[(k + 2) % w->pointCount], tmpw.points[2]);
                    if (!FUN_00447b50(tmpw.points[0], tmpw.points[1], tmpw.points[2], &plane))
                        continue;
                }
            }
            front = DotProduct(start, plane.normal) - plane.dist;
            back = DotProduct(end, plane.normal) - plane.dist;
            if (front < 0.01f && back < 0.01f)
                continue;
            if (front > -0.01f && back > -0.01f)
                continue;
            back = front - back;
            if (fabs(back) < 0.001f)
                continue;
            frac = front / back;
            if (frac < smallestfrac)
            {
                mid[0] = start[0] + (end[0] - start[0]) * frac;
                mid[1] = start[1] + (end[1] - start[1]) * frac;
                mid[2] = start[2] + (end[2] - start[2]) * frac;
                smallestfrac = frac;
            }
            done = false;
        }
        for (i = 0; i < nummovefaces; i++)
        {
            face = &b->faces[movefaces[i]];
            w = face->w;
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
            assert(Point_Equal( w->points[movefacepoints[i]], start, 0.2f ));
            VectorCopy(mid, w->points[movefacepoints[i]]);
            for (j = 0; j < 3; j++)
                VectorCopy(w->points[j], face->planepts[j]);
            Face_MakePlane(face);
            if (VectorLength(face->plane.normal) < 0.1f)
                result = false;
        }
        if (result && FUN_00455e20(b))
        {
            VectorCopy(mid, start);
        }
        else
        {
            for (i = 0; i < nummovefaces; i++)
            {
                face = &b->faces[movefaces[i]];
                w = face->w;
                VectorCopy(start, w->points[movefacepoints[i]]);
                for (j = 0; j < 3; j++)
                    VectorCopy(w->points[j], face->planepts[j]);
                Face_MakePlane(face);
            }
            result = false;
            VectorCopy(start, end);
            done = true;
        }
        for (faceIndex = 0; faceIndex < b->faceCount; faceIndex++)
            // pad
            // pad
            // pad
            // pad
            // pad
            // pad
            // pad
            assert(originalFaceIndex[faceIndex] <= faceIndex);
        for (faceIndex = 0; faceIndex < b->faceCount; )
        {
            j = originalFaceIndex[faceIndex];
            if (j == faceIndex)
            {
                faceIndex++;
                continue;
            }
            if (!FUN_00447a50(&b->faces[faceIndex].plane, &b->faces[j].plane, false))
            {
                faceIndex++;
                continue;
            }
            w = FUN_00448a10(b->faces[faceIndex].w, b->faces[j].w, b->faces[faceIndex].plane.normal, true);
            if (!w)
            {
                faceIndex++;
                continue;
            }
            if (b->faces[j].w)
            {
                delete b->faces[j].w;
                b->faces[j].w = NULL;
            }
            b->faces[j].w = w;
            Brush_RemoveFace(b, faceIndex);
            for (i = faceIndex; i < b->faceCount; i++)
            {
                originalFaceIndex[i] = originalFaceIndex[i + 1];
                if (originalFaceIndex[i] >= faceIndex)
                    originalFaceIndex[i]--;
            }
        }
    } while (!done);
    b->version++;
    return result;
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

// RTTI .?AVAbstractFileWrapper@@; the slot 0 name is unknown, it is named after its first body 0x00467df0
class AbstractFileWrapper
{
public:
    virtual void FUN_00467df0(const char *fmt, ...) = 0;
};
void FUN_00420b30(AbstractFileWrapper *f, int contents);
void FUN_00420b50(AbstractFileWrapper *f, int toolFlags);
void FUN_004322e0(patchMesh_t *p, AbstractFileWrapper *f);

// 0x004579e0 (488 B), stream in esi
void FUN_004579e0(brushdef_t *b, AbstractFileWrapper *f)
{
    if (b->patch)
    {
        FUN_004322e0(b->patch, f);
        return;
    }
    f->FUN_00467df0("{\n");
    FUN_00420b30(f, b->faces->contents);
    FUN_00420b50(f, b->faces->toolFlags);
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *fa = &b->faces[i];
        for (int j = 0; j < 3; j++)
        {
            f->FUN_00467df0(" (");
            for (int k = 0; k < 3; k++)
                f->FUN_00467df0(" %.8g", fa->planepts[j][k]);
            f->FUN_00467df0(" )");
        }
        for (int t = 0; t < 2; t++)
        {
            texdef_t *td = &fa->texdef[t];
#line 1405
            assert(td);
            const char *name = td->radMat->name;
            assert(name[0]);
            f->FUN_00467df0(" %s %.8g %.8g %.8g %.8g %.8g %.8g", name, td->scale[0], td->scale[1], td->shift[0], td->shift[1], td->rotate, td->crossterm);
        }
        f->FUN_00467df0("\n");
    }
    f->FUN_00467df0("}\n");
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

void Brush_Free(brush_t *b)
{
    if (b->next)
        FUN_004592f0(b);
    if (b->patch)
        FUN_0042f790(b->patch);
    if (b->faces)
        FaceRender_FreeArray(b, b->faces, b->faceCount);
    Brush_RemoveFromEntity(b, NULL);
#line 1808
    assert(b->def);
    if (b->def->owner && b->def->onext && b->def->refCount == 2)
        FUN_00467240(b->def);
#line 1812
    assertMsg((b->def->refCount > 0), "(b->def->refCount) = %i", b->def->refCount);
    b->def->refCount--;
    if (b->def->refCount == 0)
        FUN_00458af0(b->def);
    delete b;
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


brushdef_t *FUN_00458dc0(const brushdef_t *b)
{
    if (b->patch)
    {
        int p = FUN_00434880(b->patch);
        brushdef_t *def = *(brushdef_t **)(p + 0x3828);
        FUN_00467240(def);
        return def;
    }
    brushdef_t *n = new brushdef_t;
    memset(n, 0, sizeof(brushdef_t));
    n->owner = b->owner;
    n->faceCount = b->faceCount;
    n->faces = Face_AllocArray(n->faceCount);
    for (int i = 0; i < n->faceCount; i++)
        FUN_00454960(&b->faces[i], &n->faces[i]);
    return n;
}


brushdef_t *FUN_00458eb0(brushdef_t *b)
{
    if (b->patch)
    {
        int p = FUN_00434880(b->patch);
        brushdef_t *def = *(brushdef_t **)(p + 0x3828);
        FUN_00467240(def);
        def->owner = b->owner;
        FUN_0045a220(def, true);
        if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        def->version++;
        return def;
    }
    brushdef_t *n = new brushdef_t;
    memset(n, 0, sizeof(brushdef_t));
    n->owner = b->owner;
    VectorCopy(b->mins, n->mins);
    VectorCopy(b->maxs, n->maxs);
    n->faceCount = b->faceCount;
    n->faces = Face_AllocArray(n->faceCount);
    for (int i = 0; i < n->faceCount; i++)
        FUN_004549b0(&b->faces[i], &n->faces[i]);
    return n;
}


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










void FUN_004593c0(brushdef_t *b, face_t *face, const texdef_t *td)
{
    memcpy(&face->texdef[brush_layer], td, sizeof(texdef_t));
    if (b->patch && b->faceCount > 0)
    {
        for (int i = 0; i < b->faceCount; i++)
            memcpy(&b->faces[i].texdef[brush_layer], &face->texdef[brush_layer], sizeof(texdef_t));
    }
    b->version++;
}


#line 2089
void FUN_00459430(brushdef_t *b, face_t *f, radmat_t *mat)
{
    assert(b);
    assert(f);
    assert(f - b->faces >= 0 && f - b->faces < b->faceCount && f == &b->faces[f - b->faces]);
    f->texdef[g_qeglobals.activeMaterial].radMat = mat;
    b->version++;
}


#line 2102
void FUN_00459530(brushdef_t *b, face_t *f, const texdef_t *td)
{
    assert(b);
    assert(f);
    assert(f - b->faces >= 0 && f - b->faces < b->faceCount && f == &b->faces[f - b->faces]);
    assert(td);
    radmat_t *mat = f->texdef[brush_layer].radMat;
    memcpy(&f->texdef[brush_layer], td, sizeof(texdef_t));
    f->texdef[brush_layer].radMat = mat;
    b->version++;
}


#line 2116
void FUN_004596a0(brushdef_t *b, face_t *f, int scale)
{
    assert(b);
    assert(f);
    assert(f - b->faces >= 0 && f - b->faces < b->faceCount && f == &b->faces[f - b->faces]);
    if (b->patch)
    {
        FUN_00459920(b, scale);
        return;
    }
    f->lmTexdef.scale[0] = (float)(f->texdef[1].radMat->width * scale);
    f->lmTexdef.scale[1] = (float)(f->texdef[1].radMat->height * scale);
}


void FUN_004597f0(brushdef_t *b, const texdef_t *td, int a, int c, bool flag)
{
    for (int i = 0; i < b->faceCount; i++)
        FUN_004593c0(b, &b->faces[i], td);
    FUN_004559f0(b, true, true);
    if (b->patch)
    {
        patchMesh_t *p = b->patch;
        if (flag)
        {
            *(int *)((char *)p + g_qeglobals.activeMaterial * 4 + 0x18) = *(const int *)td;
            (*(int *)((char *)p + 0x382c))++;
            if (g_PatchDialog.GetSafeHwnd())
                g_PatchDialog.GetPatchInfo();
        }
        else
        {
            FUN_0042f970(td, p, a, c);
        }
    }
    FUN_0045e0b0(b);
}


void FUN_004598b0(brushdef_t *b, const texdef_t *td)
{
    for (int i = 0; i < b->faceCount; i++)
        FUN_00459530(b, &b->faces[i], td);
    FUN_004559f0(b, true, true);
}


void FUN_00459920(brushdef_t *b, int scale)
{
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *f = &b->faces[i];
        f->lmTexdef.scale[0] = (float)(f->texdef[1].radMat->width * scale);
        f->lmTexdef.scale[1] = (float)(f->texdef[1].radMat->height * scale);
    }
    FUN_004559f0(b, true, true);
    if (b->patch)
        FUN_0042fad0(b->patch, scale);
}


bool FUN_004599b0(vec3_t p1, vec3_t p2, face_t *f)
{
    float d1 = DotProduct(p1, f->plane.normal) - f->plane.dist;
    float d2 = DotProduct(p2, f->plane.normal) - f->plane.dist;
    if (d1 >= 0 && d2 >= 0)
        return false;
    if (d1 <= 0 && d2 <= 0)
        return true;
    float fr = d1 / (d1 - d2);
    float *v = d1 > 0 ? p1 : p2;
    for (int i = 0; i < 3; i++)
        v[i] = p1[i] + fr * (p2[i] - p1[i]);
    return true;
}


bool FUN_00459aa0(float *f)
{
    int *count = (int *)((char *)&g_qeglobals + 0x8070);
    float **points = (float **)((char *)&g_qeglobals + 0x8074);
    if (*count == 0x1000)
        return false;
    for (int i = 0; i < *count; i++)
    {
        if (points[i] == f)
            return false;
    }
    points[(*count)++] = f;
    return true;
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



#line 2483
void FUN_0045a830(brush_t *b)
{
    assert(b);
    assert(b->def);
    if (b->version != b->def->version)
    {
        FUN_0045a600(b);
#line 2490
        assert(b->version == b->def->version);
    }
}


#line 2612
void FUN_0045af00(brush_t *b)
{
    assert(b);
    assert(b->def);
    if (b->faces)
    {
        FaceRender_FreeArray(b, b->faces, b->faceCount);
        b->faces = NULL;
        b->faceCount = 0;
    }
    if (b->patch)
        FUN_0042cc50(b->patch);
    b->version = b->def->version - 1;
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




void FUN_0045b840(brush_t *b, const vec3_t origin, const vec3_t mins, const vec3_t maxs, int width)
{
    float color[4];
    float pts[8][4];
    unsigned int packed;
    GfxPointVertex verts[256];
    int vertCount;

    color[0] = 0.0f;
    color[1] = 0.0f;
    color[2] = 1.0f;
    color[3] = 1.0f;
    FUN_0045d090(b->def, color, color);
    (*FUN_0059c468)(color, &packed);

    pts[0][0] = mins[0];
    pts[0][1] = origin[1];
    pts[0][2] = origin[2];
    pts[1][0] = maxs[0];
    pts[1][1] = origin[1];
    pts[1][2] = origin[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, 0, 256);
    pts[0][0] = origin[0];
    pts[0][1] = mins[1];
    pts[0][2] = origin[2];
    pts[1][0] = origin[0];
    pts[1][1] = maxs[1];
    pts[1][2] = origin[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);
    pts[0][0] = origin[0];
    pts[0][1] = origin[1];
    pts[0][2] = mins[2];
    pts[1][0] = origin[0];
    pts[1][1] = origin[1];
    pts[1][2] = maxs[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);

    pts[0][0] = mins[0];
    pts[0][1] = mins[1];
    pts[0][2] = mins[2];
    pts[1][0] = maxs[0];
    pts[1][1] = mins[1];
    pts[1][2] = mins[2];
    pts[2][0] = mins[0];
    pts[2][1] = maxs[1];
    pts[2][2] = mins[2];
    pts[3][0] = maxs[0];
    pts[3][1] = maxs[1];
    pts[3][2] = mins[2];
    pts[4][0] = mins[0];
    pts[4][1] = mins[1];
    pts[4][2] = maxs[2];
    pts[5][0] = maxs[0];
    pts[5][1] = mins[1];
    pts[5][2] = maxs[2];
    pts[6][0] = mins[0];
    pts[6][1] = maxs[1];
    pts[6][2] = maxs[2];
    pts[7][0] = maxs[0];
    pts[7][1] = maxs[1];
    pts[7][2] = maxs[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[0], pts[2], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[0], pts[4], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[1], pts[3], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[1], pts[5], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[2], pts[3], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[2], pts[6], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[3], pts[7], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[4], pts[5], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[4], pts[6], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[5], pts[7], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[6], pts[7], &packed, width, vertCount, 256);

#line 2919
    brush_assert1(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    if ((*(int *)(dword_01233b64 + 0x2cc) & 0x1000) && !(e->eclass->flags_160 & 0x10))
    {
        (*FUN_0059c468)(e->eclass->color, &packed);
        const brushdef_t *def = b->def;
        pts[0][0] = def->mins[0];
        pts[0][1] = def->mins[1];
        pts[0][2] = def->mins[2];
        pts[1][0] = def->maxs[0];
        pts[1][1] = def->mins[1];
        pts[1][2] = def->mins[2];
        pts[2][0] = def->mins[0];
        pts[2][1] = def->maxs[1];
        pts[2][2] = def->mins[2];
        pts[3][0] = def->maxs[0];
        pts[3][1] = def->maxs[1];
        pts[3][2] = def->mins[2];
        pts[4][0] = def->mins[0];
        pts[4][1] = def->mins[1];
        pts[4][2] = def->maxs[2];
        pts[5][0] = def->maxs[0];
        pts[5][1] = def->mins[1];
        pts[5][2] = def->maxs[2];
        pts[6][0] = def->mins[0];
        pts[6][1] = def->maxs[1];
        pts[6][2] = def->maxs[2];
        pts[7][0] = def->maxs[0];
        pts[7][1] = def->maxs[1];
        pts[7][2] = def->maxs[2];
        vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[0], pts[2], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[0], pts[4], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[1], pts[3], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[1], pts[5], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[2], pts[3], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[2], pts[6], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[3], pts[7], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[4], pts[5], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[4], pts[6], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[5], pts[7], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[6], pts[7], &packed, width, vertCount, 256);
    }
    if (vertCount)
        R_AddCmd_Line3D(vertCount / 2, width, verts);
}

extern bool FUN_0045b420(brush_t *b);
extern void FUN_0045b660(entity_t *e, void *a2, int a3, int a4, int a5, int a6, bool a7);
struct entityInst_t;
extern void FUN_00467a70(entityInst_t *e);
extern void (*FUN_0059c49c)(void *model, int a2, int a3, int a4);
extern void (*FUN_0059c464)(void *material, int a, unsigned short indexCount, const unsigned short *indices, unsigned short vertCount,
                            float (*xyzw)[4], float (*normal)[3], const unsigned int *colors, float (*st)[2]);
extern void *dword_011298c8;
extern float groupColors[16][4];
#define ARRAY_COUNT(a) (sizeof(a) / sizeof((a)[0]))


bool FUN_0045bfc0(brush_t *b, int a2, int a3, int a4, int a5, int width, int a7, bool a8)
{
    if (b->def->modelFailed)
        return false;
    if (!(((entity_t *)b->owner->def)->eclass->flags_160 & 0x10))
    {
        int mode = *(int *)(dword_01233b64 + 0x2cc);
        if (mode == 0x1000)
            return false;
        if ((mode & 0x100) && !FUN_0045b630(b))
            return false;
    }
    if (!FUN_0045b420(b))
    {
#line 2981
        assert(b->def->modelFailed);
        return false;
    }
    FUN_00467a70((entityInst_t *)b->owner);
    if (b->owner->model)
        (*FUN_0059c49c)(b->owner->model, a4, a5, a5 == 0x1e ? a7 : 0);
    if (b->owner->field_38)
        FUN_0045b660((entity_t *)b->owner->def, b->owner->field_38 + 0xc, a2, a3, a5, a7, a8);
#line 2996
    brush_assert1(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    vec3_t mins, maxs, origin;
    if (e->eclass->flags_160 & 8)
    {
        int size = (int)*(float *)(dword_01233b64 + 0x2ac);
        mins[0] = mins[1] = mins[2] = (float)-size;
        maxs[0] = maxs[1] = maxs[2] = (float)size;
    }
    else
    {
        VectorCopy(e->eclass->mins, mins);
        VectorCopy(e->eclass->maxs, maxs);
    }
    VectorCopy(e->origin, origin);
    VectorAdd(origin, mins, mins);
    VectorAdd(origin, maxs, maxs);
    if (FUN_00465d80(e, *(const char **)(dword_01233b64 + 0x2ec)))
    {
        unsigned int packed;
        float xyz[8][4];
        vec3_t normals[4];
        vec2_t st[4];
        unsigned int colors[4];
        unsigned short indices[6];
        int colorIndex = atoi(ValueForKey(e->epairs, *(const char **)(dword_01233b64 + 0x2ec))) % ARRAY_COUNT(groupColors);
        if (colorIndex < 0)
            colorIndex += ARRAY_COUNT(groupColors);
#line 3023
        brush_assert1(colorIndex >= 0 && colorIndex < ARRAY_COUNT( groupColors ));
        (*FUN_0059c468)(groupColors[colorIndex], &packed);
        float midY = (maxs[1] + mins[1]) * 0.5f;
        float midX = (maxs[0] + mins[0]) * 0.5f;
        xyz[0][0] = mins[0] - 8.0f;
        xyz[0][1] = midY;
        xyz[0][2] = mins[2];
        xyz[0][3] = 1.0f;
        xyz[1][0] = midX;
        xyz[1][1] = maxs[1] + 8.0f;
        xyz[1][2] = mins[2];
        xyz[1][3] = 1.0f;
        xyz[2][0] = maxs[0] + 8.0f;
        xyz[2][1] = midY;
        xyz[2][2] = mins[2];
        xyz[2][3] = 1.0f;
        xyz[3][0] = midX;
        xyz[3][1] = mins[1] - 8.0f;
        xyz[3][2] = mins[2];
        xyz[3][3] = 1.0f;
        for (int i = 0; i < 4; i++)
        {
            normals[i][0] = 0.0f;
            normals[i][1] = 0.0f;
            normals[i][2] = 1.0f;
            st[i][0] = 0.0f;
            st[i][1] = 0.0f;
            colors[i] = packed;
        }
        indices[0] = 3;
        indices[1] = 0;
        indices[2] = 2;
        indices[3] = 2;
        indices[4] = 0;
        indices[5] = 1;
        (*FUN_0059c464)(dword_011298c8, 3, 6, indices, 4, xyz, normals, colors, st);
    }
    FUN_0045b840(b, origin, mins, maxs, width);
    return true;
}

// ---- 0x45d7f0

extern void FUN_0042e6c0(patch_t *p);
extern void FUN_0042e7b0(patch_t *p, int a2, int a3);
extern void FUN_0042e550(patch_t *p, int a2, bool a3);
extern void FUN_0045a830(brush_t *b);
extern void FUN_0045c420(brush_t *b, int a2, int a3);
extern void FUN_0045d450(brush_t *b, const vec3_t offset, int a3, int a4, int a5, int a6, int a7);
extern void FUN_00467640(entity_t *ent, float *vec);
extern int dword_01129888;
void MatrixTransformVectorCols(const vec3_t in, const vec3_t mat[3], vec3_t out);


void FUN_0045c6b0()
{
    char buf[16];
    int maxGroup = -1;
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
    {
        if (!b->owner || b->owner == world_entity)
            continue;
#line 3153
        assert(b->owner->def == b->def->owner);
        entity_t *e = (entity_t *)b->owner->def;
        if (!FUN_00465d80(e, *(char **)(dword_01233b64 + 0x2ec)))
            continue;
        char *group = ValueForKey(e->epairs, *(char **)(dword_01233b64 + 0x2ec));
#line 3158
        brush_assert1(group);
        if (*group)
        {
            int n = atoi(group);
            if (maxGroup < n)
                maxGroup = n;
        }
    }
    _itoa(maxGroup + 1, buf, 10);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->owner || b->owner == world_entity)
            continue;
#line 3173
        assert(b->owner->def == b->def->owner);
        FUN_00465bf0((entity_t *)b->owner->def, *(char **)(dword_01233b64 + 0x2ec), buf);
    }
}




void FUN_0045c890()
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->owner || b->owner == world_entity)
            continue;
#line 3189
        assert(b->owner->def == b->def->owner);
        entity_t *e = (entity_t *)b->owner->def;
        const char *key = *(char **)(dword_01233b64 + 0x2ec);
        if (FUN_00465d80(e, key))
        {
            DeleteKey(e->epairs, key);
            FUN_004655f0(e, key);
            FUN_004657a0(e, key);
        }
    }
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

extern void *dword_011298c8;
extern void (*FUN_0059c464)(void *material, int a, unsigned short indexCount, const unsigned short *indices, unsigned short vertCount,
                            float (*xyzw)[4], float (*normal)[3], const unsigned int *colors, float (*st)[2]);

void FUN_0045def0(int *vertCount, face_t *face, const unsigned int *color, int *indexCount, int maxIndices, unsigned short *indices,
                  int maxVerts, float (*xyzw)[4], float (*normal)[3], unsigned int *colors, float (*st)[2])
{
    winding_t *w = face->w;
    if (!w)
        return;
    if (*vertCount + w->pointCount > maxVerts || w->pointCount * 3 - 6 + *indexCount > maxIndices)
    {
        (*FUN_0059c464)(dword_011298c8, 3, *indexCount, indices, *vertCount, xyzw, normal, colors, st);
        *indexCount = 0;
        *vertCount = 0;
    }
    int i;
    for (i = 0; i < w->pointCount; i++)
    {
        VectorCopy(w->points[i], xyzw[*vertCount + i]);
        xyzw[*vertCount + i][3] = 1.0f;
        VectorCopy(face->plane.normal, normal[*vertCount + i]);
        colors[*vertCount + i] = *color;
        float *uv = st[*vertCount + i];
        uv[0] = 0.0f;
        uv[1] = 0.0f;
    }
    for (i = 2; i < w->pointCount; i++)
    {
        indices[*indexCount] = (unsigned short)*vertCount;
        indices[*indexCount + 1] = (unsigned short)(*vertCount + i - 1);
        indices[*indexCount + 2] = (unsigned short)(*vertCount + i);
        *indexCount += 3;
    }
    *vertCount += w->pointCount;
}

extern void FUN_00454c80(face_t *f, float st[2][3][2], const bool *lock);
extern void FUN_0042ea50(patchMesh_t *p, const vec3_t v);
extern int DAT_011298b0;

// Q3 Brush_Move shape

void FUN_0045d7f0(brush_t *b, int viewType, int a3, int a4, int a5, int a6, const unsigned int *color, int a8, int a9)
{
    if (b->field_26)
        return;
    if (b->patch)
    {
        if (a6 == 0x1e)
        {
            if (viewType == 2 || viewType == 1 || viewType == 0)
                FUN_0042e7b0(b->patch, (int)color, a8);
            else
                FUN_0042e6c0(b->patch);
        }
        else
        {
            FUN_0042e550(b->patch, a5, a9);
        }
        return;
    }
    FUN_0045a830(b);
#line 3617
    assert(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    vec3_t offset;
    if (e->eclass->fixedsize)
    {
        if (a9 || (!(dword_01129888 & 0x4000) && (e->eclass->flags_160 & 2)))
            FUN_0045c420(b, viewType, (int)color);
        if (!b->def->modelFailed)
        {
            if (FUN_0045bfc0(b, viewType, (*(int *)(dword_01233b64 + 0x2cc) & 1) ? 0x1e : a4, a5, a6, a8, (int)color, a9))
                return;
        }
        vec3_t angles, axis[3];
        FUN_00467640(e, angles);
        AnglesToAxis(angles, axis);
        MatrixTransformVectorCols(e->origin, axis, offset);
        VectorSubtract(e->origin, offset, offset);
    }
    FUN_0045d450(b, offset, viewType, a3, a4, (int)color, a8);
}

void FUN_0045e1a0(brushdef_t *b, const vec3_t move, bool bSnap)
{
    bool lock[2];
    lock[0] = *(int *)(dword_01233b64 + 0x1b8) != 0;
    lock[1] = *(int *)(dword_01233b64 + 0x1bc) != 0;
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *f = &b->faces[i];
        float st[2][3][2];
        FUN_00454b70(st, f);
        for (int j = 0; j < 3; j++)
            VectorAdd(f->planepts[j], move, f->planepts[j]);
        FUN_00454c80(f, st, lock);
    }
    FUN_0045a220(b, bSnap);
    if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
        FUN_00475350();
    Sys_MarkMapModified();
    b->version++;
    if (b->patch)
        FUN_0042ea50(b->patch, move);
    if (b->owner->eclass->fixedsize)
    {
        VectorAdd(b->owner->origin, move, b->owner->origin);
        b->owner->field_68++;
    }
}


void FUN_0045e2c0(brushdef_t *b)
{
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *f = &b->faces[i];
        Sys_Printf("Face %i\n", i);
        Sys_Printf("%g %g %g\n", f->planepts[0][0], f->planepts[0][1], f->planepts[0][2]);
        Sys_Printf("%g %g %g\n", f->planepts[1][0], f->planepts[1][1], f->planepts[1][2]);
        Sys_Printf("%g %g %g\n", f->planepts[2][0], f->planepts[2][1], f->planepts[2][2]);
    }
}


float FUN_0045ebc0(float a, float b)
{
    return a - (float)floor(a / b) * b;
}


void FUN_0045ef60(brushdef_t *b, int h, int w)
{
    if (b->patch)
    {
        FUN_00433830(b->patch);
        return;
    }
    for (int i = 0; i < b->faceCount; i++)
        FUN_0045ebf0(&b->faces[i], h, w, 0);
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

extern void FUN_00439450(patchMesh_t *p);

// 0x0045f150 (229 B), b in eax: undo of 0x45f070
void FUN_0045f150(brushdef_t *b)
{
#line 4194
    assert(b);
    for (int i = 0; i < b->faceCount; i++)
        FUN_0045f010(&b->faces[i], b);
    if (b->patch)
        FUN_00439450(b->patch);
}





void FUN_0045f6a0(float *out, brush_t *b)
{
    for (int i = 0; i < 3; i++)
    {
        float lo = b->def->mins[i];
        float hi = b->def->maxs[i];
        if (*(int *)(dword_01233b64 + 0x248) == 0)
            out[i] = (float)(floor((hi + lo) * 0.5 / g_qeglobals.d_gridsize) * g_qeglobals.d_gridsize);
        else
            out[i] = (hi - lo) / 2.0f + lo;
    }
}


void FUN_0045f720(brush_t *head)
{
    for (brush_t *b = head->next; b != head; b = b->next)
    {
        b->def->version++;
        if (b->patch)
        {
            patchMesh_t *pm = b->patch->def;
            void **cache = (void **)((char *)pm + 0x3824);
            if (*cache)
                free(*cache);
            void *mesh = FUN_004267d0(pm, brush_layer, 0, 0);
            (*(unsigned short *)((char *)pm + 0x382c))++;
            *cache = mesh;
        }
        if (b->owner)
        {
            char *group = b->owner->field_38;
            if (group)
                FUN_0045f720((brush_t *)(group + 12));
            ((entity_t *)b->owner->def)->field_68++;
        }
    }
}


void FUN_0045f7b0()
{
    FUN_0045f720(&dword_010a44dc);
    FUN_0045f720(&dword_010a44b4);
    FUN_0045f720(&dword_010a448c);
}


void FUN_0045f7e0()
{
    for (int i = 0; i < dword_012485bc; i++)
        FUN_0045a830(*(brush_t **)((char *)dword_012485b8 + i * 12));
}


void FUN_0045f830(const vec3_t a, const vec3_t b, vec3_t out, float t)
{
    out[0] = (b[0] - a[0]) * t + a[0];
    out[1] = (b[1] - a[1]) * t + a[1];
    out[2] = (b[2] - a[2]) * t + a[2];
}



int FUN_0045f860(const vec3_t a, const vec3_t b, float eps)
{
    for (int i = 0; i < 3; i++)
    {
        float d = a[i] - b[i];
        if (d * d > eps * eps)
            return 0;
    }
    return 1;
}


