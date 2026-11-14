#include "common_types.h"
#include <universal/com_math.h>
#include "imports.h"

int XSurfaceGetNumVerts(const XSurface *surface);
int XSurfaceGetNumTris(const XSurface *surface);
void XSurfaceGetTris(const XSurface *surface, r_index_t *dstIndices, short offset);
XVertexInfo *XSurfaceGetVertexInfoArray(const XSurface *surf);
int XSurfaceGetBoneOffset(const XSurface *surf);
void XSurfaceTransferDx7(const XVertexBuffer *surfVerts, GfxVertexDx7 *verts, int vertCount);
void XSurfaceTransfer(const XVertexBuffer *surfVerts, GfxVertex *verts, int vertCount);
void XSurfaceGetVerts(const XSurface *surf, DObjSkelMat *boneMatrix, float *pVert, float *pTexCoord, float *pNormal);
int XSurfaceGetNumVerts(const XSurface *surface);
int XSurfaceGetNumTris(const XSurface *surface);
void XSurfaceGetTris(const XSurface *surface, r_index_t *dstIndices, short offset);
XVertexInfo *XSurfaceGetVertexInfoArray(const XSurface *surf);
int XSurfaceGetBoneOffset(const XSurface *surf);
void XSurfaceTransferDx7(const XVertexBuffer *surfVerts, GfxVertexDx7 *verts, int vertCount);
void XSurfaceTransfer(const XVertexBuffer *surfVerts, GfxVertex *verts, int vertCount);
static inline __attribute__((always_inline)) void XSurfaceRotateNormal(const float *normal, const DObjSkelMat *mat, float *out);
static inline __attribute__((always_inline)) void XSurfaceTransformPos(const float *pos, const DObjSkelMat *mat, float *out);
void XSurfaceGetVerts(const XSurface *surf, DObjSkelMat *boneMatrix, float *pVert, float *pTexCoord, float *pNormal);

static inline __attribute__((always_inline)) void XSurfaceTransformPos(const float *pos, const DObjSkelMat *mat, float *out)
{
    out[0] = pos[1] * mat->axis[1][0] + pos[2] * mat->axis[2][0] + pos[0] * mat->axis[0][0] + mat->origin[0];
    out[1] = pos[0] * mat->axis[0][1] + pos[1] * mat->axis[1][1] + pos[2] * mat->axis[2][1] + mat->origin[1];
    out[2] = pos[0] * mat->axis[0][2] + pos[1] * mat->axis[1][2] + pos[2] * mat->axis[2][2] + mat->origin[2];
}

static inline __attribute__((always_inline)) void XSurfaceRotateNormal(const float *normal, const DObjSkelMat *mat, float *out)
{
    out[0] = normal[1] * mat->axis[1][0] + normal[2] * mat->axis[2][0] + normal[0] * mat->axis[0][0];
    out[1] = normal[0] * mat->axis[0][1] + normal[1] * mat->axis[1][1] + normal[2] * mat->axis[2][1];
    out[2] = normal[0] * mat->axis[0][2] + normal[1] * mat->axis[1][2] + normal[2] * mat->axis[2][2];
}

int XSurfaceGetNumVerts(const XSurface *surface)
{
    return surface->vertCount;
}

int XSurfaceGetNumTris(const XSurface *surface)
{
    return surface->triCount;
}

// PC 1.0 takes a 16-bit offset (retail loads the argument word-sized); the Mac 1.3 build declares int.
void XSurfaceGetTris(const XSurface *surface, r_index_t *dstIndices, short offset)
{
    short sOffset = (short)offset;

    if (sOffset != 0) {

        unsigned int twoOffsets = ((unsigned int)(unsigned short)sOffset << 16) | (unsigned short)sOffset;
        unsigned int *dst = (unsigned int *)dstIndices;
        unsigned int *src = (unsigned int *)surface->triIndices;
        int numMoves = surface->triCount >> 1;

        do {
            *dst++ = *src++ + twoOffsets;
            *dst++ = *src++ + twoOffsets;
            *dst++ = *src++ + twoOffsets;
        } while (--numMoves);
    } else {
        memcpy(dstIndices, surface->triIndices, surface->triCount * 6);
    }
}

XVertexInfo *XSurfaceGetVertexInfoArray(const XSurface *surf)
{
    return (XVertexInfo *)surf->verts;
}

int XSurfaceGetBoneOffset(const XSurface *surf)
{
    return surf->boneOffset;
}

