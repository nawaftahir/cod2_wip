// PINNED PC rigid vertex transforms, 1001e260/1001e3a0/1001ed70/1001ee00.
// The decompile's float-array __m128 is not the compiler's SIMD type.
#define __m128 CoD2DecompileVector4
#include "gfx.h"
#undef __m128
#include <xmmintrin.h>

typedef char rigid_vertex_layout[(sizeof(XVertexInfo) == 64
    && sizeof(GfxVertex) == 64 && sizeof(GfxVertexDx7) == 36
    && offsetof(XSurface, verts) == 12 && offsetof(XSurface, vertCount) == 2) ? 1 : -1];
typedef char skinning_layout[(sizeof(XBlendInfo) == 16 && offsetof(XBlendInfo, boneOffset) == 12
    && offsetof(XBlendInfo, boneWeight) == 14 && sizeof(GfxModelSkinnedSurface) == 16
    && offsetof(GfxModelSkinnedSurface, skinnedCachedOffset) == 8
    && offsetof(GfxModelSkinnedSurface, skinnedVert) == 12
    && offsetof(SkinRigidXModelCmd, mat) == 12 && sizeof(DObjSkelMat) == 64
    && offsetof(GfxEntity, axis) == 20 && offsetof(GfxEntity, scale) == 56
    && offsetof(GfxEntity, origin) == 60) ? 1 : -1];

// Helper names, formal argument order and TU grouping are provisional.
void R_TransformSkelVector(const DObjSkelMat *bone, const float *in, float *out);
void R_TransformSkelPosition(const DObjSkelMat *bone, const float *in, float *out);
static void R_TransformRigidVertex(const DObjSkelMat *bone, const float *normal,
    const float *binormal, const float *position, const float *tangent, GfxVertex *out)
{
    R_TransformSkelVector(bone, normal, out->normal);
    R_TransformSkelVector(bone, binormal, out->binormal);
    R_TransformSkelVector(bone, tangent, out->tangent);
    R_TransformSkelPosition(bone, position, out->xyzw);
    out->xyzw[3] = 1.0f;
}

static void R_TransformRigidVertexDx7(const DObjSkelMat *bone, const float *position,
    const float *normal, GfxVertexDx7 *out)
{
    R_TransformSkelVector(bone, normal, out->normal);
    R_TransformSkelPosition(bone, position, out->xyz);
}

void R_SkinXSurfaceRigid(const XSurface *surface, const DObjSkelMat *bones,
    int boneOffset, GfxVertex *out)
{
    const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + boneOffset);
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        __declspec(align(16)) GfxVertex vertex;
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        R_TransformRigidVertex(bone, in->normal, in->binormal, in->offset, in->tangent, &vertex);
        ++in;
        --remaining;
        memcpy(out, &vertex, sizeof(vertex));
        ++out;
    }
}

void R_SkinXSurfaceRigidDx7(const XSurface *surface, const DObjSkelMat *bones,
    int boneOffset, GfxVertexDx7 *out)
{
    const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + boneOffset);
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        GfxVertexDx7 vertex;
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        R_TransformRigidVertexDx7(bone, in->offset, in->normal, &vertex);
        ++in;
        --remaining;
        memcpy(out, &vertex, sizeof(vertex));
        ++out;
    }
}

// PINNED 1001e920/344 and 1001ec20/330: only position is blended.
static __forceinline void R_BlendSkinPosition(const float *in,
    const DObjSkelMat *bone, float weight, float *out)
{
    out[0] += (bone->axis[2][0] * in[2] + bone->axis[1][0] * in[1]
        + in[0] * bone->axis[0][0] + bone->origin[0]) * weight;
    out[1] += (bone->axis[2][1] * in[2] + bone->axis[1][1] * in[1]
        + bone->axis[0][1] * in[0] + bone->origin[1]) * weight;
    out[2] += (bone->axis[2][2] * in[2] + bone->axis[1][2] * in[1]
        + bone->axis[0][2] * in[0] + bone->origin[2]) * weight;
}

