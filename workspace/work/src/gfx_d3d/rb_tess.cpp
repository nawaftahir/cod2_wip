// PC surface tessellation; the command table is owned by rb_backend.
#include "gfx.h"
#include "rb_tess.h"
#include "r_tess_dispatch.h"
#include "r_entity.h"
#include <stddef.h>
#include <string.h>

void RB_EndSurface();
void RB_TessOverflow();
extern "C" void Com_Memcpy(void *out, const void *in, int count);

typedef char tessSurfaceLayoutCheck[(sizeof(srfPoly_t) == 16
    && offsetof(srfPoly_t, vertCount) == 10 && offsetof(srfPoly_t, verts) == 12
    && sizeof(GfxWorldVertex) == 68 && offsetof(GfxWorldVertex, color) == 24
    && sizeof(GfxWorldVertexDx7) == 32 && offsetof(GfxWorldVertexDx7, color) == 12
    && offsetof(srfTriangles_t, firstVertex) == 28
    && offsetof(srfTriangles_t, vertexCount) == 32
    && offsetof(srfTriangles_t, indexCount) == 34
    && offsetof(srfTriangles_t, indices) == 36) ? 1 : -1];

extern DxGlobals dx;
extern const dvar_t *r_logFile;
char *va(const char *format, ...);
void RB_LogPrint(const char *text);

typedef char cachedTessLayoutCheck[(offsetof(GfxStaticModelCachedSurface, surface) == 8
    && offsetof(GfxStaticModelSurfaceCached, baseVertIndex) == 0
    && offsetof(XSurface, triCount) == 4
    && offsetof(DxGlobals, smodelCacheIndices) == 0x2dc8) ? 1 : -1];

extern DxState dxState;
extern r_backEndGlobals_t backEnd;
void RB_ChangeIndices(IDirect3DIndexBuffer9 *buffer);
void RB_ChangeStreamSource(int stream, IDirect3DVertexBuffer9 *buffer, int offset, int stride);
void RB_PushMatrixStack();
void RB_PopMatrixStack();
void RB_ChangedWorldMatrix(float scale);
void RB_DrawTechnique(int declaration, const GfxDrawPrimArgs *args);

typedef char rigidTessLayoutCheck[(sizeof(GfxModelRigidSurface) == 56
    && offsetof(GfxModelRigidSurface, boneAxis) == 8
    && offsetof(XSurface, vertCount) == 2 && offsetof(XSurface, surfRigid) == 16
    && offsetof(XSurface, indexBuffer) == 20
    && sizeof(GfxCodeMatrices) == 0xcd0
    && offsetof(r_backEndGlobals_t, codeMatrixStack) == 0x4e0
    && offsetof(r_backEndGlobals_t, codeMatrixStackLevel) == 0x2b50
    && offsetof(r_backEndGlobals_t, currentEntity) == 0x440
    && offsetof(DxState, indexBuffer) == 0x20cc
    && offsetof(DxState, streams) == 0x20d0
    && offsetof(GfxEntity, scale) == 56 && sizeof(GfxDrawPrimArgs) == 20) ? 1 : -1];

// PINNED PC skinned-model submission, 10041140..100413b5.
extern GfxBackEndData *backEndData;
void XSurfaceGetTris(const XSurface *surface, r_index_t *out, short offset);

typedef char skinnedTessLayoutCheck[(sizeof(GfxModelSkinnedSurface) == 16
    && offsetof(GfxModelSkinnedSurface, skinnedCachedOffset) == 8
    && offsetof(GfxModelSkinnedSurface, skinnedVert) == 12
    && sizeof(r_vb_state_t) == 12 && offsetof(r_vb_state_t, buffer) == 8
    && offsetof(GfxBackEndData, skinnedCacheVb) == 0x217c78) ? 1 : -1];

// PINNED PC particle-cloud submission, 10040ca0..10041024.
#include <math.h>
float Vec3Normalize(float *vector);

typedef char particleTessLayoutCheck[(offsetof(GfxEntity, origin) == 0x3c
    && offsetof(GfxEntity, endpos) == 0x48 && offsetof(GfxEntity, materialRGBA) == 0x58
    && offsetof(GfxEntity, radius) == 0x64 && offsetof(GfxViewParms, viewMatrix) == 0x48
    && offsetof(DxGlobals, particleCloudVertexBuffer) == 0x2db8
    && offsetof(DxGlobals, particleCloudIndexBuffer) == 0x2dbc) ? 1 : -1];

void MakeNormalVectors(const vec3_t forward, vec3_t right, vec3_t up);

extern const dvar_t *r_railCoreWidth;

// Private name unconfirmed; PINNED 1003ee10/68 is an out-of-line two-pointer call.
#pragma optimize("p", on)
static __declspec(noinline) int RB_ParticleCloudOriginsMatch(const float *a, const float *b)
{
    for (int index = 0; index < 3; ++index)
    {
        float delta = b[index] - a[index];
        if (delta * delta > 0.0000010000001111620804f)
            return 0;
    }
    return 1;
}

#pragma optimize("p", off)

/* Header-style inline helpers. Retail keeps uncalled copies at 1003ee60/4, 1003ee70/3,
   1003ee80/24 (PINNED); names unconfirmed. */
inline IDirect3DIndexBuffer9 *XSurfaceGetIndexBuffer(const XSurface *surface)
{
    return surface->indexBuffer;
}

inline const XSurface *RB_GetModelSurfaceXSurface(const GfxModelSurface *surf)
{
    return surf->xsurf;
}

inline void RB_CheckOptimizedIndexOverflow(int indexCount)
{
    if (tess.optimizedIndexCount + indexCount > 0x100000)
        RB_TessOverflow();
}

