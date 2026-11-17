#include "stdafx.h"
#include "Pmesh.h"
#include "PatchDialog.h"
#include <malloc.h>
#include <string.h>
#include "../universal/com_math.h"
#include "../universal/assertive.h"

#define iassert(expr) \
    do { \
        static bool s_assertDisable; \
        if ( !(expr) && !s_assertDisable ) \
        { \
            switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 1, 1 ) ) \
            { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = true; break; \
            } \
        } \
    } while ( 0 )

struct material_t
{
    unsigned char field_00[0x14];
    int width;
    int height;
};

struct texdef_t
{
    material_t *mat;
    float scale[2];
    float shift[2];
    float rotate;
    float skew;
};

struct plane_t
{
    vec3_t normal;
    int type;
    double dist;
};

struct winding_t
{
    int numpoints;
    vec3_t p[1];
};

struct face_t
{
    vec3_t planepts[3];
    texdef_t texdef[2];
    unsigned char field_5c[0x1c];
    int field_78;
    int field_7c;
    plane_t plane;
    unsigned char field_98[8];
    winding_t *w;
    int field_a4;
};

struct brush_t
{
    unsigned char field_00[0x38];
    int faceCount;
    face_t *faces;
    short field_40;
    short version;
    patchMesh_t *patch;
};

struct drawVert_t
{
    float xyz[3];
    float st[2];
    float lightmap[2];
    float normal[3];
    unsigned char color[4];
};

struct mesh_t
{
    int width;
    int height;
    int field_08;
    drawVert_t *verts;
    int field_10;
};

extern int DAT_01128d90;
extern int DAT_01128d94;
extern float dword_1128DC4;
extern int DAT_011298b0;
static int g_nFaceCycle = 0;

void BuildTextureVecs(const vec3_t normal, const vec2_t scale, const vec2_t shift, float rotate, float skew, vec4_t texVecs[2]);
void FUN_00421150(mesh_t *m);
int FUN_00421500(mesh_t *m, vec3_t normal);
void FUN_00421830(mesh_t m);
mesh_t *FUN_00421980(mesh_t m, float style, float maxError, int *x, int *y);
mesh_t *FUN_00422370(mesh_t *m, int *x, int *y);
mesh_t *FUN_00422900(mesh_t *m, float scale, int maxSize, int *x2, int *y2, int *x1, int *y1);
void FUN_004546a0(int faceCount, face_t *faces);
brush_t *FUN_00457ce0(void *unused, const texdef_t *td);
void FUN_00457dd0(const vec3_t mins, const vec3_t maxs, brush_t *b, int flags);
void FUN_0045a220(brush_t *b, bool bFlag);
void FUN_004671b0(brush_t *b);
void FUN_00475350();
void FUN_0047a3c0();
void FUN_0047a760(const char *fmt, ...);
void FUN_00426e80(patchMesh_t *p, int layer, float scale);
void FUN_00426f20(patchMesh_t *p, int layer, float scale);

// Retail 0x00425770, 152 bytes; exact relocation-normalized MATCH
// in the isolated MSVC 7.1 trial 42070900634. Material lookup uses ECX
// argument, as established by retail disassembly.
// Retail 0x00425770 / 152 B -- unverified real initialization candidate.
// Class storage and string values come from retail disassembly. Material
// resolver 0x00440840 is a cross-lane dependency: the symbol name is provisional.
struct qtexture_s;
extern qtexture_s * __fastcall FUN_00440840(char *name);

patchMesh_t *MakeNewPatch()
{
    patchMesh_t *patch = new patchMesh_t;
    patch->width = 0;
    patch->height = 0;
    patch->field_08 = 0;
    patch->type_10 = 0;
    patch->value_3834 = 0.0f;
    patch->style_14 = 8;
    patch->image_18 = FUN_00440840("case");
    patch->lightmap_1c = FUN_00440840("lightmap_gray");

    memset(patch->ctrl, 0, sizeof(patch->ctrl));
    for (int w = 0; w < 16; ++w)
    {
        for (int h = 0; h < 16; ++h)
        {
            patch->ctrl[w][h].color_28[2] = 255;
            patch->ctrl[w][h].color_28[1] = 255;
            patch->ctrl[w][h].color_28[0] = 255;
            patch->ctrl[w][h].color_28[3] = 255;
        }
    }
    patch->cache_3824 = NULL;
    patch->cache_3828 = NULL;
    patch->version = 0;
    patch->field_382e = 0;
    return patch;
}

// Retail 0x00425810 (10 bytes); relocation-normalized MATCH in CI trial 42066152684.
int Patch_MemorySize(patchMesh_t *patch)
{
    return _msize(patch);
}

// Retail 0x00425820 (29 bytes); relocation-normalized MATCH in CI 42067258788.
// Original symbol name is unknown. No ABI annotations or artificial callers.
void FUN_00425820(patchMesh_t *patch, int mode, bool enabled, float value)
{
    if (mode == 1)
    {
        patch->flag_382f = enabled;
        if (enabled)
            patch->value_3834 = value;
    }
}

