// Engine import table (refimport_t) with only the base types it needs, so a TU can pair it
// either with the opencod2 type universe (gfx.h) or with the real Windows/D3D headers (r_local.h).
#pragma once

#ifndef GFX_OC_TYPES
typedef unsigned char byte;
typedef float vec_t;
typedef vec_t vec2_t[2];
typedef vec_t vec3_t[3];
typedef vec_t vec4_t[4];
typedef int clipHandle_t;
typedef int fileHandle_t;
typedef void (*xcommand_t)();
typedef void *(*Alloc_t)(int);

enum errorParm_t
{
    ERR_FATAL = 0,
    ERR_DROP = 1,
    ERR_SERVERDISCONNECT = 2,
    ERR_DISCONNECT = 3,
    ERR_SCRIPT = 4,
    ERR_SCRIPT_DROP = 5,
    ERR_LOCALIZATION = 6
};

enum fsMode_t
{
    FS_READ = 0,
    FS_WRITE = 1,
    FS_APPEND = 2,
    FS_APPEND_SYNC = 3
};

enum e_status
{
    FMV_IDLE = 0,
    FMV_PLAY = 1,
    FMV_EOF = 2,
    FMV_ID_BLT = 3,
    FMV_ID_IDLE = 4,
    FMV_LOOPED = 5,
    FMV_ID_WAIT = 6
};

typedef struct dvar_s dvar_t;
typedef struct DObj_s DObj;
typedef struct XSurface_s XSurface;
struct XModel;
struct trace_t;
typedef struct DObjAnimMat_s DObjAnimMat;
struct DObjModel_s;
struct DSurface_s;
struct XAnimTree_s;
typedef struct XBoneInfo_s XBoneInfo;
struct dheader_s;
struct trXSkin_t;
union DvarValue;
union XAssetHeader;
#endif

