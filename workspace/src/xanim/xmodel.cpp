#include "../universal/com_memory.h"
#include "../qcommon/qcommon.h"
#include "xanim_public.h"

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

XModelSurfs *XModelSurfsFindData(const char *surfName)
{
	return (XModelSurfs *)Hunk_FindDataForFile(FILEDATA_XMODELSURFS, surfName);
}

XModel *XModelFindExisting(const char *name)
{
	return (XModel *)Hunk_FindDataForFile(FILEDATA_XMODEL, name);
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

bool Com_ValidXModelName(const char *name)
{
	return !_strnicmp(name, "xmodel", 6) && (name[6] == '/' || name[6] == '\\');
}