void InterpolateInteriorPoints(patchMesh_t *p)
{
    int i, j, next, prev;
    for (i = 0; i < p->width; i += 2)
    {
        next = (i == p->width - 1) ? 1 : (i + 1) % p->width;
        prev = (i == 0) ? p->width - 2 : i - 1;
        for (j = 0; j < p->height; j++)
        {
            if ((p->ctrl[i][j].flags_34 & 2) == 0)
            {
                Vec3Avg(p->ctrl[prev][j].xyz, p->ctrl[next][j].xyz, p->ctrl[i][j].xyz);
            }
        }
    }
}

static const int neighbors[8][2] = {
    { 0,  1 }, {  1,  1 }, {  1, 0 }, {  1, -1 },
    { 0, -1 }, { -1, -1 }, { -1, 0 }, { -1,  1 }
};

void Patch_MeshNormals(patchMesh_t *in)
{
    int i, j, k, dist;
    vec3_t normal;
    vec3_t sum;
    vec3_t base;
    vec3_t delta;
    int x, y;
    PatchControl *dv;
    vec3_t around[8], temp;
    int good[8];
    int wrapWidth, wrapHeight;
    float len;

    wrapWidth = 0;
    for (i = 0; i < in->height; i++)
    {
        VectorSubtract(in->ctrl[0][i].xyz, in->ctrl[in->width - 1][i].xyz, delta);
        len = VectorLength(delta);
        if (len > 1.0)
            break;
    }
    if (i == in->height)
        wrapWidth = 1;

    wrapHeight = 0;
    for (i = 0; i < in->width; i++)
    {
        VectorSubtract(in->ctrl[i][0].xyz, in->ctrl[i][in->height - 1].xyz, delta);
        len = VectorLength(delta);
        if (len > 1.0)
            break;
    }
    if (i == in->width)
        wrapHeight = 1;

    for (i = 0; i < in->width; i++)
    {
        for (j = 0; j < in->height; j++)
        {
            dv = &in->ctrl[i][j];
            VectorCopy(dv->xyz, base);
            for (k = 0; k < 8; k++)
            {
                VectorClear(around[k]);
                good[k] = 0;

                for (dist = 1; dist <= 3; dist++)
                {
                    x = i + neighbors[k][0] * dist;
                    y = j + neighbors[k][1] * dist;
                    if (wrapWidth)
                    {
                        if (x < 0)
                            x = in->width - 1 + x;
                        else if (x >= in->width)
                            x = 1 + x - in->width;
                    }
                    if (wrapHeight)
                    {
                        if (y < 0)
                            y = in->height - 1 + y;
                        else if (y >= in->height)
                            y = 1 + y - in->height;
                    }

                    if (x < 0 || x >= in->width || y < 0 || y >= in->height)
                        break;

                    VectorSubtract(in->ctrl[x][y].xyz, base, temp);
                    if (Vec3Normalize(temp) == 0.0f)
                        continue;
                    else
                    {
                        good[k] = 1;
                        VectorCopy(temp, around[k]);
                        break;
                    }
                }
            }

            VectorClear(sum);
            for (k = 0; k < 8; k++)
            {
                if (!good[k] || !good[(k + 1) & 7])
                    continue;
                int k1 = (k + 1) & 7;
                Vec3Cross(around[k1], around[k], normal);
                if (Vec3Normalize(normal) == 0.0f)
                    continue;
                VectorAdd(normal, sum, sum);
            }
            Vec3NormalizeTo(sum, dv->normal);
        }
    }
}

bool FUN_00425d10(patchMesh_t *p, int outX[3], int outY[3])
{
    struct CornerPt
    {
        int x;
        int y;
    };
    int w = p->width - 1;
    int h = p->height - 1;
    CornerPt tris[8][3] = {
        { { w, 0 }, { 0, 0 }, { 0, h } },
        { { 0, 0 }, { 0, h }, { w, h } },
        { { 0, h }, { w, h }, { w, 0 } },
        { { w, h }, { w, 0 }, { 0, 0 } },
        { { 1, 0 }, { 0, 0 }, { 0, 1 } },
        { { 0, h - 1 }, { 0, h }, { 1, h } },
        { { w - 1, h }, { w, h }, { w, h - 1 } },
        { { w, 1 }, { w, 0 }, { w - 1, 0 } }
    };

    for (unsigned int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            outX[j] = tris[i][j].x;
            outY[j] = tris[i][j].y;
        }
        vec3_t d1, d2, normal;
        VectorSubtract(p->ctrl[outX[1]][outY[1]].xyz, p->ctrl[outX[0]][outY[0]].xyz, d1);
        VectorSubtract(p->ctrl[outX[2]][outY[2]].xyz, p->ctrl[outX[0]][outY[0]].xyz, d2);
        Vec3Cross(d1, d2, normal);
        if (VectorLengthSquared(normal) > 0.001f)
            return true;
    }
    return false;
}

