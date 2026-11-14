// Renderer-side copies of the engine print and error entry points.
#include "../gfx_d3d/r_local.h"
#include <stdio.h>
#include <stdarg.h>

void R_Error(errorParm_t code, const char *fmt, ...);

void Com_Printf(const char *fmt, ...)
{
    char msg[4096];
    va_list ap;

    va_start(ap, fmt);
    _vsnprintf(msg, sizeof(msg), fmt, ap);
    va_end(ap);
    msg[sizeof(msg) - 1] = 0;
    ri.Printf(0, "%s", msg);
}

void Com_Error(errorParm_t code, const char *fmt, ...)
{
    char msg[4096];
    va_list ap;

    va_start(ap, fmt);
    _vsnprintf(msg, sizeof(msg), fmt, ap);
    va_end(ap);
    msg[sizeof(msg) - 1] = 0;
    R_Error(code, "%s", msg);
}

/* Uncalled renderer-side forwards to the engine import table, in retail order
   (PINNED 10061d20..1006221a). Names follow the refimport_t slot they forward to. */
int FS_FOpenFileRead(const char *filename, fileHandle_t *file, int uniqueFILE)
{
    return ri.FS_FOpenFileRead(filename, file, uniqueFILE);
}

int FS_Read(void *buffer, int len, fileHandle_t h)
{
    return ri.FS_Read(buffer, len, h);
}

int FS_ReadFile(const char *qpath, void **buffer)
{
    return ri.FS_ReadFile(qpath, buffer);
}

int FS_WriteFile(const char *path, const void *buffer, int size)
{
    return ri.FS_WriteFile(path, buffer, size);
}

void FS_FCloseFile(fileHandle_t h)
{
    ri.FS_FCloseFile(h);
}

void FS_FreeFile(void *buffer)
{
    ri.FS_FreeFile(buffer);
}

char **FS_ListFiles(const char *path, const char *extension, int behavior, int *numfiles, int allocTrackType)
{
    return ri.FS_ListFiles(path, extension, behavior, numfiles, allocTrackType);
}

void FS_FreeFileList(char **list, int allocTrackType)
{
    ri.FS_FreeFileList(list, allocTrackType);
}

const char *XModelGetSurfaceName(const XModel *model, int subMatIndex, int lod)
{
    return ri.XModelGetSurfaceName(model, subMatIndex, lod);
}

void *Z_MallocInternal(int size)
{
    return ri.Z_MallocInternal(size);
}

void Z_FreeInternal(void *ptr)
{
    ri.Z_FreeInternal(ptr);
}

const dheader_s *Com_GetBsp(int *fileSize, unsigned int *checksum)
{
    return ri.Com_GetBsp(fileSize, checksum);
}

// Name unconfirmed; PINNED 10061df0, second copy (r_image keeps Hunk_AllocateTempMemoryInternal).
void *RI_Hunk_AllocateTempMemory(int size)
{
    return ri.Hunk_AllocateTempMemoryInternal(size);
}

// Name unconfirmed; PINNED 10061e00, second copy (r_image keeps Hunk_FreeTempMemory).
void RI_Hunk_FreeTempMemory(void *buf)
{
    ri.Hunk_FreeTempMemory(buf);
}

void Hunk_ClearTempMemory()
{
    ri.Hunk_ClearTempMemory();
}

void *Hunk_AllocInternal(int size)
{
    return ri.Hunk_AllocInternal(size);
}

void *Hunk_AllocAlignInternal(int size, int align)
{
    return ri.Hunk_AllocAlignInternal(size, align);
}

// Name unconfirmed; PINNED 10061e40, forwards import slot 143.
void RI_Slot143()
{
    ri.slot143();
}

// Name unconfirmed; PINNED 10061e50, forwards import slot 144.
void RI_Slot144()
{
    ri.slot144();
}

float GetVirtualWidthFromRealWidth(float width)
{
    return ri.GetVirtualWidthFromRealWidth(width);
}

// Name unconfirmed; PINNED 10061e70, forwards import slot 146.
void RI_Slot146()
{
    ri.slot146();
}

void *CM_GetPlaneNum(int planeNum)
{
    return ri.CM_GetPlaneNum(planeNum);
}

void CM_BoxTrace(trace_t *results, const vec_t *start, const vec_t *end, const vec_t *mins, const vec_t *maxs, clipHandle_t model, int brushmask)
{
    ri.CM_BoxTrace(results, start, end, mins, maxs, model, brushmask);
}

int CM_BoxSightTrace(int oldHitNum, const vec_t *start, const vec_t *end, const vec_t *mins, const vec_t *maxs, clipHandle_t model, int brushmask)
{
    return ri.CM_BoxSightTrace(oldHitNum, start, end, mins, maxs, model, brushmask);
}

int XModelBad(const XModel *model)
{
    return ri.XModelBad(model);
}

float XModelGetLodOutDist(const XModel *model)
{
    return ri.XModelGetLodOutDist(model);
}

const DObjAnimMat *XModelGetBasePose(const XModel *model)
{
    return ri.XModelGetBasePose(model);
}

int XModelNumBones(const XModel *model)
{
    return ri.XModelNumBones(model);
}

union XAssetHeader
{
    XModel *model;
    void *data;
};