static void R_SkinXSurfaceBlended(const XSurface *surface, const DObjSkelMat *bones, GfxVertex *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        __declspec(align(16)) GfxVertex vertex;
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        R_TransformRigidVertex(bone, in->normal, in->binormal, in->offset, in->tangent, &vertex);
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        unsigned int weights = in->numWeights;
        if (weights)
        {
            float weight = (float)in->boneWeight * (1.0f / 256.0f);
            vertex.xyzw[0] *= weight;
            vertex.xyzw[1] *= weight;
            vertex.xyzw[2] *= weight;
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                weight = (float)blend->boneWeight * (1.0f / 65536.0f);
                R_BlendSkinPosition(blend->offset, bone, weight, vertex.xyzw);
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        --remaining;
        memcpy(out++, &vertex, sizeof(vertex));
    }
}

static void R_SkinXSurfaceBlendedDx7(const XSurface *surface, const DObjSkelMat *bones, GfxVertexDx7 *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        GfxVertexDx7 vertex;
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        R_TransformRigidVertexDx7(bone, in->offset, in->normal, &vertex);
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        unsigned int weights = in->numWeights;
        if (weights)
        {
            float weight = (float)in->boneWeight * (1.0f / 256.0f);
            vertex.xyz[0] *= weight;
            vertex.xyz[1] *= weight;
            vertex.xyz[2] *= weight;
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                weight = (float)blend->boneWeight * (1.0f / 65536.0f);
                R_BlendSkinPosition(blend->offset, bone, weight, vertex.xyz);
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        --remaining;
        memcpy(out++, &vertex, sizeof(vertex));
    }
}

static __forceinline __m128 R_SkinVectorSse(const __m128 &in, const DObjSkelMat *bone)
{
    return _mm_add_ps(_mm_add_ps(_mm_mul_ps(_mm_load_ps(bone->axis[0]), _mm_shuffle_ps(in, in, 0)),
        _mm_mul_ps(_mm_load_ps(bone->axis[1]), _mm_shuffle_ps(in, in, 0x55))),
        _mm_mul_ps(_mm_load_ps(bone->axis[2]), _mm_shuffle_ps(in, in, 0xaa)));
}

static __forceinline __m128 R_SkinPositionSse(const __m128 &in, const DObjSkelMat *bone)
{
    return _mm_add_ps(_mm_add_ps(_mm_mul_ps(_mm_load_ps(bone->axis[0]), _mm_shuffle_ps(in, in, 0)),
        _mm_mul_ps(_mm_load_ps(bone->axis[1]), _mm_shuffle_ps(in, in, 0x55))),
        _mm_add_ps(_mm_mul_ps(_mm_load_ps(bone->axis[2]), _mm_shuffle_ps(in, in, 0xaa)),
            _mm_load_ps(bone->origin)));
}