bool FUN_00425f40(patchMesh_t *p, plane_t *plane)
{
    mesh_t *m = (mesh_t *)p->cache_3824;
    vec3_t avgNorm;
    vec3_t avgPos;
    int count;
    VectorClear(avgNorm);
    VectorClear(avgPos);
    count = 0;

    for (int j = 0; j < m->height - 1; j++)
    {
        for (int i = 0; i < m->width - 1; i++)
        {
            vec3_t d1, d2, n;
            VectorSubtract(m->verts[j * m->width + i + 1].xyz, m->verts[j * m->width + i].xyz, d1);
            VectorSubtract(m->verts[(j + 1) * m->width + i].xyz, m->verts[j * m->width + i].xyz, d2);
            Vec3Cross(d1, d2, n);
            if (Vec3Normalize(n) > 0.001f)
            {
                VectorAdd(avgNorm, n, avgNorm);
                VectorAdd(avgPos, m->verts[j * m->width + i].xyz, avgPos);
                count++;
            }

            VectorSubtract(m->verts[(j + 1) * m->width + i].xyz, m->verts[(j + 1) * m->width + i + 1].xyz, d1);
            VectorSubtract(m->verts[j * m->width + i + 1].xyz, m->verts[(j + 1) * m->width + i + 1].xyz, d2);
            Vec3Cross(d1, d2, n);
            if (Vec3Normalize(n) > 0.001f)
            {
                VectorAdd(avgNorm, n, avgNorm);
                VectorAdd(avgPos, m->verts[(j + 1) * m->width + i + 1].xyz, avgPos);
                count++;
            }
        }
    }

    if (Vec3Normalize(avgNorm) < 0.001f)
        return false;

    float dist = DotProduct(avgPos, avgNorm) / (float)count;
    for (int i = 0; i < p->width - 1; i++)
    {
        for (int j = 0; j < p->height - 1; j++)
        {
            float d = DotProduct(avgNorm, p->ctrl[i][j].xyz) - dist;
            if (d > 1.0f || d < -1.0f)
                return false;
        }
    }

    plane->dist = dist;
    VectorCopy(avgNorm, plane->normal);
    return true;
}

void Patch_CalcBounds(patchMesh_t *patch, vec3_t &mins, vec3_t &maxs, bool enlarge)
{
    ClearBounds(mins, maxs);
    ++patch->version;
    for (int w = 0; w < patch->width; ++w)
    {
        for (int h = 0; h < patch->height; ++h)
        {
            AddPointToBounds(patch->ctrl[w][h].xyz, mins, maxs);
        }
    }
    if (enlarge)
    {
        for (int axis = 0; axis < 3; ++axis)
        {
            if (maxs[axis] - mins[axis] < 8.0f)
            {
                float minimum = (mins[axis] + maxs[axis]) * 0.5f - 4.0f;
                mins[axis] = minimum;
                maxs[axis] = minimum + 8.0f;
            }
        }
    }
}

void FUN_00426420(face_t *f, const texdef_t *td, int field78, int field7c,
                  const vec3_t p0, const vec3_t p1, const vec3_t p2)
{
    memcpy(f->texdef, td, sizeof(f->texdef));
    f->field_78 = field78;
    f->field_7c = field7c;
    VectorCopy(p0, f->planepts[0]);
    VectorCopy(p1, f->planepts[1]);
    VectorCopy(p2, f->planepts[2]);
}

void Brush_RebuildBrush(brush_t *b, vec3_t vMins, vec3_t vMaxs)
{
    int i, j;
    for (i = 0; i < 3; i++)
    {
        vMins[i] = floor(vMins[i] + 0.5f);
        vMaxs[i] = floor(vMaxs[i] + 0.5f);
        if ((int)vMins[i] == (int)vMaxs[i])
        {
            vMins[i] -= 4.0f;
            vMaxs[i] += 4.0f;
        }
    }

    if (!b->faces)
        return;

    texdef_t td[2];
    memcpy(td, b->faces->texdef, sizeof(td));
    int field78, field7c;
    if (b->patch)
    {
        field78 = b->patch->field_08;
        field7c = b->patch->field_0c;
    }
    else
    {
        field78 = b->faces->field_78;
        field7c = b->faces->field_7c;
    }
    FUN_004546a0(b->faceCount, b->faces);
    b->faces = NULL;

    for (i = 0; i < 3; i++)
    {
        if (vMaxs[i] < vMins[i])
            FUN_0047a760("Brush_RebuildBrush: backwards");
    }

    vec3_t pts[4][2];
    pts[0][0][0] = vMins[0];
    pts[0][0][1] = vMins[1];
    pts[1][0][0] = vMins[0];
    pts[1][0][1] = vMaxs[1];
    pts[2][0][0] = vMaxs[0];
    pts[2][0][1] = vMaxs[1];
    pts[3][0][0] = vMaxs[0];
    pts[3][0][1] = vMins[1];
    for (i = 0; i < 4; i++)
    {
        pts[i][0][2] = vMins[2];
        pts[i][1][0] = pts[i][0][0];
        pts[i][1][1] = pts[i][0][1];
        pts[i][1][2] = vMaxs[2];
    }

    face_t *faces = new face_t[6];
    memset(faces, 0, sizeof(face_t) * 6);
    b->faces = faces;

    face_t *f = faces;
    FUN_00426420(f++, td, field78, field7c, pts[0][1], pts[1][1], pts[2][1]);
    FUN_00426420(f++, td, field78, field7c, pts[2][0], pts[1][0], pts[0][0]);
    for (i = 0; i < 4; i++)
    {
        j = (i + 1) % 4;
        FUN_00426420(f++, td, field78, field7c, pts[j][1], pts[i][1], pts[i][0]);
    }

    FUN_0045a220(b, true);
    if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
        FUN_00475350();
    FUN_0047a3c0();
    b->version++;
}

