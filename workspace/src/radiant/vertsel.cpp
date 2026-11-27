#include "stdafx.h"
#include <math.h>

typedef float vec3_t[3];

struct face_t;

struct pedge_t
{
    int p1;
    int p2;
    face_t *f1;
    face_t *f2;
};

struct VertexSelectionState
{
    unsigned char pad_00[0x68];
    vec3_t points[2048];
    int numpoints;
    pedge_t edges[512];
    int numedges;
    int numMovePoints;
    float *movePoints[0x1000];
};

// Narrow external view of the contiguous vertex-selection storage proven by retail.
// The shared owner/full QEGlobals layout is intentionally not reconstructed here.
extern VertexSelectionState g_qeglobals;

int FindPoint(vec3_t point)
{
    int i, j;

    for (i = 0; i < g_qeglobals.numpoints; i++)
    {
        for (j = 0; j < 3; j++)
            if ((float)fabs(point[j] - g_qeglobals.points[i][j]) > 0.1)
                break;
        if (j == 3)
            return i;
    }

    float *dest = g_qeglobals.points[g_qeglobals.numpoints];
    dest[0] = point[0];
    dest[1] = point[1];
    dest[2] = point[2];

    if (g_qeglobals.numpoints < 2047)
        g_qeglobals.numpoints++;

    return g_qeglobals.numpoints - 1;
}

int FindEdge(int p1, int p2, face_t *f)
{
    int i;

    for (i = 0; i < g_qeglobals.numedges; i++)
        if (g_qeglobals.edges[i].p1 == p2 &&
            g_qeglobals.edges[i].p2 == p1)
        {
            g_qeglobals.edges[i].f2 = f;
            return i;
        }

    g_qeglobals.edges[g_qeglobals.numedges].p1 = p1;
    g_qeglobals.edges[g_qeglobals.numedges].p2 = p2;
    g_qeglobals.edges[g_qeglobals.numedges].f1 = f;

    if (g_qeglobals.numedges < 511)
        g_qeglobals.numedges++;

    return g_qeglobals.numedges - 1;
}

// Brush views used by the retail loop: next at +4, def at +0x14, face count at +0x18; faces are 0xa8 bytes at def +0x3c.
struct face_t { float planepts[3][3]; unsigned char pad[0xa8 - 36]; };
struct vsBrushDef
{
    unsigned char pad[0x3c];
    face_t *faces;
};
struct vsBrush
{
    vsBrush *prev;
    vsBrush *next;
    unsigned char pad08[0xc];
    vsBrushDef *def;
    int faceCount;
};
extern vsBrush selected_brushes;
void FUN_004752c0(face_t *f);

void SetupVertexSelection()
{
    g_qeglobals.numpoints = 0;
    g_qeglobals.numedges = 0;
    for (vsBrush *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        for (int i = 0; i < b->faceCount; i++)
            FUN_004752c0(b->def->faces + i);
    }
}

// grid size of the editor globals
extern int g_gridSize;
struct winding_t { int pointCount; vec3_t points[4]; };
struct brushdef_t;
winding_t *FUN_00455800(const brushdef_t *b, const face_t *face);
void Sys_Printf(const char *fmt, ...);

static void AddPlanept(float *f)
{
    if (g_qeglobals.numMovePoints == 0x1000)
        return;
    for (int i = 0; i < g_qeglobals.numMovePoints; i++)
    {
        if (g_qeglobals.movePoints[i] == f)
            return;
    }
    g_qeglobals.movePoints[g_qeglobals.numMovePoints++] = f;
}

// 0x004753b0 (509 B)
void SelectFaceEdge(brushdef_t *def, face_t *f, int p1, int p2)
{
    int pnum[128];
    int i, j, k;

    winding_t *w = FUN_00455800(def, f);
    if (!w)
        return;
    for (i = 0; i < w->pointCount; i++)
        pnum[i] = FindPoint(w->points[i]);
    for (i = 0; i < w->pointCount; i++)
    {
        if (pnum[i] == p1 && pnum[(i + 1) % w->pointCount] == p2)
        {
            f->planepts[0][0] = g_qeglobals.points[pnum[i]][0];
            f->planepts[0][1] = g_qeglobals.points[pnum[i]][1];
            f->planepts[0][2] = g_qeglobals.points[pnum[i]][2];
            f->planepts[1][0] = g_qeglobals.points[pnum[(i + 1) % w->pointCount]][0];
            f->planepts[1][1] = g_qeglobals.points[pnum[(i + 1) % w->pointCount]][1];
            f->planepts[1][2] = g_qeglobals.points[pnum[(i + 1) % w->pointCount]][2];
            f->planepts[2][0] = g_qeglobals.points[pnum[(i + 2) % w->pointCount]][0];
            f->planepts[2][1] = g_qeglobals.points[pnum[(i + 2) % w->pointCount]][1];
            f->planepts[2][2] = g_qeglobals.points[pnum[(i + 2) % w->pointCount]][2];
            for (j = 0; j < 3; j++)
            {
                for (k = 0; k < 3; k++)
                    f->planepts[j][k] = (float)floor(f->planepts[j][k] / g_gridSize + 0.5f) * g_gridSize;
            }
            AddPlanept(f->planepts[0]);
            AddPlanept(f->planepts[1]);
            break;
        }
    }
    if (i == w->pointCount)
        Sys_Printf("SelectFaceEdge: failed\n");
    delete w;
}

