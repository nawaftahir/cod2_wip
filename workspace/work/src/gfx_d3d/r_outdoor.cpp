// Outdoor lookup state and world-to-texture mapping.
#include "gfx.h"
#include <stddef.h>
void MatrixIdentity44(float matrix[4][4]);
void ExpandBounds(const vec3_t addedMins, const vec3_t addedMaxs, vec3_t mins, vec3_t maxs);
void Image_Setup(GfxImage *image, int width, int height, int depth, int flags, DWORD usage, D3DFORMAT format);
void Image_UploadData(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES face, unsigned int mip, const byte *pixels);

// PINNED 101da980..101da9bf; names are descriptive, not PC debug provenance.
static OutdoorGlob outdoorGlob;
static const int outdoorMapSize[3] = { 512, 512, 256 };
typedef char OutdoorLayout[
    sizeof(OutdoorGlob) == 64 && sizeof(trace_t) == 36 &&
    offsetof(OutdoorGlob, scale) == 24 && offsetof(OutdoorGlob, invScale) == 36 &&
    offsetof(OutdoorGlob, add) == 48 && offsetof(OutdoorGlob, pic) == 60 &&
    offsetof(GfxWorld, surfaceCount) == 0x10 && offsetof(GfxWorld, surfaces) == 0x14 &&
    offsetof(GfxWorld, outdoorLookupMatrix) == 0x1c0 ? 1 : -1];

// PINNED 10020590/175: trace from above the world to below it.
float R_OutdoorTraceHeight(float x, float y)
{
    float startZ = outdoorGlob.bbox[1][2] + 1.0f;
    float endZ = outdoorGlob.bbox[0][2] - 1.0f;
    vec3_t start = { x, y, startZ };
    vec3_t end = { x, y, endZ };
    trace_t trace;
    memset(&trace, 0, sizeof(trace));
    trace.fraction = 1.0f;
    ri.CM_BoxTrace(&trace, start, end, vec3_origin, vec3_origin, 0, 0x2001);
    return (endZ - startZ) * trace.fraction + startZ;
}

struct OutdoorSurfaceBounds
{
    surfaceType_t type;
    vec3_t mins;
    vec3_t maxs;
};

// PINNED 10020640/329: material flag8 excludes a surface from outdoor bounds.
void R_ComputeOutdoorBounds(const GfxWorld *world)
{
    ClearBounds(outdoorGlob.bbox[0], outdoorGlob.bbox[1]);
    for (unsigned int index = 0; index != (unsigned int)world->surfaceCount; ++index)
    {
        const GfxSurface *surface = &world->surfaces[index];
        if (surface->material->info.gameFlags & 8)
            continue;
        const OutdoorSurfaceBounds *bounds = (const OutdoorSurfaceBounds *)surface->data;
        ExpandBounds(bounds->mins, bounds->maxs, outdoorGlob.bbox[0], outdoorGlob.bbox[1]);
    }
    for (int axis = 0; axis != 3; ++axis)
    {
        if (outdoorGlob.bbox[0][axis] == 131072.0f)
        {
            outdoorGlob.bbox[0][axis] = 0.0f;
            outdoorGlob.bbox[1][axis] = 0.0f;
        }
        if (outdoorGlob.bbox[1][axis] - outdoorGlob.bbox[0][axis] < 1.0f)
        {
            outdoorGlob.bbox[0][axis] -= 0.5f;
            outdoorGlob.bbox[1][axis] += 0.5f;
        }
    }
}

// PINNED 10020790/82: the depth map has256 levels, not512.
void R_ComputeOutdoorScale()
{
    for (int axis = 0; axis != 3; ++axis)
    {
        outdoorGlob.scale[axis] = (float)(outdoorMapSize[axis] - 1)
            / (outdoorGlob.bbox[1][axis] - outdoorGlob.bbox[0][axis]);
        outdoorGlob.invScale[axis] = 1.0f / outdoorGlob.scale[axis];
        outdoorGlob.add[axis] = -(outdoorGlob.scale[axis] * outdoorGlob.bbox[0][axis]);
    }
}