// Private name unconfirmed; PINNED 1003eea0/123, called only by RB_TessXModelRigid.
static __declspec(noinline) void RB_SetWorldMatrixFromBoneAxis(const GfxModelRigidSurface *surface,
    const GfxEntity *ent)
{
    float (*matrix)[4] = backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0].m;
    matrix[0][0] = surface->boneAxis[0][0];
    matrix[0][1] = surface->boneAxis[0][1];
    matrix[0][2] = surface->boneAxis[0][2];
    matrix[0][3] = 0.0f;
    matrix[1][0] = surface->boneAxis[1][0];
    matrix[1][1] = surface->boneAxis[1][1];
    matrix[1][2] = surface->boneAxis[1][2];
    matrix[1][3] = 0.0f;
    matrix[2][0] = surface->boneAxis[2][0];
    matrix[2][1] = surface->boneAxis[2][1];
    matrix[2][2] = surface->boneAxis[2][2];
    matrix[2][3] = 0.0f;
    matrix[3][0] = surface->boneAxis[3][0];
    matrix[3][1] = surface->boneAxis[3][1];
    matrix[3][2] = surface->boneAxis[3][2];
    matrix[3][3] = 1.0f;
    RB_ChangedWorldMatrix(ent->scale);
}

// PINNED 1003ef20 is an actual empty return, not a replacement for missing kinds.
void RB_TessBad(const surfaceType_t *surfType)
{
}

// PINNED 1003ef30: declaration1, world vertices, then triangle-fan indices.
void RB_TessPoly(const surfaceType_t *surfType)
{
    const srfPoly_t *poly = (const srfPoly_t *)surfType;
    if (tess.declType != 1)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        tess.declType = 1;
    }
    if (tess.vertexCount + poly->vertCount > 5450
        || tess.indexCount + (poly->vertCount - 2) * 3 > 0x100000)
        RB_TessOverflow();
    if (r_rendererInUse->current.integer == 2)
    {
        for (int index = 0; index < poly->vertCount; ++index)
        {
            GfxWorldVertexDx7 *out = (GfxWorldVertexDx7 *)tess.vertexData + tess.vertexCount + index;
            out->xyz[0] = poly->verts[index].xyz[0];
            out->xyz[1] = poly->verts[index].xyz[1];
            out->xyz[2] = poly->verts[index].xyz[2];
            out->color = poly->verts[index].color;
            out->texCoord[0] = poly->verts[index].texCoord[0];
            out->texCoord[1] = poly->verts[index].texCoord[1];
            out->lmapCoord[0] = poly->verts[index].lmapCoord[0];
            out->lmapCoord[1] = poly->verts[index].lmapCoord[1];
        }
    }
    else
        memcpy((GfxWorldVertex *)tess.vertexData + tess.vertexCount,
            poly->verts, poly->vertCount * sizeof(GfxWorldVertex));
    for (int triangle = 0; triangle < poly->vertCount - 2; ++triangle)
    {
        tess.indices[tess.indexCount] = (unsigned short)tess.vertexCount;
        tess.indices[tess.indexCount + 1] = (unsigned short)(tess.vertexCount + triangle + 1);
        tess.indices[tess.indexCount + 2] = (unsigned short)(tess.vertexCount + triangle + 2);
        tess.indexCount += 3;
    }
    tess.vertexCount += poly->vertCount;
}

// Sprite geometry and projection.
// PINNED 1003f120: corner sums/differences precede the origin addition.
static void RB_AddQuadStamp(const float *origin, const float *left, const float *up,
    unsigned int color, float s0, float t0, float s1, float t1)
{
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int base = tess.vertexCount;
    tess.indices[tess.indexCount] = (unsigned short)base;
    tess.indices[tess.indexCount + 1] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 2] = (unsigned short)(base + 3);
    tess.indices[tess.indexCount + 3] = (unsigned short)(base + 3);
    tess.indices[tess.indexCount + 4] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 5] = (unsigned short)(base + 2);
    GfxVertex *vertices = (GfxVertex *)tess.vertexData + (unsigned short)base;
    float sum[3], difference[3], normal[3], tangent[3];
    sum[0] = left[0] + up[0];
    sum[1] = left[1] + up[1];
    sum[2] = left[2] + up[2];
    difference[0] = left[0] - up[0];
    difference[1] = left[1] - up[1];
    difference[2] = left[2] - up[2];
    for (int c = 0; c < 3; ++c)
    {
        vertices[0].xyzw[c] = sum[c] + origin[c];
        vertices[1].xyzw[c] = origin[c] - difference[c];
        vertices[2].xyzw[c] = origin[c] - sum[c];
        vertices[3].xyzw[c] = difference[c] + origin[c];
    }
    for (int corner = 0; corner < 4; ++corner)
        vertices[corner].xyzw[3] = 1.0f;
    normal[0] = -backEnd.viewParms->axis[0][0];
    normal[1] = -backEnd.viewParms->axis[0][1];
    normal[2] = -backEnd.viewParms->axis[0][2];
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].normal[0] = normal[0];
        vertices[corner].normal[1] = normal[1];
        vertices[corner].normal[2] = normal[2];
    }
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].binormal[0] = up[0];
        vertices[corner].binormal[1] = up[1];
        vertices[corner].binormal[2] = up[2];
    }
    tangent[0] = -left[0];
    tangent[1] = -left[1];
    tangent[2] = -left[2];
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].tangent[0] = tangent[0];
        vertices[corner].tangent[1] = tangent[1];
        vertices[corner].tangent[2] = tangent[2];
    }
    vertices[0].texCoord[0] = s0;
    vertices[0].texCoord[1] = t0;
    vertices[1].texCoord[0] = s1;
    vertices[1].texCoord[1] = t0;
    vertices[2].texCoord[0] = s1;
    vertices[2].texCoord[1] = t1;
    vertices[3].texCoord[0] = s0;
    vertices[3].texCoord[1] = t1;
    for (int corner = 0; corner < 4; ++corner)
        vertices[corner].color.packed = color;
    tess.vertexCount += 4;
    tess.indexCount += 6;
}

