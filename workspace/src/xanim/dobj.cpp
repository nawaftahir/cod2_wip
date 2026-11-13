#include "../qcommon/qcommon.h"
#include "../script/script_public.h"
#include "xanim_public.h"

#define DOBJ_MAX_PARTS 128
#define DOBJ_MAX_PART_BITS 4
#define UNDEFINED_PART 255

const char *SL_ConvertToString(unsigned int stringValue);
unsigned int SL_GetStringOfLen(const char *str, unsigned int user, unsigned int len, int type);
void SL_AddRefToString(unsigned int stringValue);
void SL_RemoveRefToStringOfLen(unsigned int stringValue, unsigned int len);

static unsigned int g_empty = 0;

const char *DObjGetBoneName(const DObj_s *obj, int boneIndex);

void DObjInit()
{
	int duplicatePartBits[5];

	memset(duplicatePartBits, 0, sizeof(duplicatePartBits));
	g_empty = SL_GetStringOfLen((const char *)duplicatePartBits, 0, 17, 12);
}

void DObjAbort()
{
	g_empty = 0;
}

void DObjDumpInfo(const DObj_s *obj)
{
	int j;
	int i;
	int numBones;
	int numModels;
	int bones;
	byte *partName;
	XModel *model;

	if ( !obj )
	{
		Com_Printf("No Dobj\n");
		return;
	}

	Com_Printf("\nModels:\n");
	numModels = obj->numModels;
	bones = 0;

	for ( i = 0; i < numModels; ++i )
	{
		model = obj->models[i];
		Com_Printf("%d: '%s'\n", bones, model->name);
		bones += model->parts->numBones;
	}

	Com_Printf("\nBones:\n");
	numBones = obj->numBones;

	for ( j = 0; j < numBones; ++j )
	{
		Com_Printf("Bone %d: '%s'\n", j, DObjGetBoneName(obj, j));
	}

	if ( obj->duplicateParts )
	{
		Com_Printf("\nPart duplicates:\n");

		for ( partName = (byte *)(SL_ConvertToString(obj->duplicateParts) + 16); *partName; partName += 2 )
		{
			Com_Printf("%d ('%s') -> %d ('%s')\n", *partName - 1, DObjGetBoneName(obj, *partName - 1), partName[1] - 1, DObjGetBoneName(obj, partName[1] - 1));
		}
	}
	else
	{
		Com_Printf("\nNo part duplicates.\n");
	}

	Com_Printf("\n");
}

bool DObjIgnoreCollision(const DObj_s *obj, int modelIndex)
{
	return (obj->ignoreCollision & (1 << modelIndex)) != 0;
}

int DObjSkelIsBoneUpToDate(DObj_s *obj, int boneIndex)
{
	DSkel_t *skel;

#line 584
	assert(obj);
	skel = obj->skel;
#line 587
	assert(skel);

	return ((1 << (boneIndex & 0x1F)) & skel->partBits.skel[boneIndex >> 5]) != 0;
}

int DObjSkelAreBonesUpToDate(const DObj_s *obj, int *partBits)
{
	int i;
	DSkel_t *skel;

#line 603
	assert(obj);
	skel = obj->skel;
#line 606
	assert(skel);

	for ( i = 0; i < 4; ++i )
	{
		if ( (partBits[i] & ~skel->partBits.skel[i]) != 0 )
			return 0;
	}

	return 1;
}

void DObjSetTree(DObj_s *obj, XAnimTree_s *tree)
{
	unsigned int infoOffset;
	unsigned int animTreeSize;
	byte *parent;
	byte childInfoIndex;

	obj->tree = tree;

	if ( !tree )
	{
		obj->animToModel = 0;
		return;
	}

#line 950
	assert(tree->anims);
	animTreeSize = tree->anims->size;
	// Radiant XAnimTree header adds 12 bytes before infoArray relative to lnxded (+20 vs +8); PINNED on 0x004a418b.
	infoOffset = animTreeSize * 2 + 20;
	obj->animToModel = (unsigned short *)((byte *)tree + infoOffset);
	parent = (byte *)obj->animToModel + animTreeSize * 2;
	childInfoIndex = *parent + 1;

	if ( childInfoIndex == 0 )
	{
		childInfoIndex = 1;
		memset(parent + 1, 0, animTreeSize);
	}

	*parent = childInfoIndex;
}

int DObjGetAllocSkelSize(const DObj_s *obj)
{
	return sizeof(DObjAnimMat) * obj->numBones + sizeof(DSkelPartBits_s);
}

int DObjSkelExists(DObj_s *obj, int timeStamp)
{
	if ( obj->timeStamp == timeStamp )
		return obj->skel != 0;

	obj->skel = 0;
	return 0;
}

