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

int SL_IsLowercaseString(unsigned int stringValue);
int FUN_004a1890(const DObj_s *obj, unsigned int name);

static unsigned int g_empty = 0;

const char *DObjGetBoneName(const DObj_s *obj, int boneIndex);

#undef IS_NAN
#define nanmask (255<<23)
#define IS_NAN(x) (((*(int *)&(x))&nanmask)==nanmask)

typedef struct DObjSkelMat_s
{
	vec4_t axis[3];
	vec4_t origin;
} DObjSkelMat;

// retail asserts name xanim_public.h for this function
#line 340 "e:\\trees\\cod2src\\src\\xanim\\xanim_public.h"
void FUN_004a1170(const DObjAnimMat *mat, DObjSkelMat *skelMat)
{
	float xx, xy, xz, xw, yy, yz, yw, zz, zw;
	vec3_t scaledQuat;

#line 348
	assert(!IS_NAN((mat->quat)[0]) && !IS_NAN((mat->quat)[1]) && !IS_NAN((mat->quat)[2]) && !IS_NAN((mat->quat)[3]));

	VectorScale(mat->quat, mat->transWeight, scaledQuat);

	xx = scaledQuat[0] * mat->quat[0];
	xy = scaledQuat[0] * mat->quat[1];
	xz = scaledQuat[0] * mat->quat[2];
	xw = scaledQuat[0] * mat->quat[3];
	yy = scaledQuat[1] * mat->quat[1];
	yz = scaledQuat[1] * mat->quat[2];
	yw = scaledQuat[1] * mat->quat[3];
	zz = scaledQuat[2] * mat->quat[2];
	zw = scaledQuat[2] * mat->quat[3];

	skelMat->axis[0][0] = 1.0f - (yy + zz);
	skelMat->axis[0][1] = xy + zw;
	skelMat->axis[0][2] = xz - yw;
	skelMat->axis[0][3] = 0.0f;

	skelMat->axis[1][0] = xy - zw;
	skelMat->axis[1][1] = 1.0f - (xx + zz);
	skelMat->axis[1][2] = yz + xw;
	skelMat->axis[1][3] = 0.0f;

	skelMat->axis[2][0] = xz + yw;
	skelMat->axis[2][1] = yz - xw;
	skelMat->axis[2][2] = 1.0f - (xx + yy);
	skelMat->axis[2][3] = 0.0f;

#line 379
	assert(!IS_NAN((skelMat->axis[0])[0]) && !IS_NAN((skelMat->axis[0])[1]) && !IS_NAN((skelMat->axis[0])[2]));
#line 380
	assert(!IS_NAN((skelMat->axis[1])[0]) && !IS_NAN((skelMat->axis[1])[1]) && !IS_NAN((skelMat->axis[1])[2]));
#line 381
	assert(!IS_NAN((skelMat->axis[2])[0]) && !IS_NAN((skelMat->axis[2])[1]) && !IS_NAN((skelMat->axis[2])[2]));

	VectorCopy(mat->trans, skelMat->origin);
	skelMat->origin[3] = 1.0f;
}

#line 82 "\\trees\\cod2src\\src\\xanim\\dobj.cpp"
void DObjInit()
{
	int duplicatePartBits[5];

	memset(duplicatePartBits, 0, sizeof(duplicatePartBits));
	g_empty = SL_GetStringOfLen((const char *)duplicatePartBits, 0, 17, 12);
}