void XSurfaceGetVerts(const XSurface *surf, DObjSkelMat *boneMatrix, float *pVert, float *pTexCoord, float *pNormal)
{
    const XVertexInfo *vert;
    const XBlendInfo *blend;
    const DObjSkelMat *mat;
    int boneOffset;
    int vertCount;
    int numWeights;
    float scale;

    boneOffset = surf->boneOffset;
    vert = (const XVertexInfo *)surf->verts;
    if (boneOffset != -1)
    {
        mat = (const DObjSkelMat *)((const char *)boneMatrix + boneOffset);
        for (vertCount = surf->vertCount; vertCount; vertCount--)
        {
            if (pNormal)
            {
                XSurfaceRotateNormal(vert->normal, mat, pNormal);
                pNormal += 3;
            }
            if (pTexCoord)
            {
                pTexCoord[0] = vert->texCoordX;
                pTexCoord[1] = vert->texCoordY;
                pTexCoord += 2;
            }
            XSurfaceTransformPos(vert->offset, mat, pVert);
            vert++;
            pVert += 3;
        }
    }
    else
    {
        for (vertCount = surf->vertCount; vertCount; --vertCount)
        {
            if (pNormal)
            {
                XSurfaceRotateNormal(vert->normal, (const DObjSkelMat *)((const char *)boneMatrix + vert->boneOffset), pNormal);
                pNormal += 3;
            }
            XSurfaceTransformPos(vert->offset, (const DObjSkelMat *)((const char *)boneMatrix + vert->boneOffset), pVert);
            numWeights = vert->numWeights;
            if (numWeights)
            {
                scale = vert->boneWeight * (1.0f / 256.0f);
                pVert[0] = scale * pVert[0];
                pVert[1] = scale * pVert[1];
                pVert[2] = scale * pVert[2];
                blend = (const XBlendInfo *)(vert + 1);
                do
                {
                    mat = (const DObjSkelMat *)((const char *)boneMatrix + blend->boneOffset);
                    scale = blend->boneWeight * (1.0f / 65536.0f);
                    pVert[0] += (blend->offset[1] * mat->axis[1][0] + blend->offset[2] * mat->axis[2][0] + blend->offset[0] * mat->axis[0][0] + mat->origin[0]) * scale;
                    pVert[1] += (blend->offset[0] * mat->axis[0][1] + blend->offset[1] * mat->axis[1][1] + blend->offset[2] * mat->axis[2][1] + mat->origin[1]) * scale;
                    pVert[2] += (blend->offset[0] * mat->axis[0][2] + blend->offset[1] * mat->axis[1][2] + blend->offset[2] * mat->axis[2][2] + mat->origin[2]) * scale;
                    blend++;
                } while (--numWeights);
                vert = (const XVertexInfo *)blend;
            }
            else
            {
                vert++;
            }
            pVert += 3;
        }
    }
}

void XSurfaceTransfer(const XVertexBuffer *surfVerts, GfxVertex *verts, int vertCount)
{
    int vertIndex;
    const XVertexInfo *v = (const XVertexInfo *)surfVerts;

    if (vertCount <= 0)
        return;

    for (vertIndex = 0; vertIndex < vertCount; vertIndex++) {
        const XVertexInfo *vi = v;

        VectorCopy(vi->offset, verts[vertIndex].xyzw);

        verts[vertIndex].xyzw[3] = 1.0f;

        VectorCopy(vi->normal, verts[vertIndex].normal);

        verts[vertIndex].color = *(const GfxColor *)vi->color;

        verts[vertIndex].texCoord[0] = vi->texCoordX;
        verts[vertIndex].texCoord[1] = vi->texCoordY;

        VectorCopy(vi->binormal, verts[vertIndex].binormal);

        VectorCopy(vi->tangent, verts[vertIndex].tangent);

        ++v;
    }
}

void XSurfaceTransferDx7(const XVertexBuffer *surfVerts, GfxVertexDx7 *verts, int vertCount)
{
    int vertIndex;
    const XVertexInfo *vi = (const XVertexInfo *)surfVerts;

    for (vertIndex = 0; vertIndex < vertCount; vertIndex++) {

        VectorCopy(vi->offset, verts[vertIndex].xyz);

        VectorCopy(vi->normal, verts[vertIndex].normal);

        verts[vertIndex].color = *(const GfxColor *)vi->color;

        verts[vertIndex].texCoord[0] = vi->texCoordX;
        verts[vertIndex].texCoord[1] = vi->texCoordY;
        ++vi;
    }
}
