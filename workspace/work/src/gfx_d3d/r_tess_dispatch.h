// PINNED retail surface dispatch, including the raw-geometry null slot.
#pragma once
#ifndef GFX_OC_TYPES
enum surfaceType_t
{
    SF_BAD, SF_POLY, SF_ENTITY, SF_XMODEL_SKINNED, SF_XMODEL_RIGID,
    SF_STATICMODEL_CACHED, SF_TRIANGLES, SF_RAW_GEOMETRY,
    SF_NUM_SURFACE_TYPES, SF_MAX = 0xffffffff
};
#endif
void RB_TessBad(const surfaceType_t *);
void RB_TessPoly(const surfaceType_t *);
void RB_TessBackEndEntity(const surfaceType_t *);
void RB_TessXModelSkinned(const surfaceType_t *);
void RB_TessXModelRigid(const surfaceType_t *);
void RB_TessStaticModelCached(const surfaceType_t *);
void RB_TessTriangles(const surfaceType_t *);
typedef void (*GfxTessSurfaceFunction)(const surfaceType_t *);
extern GfxTessSurfaceFunction const rb_tessTable[SF_NUM_SURFACE_TYPES];
