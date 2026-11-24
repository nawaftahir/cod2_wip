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

extern int DAT_011298b0;
extern int DAT_010f8d88;
extern float DAT_010c8d88[][3];
extern const float DAT_0053dc84[4];
extern const float DAT_0053dca4[4];
extern void (*FUN_0059c468)(const float *inColor, unsigned int *outColor);
extern void (*FUN_0059c45c)(int count, int width, const GfxPointVertex *verts);
int FUN_00429e20(const float *pt);

// 0x0040bff0 (259 B): draw the event points that are not near another point
void FUN_0040bff0()
{
    GfxPointVertex verts[0x552];
    unsigned int color;
    int vertCount = 0;

    if (DAT_011298b0 != 4 && DAT_011298b0 != 5)
        return;
    (*FUN_0059c468)(DAT_0053dc84, &color);
    for (int i = 0; i < DAT_010f8d88; i++)
    {
        if (FUN_00429e20(DAT_010c8d88[i]) < 0)
        {
            OrientationPosToWorld(&g_editorOrientation, DAT_010c8d88[i], verts[vertCount].xyz);
            *(unsigned int *)verts[vertCount].color = color;
            vertCount++;
            if (vertCount == 0x552)
            {
                (*FUN_0059c45c)(vertCount, 6, verts);
                vertCount = 0;
            }
        }
    }
    if (vertCount)
        (*FUN_0059c45c)(vertCount, 6, verts);
}

// 0x0040c100 (259 B): draw the event points that are near another point
void FUN_0040c100()
{
    GfxPointVertex verts[0x552];
    unsigned int color;
    int vertCount = 0;

    if (DAT_011298b0 != 4 && DAT_011298b0 != 5)
        return;
    (*FUN_0059c468)(DAT_0053dca4, &color);
    for (int i = 0; i < DAT_010f8d88; i++)
    {
        if (FUN_00429e20(DAT_010c8d88[i]) >= 0)
        {
            OrientationPosToWorld(&g_editorOrientation, DAT_010c8d88[i], verts[vertCount].xyz);
            *(unsigned int *)verts[vertCount].color = color;
            vertCount++;
            if (vertCount == 0x552)
            {
                (*FUN_0059c45c)(vertCount, 6, verts);
                vertCount = 0;
            }
        }
    }
    if (vertCount)
        (*FUN_0059c45c)(vertCount, 6, verts);
}

extern void (*FUN_0059c464)(void *material, int a, unsigned short indexCount, const unsigned short *indices, unsigned short vertCount,
                            float (*xyzw)[4], float (*normal)[3], const unsigned int *colors, float (*st)[2]);
extern void *dword_011298c8;

// 0x0040c4a0 (226 B): draw a quad of the given corners in translucent blue
void FUN_0040c4a0(float (*xyzw)[4])
{
    unsigned short indices[6];
    float st[4][2];
    float normals[4][3];
    float rgba[4];
    unsigned int packed;
    unsigned int colors[4];

    indices[0] = 3;
    indices[1] = 0;
    indices[2] = 2;
    indices[3] = 2;
    indices[4] = 0;
    indices[5] = 1;
    st[0][0] = 0.0f;
    st[0][1] = 0.0f;
    st[1][0] = 0.0f;
    st[1][1] = 1.0f;
    st[2][0] = 1.0f;
    st[2][1] = 1.0f;
    st[3][0] = 1.0f;
    st[3][1] = 0.0f;
    rgba[0] = 0.0f;
    rgba[1] = 0.0f;
    rgba[2] = 1.0f;
    rgba[3] = 0.25f;
    (*FUN_0059c468)(rgba, &packed);
    colors[0] = packed;
    colors[1] = packed;
    colors[2] = packed;
    colors[3] = packed;
    for (int i = 0; i < 4; i++)
    {
        normals[i][0] = 0.0f;
        normals[i][1] = 0.0f;
        normals[i][2] = 1.0f;
    }
    (*FUN_0059c464)(dword_011298c8, 3, 6, indices, 4, xyzw, normals, colors, st);
}

struct EdgeRef { int from; int to; int pad[2]; };
extern float DAT_010bcd7c[][3];
extern int DAT_010c2d7c;
extern EdgeRef DAT_010c2d80[];
extern int DAT_010c4d80;
extern const float DAT_0053dc74[4];
extern const float DAT_0053dc94[4];
extern void *DAT_00597154;
void FUN_0040c620(void *wnd, bool enable);
void FUN_004501f0();
void FUN_004509a0();
void FUN_00493390();
void Pointfile_Draw();

// 0x0040c210 (644 B): draw the selected event vertices or edge midpoints, then refresh the views
void FUN_0040c210()
{
    GfxPointVertex verts[0x552];
    unsigned int color;
    int vertCount;

    FUN_0040c100();
    if (DAT_011298b0 == 1 || DAT_011298b0 == 0x10 || DAT_011298b0 == 0x11)
    {
        (*FUN_0059c468)(DAT_0053dc74, &color);
        vertCount = 0;
        for (int i = 0; i < DAT_010c2d7c; i++)
        {
            OrientationPosToWorld(&g_editorOrientation, DAT_010bcd7c[i], verts[vertCount].xyz);
            *(unsigned int *)verts[vertCount].color = color;
            vertCount++;
            if (vertCount == 0x552)
            {
                (*FUN_0059c45c)(vertCount, 4, verts);
                vertCount = 0;
            }
        }
        if (vertCount)
            (*FUN_0059c45c)(vertCount, 4, verts);
    }
    else if (DAT_011298b0 == 2)
    {
        (*FUN_0059c468)(DAT_0053dc94, &color);
        vertCount = 0;
        for (int i = 0; i < DAT_010c4d80; i++)
        {
            float mid[3];
            const float *a = DAT_010bcd7c[DAT_010c2d80[i].from];
            const float *b = DAT_010bcd7c[DAT_010c2d80[i].to];
            mid[0] = (b[0] + a[0]) * 0.5f;
            mid[1] = (b[1] + a[1]) * 0.5f;
            mid[2] = (b[2] + a[2]) * 0.5f;
            OrientationPosToWorld(&g_editorOrientation, mid, verts[vertCount].xyz);
            *(unsigned int *)verts[vertCount].color = color;
            vertCount++;
            if (vertCount == 0x552)
            {
                (*FUN_0059c45c)(vertCount, 4, verts);
                vertCount = 0;
            }
        }
        if (vertCount)
            (*FUN_0059c45c)(vertCount, 4, verts);
    }
    FUN_0040c620(DAT_00597154, DAT_011298b0 == 9 || DAT_011298b0 == 8);
    FUN_004501f0();
    FUN_004509a0();
    FUN_00493390();
    Pointfile_Draw();
}