// PINNED 1003f410: corner sums/differences precede the origin addition.
static void RB_AddQuadStampDx7(const float *origin, const float *left, const float *up,
    unsigned int color, float s0, float t0, float s1, float t1)
{
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int base = tess.vertexCount;
    tess.indices[tess.indexCount] = (unsigned short)base;
    tess.indices[tess.indexCount + 1] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 2] = (unsigned short)(base + 3);
    tess.indices[tess.indexCount + 3] = (unsigned short)(base + 3);
    tess.indices[tess.indexCount + 4] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 5] = (unsigned short)(base + 2);
    GfxVertexDx7 *vertices = (GfxVertexDx7 *)tess.vertexData + (unsigned short)base;
    float sum[3], difference[3], normal[3];
    sum[0] = left[0] + up[0];
    sum[1] = left[1] + up[1];
    sum[2] = left[2] + up[2];
    difference[0] = left[0] - up[0];
    difference[1] = left[1] - up[1];
    difference[2] = left[2] - up[2];
    for (int c = 0; c < 3; ++c)
        vertices[0].xyz[c] = sum[c] + origin[c];
    for (int c = 0; c < 3; ++c)
        vertices[1].xyz[c] = origin[c] - difference[c];
    for (int c = 0; c < 3; ++c)
        vertices[2].xyz[c] = origin[c] - sum[c];
    for (int c = 0; c < 3; ++c)
        vertices[3].xyz[c] = difference[c] + origin[c];
    normal[0] = -backEnd.viewParms->axis[0][0];
    normal[1] = -backEnd.viewParms->axis[0][1];
    normal[2] = -backEnd.viewParms->axis[0][2];
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].normal[0] = normal[0];
        vertices[corner].normal[1] = normal[1];
        vertices[corner].normal[2] = normal[2];
    }
    vertices[0].texCoord[0] = s0;
    vertices[0].texCoord[1] = t0;
    vertices[1].texCoord[0] = s1;
    vertices[1].texCoord[1] = t0;
    vertices[2].texCoord[0] = s1;
    vertices[2].texCoord[1] = t1;
    vertices[3].texCoord[0] = s0;
    vertices[3].texCoord[1] = t1;
    for (int corner = 0; corner < 4; ++corner)
        vertices[corner].color.packed = color;
    tess.vertexCount += 4;
    tess.indexCount += 6;
}

// PINNED 1003f620: signed frame division; the column byte is at material+0xf.
static void RB_GetEntityAtlasCoords(const GfxEntity *ent, float *uv)
{
    int rows = ent->customMaterial->info.textureAtlasRowCount;
    int columns = ent->customMaterial->info.textureAtlasColumnCount;
    if (rows * columns == 1)
    {
        uv[0] = uv[1] = 0.0f;
        uv[2] = uv[3] = 1.0f;
        return;
    }
    float inverseColumns = 1.0f / columns;
    float inverseRows = 1.0f / rows;
    uv[0] = (ent->materialSubimageIndex % columns) * inverseColumns;
    uv[1] = (ent->materialSubimageIndex / columns) * inverseRows;
    uv[2] = uv[0] + inverseColumns;
    uv[3] = uv[1] + inverseRows;
}

// PINNED 1003f6c0: lifted origin, BGRA color and optional camera-plane rotation.
static void RB_BuildSprite(const GfxEntity *ent, const float *radius)
{
    float origin[3] = {ent->origin[0], ent->origin[1], ent->origin[2]};
    if (ent->renderFxFlags & 0x1000)
        origin[2] += radius[1];
    const GfxViewParms *view = backEnd.viewParms;
    float left[3], up[3];
    if (ent->rotation == 0.0f)
    {
        for (int component = 0; component < 3; ++component)
        {
            left[component] = radius[0] * view->axis[1][component];
            up[component] = radius[1] * view->axis[2][component];
        }
    }
    else
    {
        float radians = ent->rotation * 0.017453292f;
        float sine, cosine;
        FastSinCos(radians, &sine, &cosine);
        float leftCos = cosine * radius[0], leftSin = -(sine * radius[0]);
        float upCos = cosine * radius[1], upSin = sine * radius[1];
        for (int component = 0; component < 3; ++component)
        {
            left[component] = leftSin * view->axis[2][component] + leftCos * view->axis[1][component];
            up[component] = upSin * view->axis[1][component] + upCos * view->axis[2][component];
        }
    }
    GfxColor rgba;
    rgba.array[2] = ent->materialRGBA[0];
    rgba.array[1] = ent->materialRGBA[1];
    rgba.array[0] = ent->materialRGBA[2];
    rgba.array[3] = ent->materialRGBA[3];
    unsigned int color = rgba.packed;
    float uv[4];
    RB_GetEntityAtlasCoords(ent, uv);
    if (r_rendererInUse->current.integer == 2)
        RB_AddQuadStampDx7(origin, left, up, color, uv[0], uv[1], uv[2], uv[3]);
    else
        RB_AddQuadStamp(origin, left, up, color, uv[0], uv[1], uv[2], uv[3]);
}

// PINNED 1003f930: reject ordered W<=0, while unordered enters the projection.
static bool RB_ScreenRadiusToWorld(const float *origin, float height, float *radius)
{
    const GfxViewParms *view = backEnd.viewParms;
    const D3DMATRIX *matrix = &view->viewProjectionMatrix;
    float w = origin[2] * matrix->m[2][3] + origin[1] * matrix->m[1][3]
        + origin[0] * matrix->m[0][3] + matrix->m[3][3];
    if (w <= 0.0f)
        return false;
    height += height;
    const D3DMATRIX *inverse = &view->inverseViewProjectionMatrix;
    float up[3];
    up[0] = height * inverse->m[1][0];
    up[1] = height * inverse->m[1][1];
    up[2] = height * inverse->m[1][2];
    *radius = (up[1] * view->axis[2][1] + up[2] * view->axis[2][2] + up[0] * view->axis[2][0]) * w;
    return true;
}

// PINNED 1003f9b0: offset the camera origin and project at the entity's W.
static bool RB_WorldRadiusToScreen(const float *origin, const float *radius, float *screen)
{
    const GfxViewParms *view = backEnd.viewParms;
    const D3DMATRIX *matrix = &view->viewProjectionMatrix;
    float w = origin[2] * matrix->m[2][3] + origin[1] * matrix->m[1][3]
        + origin[0] * matrix->m[0][3] + matrix->m[3][3];
    if (w <= 0.0f)
        return false;
    float point[3];
    for (int component = 0; component < 3; ++component)
        point[component] = -radius[0] * view->axis[1][component] + view->origin[component]
            + radius[1] * view->axis[2][component];
    float x = point[2] * matrix->m[2][0] + point[1] * matrix->m[1][0]
        + point[0] * matrix->m[0][0] + matrix->m[3][0];
    float y = point[2] * matrix->m[2][1] + point[0] * matrix->m[0][1]
        + point[1] * matrix->m[1][1] + matrix->m[3][1];
    float inverseW = 1.0f / w;
    screen[0] = x * inverseW * 0.5f;
    screen[1] = y * inverseW * 0.5f;
    return true;
}