int DObjSkelIsValid(const DObj *obj, int timeStamp)
{
	return obj->timeStamp == timeStamp && obj->skel;
}

void DObjSkelClear(DObj_s *obj)
{
	obj->timeStamp = 0;
	obj->skel = 0;
}

void DObjCreateSkel(DObj_s *obj, DSkel_t *skel, int time)
{
	int i;
	DSkel_t *pSkel;

#line 1281
	assert(skel);
	pSkel = skel;
	obj->skel = pSkel;
	obj->timeStamp = time;

	for ( i = 0; i < 4; ++i )
	{
		pSkel->partBits.anim[i] = 0;
		pSkel->partBits.control[i] = 0;
		pSkel->partBits.skel[i] = 0;
	}
}

int DObjGetNumModels(const DObj_s *obj)
{
	return obj->numModels;
}

XModel *DObjGetModel(const DObj_s *obj, int modelIndex)
{
	return obj->models[modelIndex];
}

void DObjGetBounds(const DObj_s *obj, float *mins, float *maxs)
{
#line 1325
	assert(obj);
	VectorCopy(obj->mins, mins);
	VectorCopy(obj->maxs, maxs);
}

DObjAnimMat *DObjGetRotTransArray(const DObj_s *obj)
{
#line 1339
	assert(obj);
	if ( obj->skel )
		return &obj->skel->Mat;
	else
		return 0;
}

int DObjGetMatOffset(const DObj_s *obj, int modelIndex)
{
#line 1382
	assert(obj);
	return obj->matOffset[modelIndex];
}

void DObjGetBoneInfo(const DObj *obj, XBoneInfo **boneInfo)
{
	int numBones;
	int j;
	int i;
	XModel *model;
	XModelParts *parts;

	for ( i = 0; i < obj->numModels; i++ )
	{
		model = obj->models[i];
		parts = model->parts;
		numBones = parts->numBones;

		for ( j = 0; j < numBones; j++, boneInfo++ )
			*boneInfo = &model->boneInfo[j];
	}
}

int DObjSetRotTransIndex(const DObj_s *obj, const int *partBits, int boneIndex)
{
	int boneIndexHigh;
	int boneIndexLow;
	DSkel_t *skel;

#line 1423
	assert(obj);
#line 1424
	assert(obj->skel);
#line 1425
	assert(boneIndex >= 0);
#line 1426
	assert(boneIndex < obj->numBones);

	boneIndexHigh = boneIndex >> 5;
	boneIndexLow = 1 << (boneIndex & 0x1F);

	if ( (partBits[boneIndexHigh] & boneIndexLow) == 0 )
		return 0;

	skel = obj->skel;

	if ( (skel->partBits.skel[boneIndexHigh] & boneIndexLow) != 0 )
		return 0;

	skel->partBits.anim[boneIndexHigh] |= boneIndexLow;
	return 1;
}

int DObjSetControlRotTransIndex(const DObj_s *obj, const int *partBits, int boneIndex)
{
	int boneIndexHigh;
	int boneIndexLow;
	DSkel_t *skel;

#line 1454
	assert(obj);
#line 1455
	assert(obj->skel);
#line 1456
	assert(boneIndex >= 0);
#line 1457
	assert(boneIndex < obj->numBones);

	boneIndexHigh = boneIndex >> 5;
	boneIndexLow = 1 << (boneIndex & 0x1F);

	if ( (partBits[boneIndexHigh] & boneIndexLow) == 0 )
		return 0;

	skel = obj->skel;

	if ( (skel->partBits.skel[boneIndexHigh] & boneIndexLow) != 0 )
		return 0;

	skel->partBits.control[boneIndexHigh] |= boneIndexLow;
	skel->partBits.anim[boneIndexHigh] |= boneIndexLow;
	return 1;
}

int DObjGetSurfaceCount(const DObj_s *obj, const char *lods)
{
	int count;
	int i;
	XModel *model;
	XModelLodInfo *lodInfo;

#line 1487
	assert(lods);

	count = 0;

	for ( i = obj->numModels - 1; i >= 0; --i )
	{
		if ( lods[i] >= 0 )
		{
			model = obj->models[i];
			lodInfo = &model->lodInfo[lods[i]];

			if ( lodInfo->surfs )
				count += lodInfo->numsurfs;
		}
	}

	return count;
}

void *DObjGetModelSurface(const DObj *obj, int modelIndex, int surfIndex, int lod)
{
#line 1511
	assert(lod >= 0);
	return ((void **)obj->models[modelIndex]->lodInfo[lod].surfs->surf)[surfIndex];
}

const char *DObjGetModelSurfaceName(const DObj *obj, int modelIndex, int subMatIndex, int lod)
{
	unsigned short name;

#line 1526
	assert(lod >= 0);
#line 1527
	assert((unsigned)subMatIndex < obj->models[modelIndex]->lodInfo[lod].numsurfs);

	name = obj->models[modelIndex]->lodInfo[lod].surfNames[subMatIndex];

	if ( name )
		return SL_ConvertToString(name);

	return "DEFAULT";
}

