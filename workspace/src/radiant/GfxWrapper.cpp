/* Recovered directly from the retail GfxWrapper TU.
 * These are genuine RET/no-op and zero-return code spans, not stand-ins for
 * nonempty routines. This file remains PARTIAL: nontrivial GL dispatch,
 * class metadata and callback identities have not been reconstructed.
 */
#include "stdafx.h"
#include "../universal/assertive.h"
#include <stdarg.h>
#include <stdio.h>

extern void Sys_Printf(const char *fmt, ...);
extern void Com_Error(int code, const char *fmt, ...);

extern "C" void FUN_004100c0(int, const char *fmt, ...)
{
    char text[4096];
    va_list args;
    va_start(args, fmt);
    vsprintf(text, fmt, args);
    va_end(args);
    Sys_Printf("%s", text);
}












extern "C" void FUN_00410120(char **text)
{
    assert(text);
    assert(*text);
    if (**text)
        ++*text;
}

extern "C" void FUN_004101c0() {}
extern "C" void FUN_004101d0() {}
extern "C" void FUN_004101e0() {}
extern "C" void FUN_004101f0() {}
extern "C" void FUN_00410200() {}
extern "C" int FUN_00410210() { return 0; }
extern "C" const char *FUN_00410220() { return ""; }
extern "C" void FUN_00410230() {}
extern "C" void FUN_00410240() {}
extern "C" void FUN_00410250() { Com_Error(0, "DirectX error during startup"); }
extern "C" void FUN_00410260() {}
extern "C" void FUN_00410270() {}
extern "C" void FUN_00410280() {}

#line 119
extern "C" void FUN_00410290()
{
	assertFailMsg(0, "not handled");
}

#line 125
extern "C" int FUN_004102e0()
{
	assertFailMsg(0, "not handled");
	return 0;
}

#line 132
extern "C" void FUN_00410330(float *out)
{
	assertFailMsg(0, "not handled");
	*out = 1.0f;
}

#line 139
extern "C" int FUN_004103a0()
{
	assertFailMsg(0, "not handled");
	return 0;
}

extern "C" int FUN_004103f0() { return 0; }

// refimport handed to the renderer DLL; field names are not known
struct refimport_t
{
	void *fn[0xa1];
};

// renderer exports filled by GetRefAPI
struct refexport_t
{
	void *fn[0x7f];
};

extern refexport_t re;
HMODULE dword_0059c4fc;

void FUN_0047a760(const char *fmt, ...);
void FUN_0047ae50(int level, const char *fmt, ...);
extern "C" void FUN_00410110();
extern "C" void FUN_00410400();
extern "C" void FUN_00410450();
extern "C" void FUN_004104a0();
extern "C" void FUN_004104f0();
extern "C" void FUN_00410580();
extern "C" void FUN_0048a480();
extern "C" void FUN_004a2250();
extern "C" void FUN_004a2700();
extern "C" void FUN_004a5a60();
extern "C" bool FUN_00498660();
extern "C" bool FUN_00498670();
extern "C" void *FUN_00498690(int index);

typedef int qboolean;
typedef int fileHandle_t;
struct dvar_s;
typedef dvar_s dvar_t;
struct DvarValue;
enum DvarSetSource;
enum FsListBehavior;
enum fsMode_t;
struct XModel;
struct XSurface;
struct Material;
struct DObjAnimMat;
struct DObj_s;
struct DObjSurfRef;
struct DObjModel_s;
struct XAnimTree_s;
struct DSkel_t;
struct DObjSkelMat_s;
struct XBoneInfo;

void *Hunk_AllocInternal(int size);
void *Hunk_AllocateTempMemoryInternal(int size);
extern "C" void *Z_MallocInternal(int size);
extern "C" void Z_FreeInternal(void *ptr);
void *Hunk_AllocAlignInternal(int size, int alignment);
void *Z_VirtualReserve(int size);
void Z_VirtualCommitInternal(void *ptr, int size);
void Z_VirtualDecommit(void *ptr, int size);
void Z_VirtualFreeInternal(void *ptr);
void Hunk_FreeTempMemory(void *buf);
void Hunk_ClearTempMemoryInternal();
int Hunk_HideTempMemory();
void Hunk_ShowTempMemory(int);
void Hunk_CheckTempMemoryClear();
void Hunk_OverrideDataForFile(int type, const char *name, void *data);