void FUN_00426780(drawVert_t *out, const PatchControl *in, int layer)
{
    VectorCopy(in->xyz, out->xyz);
    out->st[0] = in->st[layer][0];
    out->st[1] = in->st[layer][1];
    out->lightmap[0] = 0.0f;
    out->lightmap[1] = 0.0f;
    VectorCopy(in->normal, out->normal);
    *(unsigned int *)out->color = *(const unsigned int *)in->color_28;
}

mesh_t *FUN_004267d0(patchMesh_t *p, int layer, int *x, int *y)
{
    mesh_t inMesh;
    inMesh.verts = new drawVert_t[p->width * p->height];
    inMesh.width = p->width;
    inMesh.height = p->height;
    for (int j = 0; j < p->height; j++)
    {
        for (int i = 0; i < p->width; i++)
        {
            drawVert_t *v = &inMesh.verts[j * p->width + i];
            const PatchControl *in = &p->ctrl[i][j];
            VectorCopy(in->xyz, v->xyz);
            v->st[0] = in->st[layer][0];
            v->st[1] = p->ctrl[i][j].st[layer][1];
            v->lightmap[0] = 0.0f;
            v->lightmap[1] = 0.0f;
            VectorCopy(in->normal, v->normal);
            *(unsigned int *)v->color = *(const unsigned int *)in->color_28;
        }
    }

    mesh_t *result;
    if (p->type_10 & 0x40)
    {
        int size = inMesh.width * inMesh.height * sizeof(drawVert_t);
        result = (mesh_t *)malloc(sizeof(mesh_t) + size);
        result->width = inMesh.width;
        result->height = inMesh.height;
        result->verts = (drawVert_t *)(result + 1);
        memcpy(result->verts, inMesh.verts, size);
        FUN_00421150(result);
    }
    else
    {
        mesh_t *sub = FUN_00421980(inMesh, (float)p->style_14, 999.0f, x, y);
        FUN_00421830(*sub);
        FUN_00421150(sub);
        result = FUN_00422370(sub, x, y);
        free(sub);
    }
    delete[] inMesh.verts;
    return result;
}

void FUN_004269a0(patchMesh_t *p)
{
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
}

void FUN_004269d0(patchMesh_t *p, bool bRebuildBrush)
{
    if (bRebuildBrush)
    {
        if (p->flag_382f)
        {
            float val = p->value_3834;
            if (p->type_10 & 0x40)
                FUN_00426e80(p, 1, val);
            else
                FUN_00426f20(p, 1, val);
            p->flag_382f = 1;
            p->value_3834 = val;
        }
        vec3_t mins, maxs;
        Patch_CalcBounds(p, mins, maxs, true);
        Brush_RebuildBrush((brush_t *)p->cache_3828, mins, maxs);
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

brush_t *AddBrushForPatch(patchMesh_t *pm, bool bLinkToWorld)
{
    vec3_t vMin, vMax;
    Patch_CalcBounds(pm, vMin, vMax, true);

    texdef_t td;
    memset(&td, 0, sizeof(td));
    material_t *mat = (material_t *)pm->image_18;
    td.mat = mat;
    td.scale[0] = (float)mat->width * 0.25f;
    td.scale[1] = (float)mat->height * 0.25f;

    brush_t *b = FUN_00457ce0(NULL, &td);
    FUN_00457dd0(vMin, vMax, b, 0);
    for (int i = 0; i < b->faceCount; i++)
    {
        b->faces[i].field_78 = pm->field_08;
        b->faces[i].field_7c = pm->field_0c;
    }

    b->patch = pm;
    pm->version++;
    pm->cache_3828 = b;

    if (bLinkToWorld)
    {
        FUN_004671b0(b);
        FUN_0045a220(b, true);
        if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
            FUN_00475350();
        FUN_0047a3c0();
        b->version++;
    }
    return b;
}

float Patch_WidthDistanceTo(patchMesh_t *patch, int count)
{
    float length = 0;
    for (int i = 0; i < count; ++i)
    {
        vec3_t delta;
        VectorSubtract(patch->ctrl[i+1][0].xyz, patch->ctrl[i][0].xyz, delta);
        // This component order preserves the retail floating-point result.
        length += I_sqrt(delta[1]*delta[1] + delta[0]*delta[0] + delta[2]*delta[2]);
    }
    return length;
}

float Patch_HeightDistanceTo(patchMesh_t *patch, int count)
{
    float length = 0;
    for (int i = 0; i < count; ++i)
    {
        vec3_t delta;
        VectorSubtract(patch->ctrl[0][i+1].xyz, patch->ctrl[0][i].xyz, delta);
        length += I_sqrt(delta[1]*delta[1] + delta[0]*delta[0] + delta[2]*delta[2]);
    }
    return length;
}

void FUN_00426c90(patchMesh_t *p, const vec3_t normal, int layer, const texdef_t *td)
{
    vec4_t texVecs[2];
    BuildTextureVecs(normal, td->scale, td->shift, td->rotate, td->skew, texVecs);

    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            float s = DotProduct(p->ctrl[i][j].xyz, texVecs[0]) + texVecs[0][3];
            float t = DotProduct(p->ctrl[i][j].xyz, texVecs[1]) + texVecs[1][3];

            unsigned int sBits = *(unsigned int *)&s;
            if ((sBits & 0xfff) <= 4)
                sBits -= (sBits & 0xfff);
            else if (0x1000 - (sBits & 0xfff) <= 4)
                sBits += 0x1000 - (sBits & 0xfff);
            *(unsigned int *)&p->ctrl[i][j].st[layer][0] = sBits;

            unsigned int tBits = *(unsigned int *)&t;
            if ((tBits & 0xfff) <= 4)
                tBits -= (tBits & 0xfff);
            else if (0x1000 - (tBits & 0xfff) <= 4)
                tBits += 0x1000 - (tBits & 0xfff);
            *(unsigned int *)&p->ctrl[i][j].st[layer][1] = tBits;
        }
    }
}