int DObjGetSurfaceList(const DObj *obj, DObjSurfRef *list, unsigned int *surfPartBits, const char *lods)
{
	int numModels;
	int surfIndex;
	int modelIndex;
	int numsurfs;
	XModelSurfs *surfs;
	int bitOffset;
	int k;
	unsigned int *partBits;
	int numBoneBits;
	XModel *model;
	int word;
	int shift;
	int invShift;
	int startWord;
	int total;
	int j;
	XSurface *surfaces;
	XModelLodInfo *lodInfo;
	int *modelPartBits;

	memset(surfPartBits, 0, 16);
	numModels = obj->numModels;
	total = 0;

	for ( modelIndex = 0; modelIndex < numModels; modelIndex++ )
	{
		if ( lods[modelIndex] < 0 )
			continue;

		model = obj->models[modelIndex];
		lodInfo = &model->lodInfo[lods[modelIndex]];
		surfs = lodInfo->surfs;

		if ( !surfs )
			continue;

		numBoneBits = (model->parts->numBones - 1) >> 5;
#line 1578
		assert((unsigned)numBoneBits < DOBJ_MAX_PART_BITS);

		numsurfs = lodInfo->numsurfs;

		if ( total + numsurfs > 64 )
		{
			Com_Printf("ERROR: models with more than %i total surfaces\n", 64);

			for ( j = 0; j < numModels; j++ )
			{
				model = DObjGetModel(obj, j);
				Com_Printf("  model '%s' lod %i has %i surfaces\n", XModelGetName(model), lods[j],
				           XModelGetSurfaces(model, &surfaces, lods[j], &modelPartBits));
			}

			Com_Error(ERR_DROP, "Max surfs exceeded - see console for details");
		}

		for ( surfIndex = 0; surfIndex < numsurfs; surfIndex++, total++ )
		{
			list[total].surfIndex = surfIndex;
			list[total].modelIndex = modelIndex;
		}

		bitOffset = obj->matOffset[modelIndex];
		partBits = (unsigned int *)surfs->partBits;
		startWord = bitOffset >> 5;
		shift = bitOffset & 31;

		if ( shift )
		{
			invShift = 32 - shift;
			surfPartBits[startWord] |= partBits[0] << shift;
			word = startWord + 1;

			for ( k = 0; k < numBoneBits; k++ )
			{
				surfPartBits[word] |= (partBits[k] >> invShift) | (partBits[k + 1] << shift);
				word++;
			}

			surfPartBits[word] |= partBits[k] >> invShift;
		}
		else
		{
			word = startWord;

			for ( k = 0; k <= numBoneBits; k++ )
			{
				surfPartBits[word] |= partBits[k];
				word++;
			}
		}
	}

	return total;
}

const char *DObjGetBoneName(const DObj_s *obj, int boneIndex)
{
	int numModels;
	int i;
	int offset;
	XModel *model;
	int numBones;
	unsigned short *names;
	int index;
	XBoneHierarchy *hierarchy;
	XModelParts *parts;

#line 1668
	assert(obj);
	numModels = obj->numModels;
	offset = 0;

	for ( i = 0; i < numModels; i++ )
	{
		model = obj->models[i];
		parts = model->parts;
		hierarchy = parts->hierarchy;
		names = hierarchy->names;
		numBones = parts->numBones;
		index = boneIndex - offset;
#line 1681
		assert(index >= 0);

		if ( index < numBones )
			return SL_ConvertToString(names[index]);

#line 1684
		assertMsg((numBones >= 0), "(numBones) = %i", numBones);
		offset += numBones;
	}

	return NULL;
}

XAnimTree_s *DObjGetTree(const DObj_s *obj)
{
#line 1698
	assert(obj);
	return obj->tree;
}

int DObjNumBones(const DObj *obj)
{
	return obj->numBones;
}

int DObjGetModelLodForDist(const DObj_s *obj, int modelIndex, float dist)
{
	return XModelGetLodForDist(obj->models[modelIndex], dist);
}

float DObjGetMaxLodOutDist(const DObj_s *obj)
{
	int i;
	float dist;
	float maxDist;

	maxDist = 0;

	for ( i = 0; i < obj->numModels; ++i )
	{
		dist = XModelGetLodOutDist(obj->models[i]);

		if ( maxDist < dist )
			maxDist = dist;
	}

	return maxDist;
}

void DObjSetModel(DObj_s *obj, XModel *model)
{
	obj->skel = &model->parts->skel;
	obj->numBones = (byte)model->parts->numBones;
	obj->models[0] = model;
}