// PINNED 1003fae0: NaN minimum size skips the ordered-positive clamp path.
static void RB_TessWorldSprite(const GfxEntity *ent)
{
    float radius[2] = {ent->radius[0], ent->radius[1]};
    if (ent->minScreenRadius > 0.0f)
    {
        float screen[2];
        if (!RB_WorldRadiusToScreen(ent->origin, ent->radius, screen))
            return;
        if (screen[1] < ent->minScreenRadius)
        {
            float scale = ent->minScreenRadius / screen[1];
            radius[0] = scale * ent->radius[0];
            radius[1] = scale * ent->radius[1];
        }
    }
    RB_BuildSprite(ent, radius);
}

// PINNED 1003fb50: screen-space sprites use one projected radius for both axes.
void RB_TessSprite(const GfxEntity *ent)
{
    if (ent->renderFxFlags & 0x2000)
    {
        float radius[2];
        if (!RB_ScreenRadiusToWorld(ent->origin, ent->radius[1], &radius[1]))
            return;
        radius[0] = radius[1];
        RB_BuildSprite(ent, radius);
    }
    else
        RB_TessWorldSprite(ent);
}

// PINNED 1003fba0: oriented quads use entity axis0, without sprite size/lift flags.
void RB_TessOrientedQuad(const GfxEntity *ent)
{
    float right[3], vertical[3], left[3], up[3];
    MakeNormalVectors(ent->axis[0], right, vertical);
    if (ent->rotation == 0.0f)
    {
        for (int component = 0; component < 3; ++component)
        {
            left[component] = right[component] * ent->radius[0];
            up[component] = vertical[component] * ent->radius[1];
        }
    }
    else
    {
        float radians = ent->rotation * 0.017453292f;
        float sine, cosine;
        FastSinCos(radians, &sine, &cosine);
        float scale = cosine * ent->radius[0];
        left[0] = right[0] * scale;
        left[1] = right[1] * scale;
        left[2] = right[2] * scale;
        scale = -(sine * ent->radius[0]);
        left[0] = vertical[0] * scale + left[0];
        left[1] = vertical[1] * scale + left[1];
        left[2] = vertical[2] * scale + left[2];
        scale = cosine * ent->radius[1];
        up[0] = vertical[0] * scale;
        up[1] = vertical[1] * scale;
        up[2] = vertical[2] * scale;
        scale = sine * ent->radius[1];
        up[0] = right[0] * scale + up[0];
        up[1] = right[1] * scale + up[1];
        up[2] = right[2] * scale + up[2];
    }
    GfxColor rgba;
    rgba.array[2] = ent->materialRGBA[0];
    rgba.array[1] = ent->materialRGBA[1];
    rgba.array[0] = ent->materialRGBA[2];
    rgba.array[3] = ent->materialRGBA[3];
    unsigned int color = rgba.packed;
    float uv[4];
    RB_GetEntityAtlasCoords(ent, uv);
    if (r_rendererInUse->current.integer == 2)
        RB_AddQuadStampDx7(ent->origin, left, up, color, uv[0], uv[1], uv[2], uv[3]);
    else
        RB_AddQuadStamp(ent->origin, left, up, color, uv[0], uv[1], uv[2], uv[3]);
}

// Cylinder geometry and entity dispatch.
// PINNED 1003fdb0: LOD count before overflow, basis/radii afterward; normals untouched.
static void RB_TessCylinder(const GfxEntity *ent)
{
    float center[3];
    for (int component = 0; component < 3; ++component)
        center[component] = (ent->origin[component] + ent->endpos[component]) * 0.5f
            - backEnd.lodParms.origin[component];
    float distance = Vec3Normalize(center);
    float desired = (1.0f - (distance * backEnd.lodParms.scale + backEnd.lodParms.bias)
        * 0.0009765625f) * 32.0f;
    int segments = I_fround(desired);
    if (segments < 8)
        segments = 8;
    else if (segments > 32)
        segments = 32;
    if (tess.vertexCount + segments * 2 + 2 > 5450
        || tess.indexCount + segments * 6 > 0x100000)
        RB_TessOverflow();
    float direction[3], right[3], up[3];
    for (int component = 0; component < 3; ++component)
        direction[component] = ent->origin[component] - ent->endpos[component];
    Vec3Normalize(direction);
    MakeNormalVectors(direction, right, up);
    int base = tess.vertexCount;
    GfxVertex *vertices = (GfxVertex *)tess.vertexData + base;
    GfxColor rgba;
    rgba.array[2] = ent->materialRGBA[0];
    rgba.array[1] = ent->materialRGBA[1];
    rgba.array[0] = ent->materialRGBA[2];
    rgba.array[3] = ent->materialRGBA[3];
    unsigned int color = rgba.packed;
    float inverseSegments = 1.0f / segments, coordinate = 0.0f;
    float sine, cosine;
    FastSinCos(inverseSegments * 6.2831855f, &sine, &cosine);
    float x = 1.0f, y = 0.0f;
    for (int segment = 0; segment < segments; ++segment)
    {
        int first = segment * 2;
        for (int component = 0; component < 3; ++component)
        {
            vertices[first].xyzw[component] = right[component] * (y * ent->radius[1])
                + ent->origin[component];
            vertices[first].xyzw[component] += up[component] * (x * ent->radius[1]);
            vertices[first + 1].xyzw[component] = right[component] * (y * ent->radius[0])
                + ent->endpos[component];
            vertices[first + 1].xyzw[component] += up[component] * (x * ent->radius[0]);
        }
        vertices[first].xyzw[3] = vertices[first + 1].xyzw[3] = 1.0f;
        vertices[first].color.packed = vertices[first + 1].color.packed = color;
        vertices[first].texCoord[0] = vertices[first + 1].texCoord[0] = coordinate;
        vertices[first].texCoord[1] = 1.0f;
        vertices[first + 1].texCoord[1] = 0.0f;
        coordinate += inverseSegments;
        float nextX = x * cosine - y * sine;
        float nextY = y * cosine + x * sine;
        x = nextX;
        y = nextY;
        int index = tess.indexCount;
        tess.indices[index] = (unsigned short)(base + first);
        tess.indices[index + 1] = (unsigned short)(base + first + 1);
        tess.indices[index + 2] = (unsigned short)(base + first + 3);
        tess.indexCount += 3;
        index = tess.indexCount;
        tess.indices[index] = (unsigned short)(base + first + 3);
        tess.indices[index + 1] = (unsigned short)(base + first + 2);
        tess.indices[index + 2] = (unsigned short)(base + first);
        tess.indexCount += 3;
    }
    for (int component = 0; component < 4; ++component)
    {
        vertices[segments * 2].xyzw[component] = vertices[0].xyzw[component];
        vertices[segments * 2 + 1].xyzw[component] = vertices[1].xyzw[component];
    }
    vertices[segments * 2].color.packed = vertices[segments * 2 + 1].color.packed = color;
    vertices[segments * 2].texCoord[0] = vertices[segments * 2 + 1].texCoord[0] = 1.0f;
    vertices[segments * 2].texCoord[1] = 1.0f;
    vertices[segments * 2 + 1].texCoord[1] = 0.0f;
    tess.vertexCount += segments * 2 + 2;
}