void FUN_00426dc0(patchMesh_t *p, const vec3_t normal, const texdef_t *td)
{
    FUN_00426c90(p, normal, DAT_01128d94, td);
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00426e20(patchMesh_t *p, int layer, float scale, const vec3_t normal)
{
    material_t *mat = (material_t *)(&p->image_18)[layer];
    texdef_t td;
    td.mat = mat;
    td.scale[1] = (float)mat->height * scale;
    td.scale[0] = (float)mat->width * scale;
    td.shift[0] = 0.0f;
    td.shift[1] = 0.0f;
    td.rotate = 0.0f;
    td.skew = 0.0f;
    FUN_00426c90(p, normal, layer, &td);
}

void FUN_00426e80(patchMesh_t *p, int layer, float scale)
{
    vec3_t mins, maxs, size;
    Patch_CalcBounds(p, mins, maxs, false);
    VectorSubtract(maxs, mins, size);
    int axis = (size[1] < size[0]) ? 1 : 0;
    if (size[2] < size[axis])
        axis = 2;
    size[0] = 0.0f;
    size[1] = 0.0f;
    size[2] = 0.0f;
    size[axis] = 1.0f;
    FUN_00426e20(p, layer, scale, size);
}

void FUN_00426f20(patchMesh_t *p, int layer, float scale)
{
    int x2[512];
    int y2[512];
    int x1[512];
    int y1[512];
    vec3_t normal;

    mesh_t *m = FUN_004267d0(p, layer, x1, y1);
    mesh_t *m2 = FUN_00422900(m, scale, 512, x2, y2, x1, y1);
    free(m);
    if (FUN_00421500(m2, normal))
    {
        free(m2);
        FUN_00426e20(p, layer, scale, normal);
        return;
    }

    for (int i = 0; i < p->width; i++)
    {
        int sx = 0;
        while (sx < m2->width - 1 && x1[sx] < i)
            sx++;
        float s = ((float)sx + 0.5f) / 512.0f;
        for (int j = 0; j < p->height; j++)
        {
            int sy = 0;
            while (sy < m2->height - 1 && y1[sy] < j)
                sy++;
            float t = ((float)sy + 0.5f) / 512.0f;
            p->ctrl[i][j].st[layer][0] = s;
            p->ctrl[i][j].st[layer][1] = t;
        }
    }
    free(m2);
}

void FUN_004270a0(patchMesh_t *p, int layer, float scale)
{
    if (p->type_10 & 0x40)
        FUN_00426e80(p, layer, scale);
    else
        FUN_00426f20(p, layer, scale);
    if (layer == 1)
    {
        p->flag_382f = 1;
        p->value_3834 = scale;
    }
}

void FUN_004270e0(patchMesh_t *p)
{
    int layer = DAT_01128d94;
    if (p->type_10 & 0x40)
        FUN_00426e80(p, layer, 16.0f);
    else
        FUN_00426f20(p, layer, 16.0f);
    if (layer == 1)
    {
        p->flag_382f = 1;
        p->value_3834 = 16.0f;
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00427160(patchMesh_t *p, int layer)
{
    material_t *mat = (material_t *)(&p->image_18)[DAT_01128d90];
    float invW = 1.0f / ((float)mat->width * dword_1128DC4);
    float invH = 1.0f / ((float)mat->height * dword_1128DC4);
    float wDist = 0.0f;
    for (int i = 0; i < p->width; i++)
    {
        float hDist = 0.0f;
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[i][j].st[layer][0] = wDist * invW;
            p->ctrl[i][j].st[layer][1] = hDist * invH;
            hDist = Patch_HeightDistanceTo(p, j + 1);
        }
        wDist = Patch_WidthDistanceTo(p, i + 1);
    }
    if (layer == 1)
        p->flag_382f = 0;
}

void Patch_Naturalize(patchMesh_t *p)
{
    FUN_00427160(p, DAT_01128d94);
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

face_t *Patch_GetAxisFace(patchMesh_t *p)
{
#line 1009
    assert(p);
    brush_t *b = (brush_t *)p->cache_3828;
#line 1011
    assert(b);
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *faces = b->faces;
        winding_t *w = faces[i].w;
#line 1015
        assert(w);
        vec3_t vTemp;
        VectorSubtract(w->p[1], w->p[0], vTemp);
        int nScore = 0;
        if (vTemp[0] > 8.0f)
            nScore++;
        if (vTemp[1] > 8.0f)
            nScore++;
        if (vTemp[2] > 8.0f)
            nScore++;
        if (nScore > 0)
            return &b->faces[i];
    }
    return &b->faces[0];
}

face_t *nextFace(patchMesh_t *p)
{
    brush_t *b = (brush_t *)p->cache_3828;
    g_nFaceCycle++;
    if (g_nFaceCycle >= (b->faceCount > 6 ? 6 : b->faceCount))
        g_nFaceCycle = 0;
#line 1045
    iassert(g_nFaceCycle >= 0 && g_nFaceCycle < b->faceCount);
    return &b->faces[g_nFaceCycle];
}
#line 840

void Patch_CapTexture(patchMesh_t *p, bool bCycleCap, float fScaleS, float fScaleT)
{
    Patch_MeshNormals(p);
    face_t *f;
    if (bCycleCap)
        f = nextFace(p);
    else
        f = Patch_GetAxisFace(p);
    texdef_t td = f->texdef[DAT_01128d90];
    td.rotate = 0.0f;
    td.scale[0] = (float)td.mat->width * fScaleS;
    td.shift[0] = 0.0f;
    td.shift[1] = 0.0f;
    td.scale[1] = (float)td.mat->height * fScaleT;
    FUN_00426dc0(p, f->plane.normal, &td);
}

void FillPatch(patchMesh_t *p, vec3_t v)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            VectorCopy(v, p->ctrl[i][j].xyz);
        }
    }
}

