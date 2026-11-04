#include "stdafx.h"
#include <math.h>
#include <stdlib.h>

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
    vec3_t points[2048];
    int numpoints;
    pedge_t edges[512];
    int numedges;
};

// Narrow external view of the contiguous vertex-selection storage proven by retail.
// The shared owner/full QEGlobals layout is intentionally not reconstructed here.
extern VertexSelectionState g_vertexSelectionState;


int FindPoint(vec3_t point)
{
    int i, j;

    for (i = 0; i < g_vertexSelectionState.numpoints; i++)
    {
        for (j = 0; j < 3; j++)
            if ((float)fabs(point[j] - g_vertexSelectionState.points[i][j]) > 0.1)
                break;
        if (j == 3)
            return i;
    }

    float *dest = g_vertexSelectionState.points[g_vertexSelectionState.numpoints];
    dest[0] = point[0];
    dest[1] = point[1];
    dest[2] = point[2];

    if (g_vertexSelectionState.numpoints < 2047)
        g_vertexSelectionState.numpoints++;

    return g_vertexSelectionState.numpoints - 1;
}

int FindEdge(int p1, int p2, face_t *f)
{
    int i;

    for (i = 0; i < g_vertexSelectionState.numedges; i++)
        if (g_vertexSelectionState.edges[i].p1 == p2 &&
            g_vertexSelectionState.edges[i].p2 == p1)
        {
            g_vertexSelectionState.edges[i].f2 = f;
            return i;
        }

    g_vertexSelectionState.edges[g_vertexSelectionState.numedges].p1 = p1;
    g_vertexSelectionState.edges[g_vertexSelectionState.numedges].p2 = p2;
    g_vertexSelectionState.edges[g_vertexSelectionState.numedges].f1 = f;

    if (g_vertexSelectionState.numedges < 511)
        g_vertexSelectionState.numedges++;

    return g_vertexSelectionState.numedges - 1;
}


struct brush_t;

struct winding_t
{
    int numpoints;
    vec3_t points[1];
};

extern winding_t *Brush_MakeFaceWinding(brush_t *brush, face_t *face);

void MakeFace(brush_t *brush, face_t *face)
{
    winding_t *w = Brush_MakeFaceWinding(brush, face);
    if (!w)
        return;

    int pnum[128];

    for (int i = 0; i < w->numpoints; i++)
        pnum[i] = FindPoint(w->points[i]);

    for (int i = 0; i < w->numpoints; i++)
        FindEdge(pnum[i], pnum[(i + 1) % w->numpoints], face);

    free(w);
}