// PINNED 100401a0: LOD count before overflow, basis/radii afterward; normals untouched.
static void RB_TessCylinderDx7(const GfxEntity *ent)
{
    float center[3];
    for (int component = 0; component < 3; ++component)
        center[component] = (ent->origin[component] + ent->endpos[component]) * 0.5f
            - backEnd.lodParms.origin[component];
    float distance = Vec3Normalize(center);
    float desired = (1.0f - (distance * backEnd.lodParms.scale + backEnd.lodParms.bias)
        * 0.0009765625f) * 32.0f;
    int segments = I_fround(desired);
    if (segments < 8)
        segments = 8;
    else if (segments > 32)
        segments = 32;
    if (tess.vertexCount + segments * 2 + 2 > 5450
        || tess.indexCount + segments * 6 > 0x100000)
        RB_TessOverflow();
    float direction[3], right[3], up[3];
    for (int component = 0; component < 3; ++component)
        direction[component] = ent->origin[component] - ent->endpos[component];
    Vec3Normalize(direction);
    MakeNormalVectors(direction, right, up);
    int base = tess.vertexCount;
    GfxVertexDx7 *vertices = (GfxVertexDx7 *)tess.vertexData + base;
    GfxColor rgba;
    rgba.array[2] = ent->materialRGBA[0];
    rgba.array[1] = ent->materialRGBA[1];
    rgba.array[0] = ent->materialRGBA[2];
    rgba.array[3] = ent->materialRGBA[3];
    unsigned int color = rgba.packed;
    float inverseSegments = 1.0f / segments, coordinate = 0.0f;
    float sine, cosine;
    FastSinCos(inverseSegments * 6.2831855f, &sine, &cosine);
    float x = 1.0f, y = 0.0f;
    for (int segment = 0; segment < segments; ++segment)
    {
        int first = segment * 2;
        for (int component = 0; component < 3; ++component)
        {
            vertices[first].xyz[component] = right[component] * (y * ent->radius[1])
                + ent->origin[component];
            vertices[first].xyz[component] += up[component] * (x * ent->radius[1]);
            vertices[first + 1].xyz[component] = right[component] * (y * ent->radius[0])
                + ent->endpos[component];
            vertices[first + 1].xyz[component] += up[component] * (x * ent->radius[0]);
        }
        vertices[first].color.packed = vertices[first + 1].color.packed = color;
        vertices[first].texCoord[0] = vertices[first + 1].texCoord[0] = coordinate;
        vertices[first].texCoord[1] = 1.0f;
        vertices[first + 1].texCoord[1] = 0.0f;
        coordinate += inverseSegments;
        float nextX = x * cosine - y * sine;
        float nextY = y * cosine + x * sine;
        x = nextX;
        y = nextY;
        int index = tess.indexCount;
        tess.indices[index] = (unsigned short)(base + first);
        tess.indices[index + 1] = (unsigned short)(base + first + 1);
        tess.indices[index + 2] = (unsigned short)(base + first + 3);
        tess.indexCount += 3;
        index = tess.indexCount;
        tess.indices[index] = (unsigned short)(base + first + 3);
        tess.indices[index + 1] = (unsigned short)(base + first + 2);
        tess.indices[index + 2] = (unsigned short)(base + first);
        tess.indexCount += 3;
    }
    for (int component = 0; component < 3; ++component)
    {
        vertices[segments * 2].xyz[component] = vertices[0].xyz[component];
        vertices[segments * 2 + 1].xyz[component] = vertices[1].xyz[component];
    }
    vertices[segments * 2].color.packed = vertices[segments * 2 + 1].color.packed = color;
    vertices[segments * 2].texCoord[0] = vertices[segments * 2 + 1].texCoord[0] = 1.0f;
    vertices[segments * 2].texCoord[1] = 1.0f;
    vertices[segments * 2 + 1].texCoord[1] = 0.0f;
    tess.vertexCount += segments * 2 + 2;
}