struct Material;
struct GfxImage;
void Material_ForEachRegistered(void (*callback)(Material *, int), int arg);
void Image_Iterate(void (*callback)(GfxImage *, void *), void *data);

// Materials (type 2) and images (type 3) live in the renderer, the rest in the engine.
void DB_EnumXAssets(int type, void (*func)(XAssetHeader, void *), void *data, int overrides)
{
    switch (type)
    {
    case 2:
        Material_ForEachRegistered((void (*)(Material *, int))func, (int)data);
        break;
    case 3:
        Image_Iterate((void (*)(GfxImage *, void *))func, data);
        break;
    default:
        ri.DB_EnumXAssets(type, func, data, overrides);
        break;
    }
}

void *Sys_GetValue(int valueIndex)
{
    return ri.Sys_GetValue(valueIndex);
}

int Sys_IsMainThread()
{
    return ri.Sys_IsMainThread();
}

// Name unconfirmed; PINNED 10061fa0, forwards import slot 113.
void RI_Slot113()
{
    ri.slot113();
}

const char *XModelGetName(const XModel *model)
{
    return ri.XModelGetName(model);
}

unsigned char XModelGetFlags(const XModel *model)
{
    return ri.XModelGetFlags(model);
}

int XModelGetSurfaces(const XModel *model, XSurface ***surfaces, int lod, int **partBits)
{
    return ri.XModelGetSurfaces(model, surfaces, lod, partBits);
}

int XModelGetNumLods(const XModel *model)
{
    return ri.XModelGetNumLods(model);
}

void DObjSetModel(DObj *obj, const XModel *model)
{
    ri.DObjSetModel(obj, model);
}

XModel *XModelPrecache(const char *name, Alloc_t Alloc, Alloc_t AllocColl)
{
    return ri.XModelPrecache(name, Alloc, AllocColl);
}

int DObjGetMatOffset(const DObj *obj, int modelIndex)
{
    return ri.DObjGetMatOffset(obj, modelIndex);
}

DObjAnimMat *DObjGetRotTransArray(const DObj *obj)
{
    return ri.DObjGetRotTransArray(obj);
}

int DObjSkelAreBonesUpToDate(const DObj *obj, int *partBits)
{
    return ri.DObjSkelAreBonesUpToDate(obj, partBits);
}

int DObjNumBones(const DObj *obj)
{
    return ri.DObjNumBones(obj);
}

int DObjBad(const DObj *obj)
{
    return ri.DObjBad(obj);
}

int DObjGetSurfaceList(const DObj *obj, DSurface_s *surfaces, int *partBits, char *lods)
{
    return ri.DObjGetSurfaceList(obj, surfaces, partBits, lods);
}

int DObjGetLodForDist(const DObj *obj, int modelIndex, float dist)
{
    return ri.DObjGetLodForDist(obj, modelIndex, dist);
}

int DObjGetNumModels(const DObj *obj)
{
    return ri.DObjGetNumModels(obj);
}

void DObjGetBoneInfo(const DObj *obj, XBoneInfo **boneInfo)
{
    ri.DObjGetBoneInfo(obj, boneInfo);
}

// Name unconfirmed; PINNED 100620d0, forwards import slot 139 with three arguments.
void RI_Slot139(int a, int b, int c)
{
    ((void (*)(int, int, int))ri.slot139)(a, b, c);
}

XSurface *DObjGetSurface(const DObj *obj, int modelIndex, int subMatIndex, int lod)
{
    return ri.DObjGetSurface(obj, modelIndex, subMatIndex, lod);
}

XModel *DObjGetModel(const DObj *obj, int modelIndex)
{
    return ri.DObjGetModel(obj, modelIndex);
}

int XModelGetLodForDist(const XModel *model, float dist)
{
    return ri.XModelGetLodForDist(model, dist);
}

const trXSkin_t *XModelGetSkins(const XModel *model)
{
    return ri.XModelGetSkins(model);
}

int XModelGetMemUsage(const XModel *model)
{
    return ri.XModelGetMemUsage(model);
}

const dvar_t *Dvar_RegisterFloat(const char *dvarName, float value, float min, float max, int flags)
{
    return ri.Dvar_RegisterFloat(dvarName, value, min, max, flags);
}

const dvar_t *Dvar_RegisterString(const char *dvarName, const char *value, int flags)
{
    return ri.Dvar_RegisterString(dvarName, value, flags);
}

const dvar_t *Dvar_RegisterVec3(const char *dvarName, float x, float y, float z, float min, float max, int flags)
{
    return ri.Dvar_RegisterVec3(dvarName, x, y, z, min, max, flags);
}

int Com_LoadDvarsFromBuffer(const char **dvar_names, int count, const char *buf, const char *path)
{
    return ri.Com_LoadDvarsFromBuffer(dvar_names, count, buf, path);
}

void FX_UpdateNonBolt()
{
    ri.FX_UpdateNonBolt();
}

void FX_UpdateBolt()
{
    ri.FX_UpdateBolt();
}

void FX_UpdateAndDraw()
{
    ri.FX_UpdateAndDraw();
}

void CG_AddMarks()
{
    ri.CG_AddMarks();
}

void CG_CullIn(const centity_s *cent)
{
    ri.CG_CullIn(cent);
}

void CG_UsedDObjCalcPose(const centity_s *cent)
{
    ri.CG_UsedDObjCalcPose(cent);
}
