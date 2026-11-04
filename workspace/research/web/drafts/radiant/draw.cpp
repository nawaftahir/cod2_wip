#include <windows.h>
#include "../universal/assertive.h"

struct GfxPointVertex
{
    float xyz[3];
    unsigned char color[4];
};
struct orientation_t
{
    float origin[3];
    float axis[3][3];
};
extern orientation_t g_editorOrientation;
extern void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts);














int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount)
{
    assert(vertCount >= 0);
    assert((vertCount & 1) == 0);
    assert(maxVertCount >= 2);
    if (vertCount + 2 > maxVertCount)
    {
        R_AddCmd_Line3D(vertCount / 2, width, verts);
        vertCount = 0;
    }
    GfxPointVertex *out = &verts[vertCount];
    OrientationPosToWorld(&g_editorOrientation, p1, out[0].xyz);
    OrientationPosToWorld(&g_editorOrientation, p2, out[1].xyz);
    *(unsigned int *)out[0].color = *(const unsigned int *)color;
    *(unsigned int *)out[1].color = *(const unsigned int *)color;
    return vertCount + 2;
}