// Line and rail geometry.
// PINNED 10040580: frame vectors precede overflow; endpoint positions follow it.
static void RB_AddLine(const float *start, const float *end, float width,
    unsigned int color, float s0, float t0, float s1, float t1)
{
    const float *viewOrigin = backEnd.viewParms->origin;
    float from[3], to[3], tangent[3], direction[3], normal[3], offset[3];
    for (int component = 0; component < 3; ++component)
    {
        from[component] = start[component] - viewOrigin[component];
        to[component] = end[component] - viewOrigin[component];
    }
    Vec3Cross(from, to, tangent);
    Vec3Normalize(tangent);
    for (int component = 0; component < 3; ++component)
    {
        offset[component] = tangent[component] * width;
        direction[component] = end[component] - start[component];
    }
    Vec3Normalize(direction);
    Vec3Cross(tangent, direction, normal);
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    GfxVertex *vertices = (GfxVertex *)tess.vertexData + tess.vertexCount;
    for (int c = 0; c < 3; ++c)
        vertices[0].xyzw[c] = offset[c] + start[c];
    for (int c = 0; c < 3; ++c)
        vertices[1].xyzw[c] = start[c] - offset[c];
    for (int c = 0; c < 3; ++c)
        vertices[2].xyzw[c] = offset[c] + end[c];
    for (int c = 0; c < 3; ++c)
        vertices[3].xyzw[c] = end[c] - offset[c];
    for (int corner = 0; corner < 4; ++corner)
        vertices[corner].xyzw[3] = 1.0f;
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].normal[0] = normal[0];
        vertices[corner].normal[1] = normal[1];
        vertices[corner].normal[2] = normal[2];
    }
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].binormal[0] = direction[0];
        vertices[corner].binormal[1] = direction[1];
        vertices[corner].binormal[2] = direction[2];
    }
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].tangent[0] = tangent[0];
        vertices[corner].tangent[1] = tangent[1];
        vertices[corner].tangent[2] = tangent[2];
    }
    vertices[0].texCoord[0] = s0;
    vertices[0].texCoord[1] = t0;
    vertices[1].texCoord[0] = s1;
    vertices[1].texCoord[1] = t0;
    vertices[2].texCoord[0] = s0;
    vertices[2].texCoord[1] = t1;
    vertices[3].texCoord[0] = s1;
    vertices[3].texCoord[1] = t1;
    for (int corner = 0; corner < 4; ++corner)
        vertices[corner].color.packed = color;
    int base = tess.vertexCount;
    tess.indices[tess.indexCount] = (unsigned short)base;
    tess.indices[tess.indexCount + 1] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 2] = (unsigned short)(base + 2);
    tess.indices[tess.indexCount + 3] = (unsigned short)(base + 2);
    tess.indices[tess.indexCount + 4] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 5] = (unsigned short)(base + 3);
    tess.vertexCount += 4;
    tess.indexCount += 6;
}

// PINNED 10040920: frame vectors precede overflow; endpoint positions follow it.
static void RB_AddLineDx7(const float *start, const float *end, float width,
    unsigned int color, float s0, float t0, float s1, float t1)
{
    const float *viewOrigin = backEnd.viewParms->origin;
    float from[3], to[3], tangent[3], direction[3], normal[3], offset[3];
    for (int component = 0; component < 3; ++component)
    {
        from[component] = start[component] - viewOrigin[component];
        to[component] = end[component] - viewOrigin[component];
    }
    Vec3Cross(from, to, tangent);
    Vec3Normalize(tangent);
    for (int component = 0; component < 3; ++component)
    {
        offset[component] = tangent[component] * width;
        direction[component] = end[component] - start[component];
    }
    Vec3Normalize(direction);
    Vec3Cross(tangent, direction, normal);
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    GfxVertexDx7 *vertices = (GfxVertexDx7 *)tess.vertexData + tess.vertexCount;
    for (int c = 0; c < 3; ++c)
        vertices[0].xyz[c] = offset[c] + start[c];
    for (int c = 0; c < 3; ++c)
        vertices[1].xyz[c] = start[c] - offset[c];
    for (int c = 0; c < 3; ++c)
        vertices[2].xyz[c] = offset[c] + end[c];
    for (int c = 0; c < 3; ++c)
        vertices[3].xyz[c] = end[c] - offset[c];
    for (int corner = 0; corner < 4; ++corner)
    {
        vertices[corner].normal[0] = normal[0];
        vertices[corner].normal[1] = normal[1];
        vertices[corner].normal[2] = normal[2];
    }
    vertices[0].texCoord[0] = s0;
    vertices[0].texCoord[1] = t0;
    vertices[1].texCoord[0] = s1;
    vertices[1].texCoord[1] = t0;
    vertices[2].texCoord[0] = s0;
    vertices[2].texCoord[1] = t1;
    vertices[3].texCoord[0] = s1;
    vertices[3].texCoord[1] = t1;
    for (int corner = 0; corner < 4; ++corner)
        vertices[corner].color.packed = color;
    int base = tess.vertexCount;
    tess.indices[tess.indexCount] = (unsigned short)base;
    tess.indices[tess.indexCount + 1] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 2] = (unsigned short)(base + 2);
    tess.indices[tess.indexCount + 3] = (unsigned short)(base + 2);
    tess.indices[tess.indexCount + 4] = (unsigned short)(base + 1);
    tess.indices[tess.indexCount + 5] = (unsigned short)(base + 3);
    tess.vertexCount += 4;
    tess.indexCount += 6;
}

// PINNED 10040c00: rail width is the dvar; longitudinal UV is length/256.
void RB_TessRailCore(const GfxEntity *ent)
{
    float x = ent->endpos[0] - ent->origin[0];
    float y = ent->endpos[1] - ent->origin[1];
    float z = ent->endpos[2] - ent->origin[2];
    float lengthSquared = z * z + y * y + x * x;
    float longitudinal = (float)(sqrt(lengthSquared) * 0.00390625f);
    GfxColor rgba;
    rgba.array[2] = ent->materialRGBA[0];
    rgba.array[1] = ent->materialRGBA[1];
    rgba.array[0] = ent->materialRGBA[2];
    rgba.array[3] = ent->materialRGBA[3];
    unsigned int color = rgba.packed;
    if (r_rendererInUse->current.integer == 2)
        RB_AddLineDx7(ent->origin, ent->endpos, r_railCoreWidth->current.value,
            color, 0.0f, 0.0f, 1.0f, longitudinal);
    else
        RB_AddLine(ent->origin, ent->endpos, r_railCoreWidth->current.value,
            color, 0.0f, 0.0f, 1.0f, longitudinal);
}

