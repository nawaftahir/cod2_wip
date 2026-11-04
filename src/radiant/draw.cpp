#include <windows.h>
#include "../universal/assertive.h"

// Provisional type and global names pending retail symbol confirmation
struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
struct orientation_t { float origin[3]; float axis[3][3]; };

extern orientation_t g_editorOrientation;
extern void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts), (*R_AddCmd_Points3D)(int count, int width, const void *verts);














int FUN_0040be30(int vertCount, int width, GfxPointVertex *verts)
{
    if (vertCount) R_AddCmd_Points3D(vertCount, width, verts);
    return 0;
}

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

int FUN_0040bf80(float p1x, float p1y, float p2x, float p2y, const void *color, int width, int vertCount, int maxVertCount, GfxPointVertex *verts)
{
    float pt1[3];
    float pt2[3];

    pt1[0] = p1x;
    pt1[1] = p1y;
    pt1[2] = 0.0f;
    pt2[0] = p2x;
    pt2[1] = p2y;
    pt2[2] = 0.0f;
    return R_Add3DLine(verts, pt1, pt2, color, width, vertCount, maxVertCount);
}

int FUN_0040bfd0(int vertCount, int width, GfxPointVertex *verts)
{
    if (vertCount)
    {
        R_AddCmd_Line3D(vertCount / 2, width, verts);
    }
    return 0;
}
