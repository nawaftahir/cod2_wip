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


// Target-backed narrow views for the next two uncredited routines.
// The 0x14 definition pointer, 0x18 face count, +0x3c face storage pointer,
// and 0xa8 face stride come from the retail SetupVertexSelection decompilation.
// Unknown storage is intentionally not assigned speculative field names.
struct face_storage_view
{
    unsigned char undecoded[0x3c];
    face_t *faces;
};

struct brush_t
{
    void *previous;
    brush_t *next;
    unsigned char undecoded[0x0c];
    face_storage_view *definition;
    int numFaces;
};

struct winding_t
{
    int numpoints;
    float points[128][5]; // Q3Radiant winding layout; retail stride still needs checking
};

extern brush_t selected_brushes;
extern winding_t *FUN_00455800(face_t *face);

// Candidate for retail 0x004752c0, not verified.
void MakeFace(face_t *face)
{
    winding_t *w = FUN_00455800(face);
    if (!w)
        return;

    int pointNumbers[128];
    for (int i = 0; i < w->numpoints; ++i)
        pointNumbers[i] = FindPoint(w->points[i]);

    for (int j = 0; j < w->numpoints; ++j)
        FindEdge(pointNumbers[j],
                 pointNumbers[(j + 1) % w->numpoints], face);

    free(w);
}

// Candidate for retail 0x00475350, not verified.
void SetupVertexSelection()
{
    g_vertexSelectionState.numpoints = 0;
    g_vertexSelectionState.numedges = 0;

    for (brush_t *b = selected_brushes.next;
         b != &selected_brushes;
         b = b->next)
    {
        const char *faces = (const char *)b->definition->faces;
        for (int i = 0; i < b->numFaces; ++i)
            MakeFace((face_t *)(faces + i * 0xa8));
    }
}