// PINNED 1001e6e0/567: aligned loads, position weights and four streaming stores.
static void R_SkinXSurfaceBlendedSse(const XSurface *surface, const DObjSkelMat *bones, GfxVertex *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    _mm_empty();
    while (remaining > 0)
    {
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        __m128 normalIn = _mm_load_ps(in->normal);
        __m128 binormalIn = _mm_load_ps(in->binormal);
        __m128 tangentIn = _mm_load_ps(in->tangent);
        __m128 position = R_SkinPositionSse(_mm_load_ps(in->offset), bone);
        __m128 normal = R_SkinVectorSse(normalIn, bone);
        _mm_prefetch((const char *)in + 128, _MM_HINT_NTA);
        __m128 binormal = R_SkinVectorSse(binormalIn, bone);
        __m128 tangent = R_SkinVectorSse(tangentIn, bone);
        __m128 coords = _mm_unpackhi_ps(binormalIn, tangentIn);
        unsigned int weights = in->numWeights;
        if (weights)
        {
            position = _mm_mul_ps(position, _mm_set1_ps((float)in->boneWeight * (1.0f / 256.0f)));
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                __m128 transformed = R_SkinPositionSse(_mm_load_ps(blend->offset), bone);
                __m128 weight = _mm_set1_ps((float)blend->boneWeight * (1.0f / 65536.0f));
                position = _mm_add_ps(position, _mm_mul_ps(weight, transformed));
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        _mm_stream_ps(out->xyzw, position);
        __m128 normalColor = _mm_shuffle_ps(normal, normalIn, 0xfa);
        normalColor = _mm_shuffle_ps(normal, normalColor, 0xd4);
        _mm_stream_ps(out->normal, normalColor);
        _mm_stream_ps(out->texCoord, _mm_shuffle_ps(coords, binormal, 0x4e));
        __m128 tail = _mm_shuffle_ps(binormal, tangent, 0x22);
        _mm_stream_ps(&out->binormal[2], _mm_shuffle_ps(tail, tangent, 0x9c));
        ++out;
        --remaining;
    }
}

// PINNED 1001ea80/408: the DX7 output is a 36-byte copy, not a streaming store.
static void R_SkinXSurfaceBlendedDx7Sse(const XSurface *surface, const DObjSkelMat *bones, GfxVertexDx7 *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        __m128 position = R_SkinPositionSse(_mm_load_ps(in->offset), bone);
        __m128 normal = R_SkinVectorSse(_mm_load_ps(in->normal), bone);
        const XVertexInfo *original = in;
        unsigned int weights = in->numWeights;
        if (weights)
        {
            position = _mm_mul_ps(position, _mm_set1_ps((float)in->boneWeight * (1.0f / 256.0f)));
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                __m128 transformed = R_SkinPositionSse(_mm_load_ps(blend->offset), bone);
                __m128 weight = _mm_set1_ps((float)blend->boneWeight * (1.0f / 65536.0f));
                position = _mm_add_ps(position, _mm_mul_ps(weight, transformed));
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        __declspec(align(16)) GfxVertexDx7 vertex;
        _mm_store_ps(vertex.xyz, position);
        _mm_storeu_ps(vertex.normal, normal);
        vertex.color = *(const GfxColor *)original->color;
        vertex.texCoord[0] = original->texCoordX;
        vertex.texCoord[1] = original->texCoordY;
        memcpy(out++, &vertex, sizeof(vertex));
        --remaining;
    }
}

extern const dvar_t *sys_SSE;
extern const dvar_t *r_sse_skinning;
extern DxGlobals dx;

// PINNED 1001f030/195: cached byte offsets and per-surface rigid/blended routing.
static __declspec(noinline) void R_SkinXSurfaceSkinned(GfxModelSkinnedSurface *modelSurface, const DObjSkelMat *bones)
{
    void *out;
    if (modelSurface->skinnedCachedOffset >= 0)
        out = dx.skinnedCacheLockAddr + modelSurface->skinnedCachedOffset;
    else
        out = modelSurface->skinnedVert.variant;
    const XSurface *surface = modelSurface->surf.xsurf;
    int boneOffset = surface->boneOffset;
    if (r_rendererInUse->current.integer == 2)
    {
        if (boneOffset == -1)
        {
            if (sys_SSE->current.enabled && r_sse_skinning->current.enabled)
                R_SkinXSurfaceBlendedDx7Sse(surface, bones, (GfxVertexDx7 *)out);
            else
                R_SkinXSurfaceBlendedDx7(surface, bones, (GfxVertexDx7 *)out);
        }
        else
            R_SkinXSurfaceRigidDx7(surface, bones, boneOffset, (GfxVertexDx7 *)out);
    }
    else
    {
        if (boneOffset == -1)
        {
            if (sys_SSE->current.enabled && r_sse_skinning->current.enabled)
                R_SkinXSurfaceBlendedSse(surface, bones, (GfxVertex *)out);
            else
                R_SkinXSurfaceBlended(surface, bones, (GfxVertex *)out);
        }
        else
            R_SkinXSurfaceRigid(surface, bones, boneOffset, (GfxVertex *)out);
    }
}

void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in, DObjSkelMat *out);
void R_GetRigidTransform(const DObjSkelMat *bone, const float *origin, const vec3_t *axis, float scale, vec3_t *out);