// Private name unconfirmed; PINNED 10040ca0 uses Z,Y,X accumulation order.
static void RB_RotateParticleCloudDirection(const float *in, float *out)
{
    const D3DMATRIX *view = &backEnd.viewParms->viewMatrix;
    float matrix[3][3] = {
        {view->m[0][0], view->m[0][1], view->m[0][2]},
        {view->m[1][0], view->m[1][1], view->m[1][2]},
        {view->m[2][0], view->m[2][1], view->m[2][2]}
    };
    out[0] = matrix[2][0] * in[2] + matrix[1][0] * in[1] + matrix[0][0] * in[0];
    out[1] = matrix[2][1] * in[2] + matrix[1][1] * in[1] + matrix[0][1] * in[0];
    out[2] = matrix[2][2] * in[2] + matrix[1][2] * in[1] + matrix[0][2] * in[0];
}

// Private name unconfirmed; PINNED 10040d40 tests signed components, not fabs.
static void RB_ProjectParticleCloudAxis(const GfxEntity *ent, const float *viewUp, float *axis)
{
    if (viewUp[0] < 0.001f && viewUp[1] < 0.001f)
    {
        axis[0] = ent->radius[0];
        axis[1] = axis[2] = 0.0f;
        axis[3] = ent->radius[1];
        return;
    }
    axis[0] = viewUp[1];
    axis[1] = -viewUp[0];
    axis[2] = viewUp[0];
    axis[3] = viewUp[1];
    float length = Vec2Length(axis);
    float inverseLength = 1.0f / length;
    float scale = inverseLength * ent->radius[0];
    axis[0] *= scale;
    axis[1] *= scale;
    if (length < ent->radius[0])
    {
        inverseLength *= ent->radius[0];
        axis[2] *= inverseLength;
        axis[3] *= inverseLength;
    }
}

// Private name unconfirmed; PINNED 10040df0 publishes axis49 and RGBA48.
static void RB_SetParticleCloudConstants(const GfxEntity *ent)
{
    float axis[4];
    if (ent->radius[0] == ent->radius[1]
        || RB_ParticleCloudOriginsMatch(ent->origin, ent->endpos))
    {
        axis[0] = ent->radius[0];
        axis[1] = axis[2] = 0.0f;
        axis[3] = ent->radius[1];
    }
    else
    {
        float worldUp[3], scaledWorldUp[3], viewUp[3];
        worldUp[0] = ent->endpos[0] - ent->origin[0];
        worldUp[1] = ent->endpos[1] - ent->origin[1];
        worldUp[2] = ent->endpos[2] - ent->origin[2];
        Vec3Normalize(worldUp);
        scaledWorldUp[0] = worldUp[0] * ent->radius[1];
        scaledWorldUp[1] = worldUp[1] * ent->radius[1];
        scaledWorldUp[2] = worldUp[2] * ent->radius[1];
        RB_RotateParticleCloudDirection(scaledWorldUp, viewUp);
        RB_ProjectParticleCloudAxis(ent, viewUp, axis);
    }
    backEnd.codeConsts[49][0] = axis[0];
    backEnd.codeConsts[49][1] = axis[1];
    backEnd.codeConsts[49][2] = axis[2];
    backEnd.codeConsts[49][3] = axis[3];
    const float oneOver255 = 0.003921568859368563f; // PINNED float at1019bd54.
    backEnd.codeConsts[48][0] = ent->materialRGBA[0] * oneOver255;
    backEnd.codeConsts[48][1] = ent->materialRGBA[1] * oneOver255;
    backEnd.codeConsts[48][2] = ent->materialRGBA[2] * oneOver255;
    backEnd.codeConsts[48][3] = ent->materialRGBA[3] * oneOver255;
}

// PINNED 10040f30/245: PC does not add the reference's DX7 early return.
void RB_TessParticleCloud(const GfxEntity *ent)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (r_logFile->current.integer)
        RB_LogPrint(va("--- RB_TessParticleCloud( %s ) ---\n", tess.material->info.name));
    GfxDrawPrimArgs args;
    args.u.buf.baseVertex = 0;
    args.u.buf.baseIndex = 0;
    args.firstVertexFromBase = 0;
    args.vertexCount = 4096;
    args.primCount = 2048;
    RB_SetParticleCloudConstants(ent);
    if (dxState.indexBuffer != dx.particleCloudIndexBuffer)
        RB_ChangeIndices(dx.particleCloudIndexBuffer);
    IDirect3DVertexBuffer9 *buffer = dx.particleCloudVertexBuffer;
    if (dxState.streams[0].vb != buffer || dxState.streams[0].offset != 0
        || dxState.streams[0].stride != 20)
        RB_ChangeStreamSource(0, buffer, 0, 20);
    RB_DrawTechnique(2, &args);
}

// PINNED 10041030: entity radius0 and the same signed frame atlas as sprites.
void RB_TessLine(const GfxEntity *ent)
{
    GfxColor rgba;
    rgba.array[2] = ent->materialRGBA[0];
    rgba.array[1] = ent->materialRGBA[1];
    rgba.array[0] = ent->materialRGBA[2];
    rgba.array[3] = ent->materialRGBA[3];
    unsigned int color = rgba.packed;
    float uv[4];
    RB_GetEntityAtlasCoords(ent, uv);
    if (r_rendererInUse->current.integer == 2)
        RB_AddLineDx7(ent->origin, ent->endpos, ent->radius[0], color, uv[0], uv[1], uv[2], uv[3]);
    else
        RB_AddLine(ent->origin, ent->endpos, ent->radius[0], color, uv[0], uv[1], uv[2], uv[3]);
}

// PINNED 100410b0: physical case-block order differs from the entity enum.
void RB_TessEntity(const GfxEntity *ent)
{
    switch (ent->reType)
    {
    case 4: RB_TessSprite(ent); break;
    case 7: RB_TessOrientedQuad(ent); break;
    case 5: RB_TessRailCore(ent); break;
    case 8: RB_TessLine(ent); break;
    case 9:
        if (r_rendererInUse->current.integer == 2)
            RB_TessCylinderDx7(ent);
        else
            RB_TessCylinder(ent);
        break;
    case 6: RB_TessParticleCloud(ent); break;
    }
}

// PINNED 10041130: the surface argument is unused; the live backend entity owns it.
void RB_TessBackEndEntity(const surfaceType_t *surfType)
{
    RB_TessEntity((const GfxEntity *)backEnd.currentEntity);
}

