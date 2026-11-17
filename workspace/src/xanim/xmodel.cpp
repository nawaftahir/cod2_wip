#include "../universal/com_memory.h"
#include "../qcommon/qcommon.h"
#include "xanim_public.h"
#include "../script/script_public.h"

#define DOBJ_MAX_PARTS 128
#define MAX_LODS 4

struct XModelDefault
{
	unsigned short boneNames[1];
	XBoneHierarchy hierarchy;
	XModelParts modelParts;
	XModelSurfs modelSurf;
	XBoneInfo boneInfo;
	unsigned char partClassification[1];
	unsigned short surfNames[1];
};

static int g_xmodelOptimize;
static XModelDefault g_default;

XModelParts_s *XModelCreateDefaultParts();
XModelSurfs_s *XModelCreateDefaultSurface();
void XModelMakeDefault(XModel *model);
XModel *XModelCreateDefault(void *(*Alloc)(int));
XModel *XModelFindExisting(const char *name);
const char *XModelGetLodName(const XModel *model, int lod);
int XModelGetCollisionLod(const XModel *model);
struct Material *XModelGetSkins(const XModel *model);
int XModelGetMemUsage(const XModel *model);
bool Com_ValidXModelName(const char *name);




qboolean XModelBad(XModel *model)
{
	assert(model);

	return model->bad;
}

void XModelSetOptimize(int optimize)
{
	g_xmodelOptimize = optimize;
}























void XModelPartsFree(XModelParts *model)
{
	int i, numBones;
	unsigned short *names;

	assert(model);
	names = model->hierarchy->names;
	numBones = model->numBones;
	for (i = 0; i < numBones; ++i)
		SL_RemoveRefToString(names[i]);
}

void XModelFree(XModel *model)
{
	int i;
	int j;

	if (XModelBad(model))
		return;

	for (i = 0; i < MAX_LODS; ++i)
	{
		if (model->lodInfo[i].surfNames)
		{
			for (j = 0; j < model->lodInfo[i].numsurfs; ++j)
				SL_RemoveRefToString(model->lodInfo[i].surfNames[j]);
			model->lodInfo[i].surfNames = 0;
		}
	}
}




















































XModelParts_s *XModelCreateDefaultParts()
{
	g_default.hierarchy.names = g_default.boneNames;
	g_default.modelParts.hierarchy = &g_default.hierarchy;

	g_default.modelParts.quats = 0;
	g_default.modelParts.trans = 0;

	g_default.modelParts.numBones = 1;
	g_default.modelParts.numRootBones = 1;

	g_default.modelParts.partClassification = g_default.partClassification;
	g_default.partClassification[0] = 0;

	g_default.boneNames[0] = 0;

	return &g_default.modelParts;
}

XModelSurfs_s *XModelCreateDefaultSurface()
{
	g_default.modelSurf.surf = 0;
	return &g_default.modelSurf;
}

void XModelMakeDefault(XModel *model)
{
	model->bad = true;
	model->parts = XModelCreateDefaultParts();

	for (int i = 0; i < MAX_LODS; i++)
	{
		model->lodInfo[i].surfs = 0;
		model->lodInfo[i].filename = "";
		model->lodInfo[i].dist = 0;
		model->lodInfo[i].numsurfs = 1;
		model->lodInfo[i].surfNames = g_default.surfNames;

		g_default.surfNames[0] = 0;
	}

	model->lodInfo->surfs = XModelCreateDefaultSurface();
	model->numLods = 1;
	model->collLod = 0;

	model->name = "DEFAULT";

	g_default.boneInfo.bounds[0][0] = -16;
	g_default.boneInfo.bounds[0][1] = -16;
	g_default.boneInfo.bounds[0][2] = -16;

	g_default.boneInfo.bounds[1][0] = 16;
	g_default.boneInfo.bounds[1][1] = 16;
	g_default.boneInfo.bounds[1][2] = 16;

	model->boneInfo = &g_default.boneInfo;
}

XModel *XModelCreateDefault(void *(*Alloc)(int))
{
	XModel *model = (XModel *)Alloc(sizeof(XModel));
	XModelMakeDefault(model);

	return model;
}

XModelParts *XModelPartsFindData(const char *partName)
{
	return (XModelParts *)Hunk_FindDataForFile(FILEDATA_XMODELPARTS, partName);
}

/* DEFER 0x004aa9e0 XModelPartsSetData: Hunk_SetDataForFile (0x0048a170) needs xmodel_load_obj.cpp /GL callers for (eax, esi) ABI
const char *XModelPartsSetData(const char *name, XModelParts *parts, void *(*Alloc)(int))
{
	return Hunk_SetDataForFile(FILEDATA_XMODELPARTS, name, parts, Alloc);
} */

XModelSurfs *XModelSurfsFindData(const char *surfName)
{
	return (XModelSurfs *)Hunk_FindDataForFile(FILEDATA_XMODELSURFS, surfName);
}