int FS_ReadFile(const char *qpath, void **buffer);
void FS_FreeFile(void *buffer);
int FS_FOpenFileRead(const char *filename, int *file, int uniqueFILE);
int FS_WriteFile(const char *qpath, const void *buffer, int size);
void FS_FreeFileList(char **list, int allocType);
char **FS_ListFiles(const char *path, const char *extension, FsListBehavior behavior, int *numfiles, int allocType);
int FS_FileExists(const char *file);
int FS_FOpenFileByMode(const char *qpath, fileHandle_t *f, fsMode_t mode);
void FS_FCloseFile(int f);
int FS_Read(void *buffer, int len, int f);
int FS_Write(const void *buffer, int len, int h);

dvar_t *Dvar_RegisterBool(const char *dvarName, bool value, unsigned short flags);
dvar_t *Dvar_RegisterInt(const char *dvarName, int value, int min, int max, unsigned short flags);
dvar_t *Dvar_RegisterFloat(const char *dvarName, float value, float min, float max, unsigned short flags);
dvar_t *Dvar_RegisterVec2(const char *dvarName, float x, float y, float min, float max, unsigned short flags);
dvar_t *Dvar_RegisterVec3(const char *dvarName, float x, float y, float z, float min, float max, unsigned short flags);
dvar_t *Dvar_RegisterVec4(const char *dvarName, float x, float y, float z, float w, float min, float max, unsigned short flags);
dvar_t *Dvar_RegisterString(const char *dvarName, const char *value, unsigned short flags);
dvar_t *Dvar_RegisterEnum(const char *dvarName, const char **valueList, int defaultIndex, unsigned short flags);
dvar_t *Dvar_RegisterColor(const char *dvarName, float r, float g, float b, float a, unsigned short flags);
void Dvar_ClearModified(dvar_t *dvar);
void Dvar_SetModified(dvar_t *dvar);
void Dvar_UpdateEnumDomain(const dvar_t *dvar, const char **stringTable);
void Dvar_ClearFlagsFromAll(int sysFlag);
void Dvar_ChangeResetValue(dvar_t *dvar, DvarValue value);
bool Dvar_IsAtDefaultValue(const dvar_t *dvar);
void Dvar_SetBool(dvar_t *dvar, bool value);
void Dvar_SetInt(dvar_t *dvar, int value);
void Dvar_SetFloat(dvar_t *dvar, float value);
void Dvar_SetVec2(dvar_t *dvar, float x, float y);
void Dvar_SetVec3(dvar_t *dvar, float x, float y, float z);
void Dvar_SetVec4(dvar_t *dvar, float x, float y, float z, float w);
void Dvar_SetString(dvar_t *dvar, const char *value);
void Dvar_SetColor(dvar_t *dvar, float r, float g, float b, float a);
void Dvar_SetFromString(dvar_t *dvar, const char *string);
void Dvar_SetBoolByName(const char *dvarName, bool value);
void Dvar_SetIntByName(const char *dvarName, int value);
void Dvar_SetFloatByName(const char *dvarName, float value);
void Dvar_SetVec2ByName(const char *dvarName, float x, float y);
void Dvar_SetVec3ByName(const char *dvarName, float x, float y, float z);
void Dvar_SetVec4ByName(const char *dvarName, float x, float y, float z, float w);
void Dvar_SetStringByName(const char *dvarName, const char *value);
void Dvar_SetColorByName(const char *dvarName, unsigned char r, unsigned char g, unsigned char b, unsigned char a);
void Dvar_SetFromStringByName(const char *dvarName, const char *string);
bool Dvar_GetBool(const char *dvarName);
int Dvar_GetInt(const char *dvarName);
float Dvar_GetFloat(const char *dvarName);
const char *Dvar_GetString(const char *dvarName);
const char *Dvar_GetVariantString(const char *dvarName);
const char *Dvar_EnumToString(const dvar_t *dvar);
void Dvar_Reset(dvar_t *dvar, DvarSetSource setSource);
qboolean Com_SaveDvarsToBuffer(const char **dvarnames, int numDvars, char *buffer, int bufsize);
qboolean Com_LoadDvarsFromBuffer(const char **dvarnames, int numDvars, const char *buffer, const char *filename);