struct patch_eclass_t { unsigned char pad[8]; int fixedsize; };
struct patch_entity_def_t { unsigned char pad[0x50]; patch_eclass_t *eclass; };
struct entity_s { unsigned char pad[8]; patch_entity_def_t *def; };
struct patch_t { patchMesh_t *def; short version; unsigned char pad06[0x1a]; };
struct selbrush_t
{
    selbrush_t *prev;
    selbrush_t *next;
    entity_s *owner;
    unsigned char pad0[8];
    brush_t *def;
    int faceCount;
    unsigned char pad1[4];
    patch_t *patch;
    unsigned char pad2[2];
    unsigned char hiddenBrush;
};

// Retail 0x00429df0 / 34 B; MSVC 7.1 isolated referee MATCH
// in run 42071492272. The decompiler names identify two existing
// global objects: an index count and a contiguous 32-bit table.
extern int DAT_010c4d84;
extern int DAT_010c4d88[];

int __fastcall FUN_00429df0(void *, int value)
{
    for (int i = 0; i < DAT_010c4d84; ++i)
    {
        if (value == DAT_010c4d88[i])
            return i;
    }
    return -1;
}

// Retail 0x0042ab00: 2D cross-product term of three points (eax, ecx, edx).
float FUN_0042ab00(const vec2_t p0, const vec2_t p1, const vec2_t p2)
{
    return (p1[1] - p0[1]) * p2[0] + (p2[1] - p1[1]) * p0[0] + (p0[1] - p2[1]) * p1[0];
}

extern HWND g_hwndCheck_01234004;
extern selbrush_t DAT_010a44b4;
extern selbrush_t DAT_010a44dc;
void FUN_0042ae30(patchMesh_t *patch, float offset);

void FUN_0042aed0(selbrush_t *list, float offset)
{
    for (selbrush_t *b = list->next; b != list; b = b->next)
    {
        if (b->patch)
        {
#line 2287
            assert( b->patch->def == b->def->patch );
            FUN_0042ae30(b->patch->def, offset);
        }
    }
}

void FUN_0042af50(float offset)
{
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
        FUN_0042aed0(&DAT_010a44dc, offset);
    FUN_0042aed0(&DAT_010a44b4, offset);
}

// Retail 0x0042b6d0, 14 B. Isolated exact MATCH in run 42070669799.
float FUN_0042b6d0(int unused1, int unused2,
                    float offset, float factor, float scale)
{
    return factor * scale + offset;
}

static float g_patchAccumWeights[5];
static float g_patchAccumVals[5];

// Retail 0x0042b760, 45 B: weighted control-point accumulator callback (5 components).
float FUN_0042b760(int unused1, int index, float value, int unused2, float weight)
{
    g_patchAccumVals[index] += value * weight;
    g_patchAccumWeights[index] += weight;
    return value;
}

void FUN_0042bd10(selbrush_t *list)
{
    for (selbrush_t *b = list->next; b != list; b = b->next)
    {
        if (b->patch)
        {
#line 2640
            assert( b->patch->def == b->def->patch );
            b->patch->def->field_382e = 0;
        }
    }
}