/* DEFER 0x004aaa10 XModelSurfsSetData: Hunk_SetDataForFile (0x0048a170) needs xmodel_load_obj.cpp /GL callers for (eax, esi) ABI
const char *XModelSurfsSetData(const char *name, XModelSurfs *surface, void *(*Alloc)(int))
{
	return Hunk_SetDataForFile(FILEDATA_XMODELSURFS, name, surface, Alloc);
} */

XModel *XModelFindExisting(const char *name)
{
	return (XModel *)Hunk_FindDataForFile(FILEDATA_XMODEL, name);
}

/* DEFER 0x004aaa40 XModelDefaultModel: Hunk_SetDataForFile (0x0048a170) needs xmodel_load_obj.cpp /GL callers for (eax, esi) ABI
XModel *XModelDefaultModel(const char *name, void *(*Alloc)(int))
{
	XModel *model;

	model = (XModel *)Alloc(sizeof(XModel));
	XModelMakeDefault(model);
	Hunk_SetDataForFile(FILEDATA_XMODEL, name, model, Alloc);

	return model;
} */

void XModelReplace(XModel *model, XModel *replacement)
{
	const char *name;
	int i;
	int j;
	XModelLodInfo *lodInfo;

	if (XModelBad(replacement))
		Com_Error(ERR_DROP, "Could not load replacement model.");

	name = model->name;
	XModelFree(model);
	*model = *replacement;
	model->name = name;

	for (i = 0; i < MAX_LODS; ++i)
	{
		lodInfo = &model->lodInfo[i];
		if (lodInfo->surfNames)
		{
			for (j = 0; j < lodInfo->numsurfs; ++j)
				SL_AddRefToString(lodInfo->surfNames[j]);
		}
	}
}

/* DEFER 0x004aab00 XModelPrecache: diverges at +0x24 calling unimplemented LTCG XModelLoad (0x004ac9a0) and Hunk_SetDataForFile
XModel *XModelPrecache(const char *name, void *(*Alloc)(int), void *(*AllocColl)(int))
{
	XModel *model;

	model = (XModel *)Hunk_FindDataForFile(FILEDATA_XMODEL, name);
	if (model)
		return model;

	model = XModelLoad(name, Alloc, AllocColl);
	if (model)
	{
		model->name = Hunk_SetDataForFile(FILEDATA_XMODEL, name, model, Alloc);
		return model;
	}

	Com_Printf("^1ERROR: Cannot find xmodel '%s'.\n", name);
	return XModelDefaultModel(name, Alloc);
} */



































unsigned short *XModelBoneNames(XModel *model)
{
	return model->parts->hierarchy->names;
}

int XModelGetBoneIndex(const XModel *model, unsigned int name)
{
	XModelParts *parts;
	int numBones;
	unsigned short *boneNames;
	int localBoneIndex;

	parts = model->parts;
	numBones = parts->numBones;
	boneNames = parts->hierarchy->names;
	assert(numBones < DOBJ_MAX_PARTS);

	for (localBoneIndex = numBones - 1; localBoneIndex >= 0; --localBoneIndex)
	{
		if (name == boneNames[localBoneIndex])
			return localBoneIndex;
	}

	return localBoneIndex;
}

void XModelGetBounds(const XModel *model, float *mins, float *maxs)
{
	VectorCopy(model->mins, mins);
	VectorCopy(model->maxs, maxs);
}













const char *XModelGetLodName(const XModel *model, int lod)
{
	assert(lod >= 0);

	return model->lodInfo[lod].filename;
}






int XModelGetContents(const XModel *model)
{
	assert(model);

	return model->contents;
}

int XModelGetCollisionLod(const XModel *model)
{
	return model->collLod;
}

struct Material *XModelGetSkins(const XModel *model)
{
	return model->xskins;
}

int XModelGetMemUsage(const XModel *model)
{
	return model->memUsage;
}

int XModelTraceLine(const XModel *model, trace_t *results, DObjAnimMat *pose, const float *localStart, const float *localEnd, int contentmask)
{
	return -1;
}

bool Com_ValidXModelName(const char *name)
{
	return !_strnicmp(name, "xmodel", 6) && (name[6] == '/' || name[6] == '\\');
}

struct refexport_t
{
	void *pad0[109];
	void *(*AllocLoad_XSurface)(void);
	void (*Load_XSurfaceGlue)(void *, void *);
	void *pad1[16];
};
extern refexport_t re;
extern void *DAT_01233438;
















































































































































































void *FUN_004aad60(void)
{
	assert(re.AllocLoad_XSurface);
	return re.AllocLoad_XSurface();
}








void FUN_004aadb0(void *arg0)
{
	assert(re.Load_XSurfaceGlue);
	re.Load_XSurfaceGlue(arg0, DAT_01233438);
}

short XModelDataReadShort(const unsigned char **pos)
{
	short value = *(const short *)*pos;
	*pos += 2;
	return value;
}

int XModelDataReadInt(const unsigned char **pos)
{
	int value = *(const int *)*pos;
	*pos += 4;
	return value;
}

float XModelDataReadFloat(const unsigned char **pos)
{
	int value;
	memcpy(&value, *pos, 4);
	*pos += 4;
	return *(float *)&value;
}