// PINNED 1001f480/65; the helper name is descriptive.
byte *R_SkinXModelSurface(const DObjSkelMat *bone, const GfxEntity *entity, byte *cursor)
{
    GfxModelSurface *surface = (GfxModelSurface *)cursor;
    if (surface->surfType != 5)
    {
        if (surface->surfType == 4)
        {
            GfxModelRigidSurface *rigid = (GfxModelRigidSurface *)cursor;
            R_GetRigidTransform((const DObjSkelMat *)((const byte *)bone + surface->xsurf->boneOffset),
                entity->origin, entity->axis, entity->scale, rigid->boneAxis);
            return cursor + 56;
        }
        R_SkinXSurfaceSkinned((GfxModelSkinnedSurface *)cursor, bone);
    }
    return cursor + 16;
}

// PINNED 1001f520/135: one aligned pose, then variable-size surface records.
void R_SkinRigidXModelCmd(SkinRigidXModelCmd *cmd)
{
    byte boneStorage[sizeof(DObjSkelMat) + 16];
    DObjSkelMat *bone = (DObjSkelMat *)(((size_t)boneStorage + 15) & ~(size_t)15);
    R_ConvertAnimMatToSkelMat(&cmd->mat, bone);
    byte *cursor = (byte *)cmd->surfs;
    for (int index = 0; index < cmd->surfCount; ++index)
        cursor = R_SkinXModelSurface(bone, cmd->e, cursor);
}

typedef char skin_command_layout[(sizeof(SkinBuffers) == 40960
    && offsetof(SkinXModelCmd, mat) == 8 && offsetof(SkinXModelCmd, surfacePartBits) == 12
    && offsetof(SkinXModelCmd, surfCount) == 28 && offsetof(SkinXModelCmd, boneCount) == 29
    && offsetof(SkinXModelCmd, matOffset) == 30) ? 1 : -1];

// SUPPORTED single context from the reference; the PC command runner uses context zero.
SkinBuffers g_skinBuffers[1];

// PINNED 1001f5b0/84: convert only the bones selected by the surface bitset.
static __declspec(noinline) void R_ConvertSurfaceBones(const SkinXModelCmd *cmd, DObjSkelMat *out)
{
    int count = cmd->boneCount;
    const DObjAnimMat *in = cmd->mat;
    for (int index = 0; index < count; ++index, ++in, ++out)
    {
        if (cmd->surfacePartBits[index >> 5] & (1u << (index & 31)))
            R_ConvertAnimMatToSkelMat(in, out);
    }
}

// PINNED 1001f610/152: offsets select a skeleton base before per-surface routing.
void R_SkinXModelCmd(SkinXModelCmd *cmd, int context)
{
    DObjSkelMat *bones = g_skinBuffers[context].matArrayBuf;
    R_ConvertSurfaceBones(cmd, bones);
    byte *cursor = (byte *)cmd->surfs;
    for (int index = 0; index < cmd->surfCount; ++index)
    {
        DObjSkelMat *bone = bones + cmd->matOffset[index];
        GfxModelSurface *surface = (GfxModelSurface *)cursor;
        GfxEntity *entity = cmd->e;
        if (surface->surfType == 3)
        {
            R_SkinXSurfaceSkinned((GfxModelSkinnedSurface *)cursor, bone);
            cursor += 16;
        }
        else if (surface->surfType == 5)
            cursor += 16;
        else
        {
            GfxModelRigidSurface *rigid = (GfxModelRigidSurface *)cursor;
            R_GetRigidTransform((const DObjSkelMat *)((const byte *)bone + surface->xsurf->boneOffset),
                entity->origin, entity->axis, entity->scale, rigid->boneAxis);
            cursor += 56;
        }
    }
}