// 0x004755b0 (474 B)
void SelectEdgeByRay(vec3_t org, vec3_t dir)
{
    int i, j, besti;
    float d, bestd;
    vec3_t mid, temp;

    besti = -1;
    bestd = 8;
    for (i = 0; i < g_qeglobals.numedges; i++)
    {
        for (j = 0; j < 3; j++)
            mid[j] = 0.5 * (g_qeglobals.points[g_qeglobals.edges[i].p1][j] + g_qeglobals.points[g_qeglobals.edges[i].p2][j]);
        temp[0] = mid[0] - org[0];
        temp[1] = mid[1] - org[1];
        temp[2] = mid[2] - org[2];
        d = temp[2] * dir[2] + temp[1] * dir[1] + temp[0] * dir[0];
        temp[0] = d * dir[0] + org[0];
        temp[1] = d * dir[1] + org[1];
        temp[2] = d * dir[2] + org[2];
        temp[0] = mid[0] - temp[0];
        temp[1] = mid[1] - temp[1];
        temp[2] = mid[2] - temp[2];
        d = temp[2] * temp[2] + temp[1] * temp[1] + temp[0] * temp[0];
        d = (float)sqrt(d);
        if (d < bestd)
        {
            bestd = d;
            besti = i;
        }
    }
    if (besti == -1)
    {
        Sys_Printf("Click didn't hit an edge\n");
        return;
    }
    Sys_Printf("hit edge\n");
    g_qeglobals.numMovePoints = 0;
    pedge_t *e = &g_qeglobals.edges[besti];
    for (vsBrush *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        SelectFaceEdge((brushdef_t *)b->def, e->f1, e->p1, e->p2);
        SelectFaceEdge((brushdef_t *)b->def, e->f2, e->p2, e->p1);
    }
}

// 0x00475790 (335 B)
void SelectVertexByRay(vec3_t org, vec3_t dir)
{
    int i, besti;
    float d, bestd;
    vec3_t temp;

    besti = -1;
    bestd = 8;
    for (i = 0; i < g_qeglobals.numpoints; i++)
    {
        const float *p = g_qeglobals.points[i];
        temp[0] = p[0] - org[0];
        temp[1] = p[1] - org[1];
        temp[2] = p[2] - org[2];
        d = temp[2] * dir[2] + temp[1] * dir[1] + temp[0] * dir[0];
        temp[0] = d * dir[0] + org[0];
        temp[1] = d * dir[1] + org[1];
        temp[2] = d * dir[2] + org[2];
        temp[0] = p[0] - temp[0];
        temp[1] = p[1] - temp[1];
        temp[2] = p[2] - temp[2];
        d = temp[0] * temp[0] + temp[1] * temp[1] + temp[2] * temp[2];
        d = (float)sqrt(d);
        if (d < bestd)
        {
            bestd = d;
            besti = i;
        }
    }
    if (besti == -1)
    {
        Sys_Printf("Click didn't hit a vertex\n");
        return;
    }
    Sys_Printf("hit vertex\n");
    g_qeglobals.movePoints[g_qeglobals.numMovePoints++] = g_qeglobals.points[besti];
}

class CXYWnd
{
public:
    BOOL AreaSelectOK();
};
class CMainFrame
{
public:
    unsigned char pad_00[0x7e0];
    CXYWnd *m_pActiveXY;
};
extern "C" void FUN_0041b190(CMainFrame *self);
extern CMainFrame *dword_01233488;
void FUN_0042beb0();
void FUN_0042a890(const float *point, bool bMulti, bool bColumn);
extern float DAT_012334a8;
extern int DAT_011298b0;

// 0x004758e0 (435 B): pick the nearest curve control point to the ray (Q3 SelectCurvePointByRay)
void FUN_004758e0(const float *org, const float *dir, unsigned int buttons)
{
    int i, besti;
    float d, bestd;
    vec3_t temp;

    besti = -1;
    bestd = 2;
    if (buttons & 4)
    {
        bestd = 28;
        if (DAT_012334a8 > 0)
            bestd = 28 / DAT_012334a8;
    }
    for (i = 0; i < g_qeglobals.numpoints; i++)
    {
        const float *p = g_qeglobals.points[i];
        temp[0] = p[0] - org[0];
        temp[1] = p[1] - org[1];
        temp[2] = p[2] - org[2];
        d = temp[2] * dir[2] + temp[1] * dir[1] + temp[0] * dir[0];
        temp[0] = d * dir[0] + org[0];
        temp[1] = d * dir[1] + org[1];
        temp[2] = d * dir[2] + org[2];
        temp[0] = p[0] - temp[0];
        temp[1] = p[1] - temp[1];
        temp[2] = p[2] - temp[2];
        d = temp[2] * temp[2] + temp[0] * temp[0] + temp[1] * temp[1];
        d = (float)sqrt(d);
        if (d <= bestd)
        {
            bestd = d;
            besti = i;
        }
    }
    if (besti == -1)
    {
        if ((char)dword_01233488->m_pActiveXY->AreaSelectOK())
        {
            int mode = DAT_011298b0;
            DAT_011298b0 = 5;
            if (mode == 11)
                FUN_0041b190(dword_01233488);
            else if (mode == 10)
                FUN_0042beb0();
        }
    }
    else
        FUN_0042a890(g_qeglobals.points[besti], (buttons >> 3) & 1, (buttons >> 2) & 1);
}