// PINNED 100207f0/150: renderer matrix storage is row-major.
void R_ComputeOutdoorLookupMatrix(GfxWorld *world)
{
    vec3_t scale;
    vec3_t translate;
    for (int axis = 0; axis != 3; ++axis)
    {
        float inverseRange = 1.0f / (outdoorGlob.bbox[1][axis] - outdoorGlob.bbox[0][axis]);
        scale[axis] = inverseRange;
        translate[axis] = -(inverseRange * outdoorGlob.bbox[0][axis]);
    }
    MatrixIdentity44(world->outdoorLookupMatrix);
    world->outdoorLookupMatrix[0][0] = scale[0];
    world->outdoorLookupMatrix[1][1] = scale[1];
    world->outdoorLookupMatrix[2][2] = scale[2];
    world->outdoorLookupMatrix[3][0] = translate[0];
    world->outdoorLookupMatrix[3][1] = translate[1];
    world->outdoorLookupMatrix[3][2] = translate[2];
}

// PINNED 10020890/25: coordinates refer to texel centers.
float R_OutdoorTexelToWorld(int axis, int texel)
{
    return ((float)texel + 0.5f - outdoorGlob.add[axis]) * outdoorGlob.invScale[axis];
}

// Name unconfirmed; PINNED 100208b0/77, no retail callers.
int R_OutdoorWorldToTexel(int axis, float world)
{
    int texel = I_fround(world * outdoorGlob.scale[axis] + outdoorGlob.add[axis] - 0.5f);
    int maxTexel = outdoorMapSize[axis] - 1;
    if (texel < 0)
        return 0;
    if (texel > maxTexel)
        return maxTexel;
    return texel;
}

// Name unconfirmed; PINNED 10020900/78.
inline void R_OutdoorEncodeHeight(float height, byte *out)
{
    int value = I_fround(outdoorGlob.scale[2] * height + outdoorGlob.add[2] - 0.5f);
    if (value < 0)
        value = 0;
    else if (value > 255)
        value = 255;
    *out = (byte)value;
}

// PINNED 10020950/201: map traces to clamped depth bytes; instruction tuning remains deferred.
void R_GenerateOutdoorLookup()
{
    byte *pixel = outdoorGlob.pic;
    for (int row = 0; row < 512; ++row)
    {
        float y = R_OutdoorTexelToWorld(1, row);
        for (int column = 0; column < 512; ++column)
        {
            float x = R_OutdoorTexelToWorld(0, column);
            float height = R_OutdoorTraceHeight(x, y);
            R_OutdoorEncodeHeight(height, pixel);
            ++pixel;
        }
    }
}

GfxImage *Image_Register(const char *name, int semantic, int imageTrack);

// PINNED 10020a20: DX7 has no outdoor image.
void R_RegisterOutdoorImage(GfxWorld *world)
{
    if (r_rendererInUse->current.integer == 2)
    {
        world->outdoorImage = NULL;
        return;
    }
    R_ComputeOutdoorBounds(world);
    R_ComputeOutdoorScale();
    R_ComputeOutdoorLookupMatrix(world);
    world->outdoorImage = Image_Register("$outdoor", 1, 0);
}

// PINNED 10020a70/136: the saved upload pointer and the pointer freed later differ in ownership.
void R_CreateOutdoorImage(GfxImage *image)
{
    outdoorGlob.pic = (byte *)ri.Hunk_AllocateTempMemoryInternal(262144);
    R_GenerateOutdoorLookup();
    byte *pixels = outdoorGlob.pic;
    Image_Setup(image, 512, 512, 1, 3, 0, D3DFMT_L8);
    Image_UploadData(image, D3DFMT_L8, D3DCUBEMAP_FACE_POSITIVE_X, 0, pixels);
    ri.Hunk_FreeTempMemory(outdoorGlob.pic);
}

extern const dvar_t *r_zFeather;

// Name unconfirmed; PINNED 10020b20/24, no retail callers.
bool R_IsZFeatherActive()
{
    return r_rendererInUse->current.integer != 2 && r_zFeather->current.enabled;
}