void DObjShutdown()
{
	if ( g_empty )
	{
		SL_RemoveRefToStringOfLen(g_empty, 17);
		g_empty = 0;
	}
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

int FUN_004a1890(const DObj_s *obj, unsigned int name)
{
	int offset;
	XModel *model;
	int index;
	int i;
	int numModels;

#line 215
	assert(obj);
	numModels = obj->numModels;
	index = 0;

	for ( i = 0; i < numModels; ++i )
	{
		model = obj->models[i];
		offset = XModelGetBoneIndex(model, name);

		if ( offset >= 0 )
			return index + offset;

#line 226
		assertMsg((model->parts->numBones >= 0), "(model->parts->numBones) = %i", model->parts->numBones);
		index += model->parts->numBones;
	}

	return -1;
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

void DObjSetBounds(DObj_s *obj)
{
	int numModels;
	int i;
	vec3_t modelmins;
	vec3_t modelmaxs;
	vec3_t dobjmins;
	vec3_t dobjmaxs;

#line 977
	assert(obj);
	numModels = obj->numModels;

	VectorSet(dobjmins, 0, 0, 0);
	VectorSet(dobjmaxs, 0, 0, 0);

	for ( i = 0; i < numModels; ++i )
	{
		if ( obj->models[i] )
		{
			VectorCopy(obj->models[i]->mins, modelmins);
			VectorCopy(obj->models[i]->maxs, modelmaxs);

			dobjmins[0] = dobjmins[0] + modelmins[0];
			dobjmins[1] = dobjmins[1] + modelmins[1];
			dobjmins[2] = dobjmins[2] + modelmins[2];
			dobjmaxs[0] = dobjmaxs[0] + modelmaxs[0];
			dobjmaxs[1] = dobjmaxs[1] + modelmaxs[1];
			dobjmaxs[2] = dobjmaxs[2] + modelmaxs[2];
		}
	}

	VectorCopy(dobjmins, obj->mins);
	VectorCopy(dobjmaxs, obj->maxs);
}

void DObjClone(const DObj_s *from, XAnimTree_s *tree, DObj_s *obj)
{
	DObj_s *to;

#line 1126
	assert(obj);
	to = obj;
	*to = *from;
	to->skel = 0;

	if ( to->duplicateParts && to->duplicateParts != g_empty )
		SL_AddRefToString(to->duplicateParts);

	DObjSetTree(to, tree);
}

void DObjFree(DObj_s *obj)
{
	const char *string;
	size_t len;

#line 1147
	assert(obj);

	if ( obj->tree )
	{
#line 1152
		assert(obj->tree->anims);
#line 1153
		assert(obj->animToModel);
		obj->animToModel = 0;
		obj->tree = 0;
	}

#line 1159
	assert(g_empty);

	if ( obj->duplicateParts )
	{
		if ( obj->duplicateParts != g_empty )
		{
			string = SL_ConvertToString(obj->duplicateParts);
			len = strlen(string + 16);
			SL_RemoveRefToStringOfLen(obj->duplicateParts, len + 17);
		}

		obj->duplicateParts = 0;
	}
}

void DObjGetCreateParms(const DObj_s *obj, DObjModel_s *dobjModels, unsigned short *numModels, XAnimTree_s **tree, unsigned short *entnum)
{
	DObjModel_s *model;
	int i;
	int parentModelIndex;
	int boneIndex;
	unsigned short *boneNames;

#line 1176
	assert(obj);
#line 1177
	assert(obj->numModels > 0 && obj->numModels <= DOBJ_MAX_SUBMODELS);
#line 1178
	assert(dobjModels);
#line 1179
	assert(numModels);
#line 1180
	assert(tree);

	*numModels = obj->numModels;
	*tree = obj->tree;
	*entnum = obj->tree ? obj->tree->entnum : 0;

	for ( i = 0, model = dobjModels; i < obj->numModels; i++, model++ )
	{
		model->model = obj->models[i];
		model->boneName = 0;
		model->ignoreCollision = ( obj->ignoreCollision & (1 << i) ) ? qtrue : qfalse;

		if ( obj->modelParents[i] != 255 )
		{
			for ( parentModelIndex = i - 1; parentModelIndex >= 0; parentModelIndex-- )
			{
				if ( obj->modelParents[i] < obj->matOffset[parentModelIndex] )
					continue;

				boneIndex = obj->modelParents[i] - obj->matOffset[parentModelIndex];
#line 1204
				assert(boneIndex < XModelNumBones( obj->models[parentModelIndex] ));
				boneNames = XModelBoneNames(obj->models[parentModelIndex]);
				model->boneName = SL_ConvertToString(boneNames[boneIndex]);
				break;
			}
		}
	}
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

void DObjGetMatrixArray(const DObj_s *obj, const int *partBits, DObjSkelMat *skelMat)
{
	int i;
	int boneCount;
	DObjAnimMat *mat;

	boneCount = obj->numBones;
#line 1359
	assert(boneCount <= DOBJ_MAX_PARTS);

	mat = DObjGetRotTransArray(obj);
#line 1362
	assert(mat);

	for ( i = 0; i < boneCount; ++i, ++skelMat, ++mat )
	{
		if ( partBits[i >> 5] & (1 << (i & 0x1F)) )
			FUN_004a1170(mat, skelMat);
	}
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

int DObjGetBoneIndex(const DObj_s *obj, unsigned int boneName)
{
#line 1636
	assert(boneName);
#line 1640
	assertMsg(SL_IsLowercaseString( boneName ), "%s", va("%s", SL_ConvertToString(boneName)));
	return FUN_004a1890(obj, boneName);
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

void DObjGeomTraceline(DObj_s *obj, float *localStart, float *localEnd, int contentmask, DObjTrace_s *results)
{
	trace_t trace;
	DObjAnimMat *pose;

	results->partName = 0;
	results->partGroup = 0;
	trace.fraction = results->fraction;
#line 2091
	vassert((trace.fraction >= 0.0f && trace.fraction <= 1.0f), "(trace.fraction) = %g", trace.fraction);
	trace.surfaceFlags = 0;
	VectorClear(trace.normal);

	pose = DObjGetRotTransArray(obj);

	results->fraction = trace.fraction;
#line 2114
	vassert((results->fraction >= 0.0f && results->fraction <= 1.0f), "(results->fraction) = %g", results->fraction);
	results->surfaceflags = trace.surfaceFlags;
	VectorCopy(trace.normal, results->normal);
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

void DObjCalcAnim(const DObj_s *obj, int *partBits)
{
	int boneCount;
	DSkel_t *skel;
	DObjAnimMat *Mat;
	int i;
	XModelParts_s *parts;
	short *quats;
	int boneIndex;
	bool bNoPartBits;
	int animPartBits[4];

#line 2170
	assert(obj);
	skel = obj->skel;
#line 2173
	assert(skel);

	bNoPartBits = 1;

	for ( boneCount = 0; boneCount <= 3; ++boneCount )
	{
		animPartBits[boneCount] = ~partBits[boneCount] | skel->partBits.anim[boneCount];

		if ( ~animPartBits[boneCount] )
			bNoPartBits = 0;
	}

	if ( bNoPartBits )
		return;

	for ( boneCount = 0; boneCount <= 3; ++boneCount )
		skel->partBits.anim[boneCount] |= partBits[boneCount];

	Mat = &skel->Mat;
	boneIndex = 0;

	for ( i = 0; i < obj->numModels; ++i )
	{
		parts = obj->models[i]->parts;
		boneCount = parts->numRootBones;

		while ( boneCount )
		{
			if ( !(animPartBits[boneIndex >> 5] & (1 << (boneIndex & 0x1F))) )
			{
				Mat->quat[0] = 0.0f;
				Mat->quat[1] = 0.0f;
				Mat->quat[2] = 0.0f;
				Mat->quat[3] = 1.0f;
				VectorClear(Mat->trans);
			}

			--boneCount;
			++Mat;
			++boneIndex;
		}

		quats = parts->quats;
		boneCount = parts->numBones - parts->numRootBones;

		while ( boneCount )
		{
			if ( !(animPartBits[boneIndex >> 5] & (1 << (boneIndex & 0x1F))) )
			{
				Mat->quat[0] = (float)quats[0] * (1.0f / 32767.0f);
				Mat->quat[1] = (float)quats[1] * (1.0f / 32767.0f);
				Mat->quat[2] = (float)quats[2] * (1.0f / 32767.0f);
				Mat->quat[3] = (float)quats[3] * (1.0f / 32767.0f);
				VectorClear(Mat->trans);
			}

			--boneCount;
			++Mat;
			++boneIndex;
			quats += 4;
		}
	}
}

void DObjSetModel(DObj_s *obj, XModel *model)
{
	obj->skel = &model->parts->skel;
	obj->numBones = (byte)model->parts->numBones;
	obj->models[0] = model;
}
