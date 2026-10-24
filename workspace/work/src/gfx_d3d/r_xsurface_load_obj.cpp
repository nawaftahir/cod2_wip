// XModel surface loading from the xmodelsurfs file stream.
#include "gfx.h"

template<typename T>
T Buf_Read(const byte **pos)
{
    union
    {
        T value;
        byte bytes[sizeof(T)];
    } u;

    memcpy(u.bytes, *pos, sizeof(T));
    *pos += sizeof(T);
    return u.value;
}

// Retail keeps an out-of-line copy of this helper at 0x1002d420 as well as the inlined uses.
static void XModelReadBlendInfo(const byte **pos, XBlendInfo *blend, int *partBits)
{
    int boneOffset;

    boneOffset = Buf_Read<short>(pos);
    partBits[boneOffset >> 5] |= 1 << (boneOffset & 31);
    blend->boneOffset = boneOffset << 6;
    blend->offset[0] = Buf_Read<float>(pos);
    blend->offset[1] = Buf_Read<float>(pos);
    blend->offset[2] = Buf_Read<float>(pos);
    blend->boneWeight = Buf_Read<unsigned short>(pos);
}

XSurface *XModelReadSurface(XModel *model, int *partBits, const byte **pos, Alloc_t Alloc)
{
    XSurface *surface;
    XVertexInfo *vert;
    byte *vertPtr;
    XBlendInfo *blend;
    unsigned short *triIndices;
    int boneOffset;
    short blendCount;
    int vertBoneOffset;
    short triCount;
    byte numWeights;
    int size;
    int vertIndex;
    int weightIndex;
    int triIndex;
    int paddedTriCount;

    surface = (XSurface *)Alloc(sizeof(XSurface));
    model->memUsage += sizeof(XSurface);
    surface->tileMode = **pos;
    *pos += 1;
    surface->vertCount = Buf_Read<short>(pos);
    surface->triCount = Buf_Read<short>(pos);
    boneOffset = Buf_Read<short>(pos);
    if (boneOffset == -1)
    {
        blendCount = Buf_Read<short>(pos);
        surface->boneOffset = -1;
        size = (blendCount + surface->vertCount * 4) * sizeof(XBlendInfo);
        vertPtr = (byte *)Alloc(size);
        model->memUsage += size;
    }
    else
    {
        surface->boneOffset = boneOffset << 6;
        partBits[boneOffset >> 5] |= 1 << (boneOffset & 31);
        size = surface->vertCount * sizeof(XVertexInfo);
        vertPtr = (byte *)Alloc(size);
        model->memUsage += size;
    }
    surface->verts = (XVertexBuffer *)vertPtr;

    for (vertIndex = 0; vertIndex < surface->vertCount; vertIndex++)
    {
        vert = (XVertexInfo *)vertPtr;
        vert->normal[0] = Buf_Read<float>(pos);
        vert->normal[1] = Buf_Read<float>(pos);
        vert->normal[2] = Buf_Read<float>(pos);
        vert->color[0] = (*pos)[0];
        vert->color[1] = (*pos)[1];
        vert->color[2] = (*pos)[2];
        vert->color[3] = (*pos)[3];
        *pos += 4;
        vert->texCoordX = Buf_Read<float>(pos);
        vert->texCoordY = Buf_Read<float>(pos);
        vert->binormal[0] = Buf_Read<float>(pos);
        vert->binormal[1] = Buf_Read<float>(pos);
        vert->binormal[2] = Buf_Read<float>(pos);
        vert->tangent[0] = Buf_Read<float>(pos);
        vert->tangent[1] = Buf_Read<float>(pos);
        vert->tangent[2] = Buf_Read<float>(pos);
        if (boneOffset == -1)
        {
            numWeights = Buf_Read<byte>(pos);
            vert->numWeights = numWeights;
            vertBoneOffset = Buf_Read<short>(pos);
            partBits[vertBoneOffset >> 5] |= 1 << (vertBoneOffset & 31);
            vert->boneOffset = vertBoneOffset << 6;
            vert->offset[0] = Buf_Read<float>(pos);
            vert->offset[1] = Buf_Read<float>(pos);
            vert->offset[2] = Buf_Read<float>(pos);
            if (numWeights)
            {
                vert->boneWeight = **pos;
                *pos += 1;
                vertPtr += sizeof(XVertexInfo);
                for (weightIndex = 0; weightIndex < numWeights; weightIndex++)
                {
                    vertPtr += sizeof(XBlendInfo);
                    XModelReadBlendInfo(pos, (XBlendInfo *)vertPtr - 1, partBits);
                }
                continue;
            }
        }
        else
        {
            vert->offset[0] = Buf_Read<float>(pos);
            vert->offset[1] = Buf_Read<float>(pos);
            vert->offset[2] = Buf_Read<float>(pos);
        }
        vertPtr += sizeof(XVertexInfo);
    }

    // Odd triangle counts get a degenerate pad triangle.
    triCount = surface->triCount;
    paddedTriCount = (triCount + 1) & ~1;
    surface->triIndices = (int (*)[4])Alloc((triCount * 3 + 3) * sizeof(unsigned short));
    for (triIndex = 0; triIndex < surface->triCount * 3; triIndex++)
    {
        ((unsigned short *)surface->triIndices)[triIndex] = Buf_Read<unsigned short>(pos);
    }
    if (paddedTriCount != surface->triCount)
    {
        ((unsigned short *)surface->triIndices)[triIndex] = ((unsigned short *)surface->triIndices)[triIndex - 1];
        ((unsigned short *)surface->triIndices)[triIndex + 1] = ((unsigned short *)surface->triIndices)[triIndex - 1];
        ((unsigned short *)surface->triIndices)[triIndex + 2] = ((unsigned short *)surface->triIndices)[triIndex - 1];
        surface->triCount++;
    }
    return surface;
}

extern int alwaysfails;
typedef unsigned long(__stdcall *D3DReleaseFn)(void *obj);
#define D3D_VTABLE(obj) (*(void ***)((void *)(obj)))

void R_FreeStaticIndexBuffer(IDirect3DIndexBuffer9 *ib);

// Out-of-line copies of both helpers exist in retail (0x1002db50, 0x1002dc40), so they are not static.
void XSurfaceFreeVertexBuffer(XSurface *surf)
{
    if (surf->surfRigid.vb)
    {
        int again;
        do
        {
            ((D3DReleaseFn)D3D_VTABLE(surf->surfRigid.vb)[0x08 / 4])((void *)surf->surfRigid.vb);
            again = alwaysfails;
            surf->surfRigid.vb = NULL;
        } while (again != 0);
    }
}

void XSurfaceFreeBuffers(XSurface *surf)
{
    if (surf->indexBuffer)
    {
        R_FreeStaticIndexBuffer(surf->indexBuffer);
        surf->indexBuffer = 0;
    }
    XSurfaceFreeVertexBuffer(surf);
}

void XModelUnoptimize(XModel *model)
{
    int lodCount;
    int lodIndex;
    int surfCount;
    int surfIndex;
    XSurface **surfaces;
    int *partBits;

    lodCount = ri.XModelGetNumLods(model);
    for (lodIndex = 0; lodIndex < lodCount; lodIndex++)
    {
        surfCount = ri.XModelGetSurfaces(model, &surfaces, lodIndex, &partBits);
        for (surfIndex = 0; surfIndex < surfCount; surfIndex++)
        {
            XSurfaceFreeBuffers(surfaces[surfIndex]);
        }
    }
}