// Projection of CAdvCurveEditDlg (AdvCurveDlg.cpp) for the one global instance used here.
class CAdvCurveEditDlg
{
public:
    int FUN_00401d90();
    void FUN_00401df0(int selected);
};
extern CAdvCurveEditDlg DAT_01233b68;
void FUN_0042bde0(selbrush_t *list);
void Undo_End();

void FUN_0042beb0()
{
    if (DAT_01233b68.FUN_00401d90() == 5)
        DAT_01233b68.FUN_00401df0(2);
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
        FUN_0042bde0(&DAT_010a44dc);
    FUN_0042bde0(&DAT_010a44b4);
    Undo_End();
}

struct CPatchBendXYProjection
{
    unsigned char pad[0xf4];
    int m_nViewType;
};

struct CPatchBendMainProjection
{
    unsigned char pad[0x7e0];
    CPatchBendXYProjection *m_pActiveXY;
};

class CMainFrame;
extern CMainFrame *g_pParentWnd;
extern selbrush_t selected_brushes;
extern CPtrArray g_ptrSelectedFaces;
void UpdatePatchInspector();

void FUN_0042ea50(patchMesh_t *p, const vec3_t v)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
            VectorAdd(p->ctrl[i][j].xyz, v, p->ctrl[i][j].xyz);
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    UpdatePatchInspector();
}


extern void Sys_Printf(const char *fmt, ...);
extern vec3_t g_vRotateOrigin;
static vec3_t g_vBendOrigin;

extern int dword_5909F8;
extern bool byte_12334B8;

void FUN_0042f950(int value)
{
    byte_12334B8 = (value == dword_5909F8);
    dword_5909F8 = value;
}

extern CPatchDialog g_PatchDialog;
char *va(const char *format, ...);

// the brush def a patch hangs off; retail asserts call it p->symbiot
struct symbiot_t
{
    unsigned char pad00[0x1c];
    int refCount;
    unsigned char pad20[0x44 - 0x20];
    patchMesh_t *patch;
};

// asserts whose retail text is the field name, not the C++ spelling used here
#define assertText(cond, text) \
    do { \
        static bool s_assertDisable; \
        if ( !(cond) && !s_assertDisable ) \
        { \
            switch ( FUN_0047d980( text, __FILE__, __LINE__, 0, 1 ) ) \
            { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = true; break; \
            } \
        } \
    } while ( 0 )

#define assertMsgText(cond, text, fmt, a1) \
    do { \
        static bool s_assertDisable; \
        if ( !(cond) && !s_assertDisable ) \
        { \
            switch ( FUN_0047d980( va( "%s\n\t" fmt, text, a1 ), __FILE__, __LINE__, 0, 1 ) ) \
            { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = true; break; \
            } \
        } \
    } while ( 0 )

// 0x0042f660 (290 B), patch in esi
void FUN_0042f660(patchMesh_t *p)
{
#define SYMBIOT ((symbiot_t *)p->cache_3828)
#line 3857
    assertText(SYMBIOT, "p->symbiot");
    assertText(SYMBIOT->patch == p, "p->symbiot->patch == p");
    assertMsgText(SYMBIOT->refCount == 0, "(p->symbiot->refCount == 0)", "(p->symbiot->refCount) = %i", SYMBIOT->refCount);
    SYMBIOT->patch = NULL;
    if (p->cache_3824)
        free(p->cache_3824);
    delete p;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
#undef SYMBIOT
}

void FUN_0042fad0(patchMesh_t *p, int amount)
{
    float scale = (float)amount;
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, scale);
    else
        FUN_00426f20(p, 1, scale);
    p->value_3834 = scale;
    p->flag_382f = 1;
    if (DAT_01128d90 == 1)
    {
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
}

void FUN_004325d0(patchMesh_t *p, int c)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (DAT_011298b0 == 4 && FUN_00429df0(NULL, (int)&p->ctrl[i][j]) == -1)
                continue;
            float *st = &p->ctrl[i][j].st[DAT_01128d94][c];
            *st = 1.0f - *st;
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_004326b0(patchMesh_t *p, float scaleS, float scaleT)
{
    if (scaleS == 0.0f)
        scaleS = 1.0f;
    if (scaleT == 0.0f)
        scaleT = 1.0f;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (DAT_011298b0 == 4 && FUN_00429df0(NULL, (int)&p->ctrl[i][j]) == -1)
                continue;
            p->ctrl[i][j].st[DAT_01128d94][0] *= scaleS;
            p->ctrl[i][j].st[DAT_01128d94][1] *= scaleT;
        }
    }
    if (scaleS == scaleT)
    {
        scaleS *= p->value_3834;
        if (DAT_01128d94 == 1)
        {
            p->flag_382f = 1;
            p->value_3834 = scaleS;
        }
    }
    else if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00433830(patchMesh_t *p)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[i][j].st[DAT_01128d94][0] = (float)i / (float)(p->width - 1);
            p->ctrl[i][j].st[DAT_01128d94][1] = (float)j / (float)(p->height - 1);
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}