// Engine services passed to GetRefAPI. Slot order pinned from the 1.0 client's
// CL_InitRef stores; names from matched client functions or the GLM table.
struct refimport_t
{
    void (*Printf)(int print_level, const char *fmt, ...);
    void (*Error)(errorParm_t code, const char *fmt, ...);
    int (*Milliseconds)();
    void * (*Hunk_AllocInternal)(int size);
    void * (*Hunk_AllocateTempMemoryInternal)(int size);
    void * (*Z_MallocInternal)(int size);
    void (*Z_FreeInternal)(void *ptr);
    void * (*Hunk_AllocAlignInternal)(int size, int align);
    void * (*Z_VirtualReserveInternal)(int size);
    void (*Z_VirtualCommitInternal)(void *ptr, int size);
    void (*Z_VirtualDecommitInternal)(void *ptr, int size);
    void (*Z_VirtualFreeInternal)(void *ptr);
    void (*Hunk_FreeTempMemory)(void *buf);
    void (*Hunk_ClearTempMemory)();
    int (*Hunk_HideTempMemory)();
    void (*Hunk_ShowTempMemory)(void *mark);
    void * (*Hunk_AllocateTempMemoryHighInternal)(int size);
    void (*Hunk_ClearTempMemoryHigh)();
    void (*HiAlloc)();  // signature unverified
    void (*HiSetOffset)();  // signature unverified
    void (*HiOffToPtr)();  // signature unverified
    void (*Sys_DirectXFatalError)();
    void (*Sys_ShowSplashWindow)();
    void (*Sys_HideSplashWindow)();
    void (*Sys_LoadingKeepAlive)();
    const dvar_t * (*Dvar_RegisterBool)(const char *dvarName, int value, int flags);
    const dvar_t * (*Dvar_RegisterInt)(const char *dvarName, int value, int min, int max, int flags);
    const dvar_t * (*Dvar_RegisterFloat)(const char *dvarName, float value, float min, float max, int flags);
    const dvar_t * (*Dvar_RegisterString)(const char *dvarName, const char *value, int flags);
    const dvar_t * (*Dvar_RegisterEnum)(const char *dvarName, const char **valueList, int defaultIndex, int flags);
    const dvar_t * (*Dvar_RegisterColor)(const char *dvarName, float r, float g, float b, float a, int flags);
    const dvar_t * (*Dvar_RegisterVec2)(const char *dvarName, float x, float y, float min, float max, int flags);
    const dvar_t * (*Dvar_RegisterVec3)(const char *dvarName, float x, float y, float z, float min, float max, int flags);
    const dvar_t * (*Dvar_RegisterVec4)(const char *dvarName, float x, float y, float z, float w, float min, float max, int flags);
    void (*Dvar_UnregisterSystem)(int sysFlag);
    void (*Dvar_ChangeResetValue)(const dvar_t *dvar, DvarValue value);
    int (*Dvar_IsAtDefaultValue)(const dvar_t *dvar);
    void (*Dvar_ClearModified)(const dvar_t *dvar);
    void (*Dvar_SetModified)(const dvar_t *dvar);
    void (*Dvar_UpdateEnumDomain)(const dvar_t *dvar, const char **stringTable);
    void (*Dvar_SetBool)(const dvar_t *dvar, int value);
    void (*Dvar_SetInt)(const dvar_t *dvar, int value);
    void (*Dvar_SetFloat)(const dvar_t *dvar, float value);
    void (*Dvar_SetString)(const dvar_t *dvar, const char *value);
    void (*Dvar_SetColor)(const dvar_t *dvar, float r, float g, float b, float a);
    void (*Dvar_SetVec2)(const dvar_t *dvar, float x, float y);
    void (*Dvar_SetVec3)(const dvar_t *dvar, float x, float y, float z);
    void (*Dvar_SetVec4)(const dvar_t *dvar, float x, float y, float z, float w);
    void (*Dvar_SetFromString)(const dvar_t *dvar, const char *string);
    void (*Dvar_SetBoolByName)(const char *name, int value);
    void (*Dvar_SetIntByName)(const char *name, int value);
    void (*Dvar_SetFloatByName)(const char *name, float value);
    void (*Dvar_SetStringByName)(const char *dvarName, const char *value);
    void (*Dvar_SetColorByName)(const char *dvarName, int r, int g, int b, int a);
    void (*Dvar_SetVec2ByName)(const char *dvarName, float x, float y);
    void (*Dvar_SetVec3ByName)(const char *dvarName, float x, float y, float z);
    void (*Dvar_SetVec4ByName)(const char *dvarName, float x, float y, float z, float w);
    void (*Dvar_SetFromStringByName)(const char *dvarName, const char *value);
    int (*Dvar_GetBool)(const char *dvarName);
    int (*Dvar_GetInt)(const char *dvarName);
    float (*Dvar_GetFloat)(const char *name);
    const char * (*Dvar_GetString)(const char *dvarName);
    const char * (*Dvar_GetVariantString)(const char *dvarName);
    const char * (*Dvar_EnumToString)(dvar_t *dvar);
    void (*Dvar_Reset)(void *dvar, int source);
    void (*Cmd_AddCommand)(const char *cmdName, xcommand_t function);
    void (*Cmd_RemoveCommand)(const char *cmdName);
    int (*Cmd_Argc)();
    char * (*Cmd_Argv)(int arg);
    void (*Cbuf_ExecuteText)(int exec_when, const char *text);
    int (*Com_SaveDvarsToBuffer)(const char **dvar_names, int count, char *buf, int bufsize);
    int (*Com_LoadDvarsFromBuffer)(const char **dvar_names, int count, const char *buf, const char *path);
    const dheader_s * (*Com_GetBsp)(int *fileSize, unsigned int *checksum);
    unsigned int (*SEH_ReadCharFromString)(const char **ppsText, int *pbIsTrailingPunctuation);
    void (*CL_UpdateDebugData)();
    void (*CL_FlushDebugData)(int fromServer);
    void (*StatMon_Warning)(int type, int duration, const char *materialName);
    int (*FS_ReadFile)(const char *qpath, void **buffer);
    void (*FS_FreeFile)(void *buffer);
    int (*FS_FOpenFileRead)(const char *filename, fileHandle_t *file, int uniqueFILE);
    char ** (*FS_ListFiles)(const char *path, const char *extension, int behavior, int *numfiles, int allocTrackType);
    void (*FS_FreeFileList)(char **list, int allocTrackType);
    int (*FS_FileExists)(const char *path);
    int (*FS_WriteFile)(const char *path, const void *buffer, int size);
    int (*FS_FOpenFileByMode)(const char *qpath, fileHandle_t *f, fsMode_t mode);
    void (*FS_FCloseFile)(fileHandle_t h);
    int (*FS_Read)(void *buffer, int len, fileHandle_t h);
    int (*FS_Write)(const void *buf, int len, int fh);
    void (*CM_SaveLump)(int lumpnum, byte *newLump, int size, int *checksum);
    void (*CM_BoxTrace)(trace_t *results, const vec_t *start, const vec_t *end, const vec_t *mins, const vec_t *maxs, clipHandle_t model, int brushmask);
    int (*CM_BoxSightTrace)(int oldHitNum, const vec_t *start, const vec_t *end, const vec_t *mins, const vec_t *maxs, clipHandle_t model, int brushmask);
    int (*CM_RayTriangleIntersect)();  // Mac order between pinned neighbours
    struct XModel * (*XModelPrecache)(const char *name, Alloc_t Alloc, Alloc_t AllocColl);  // Mac order between pinned neighbours
    int (*XModelGetSurfaces)(const XModel *model, struct XSurface_s ***surfaces, int lod, int **partBits);
    int (*XModelBad)(const XModel *model);
    void (*Hunk_OverrideDataForFile)(int type, const char *name, void *data);
    int (*XModelGetNumLods)(const XModel *model);
    void (*XModelSetTestLods)(int lodLevel, float dist);  // Mac order between pinned neighbours
    int (*XModelGetLodForDist)(const XModel *model, float dist);
    float (*XModelGetLodOutDist)(const XModel *model);
    const char * (*XModelGetSurfaceName)(const XModel *model, int subMatIndex, int lod);
    const char * (*XModelGetName)(const XModel *model);
    unsigned char (*XModelGetFlags)(const XModel *model);  // Mac order between pinned neighbours
    int (*XModelNumBones)(const XModel *model);
    const trXSkin_t * (*XModelGetSkins)(const XModel *model);
    int (*XModelGetMemUsage)(const XModel *model);
    const char * (*XModelGetLodName)(const XModel *model, int lod);  // Mac order between pinned neighbours
    const DObjAnimMat * (*XModelGetBasePose)(const XModel *model);
    const DObjAnimMat * (*XModelGetBasePoseBone)(const XModel *model, int skelMatBoneOffset);  // Mac order between pinned neighbours
    int (*DObjBad)(const DObj *obj);
    void (*DB_EnumXAssets)(int type, void (*func)(union XAssetHeader, void *), void *data, int overrides);
    void *(*Sys_GetValue)(int valueIndex);  // client 0x45f950 body: threadValues[valueIndex]
    int (*Sys_IsMainThread)();  // client 0x45f920 body: GetCurrentThreadId() == main thread id
    void (*slot113)();  // unidentified
    void (*DObjGetBounds)(const DObj *obj, vec_t *mins, vec_t *maxs);
    XSurface * (*DObjGetSurface)(const DObj *obj, int modelIndex, int subMatIndex, int lod);  // Mac order between pinned neighbours
    int (*DObjGetNumModels)(const DObj *obj);
    int (*DObjGetNumSurfaces)(const DObj *obj, char *lods);  // Mac order between pinned neighbours
    int (*DObjGetSurfaceList)(const DObj *obj, DSurface_s *surfaces, int *partBits, char *lods);
    int * (*DObjGetPartBits)();  // Mac order between pinned neighbours
    DObjAnimMat * (*DObjGetRotTransArray)(const DObj *obj);
    int (*DObjSkelAreBonesUpToDate)(const DObj *obj, int *partBits);
    int (*DObjGetMatOffset)(const DObj *obj, int modelIndex);
    struct XModel * (*DObjGetModel)(const DObj *obj, int modelIndex);
    const char * (*DObjGetSurfaceName)(DObj *obj, int modelIndex, int subMatIndex, int lod);  // Mac order between pinned neighbours
    void (*DObjCreate)(DObjModel_s *dobjModels, unsigned int numModels, XAnimTree_s *tree, char *buf, unsigned int entnum);
    int (*DObjGetAllocSkelSize)(const DObj *obj);
    void (*DObjCreateSkel)(const DObj *obj, char *buf, int timeStamp);
    void (*slot128)();  // unidentified
    void (*slot129)();  // unidentified
    int (*DObjNumBones)(const DObj *obj);
    void (*DObjGetBoneInfo)(const DObj *obj, XBoneInfo **boneInfo);
    int (*DObjGetLodForDist)(const DObj *obj, int modelIndex, float dist);  // Mac order between pinned neighbours
    float (*DObjGetMaxLodOutDist)(const DObj *obj);
    void (*DObjCompleteHierarchyBits)(const DObj *obj, int *partBits);  // Mac order between pinned neighbours
    void (*DObjSetModel)(DObj *obj, const XModel *model);  // Mac order between pinned neighbours
    void (*CIN_UploadCinematic)(int handle);  // Mac order between pinned neighbours
    int (*CIN_PlayCinematic)(const char *arg, int x, int y, int w, int h, int systemBits);  // Mac order between pinned neighbours
    e_status (*CIN_RunCinematic)(int handle);  // Mac order between pinned neighbours
    void (*slot139)();  // unidentified
    void (*slot140)();  // unidentified
    void (*slot141)();  // unidentified
    void (*slot142)();  // unidentified
    void (*slot143)();  // unidentified
    void (*slot144)();  // unidentified
    void (*slot145)();  // unidentified
    void (*slot146)();  // unidentified
    void * (*CM_GetPlaneNum)(int planeNum);
    void (*slot148)();  // unidentified
    void (*slot149)();  // unidentified
    void (*slot150)();  // unidentified
    void (*slot151)();  // unidentified
    void (*slot152)();  // unidentified
    void (*slot153)();  // unidentified
    void (*slot154)();  // unidentified
    void (*slot155)();  // unidentified
    void (*slot156)();  // unidentified
    void (*slot157)();  // unidentified
    void (*slot158)();  // unidentified
    void (*slot159)();  // unidentified
    void (*slot160)();  // unidentified
    void (*slot161)();  // unidentified
    void (*slot162)();  // unidentified
    void (*slot163)();  // unidentified
    void (*slot164)();  // unidentified
    void (*FX_UpdateNonBolt)();
    void (*FX_UpdateBolt)();
    void (*FX_UpdateAndDraw)();  // signature unverified
    const char * (*CL_GetHudMsgIconMaterialName)(int index);
};

extern refimport_t ri;