XModel *XModelPrecache(const char *name, void *(*Alloc)(int), void *(*AllocColl)(int));
int XModelGetSurfaces(const XModel *model, XSurface **surfaces, int submodel, int **partBits);
int XModelBad(XModel *model);
int XModelGetNumLods(const XModel *model);
void XModelSetLodOverride(int lodLevel, float dist);
int XModelGetLodForDist(const XModel *model, float dist);
float XModelGetLodOutDist(const XModel *model);
const char *XModelGetSurfaceName(const XModel *model, int lod, int index);
const char *XModelGetName(const XModel *model);
char XModelGetFlags(const XModel *model);
int XModelNumBones(const XModel *model);
Material *XModelGetSkins(const XModel *model);
int XModelGetMemUsage(const XModel *model);
const char *XModelGetLodName(const XModel *model, int lod);
DObjAnimMat *XModelGetBasePose(const XModel *model);
char *XModelGetBasePoseOffset(const XModel *model, int index);

void DObjGetBounds(const DObj_s *obj, float *mins, float *maxs);
void *DObjGetModelSurface(const DObj_s *obj, int modelIndex, int surfIndex, int lod);
int DObjGetNumModels(const DObj_s *obj);
int DObjGetSurfaceCount(const DObj_s *obj, const char *lods);
int DObjGetSurfaceList(const DObj_s *obj, DObjSurfRef *list, unsigned int *surfPartBits, const char *lods);
XModel *DObjGetModel(const DObj_s *obj, int modelIndex);
const char *DObjGetModelSurfaceName(const DObj_s *obj, int modelIndex, int subMatIndex, int lod);
void DObjCreate(DObjModel_s *dobjModels, unsigned int numModels, XAnimTree_s *tree, DObj_s *obj, unsigned int entnum);
int DObjGetAllocSkelSize(const DObj_s *obj);
void DObjCreateSkel(DObj_s *obj, DSkel_t *skel, int time);
void DObjCalcAnim(const DObj_s *obj, int *partBits);
DObjAnimMat *DObjGetRotTransArray(const DObj_s *obj);
void DObjGetMatrixArray(const DObj_s *obj, const int *partBits, DObjSkelMat_s *skelMat);
int DObjGetMatOffset(const DObj_s *obj, int modelIndex);
int DObjNumBones(const DObj_s *obj);
void DObjGetBoneInfo(const DObj_s *obj, XBoneInfo **boneInfo);
int DObjGetModelLodForDist(const DObj_s *obj, int modelIndex, float dist);
float DObjGetMaxLodOutDist(const DObj_s *obj);
void DObjSetModel(DObj_s *obj, XModel *model);