bool OnlyPatchesSelected()
{
    if (g_ptrSelectedFaces.GetSize() > 0 || selected_brushes.next == &selected_brushes)
        return false;
    for (selbrush_t *pb = selected_brushes.next; pb != &selected_brushes; pb = pb->next)
    {
        if (!pb->patch)
            return false;
    }
    return true;
}

bool AnyPatchesSelected()
{
    for (selbrush_t *pb = selected_brushes.next; pb != &selected_brushes; pb = pb->next)
    {
        if (pb->patch)
            return true;
    }
    return false;
}

static bool QE_SingleBrush_Pmesh(bool bQuiet = false)
{
    if (selected_brushes.next == &selected_brushes || selected_brushes.next->next != &selected_brushes)
    {
        if (!bQuiet)
            Sys_Printf("Error: you must have a single brush selected\n");
        return false;
    }
    if (selected_brushes.next->owner->def->eclass->fixedsize)
    {
        if (!bQuiet)
            Sys_Printf("Error: you cannot manipulate fixed size entities\n");
        return false;
    }
    return true;
}

patchMesh_t *SinglePatchSelected()
{
    if (QE_SingleBrush_Pmesh(false))
    {
        selbrush_t *b = selected_brushes.next;
        if (b->patch)
            return b->patch->def;
    }
    return NULL;
}

extern bool DAT_012334ba;
extern patchMesh_t DAT_0109c538;
extern int DAT_0123348c;
void FUN_00433ad0();

void FUN_00433e30()
{
    if (DAT_012334ba)
    {
        FUN_00433ad0();
        patchMesh_t *p = SinglePatchSelected();
        if (p)
        {
            p->width = DAT_0109c538.width;
            p->height = DAT_0109c538.height;
            p->type_10 = DAT_0109c538.type_10;
            memcpy(p->ctrl, DAT_0109c538.ctrl, sizeof(p->ctrl));
        }
        DAT_0123348c = -1;
    }
}

void Patch_SetBendRotateOrigin()
{
    int nType = reinterpret_cast<const CPatchBendMainProjection *>(g_pParentWnd)->m_pActiveXY->m_nViewType;
    int nDim3 = (nType == 2) ? 2 : (nType == 0) ? 0 : 1;
    g_vBendOrigin[nDim3] = 0.0f;
    g_vRotateOrigin[0] = g_vBendOrigin[0];
    g_vRotateOrigin[1] = g_vBendOrigin[1];
    g_vRotateOrigin[2] = g_vBendOrigin[2];
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00434100() {}

void FUN_00435840()
{
    for (selbrush_t *b = DAT_010a44dc.next; b && b != &DAT_010a44dc; b = b->next)
    {
        if (b->patch)
        {
#line 6282
            assert( b->patch->def == b->def->patch );
            patchMesh_t *p = b->patch->def;
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
        }
    }
}

void FUN_00439160(int amount)
{
    for (selbrush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->patch)
            continue;
        patchMesh_t *p = b->patch->def;
        if (p->type_10 & 0x40)
            continue;
#line 8062
        assert( p == b->def->patch );
        if (amount < 0 && p->style_14 == 1)
            continue;
        if (amount > 0)
        {
            mesh_t *m = (mesh_t *)p->cache_3824;
            if (m->width <= p->width && m->height <= p->height)
                continue;
        }
        mesh_t *m = (mesh_t *)p->cache_3824;
        int oldCount = m->height * m->width;
        p->style_14 += amount;
        for (;;)
        {
            if (p->style_14 < 1)
            {
                p->style_14 = 1;
                break;
            }
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
            m = (mesh_t *)p->cache_3824;
            if (m->height * m->width != oldCount)
                break;
            p->style_14 += amount;
        }
    }
    DAT_0123348c = -1;
}


// 0x004392a0 (275 B), def in esi
patch_t *FUN_004392a0(patchMesh_t *def)
{
#define SYMBIOT ((symbiot_t *)def->cache_3828)
#line 8097
    assert( def );
    assertText(SYMBIOT, "def->symbiot");
    assertMsgText(SYMBIOT->refCount >= 0, "(def->symbiot->refCount >= 0)", "(def->symbiot->refCount) = %i", SYMBIOT->refCount);
    patch_t *p = new patch_t;
    memset(p, 0, sizeof(patch_t));
    p->def = def;
    p->version = def->version - 1;
    return p;
#undef SYMBIOT
}


void FUN_004394f0(const vec2_t a, const vec2_t b, vec2_t out)
{
    out[0] = a[0] - b[0];
    out[1] = a[1] - b[1];
}

void FUN_00439500(const vec2_t a, const vec2_t b, vec2_t out)
{
    out[0] = (a[0] + b[0]) * 0.5f;
    out[1] = (a[1] + b[1]) * 0.5f;
}

void FUN_00439670(vec2_t v)
{
    v[0] = 0.0f;
    v[1] = 0.0f;
}

void FUN_00439680(const vec2_t src, vec2_t dst)
{
    dst[0] = src[0];
    dst[1] = src[1];
}

void FUN_00439720(unsigned char *p, unsigned char a, unsigned char b, unsigned char c, unsigned char d)
{
    p[2] = b;
    p[1] = a;
    p[0] = c;
    p[3] = d;
}