static void RB_TessXModelSkinnedCached(const GfxModelSkinnedSurface *surface)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (r_logFile->current.integer)
        RB_LogPrint(va("--- RB_TessXModelSkinnedCached( %s ) ---\n", tess.material->info.name));
    int stride = r_rendererInUse->current.integer == 2 ? 36 : 64;
    const XSurface *xsurf = RB_GetModelSurfaceXSurface(&surface->surf);
    GfxDrawPrimArgs args;
    args.u.buf.baseIndex = 0;
    args.firstVertexFromBase = 0;
    args.u.buf.baseVertex = surface->skinnedCachedOffset / stride;
    args.primCount = xsurf->triCount;
    args.vertexCount = xsurf->vertCount;
    if (dxState.indexBuffer != XSurfaceGetIndexBuffer(xsurf))
        RB_ChangeIndices(XSurfaceGetIndexBuffer(xsurf));
    IDirect3DVertexBuffer9 *buffer = backEndData->skinnedCacheVb->buffer;
    if (dxState.streams[0].vb != buffer || dxState.streams[0].offset != 0
        || dxState.streams[0].stride != stride)
        RB_ChangeStreamSource(0, buffer, 0, stride);
    RB_DrawTechnique(0, &args);
}

static void RB_TessXModelSkinnedUncached(const GfxModelSkinnedSurface *surface)
{
    if (r_logFile->current.integer)
        RB_LogPrint(va("--- RB_TessXModelSkinnedUncached( %s ) ---\n", tess.material->info.name));
    const XSurface *xsurf = RB_GetModelSurfaceXSurface(&surface->surf);
    int vertCount = xsurf->vertCount;
    int indexCount = xsurf->triCount * 3;
    if (tess.vertexCount + vertCount > 5450 || tess.indexCount + indexCount > 0x100000)
        RB_TessOverflow();
    if (tess.indexCount & 1)
        RB_TessOverflow();
    unsigned int baseVertex = tess.vertexCount;
    int stride = r_rendererInUse->current.integer == 2 ? 36 : 64;
    Com_Memcpy(tess.vertexData + (unsigned short)baseVertex * stride,
        surface->skinnedVert.variant, vertCount * stride);
    tess.vertexCount += vertCount;
    XSurfaceGetTris(xsurf, tess.indices + tess.indexCount, (short)baseVertex);
    tess.indexCount += indexCount;
}

// PINNED 10041390/38: cache eligibility is the signed offset, not renderer type.
void RB_TessXModelSkinned(const surfaceType_t *surfType)
{
    const GfxModelSkinnedSurface *surface = (const GfxModelSkinnedSurface *)surfType;
    if (surface->skinnedCachedOffset >= 0)
        RB_TessXModelSkinnedCached(surface);
    else
        RB_TessXModelSkinnedUncached(surface);
}

// PINNED 100413c0: bind buffers, push the bone matrix, draw and restore.
void RB_TessXModelRigid(const surfaceType_t *surfType)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (r_logFile->current.integer)
        RB_LogPrint(va("--- RB_TessXModelRigid( %s ) ---\n", tess.material->info.name));
    const GfxModelRigidSurface *surface = (const GfxModelRigidSurface *)surfType;
    const XSurface *xsurf = RB_GetModelSurfaceXSurface(&surface->surf);
    GfxDrawPrimArgs args;
    args.vertexCount = xsurf->vertCount;
    args.primCount = xsurf->triCount;
    args.u.buf.baseIndex = 0;
    args.u.buf.baseVertex = 0;
    args.firstVertexFromBase = 0;
    if (dxState.indexBuffer != XSurfaceGetIndexBuffer(xsurf))
        RB_ChangeIndices(XSurfaceGetIndexBuffer(xsurf));
    int stride = r_rendererInUse->current.integer == 2 ? 36 : 64;
    if (dxState.streams[0].vb != xsurf->surfRigid.vb || dxState.streams[0].offset != 0
        || dxState.streams[0].stride != stride)
        RB_ChangeStreamSource(0, xsurf->surfRigid.vb, 0, stride);
    RB_PushMatrixStack();
    RB_SetWorldMatrixFromBoneAxis(surface, backEnd.currentEntity);
    RB_DrawTechnique(0, &args);
    RB_PopMatrixStack();
}

// PINNED 10041510: capture signed triangle count, publish counts before copying.
void RB_TessStaticModelCached(const surfaceType_t *surfType)
{
    const GfxStaticModelCachedSurface *surface = (const GfxStaticModelCachedSurface *)surfType;
    int indexCount = RB_GetModelSurfaceXSurface(&surface->surf)->triCount * 3;
    RB_CheckOptimizedIndexOverflow(indexCount);
    tess.optimizedVertexSource = 2;
    tess.firstOptimizedVertex = 0;
    tess.optimizedVertexCount = 0x10000;
    if (r_logFile->current.integer)
        RB_LogPrint(va("--- RB_TessStaticModelCached( %s ) ---\n", tess.material->info.name));
    unsigned short *out = tess.secondaryIndices + tess.optimizedIndexCount;
    tess.optimizedIndexCount += indexCount;
    const byte *in = (const byte *)dx.smodelCacheIndices + surface->surface->baseVertIndex * 12;
    Com_Memcpy(out, in, indexCount * 2);
}

// PINNED 100415f0: ordinary tess data is retained; optimized indices own these counts.
void RB_TessTriangles(const surfaceType_t *surfType)
{
    const srfTriangles_t *triangles = (const srfTriangles_t *)surfType;
    if (tess.optimizedIndexCount && (tess.firstOptimizedVertex != triangles->firstVertex
        || tess.optimizedVertexCount != triangles->vertexCount))
        RB_TessOverflow();
    RB_CheckOptimizedIndexOverflow(triangles->indexCount);
    tess.optimizedVertexSource = 1;
    Com_Memcpy(tess.secondaryIndices + tess.optimizedIndexCount,
        triangles->indices, triangles->indexCount * 2);
    tess.optimizedIndexCount += triangles->indexCount;
    tess.firstOptimizedVertex = triangles->firstVertex;
    tess.optimizedVertexCount = triangles->vertexCount;
}