extern "C" void FUN_004105f0()
{
	char cwd[1024];
	refimport_t ri;
	refexport_t *(*GetRefAPI)(int, refimport_t *);
	refexport_t *ret;

	GetCurrentDirectoryA(sizeof(cwd), cwd);
	dword_0059c4fc = LoadLibraryA("gfx_d3d_tools.dll");
	if (!dword_0059c4fc)
		FUN_0047a760("couldn't load gfx_d3d_tools.dll in [%s]", cwd);
	GetRefAPI = (refexport_t *(*)(int, refimport_t *))GetProcAddress(dword_0059c4fc, "GetRefAPI");
	if (!GetRefAPI)
	{
		FreeLibrary(dword_0059c4fc);
		FUN_0047a760("couldn't get renderer API");
	}
	memset(&ri, 0, sizeof(ri));
	ri.fn[61] = (void *)FUN_004101f0;
	ri.fn[62] = (void *)FUN_00410200;
	ri.fn[63] = (void *)FUN_00410210;
	ri.fn[64] = (void *)FUN_00410220;
	ri.fn[65] = (void *)FUN_00410230;
	ri.fn[0] = (void *)FUN_004100c0;
	ri.fn[1] = (void *)FUN_0047ae50;
	ri.fn[2] = (void *)FUN_00410110;
	ri.fn[3] = (void *)Hunk_AllocInternal;
	ri.fn[4] = (void *)Hunk_AllocateTempMemoryInternal;
	ri.fn[5] = (void *)Z_MallocInternal;
	ri.fn[6] = (void *)Z_FreeInternal;
	ri.fn[7] = (void *)Hunk_AllocAlignInternal;
	ri.fn[8] = (void *)Z_VirtualReserve;
	ri.fn[9] = (void *)Z_VirtualCommitInternal;
	ri.fn[10] = (void *)Z_VirtualDecommit;
	ri.fn[11] = (void *)Z_VirtualFreeInternal;
	ri.fn[12] = (void *)Hunk_FreeTempMemory;
	ri.fn[13] = (void *)Hunk_ClearTempMemoryInternal;
	ri.fn[14] = (void *)Hunk_HideTempMemory;
	ri.fn[15] = (void *)Hunk_ShowTempMemory;
	ri.fn[16] = (void *)Hunk_CheckTempMemoryClear;
	ri.fn[17] = (void *)FUN_00410250;
	ri.fn[18] = (void *)FUN_00410260;
	ri.fn[19] = (void *)FUN_00410270;
	ri.fn[20] = (void *)FUN_00410280;
	ri.fn[73] = (void *)FS_ReadFile;
	ri.fn[74] = (void *)FS_FreeFile;
	ri.fn[75] = (void *)FS_FOpenFileRead;
	ri.fn[79] = (void *)FS_WriteFile;
	ri.fn[77] = (void *)FS_FreeFileList;
	ri.fn[76] = (void *)FS_ListFiles;
	ri.fn[78] = (void *)FS_FileExists;
	ri.fn[80] = (void *)FS_FOpenFileByMode;
	ri.fn[81] = (void *)FS_FCloseFile;
	ri.fn[82] = (void *)FS_Read;
	ri.fn[83] = (void *)FS_Write;
	ri.fn[84] = (void *)FUN_00410290;
	ri.fn[143] = (void *)FUN_004102e0;
	ri.fn[85] = (void *)FUN_00410330;
	ri.fn[86] = (void *)FUN_004103a0;
	ri.fn[21] = (void *)Dvar_RegisterBool;
	ri.fn[22] = (void *)Dvar_RegisterInt;
	ri.fn[23] = (void *)Dvar_RegisterFloat;
	ri.fn[24] = (void *)Dvar_RegisterString;
	ri.fn[25] = (void *)Dvar_RegisterEnum;
	ri.fn[26] = (void *)Dvar_RegisterColor;
	ri.fn[27] = (void *)Dvar_RegisterVec2;
	ri.fn[28] = (void *)Dvar_RegisterVec3;
	ri.fn[29] = (void *)Dvar_RegisterVec4;
	ri.fn[33] = (void *)Dvar_ClearModified;
	ri.fn[34] = (void *)Dvar_SetModified;
	ri.fn[35] = (void *)Dvar_UpdateEnumDomain;
	ri.fn[30] = (void *)Dvar_ClearFlagsFromAll;
	ri.fn[31] = (void *)Dvar_ChangeResetValue;
	ri.fn[32] = (void *)Dvar_IsAtDefaultValue;
	ri.fn[36] = (void *)Dvar_SetBool;
	ri.fn[37] = (void *)Dvar_SetInt;
	ri.fn[38] = (void *)Dvar_SetFloat;
	ri.fn[39] = (void *)Dvar_SetString;
	ri.fn[40] = (void *)Dvar_SetColor;
	ri.fn[41] = (void *)Dvar_SetVec2;
	ri.fn[42] = (void *)Dvar_SetVec3;
	ri.fn[43] = (void *)Dvar_SetVec4;
	ri.fn[44] = (void *)Dvar_SetFromString;
	ri.fn[45] = (void *)Dvar_SetBoolByName;
	ri.fn[46] = (void *)Dvar_SetIntByName;
	ri.fn[47] = (void *)Dvar_SetFloatByName;
	ri.fn[48] = (void *)Dvar_SetStringByName;
	ri.fn[49] = (void *)Dvar_SetColorByName;
	ri.fn[50] = (void *)Dvar_SetVec2ByName;
	ri.fn[51] = (void *)Dvar_SetVec3ByName;
	ri.fn[52] = (void *)Dvar_SetVec4ByName;
	ri.fn[53] = (void *)Dvar_SetFromStringByName;
	ri.fn[54] = (void *)Dvar_GetBool;
	ri.fn[55] = (void *)Dvar_GetInt;
	ri.fn[56] = (void *)Dvar_GetFloat;
	ri.fn[57] = (void *)Dvar_GetString;
	ri.fn[58] = (void *)Dvar_GetVariantString;
	ri.fn[59] = (void *)Dvar_EnumToString;
	ri.fn[60] = (void *)Dvar_Reset;
	ri.fn[66] = (void *)Com_SaveDvarsToBuffer;
	ri.fn[67] = (void *)Com_LoadDvarsFromBuffer;
	ri.fn[68] = 0;
	ri.fn[69] = (void *)FUN_00410120;
	ri.fn[70] = (void *)FUN_004101c0;
	ri.fn[71] = (void *)FUN_004101d0;
	ri.fn[72] = (void *)FUN_004101e0;
	ri.fn[88] = (void *)XModelPrecache;
	ri.fn[89] = (void *)XModelGetSurfaces;
	ri.fn[90] = (void *)XModelBad;
	ri.fn[91] = (void *)Hunk_OverrideDataForFile;
	ri.fn[92] = (void *)XModelGetNumLods;
	ri.fn[93] = (void *)XModelSetLodOverride;
	ri.fn[94] = (void *)XModelGetLodForDist;
	ri.fn[95] = (void *)XModelGetLodOutDist;
	ri.fn[96] = (void *)XModelGetSurfaceName;
	ri.fn[97] = (void *)XModelGetName;
	ri.fn[98] = (void *)XModelGetFlags;
	ri.fn[99] = (void *)XModelNumBones;
	ri.fn[100] = (void *)XModelGetSkins;
	ri.fn[101] = (void *)XModelGetMemUsage;
	ri.fn[102] = (void *)XModelGetLodName;
	ri.fn[103] = (void *)XModelGetBasePose;
	ri.fn[104] = (void *)XModelGetBasePoseOffset;
	ri.fn[105] = (void *)FUN_004a5a60;
	ri.fn[106] = (void *)FUN_0048a480;
	ri.fn[107] = (void *)FUN_00498690;
	ri.fn[108] = (void *)FUN_00498670;
	ri.fn[109] = (void *)FUN_00498660;
	ri.fn[110] = (void *)DObjGetBounds;
	ri.fn[111] = (void *)DObjGetModelSurface;
	ri.fn[112] = (void *)DObjGetNumModels;
	ri.fn[113] = (void *)DObjGetSurfaceCount;
	ri.fn[114] = (void *)DObjGetSurfaceList;
	ri.fn[119] = (void *)DObjGetModel;
	ri.fn[120] = (void *)DObjGetModelSurfaceName;
	ri.fn[121] = (void *)DObjCreate;
	ri.fn[122] = (void *)DObjGetAllocSkelSize;
	ri.fn[123] = (void *)DObjCreateSkel;
	ri.fn[124] = (void *)DObjCalcAnim;
	ri.fn[125] = (void *)FUN_004a2700;
	ri.fn[116] = (void *)DObjGetRotTransArray;
	ri.fn[136] = (void *)DObjGetMatrixArray;
	ri.fn[118] = (void *)DObjGetMatOffset;
	ri.fn[126] = (void *)DObjNumBones;
	ri.fn[127] = (void *)DObjGetBoneInfo;
	ri.fn[128] = (void *)DObjGetModelLodForDist;
	ri.fn[129] = (void *)DObjGetMaxLodOutDist;
	ri.fn[130] = (void *)FUN_004a2250;
	ri.fn[131] = (void *)DObjSetModel;
	ri.fn[132] = (void *)FUN_00410400;
	ri.fn[133] = (void *)FUN_00410450;
	ri.fn[134] = (void *)FUN_004104a0;
	ri.fn[135] = (void *)FUN_004104f0;
	ri.fn[137] = (void *)FUN_00410580;
	ri.fn[138] = (void *)FUN_0047d980;
	ri.fn[139] = 0;
	ri.fn[140] = 0;
	ri.fn[141] = 0;
	ri.fn[142] = 0;
	ret = GetRefAPI(60, &ri);
	if (!ret)
	{
		FreeLibrary(dword_0059c4fc);
		FUN_0047a760("couldn't init renderer");
	}
	re = *ret;
}
