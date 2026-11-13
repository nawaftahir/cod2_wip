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
struct radmat_t { void *handle; const char *name; };
struct texdef_t { radmat_t *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; };
struct facePlane_t { vec3_t normal; int type; double dist; };
struct winding_t { int pointCount; vec3_t points[4]; }; struct brushVertex_t { vec3_t xyz; int faceIndex[3]; };
struct face_t { vec3_t planepts[3]; texdef_t texdef[2]; texdef_t lmTexdef; int contents; int toolFlags; facePlane_t plane; int field_98; int field_9c; winding_t *w; unsigned int color; };
struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct brushdef_t { brushdef_t *oprev; brushdef_t *onext; void *owner; int pad_0c[11]; int faceCount; face_t *faces; short pad_40; short version; void *patch; };
struct brush_t { brush_t *prev; brush_t *next; void *owner; brush_t *oprev; brush_t *onext; brushdef_t *def; int faceCount; faceRender_t *faces; void *patch; short version; short pad_26; };
struct qeglobals_t { unsigned char pad0[0x18]; int d_gridsize; unsigned char pad1[0x6c060]; int activeMaterial; unsigned char pad2[0xaf4]; int d_exclude; unsigned char pad3[0x24]; int d_select_mode; };
struct orientation_t { vec3_t origin; vec3_t axis[3]; };
#define CrossProduct(a,b,c) ((c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
extern qeglobals_t g_qeglobals;
extern void * (*R_AllocStaticSurface)(void *matHandle, int vertCount, const vec3_t *xyz, const vec3_t *sTangent, const vec3_t *tTangent, const vec3_t *normals, const vec2_t *st, const unsigned int *colors);
extern void (*R_FreeStaticSurface)(void *matHandle, int vertCount, void *vertHandle);
extern bool FUN_00439620(const vec3_t v1, const vec3_t v2);
extern void FUN_0043fbc0(vec2_t outSize, vec4_t texMat[2], const vec3_t normal, float planeDist, vec2_t outShift, float *outRotate, float *outCrossterm);
extern winding_t * FUN_00447c60(const facePlane_t *plane);
extern winding_t * FUN_00447f60(const winding_t *w);
extern winding_t * FUN_00447fb0(winding_t *w);
extern winding_t * FUN_00448280(winding_t *w, const facePlane_t *plane, float epsilon);
extern int IntersectPlanes(const float **plane, vec3_t xyz); extern int PlaneFromPoints(vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c);
extern void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out); extern void OrientationDirToWorld(const orientation_t *orient, const float *dir, float *out);
extern void FUN_004884a0(const float **planes, float xyz[3], float snap, float epsilon);
extern bool FUN_00494360(const vec3_t planepts[3], float out[4][4]); extern void FUN_00494400(vec4_t out, vec3_t a, vec3_t b, vec3_t c);
extern void Sys_Printf(const char *fmt, ...); extern void Error(const char *error, ...);
extern int FUN_0045f860(const brushdef_t *b, const vec3_t point, float epsilon);
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
#line 85
void Face_BuildRender(faceRender_t *face, const face_t *def, const orientation_t *orient)
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

// pad
// pad
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
    CrossProduct(d2, d1, f->plane.normal);
    if (FUN_00439620(f->plane.normal, vec3_origin))
        printf("WARNING: brush plane with no normal\n");
    Vec3Normalize(f->plane.normal);
    f->plane.dist = DotProduct(f->plane.normal, f->planepts[1]);
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

