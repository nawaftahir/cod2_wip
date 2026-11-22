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

#define DOBJ_MAX_PARTS 128
#define DOBJ_MAX_PART_BITS 4

#line 255
void DObjCreateDuplicateParts(DObj_s *obj)
{
	int boneCount;
	int numBones;
	XModel *model;
	int boneIndex;
	int localBoneIndex;
	int boneIter;
	XBoneHierarchy *hierarchy;
	unsigned short *name;
	byte *duplicateParts;
	int len;
	bool bRootMeld;
	int index;
	int parentIndex;
	XModelParts *modelParts;
	byte duplicatePartBits[0x444];

#line 259
	assert(!obj->duplicateParts);
#line 260
	assert(obj->numModels > 0);
#line 262
	assert(obj->numBones <= DOBJ_MAX_PARTS);
#line 263
	assert((DOBJ_MAX_PART_BITS * sizeof( int ) + obj->numBones * 2 * sizeof( unsigned char ) + 1) <= sizeof( duplicatePartBits ));

	duplicateParts = &duplicatePartBits[16];
	memset(duplicatePartBits, 0, 16);
	len = 0;
	numBones = obj->models[0]->parts->numBones;

	for ( boneCount = 1; boneCount < obj->numModels; ++boneCount )
	{
		model = obj->models[boneCount];

		if ( obj->modelParents[boneCount] == 0xFF )
		{
			modelParts = model->parts;
			hierarchy = modelParts->hierarchy;
			name = hierarchy->names;
			boneIter = modelParts->numBones;
			bRootMeld = 0;
			boneIndex = -1;

#line 282
			assert(numBones);
#line 283
			assert(numBones < DOBJ_MAX_PARTS);

			for ( localBoneIndex = 0; localBoneIndex < boneIter; ++localBoneIndex )
			{
				parentIndex = FUN_004a1890(obj, name[localBoneIndex]);
#line 291
				assertMsg((parentIndex >= 0), "(parentIndex) = %i", parentIndex);

				if ( parentIndex != numBones + localBoneIndex )
				{
					if ( !localBoneIndex )
						bRootMeld = 1;

#line 299
					assert(boneIndex + localBoneIndex + 1 < 256);
#line 300
					assert(parentIndex + 1 < 256);
#line 301
					assert(parentIndex < boneIndex + localBoneIndex);

					index = numBones + localBoneIndex;
					duplicateParts[len] = index + 1;
					((int *)duplicatePartBits)[index >> 5] |= 1 << (index & 0x1F);
#line 306
					assert(duplicateParts[len]);
					duplicateParts[++len] = parentIndex + 1;
#line 309
					assert(duplicateParts[len]);
					++len;
				}
			}

			if ( !bRootMeld )
			{
				Com_Printf(
				    "WARNING: Attempting to meld model, but root part '%s' of model '%s' not found in model '%s' or any of its descendants\n",
				    SL_ConvertToString(name[0]),
				    model->name,
				    obj->models[0]->name);
			}
		}

		numBones += model->parts->numBones;
	}

	if ( !g_empty )
	{
		byte emptyBits[17];

		memset(emptyBits, 0, sizeof(emptyBits));
		g_empty = SL_GetStringOfLen((const char *)emptyBits, 0, 17, 12);
#line 322
		assert(g_empty);
	}

	if ( len )
	{
		duplicateParts[len++] = 0;
		obj->duplicateParts = SL_GetStringOfLen((const char *)duplicatePartBits, 0, len + 16, 12);
	}
	else
	{
		obj->duplicateParts = g_empty;
	}
}

#line 355
void DObjGetHierarchyBits(DObj_s *obj, int boneIndex, int *partBits)
{
	int numModels;
	int i;
	int j;
	XModelParts_s *parts;
	const unsigned char *duplicateParts;
	byte *parentList;
	int localBoneIndex;
	const unsigned char *pos;
	int newBoneIndex;
	int startIndex[8];
	const int *duplicatePartBits;

#line 360
	assert(obj);
#line 362
	assert(boneIndex >= 0);
#line 363
	assert(boneIndex < obj->numBones);

	for ( i = 0; i < 4; ++i )
		partBits[i] = 0;

	numModels = obj->numModels;
#line 369
	assert(numModels > 0);

	if ( !obj->duplicateParts )
		DObjCreateDuplicateParts(obj);

#line 374
	assert(obj->duplicateParts);
	duplicatePartBits = (const int *)SL_ConvertToString(obj->duplicateParts);
	duplicateParts = (const unsigned char *)(duplicatePartBits + 4);
	pos = duplicateParts;

	startIndex[0] = 0;

	for ( j = 0; ; startIndex[j] = newBoneIndex )
	{
		parts = obj->models[j]->parts;
		newBoneIndex = startIndex[j] + parts->numBones;

		if ( newBoneIndex > boneIndex )
			break;

		if ( ++j == numModels )
			return;
	}

	for ( parentList = parts->hierarchy->parentList; ; )
	{
		localBoneIndex = boneIndex - startIndex[j];
#line 406
		assert(localBoneIndex >= 0);

		while ( 1 )
		{
			partBits[boneIndex >> 5] |= 1 << (boneIndex & 0x1F);

			if ( (byte)(((byte)(duplicatePartBits[boneIndex >> 5] >> (boneIndex & 0x1F)) ^ 1) & 1) )
			{
				newBoneIndex = localBoneIndex - parts->numRootBones;

				if ( newBoneIndex >= 0 )
				{
					boneIndex -= parentList[newBoneIndex];
					break;
				}

				boneIndex = obj->modelParents[j];

				if ( boneIndex == 255 )
					return;
			}
			else
			{
				for ( pos = duplicateParts; ; pos += 2 )
				{
#line 431
					assert(*pos);

					if ( boneIndex == *pos - 1 )
					{
						boneIndex = pos[1] - 1;
						break;
					}
				}
			}

			localBoneIndex = boneIndex - startIndex[--j];
#line 444
			assert(j >= 0);

			if ( localBoneIndex >= 0 )
			{
				parts = obj->models[j]->parts;
				parentList = parts->hierarchy->parentList;
				break;
			}
		}
	}
}

#line 474
void DObjCompleteHierarchyBits(DObj_s *obj, int *partBits)
{
	int numModels;
	int i;
	int j;
	XModelParts_s *parts;
	const unsigned char *duplicateParts;
	byte *parentList;
	int localBoneIndex;
	const unsigned char *pos;
	int newBoneIndex;
	int startIndex[8];
	const int *duplicatePartBits;
	int boneIndex;

#line 479
	assert(obj);
#line 480
	assert(obj->numBones > 0);

	boneIndex = obj->numBones - 1;
	numModels = obj->numModels;
#line 485
	assert(numModels > 0);

	if ( !obj->duplicateParts )
		DObjCreateDuplicateParts(obj);

#line 490
	assert(obj->duplicateParts);
	duplicatePartBits = (const int *)SL_ConvertToString(obj->duplicateParts);
	duplicateParts = (const unsigned char *)(duplicatePartBits + 4);
	pos = duplicateParts;

	startIndex[0] = 0;

	for ( j = 0; ; startIndex[j] = newBoneIndex )
	{
		parts = obj->models[j]->parts;
		newBoneIndex = startIndex[j] + parts->numBones;

		if ( newBoneIndex > boneIndex )
			break;

		++j;
#line 507
		assert(j != numModels);
	}

	parentList = parts->hierarchy->parentList;

	while ( 1 )
	{
		localBoneIndex = boneIndex - startIndex[j];

		if ( localBoneIndex < 0 )
		{
			--j;

			if ( j < 0 )
				return;

			parts = obj->models[j]->parts;
			parentList = parts->hierarchy->parentList;
			continue;
		}

		if ( (byte)(((byte)(partBits[boneIndex >> 5] >> (boneIndex & 0x1F)) ^ 1) & 1) )
		{
			--boneIndex;
			continue;
		}

		if ( (byte)(((byte)(duplicatePartBits[boneIndex >> 5] >> (boneIndex & 0x1F)) ^ 1) & 1) )
		{
			newBoneIndex = localBoneIndex - parts->numRootBones;

			if ( newBoneIndex >= 0 )
			{
				newBoneIndex = boneIndex - parentList[newBoneIndex];
			}
			else
			{
				newBoneIndex = obj->modelParents[j];

				if ( newBoneIndex == 255 )
				{
					--boneIndex;
					continue;
				}
			}
		}
		else
		{
			for ( pos = duplicateParts; ; pos += 2 )
			{
#line 558
				assert(*pos);

				if ( boneIndex == *pos - 1 )
				{
					newBoneIndex = pos[1] - 1;
					break;
				}
			}
		}

#line 568
		assert((unsigned)newBoneIndex < obj->numBones);
		partBits[newBoneIndex >> 5] |= 1 << (newBoneIndex & 0x1F);
		--boneIndex;
	}
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

extern "C" int FUN_004a5a60(const DObj_s *obj)
{
	int i;

	for ( i = obj->numModels - 1; i >= 0; i-- )
	{
		if ( XModelBad(obj->models[i]) )
			return 1;
	}
	return 0;
}

#line 1703
int DObjNumBones(const DObj *obj)
{
	return obj->numBones;
}

void InvMatrixTransformVectorQuatTrans(const float *in, const DObjAnimMat *mat, float *out)
{
	float temp[3];
	float axis[3][3];

	VectorSubtract(in, mat->trans, temp);
	ConvertQuatToMat(mat, axis);

	out[0] = temp[0] * axis[0][0] + temp[1] * axis[0][1] + temp[2] * axis[0][2];
	out[1] = temp[0] * axis[1][0] + temp[1] * axis[1][1] + temp[2] * axis[1][2];
	out[2] = temp[0] * axis[2][0] + temp[1] * axis[2][1] + temp[2] * axis[2][2];
}

#line 1830
void DObjTraceline(DObj_s *obj, float *start, float *end, unsigned char *priorityMap, DObjTrace_s *trace)
{
	vec3_t delta;
	float invL2;
	XModel *model;
	XModelParts_s *parts;
	float d2;
	int numBones;
	DObjAnimMat *boneMatrix;
	DObjAnimMat *hitBoneMatrix;
	float axis[3][3];
	vec3_t center;
	vec3_t startOffset;
	vec3_t enfOffset;
	float sphereFraction;
	vec3_t offset;
	float diff2;
	vec3_t localStart;
	vec3_t localEnd;
	float enterFrac;
	float fraction;
	float solidHitFrac;
	float dist1;
	float dist2;
	float dist;
	int i;
	float *bounds;
	char bStartSolid;
	char bEndSolid;
	float sign;
	int localBoneIndex;
	float hitSign;
	int hitT;
	int traceHitT;
	int globalBoneIndex;
	DSkel_t *skel;
	int modelIter;
	unsigned int lowestPriority;
	unsigned int currentPriority;
	unsigned short *name;
	const unsigned char *pos;
	XBoneInfo *boneInfo;
	int ignoreCollision;
	unsigned char parentIndex;
	XBoneHierarchy *hierarchy;
	unsigned short classification;
	float deltaLengthSq;
	unsigned short classificationArray[128];

	skel = obj->skel;
#line 1838
	assert(skel);
#line 1840
	assert(obj->duplicateParts);
#line 1844
	assert(!IS_NAN((start)[0]) && !IS_NAN((start)[1]) && !IS_NAN((start)[2]));
#line 1845
	assert(!IS_NAN((end)[0]) && !IS_NAN((end)[1]) && !IS_NAN((end)[2]));

	trace->surfaceflags = 0;
	trace->partName = 0;
	trace->partGroup = 0;
	VectorClear(trace->normal);
	VectorSubtract(end, start, delta);
	deltaLengthSq = VectorLengthSquared(delta);

	if ( deltaLengthSq == 0.0 )
		return;

	boneMatrix = DObjGetRotTransArray(obj);

	if ( !boneMatrix )
		return;

	invL2 = 1.0f / deltaLengthSq;
	lowestPriority = 2;
	pos = (const unsigned char *)(SL_ConvertToString(obj->duplicateParts) + 16);
	globalBoneIndex = 0;
	hitT = -1;
	traceHitT = -1;
	hitSign = 0.0;
	hitBoneMatrix = 0;
	solidHitFrac = trace->fraction;

	for ( modelIter = 0; modelIter < obj->numModels; ++modelIter )
	{
		model = obj->models[modelIter];
		parts = model->parts;
		hierarchy = parts->hierarchy;
		name = hierarchy->names;
		numBones = parts->numBones;
		ignoreCollision = obj->ignoreCollision & (1 << modelIter);

		for ( localBoneIndex = 0; localBoneIndex < numBones; ++localBoneIndex, ++boneMatrix, ++globalBoneIndex )
		{
#line 1904
			assert(skel->partBits.skel[globalBoneIndex >> 5] & (1 << (globalBoneIndex & 31)));
#line 1909
			assert(!IS_NAN((boneMatrix->quat)[0]) && !IS_NAN((boneMatrix->quat)[1]) && !IS_NAN((boneMatrix->quat)[2]) && !IS_NAN((boneMatrix->quat)[3]));
#line 1910
			assert(!IS_NAN((boneMatrix->trans)[0]) && !IS_NAN((boneMatrix->trans)[1]) && !IS_NAN((boneMatrix->trans)[2]));

			classification = parts->partClassification[localBoneIndex];
			currentPriority = priorityMap[classification];

			if ( globalBoneIndex == *pos - 1 )
			{
				pos += 2;

				if ( currentPriority == 1 )
				{
					classification = classificationArray[*(pos - 1) - 1];
					currentPriority = priorityMap[classification];
				}
			}
			else if ( currentPriority == 1 )
			{
				if ( localBoneIndex < parts->numRootBones )
				{
					parentIndex = obj->modelParents[modelIter];

					classification = parentIndex != 0xFF ? classificationArray[parentIndex] : 0;
				}
				else
				{
					classification = classificationArray[globalBoneIndex
					                                     - hierarchy->parentList[localBoneIndex - parts->numRootBones]];
				}

				currentPriority = priorityMap[classification];
			}

			classificationArray[globalBoneIndex] = classification;

			if ( ignoreCollision )
				continue;

			boneInfo = &model->boneInfo[localBoneIndex];

			if ( boneInfo->radiusSquared == 0.0 )
				continue;
			if ( lowestPriority > currentPriority )
				continue;

			MatrixTransformVectorQuatTrans(boneInfo->offset, boneMatrix, center);
			VectorSubtract(start, center, startOffset);
			sphereFraction = -DotProduct(startOffset, delta) * invL2;

			if ( sphereFraction < 1.0f )
			{
				if ( sphereFraction > 0.0f )
				{
					VectorMA(startOffset, sphereFraction, delta, offset);
					d2 = VectorLengthSquared(offset);
				}
				else
				{
					d2 = VectorLengthSquared(startOffset);
				}
			}
			else
			{
				VectorSubtract(end, center, enfOffset);
				d2 = VectorLengthSquared(enfOffset);
			}

			diff2 = boneInfo->radiusSquared - d2;

			if ( diff2 <= 0.0f )
				continue;
			if ( lowestPriority == currentPriority
			        && (float)(sphereFraction - sqrtf(diff2 * invL2)) >= trace->fraction )
				continue;

			InvMatrixTransformVectorQuatTrans(start, boneMatrix, localStart);
			InvMatrixTransformVectorQuatTrans(end, boneMatrix, localEnd);
#line 1947
			assert(!IS_NAN((localStart)[0]) && !IS_NAN((localStart)[1]) && !IS_NAN((localStart)[2]));
#line 1948
			assert(!IS_NAN((localEnd)[0]) && !IS_NAN((localEnd)[1]) && !IS_NAN((localEnd)[2]));
			enterFrac = 0.0;

			if ( lowestPriority == currentPriority )
				fraction = trace->fraction;
			else
				fraction = solidHitFrac;

			bStartSolid = 1;
			bEndSolid = 1;
			sign = -1.0;

			for ( bounds = boneInfo->bounds[0]; ; bounds += 3 )
			{
#line 1963
				assert(!IS_NAN((bounds)[0]) && !IS_NAN((bounds)[1]) && !IS_NAN((bounds)[2]));

				for ( i = 0; i < 3; ++i )
				{
					dist1 = (localStart[i] - bounds[i]) * sign;
					dist2 = (localEnd[i] - bounds[i]) * sign;

					if ( dist1 > 0.0 )
					{
						if ( dist2 > 0.0 )
							goto out;

						bStartSolid = 0;
						dist = dist1 - dist2;
#line 1977
						assert(dist > 0);

						if ( dist1 > enterFrac * dist )
						{
							enterFrac = dist1 / dist;
							if ( enterFrac >= fraction )
								goto out;

							hitSign = sign;
							hitT = i;
						}
					}
					else if ( dist2 > 0.0 )
					{
						bEndSolid = 0;
						dist = dist1 - dist2;
#line 1991
						assert(dist < 0);

						if ( dist1 > fraction * dist )
						{
							fraction = dist1 / dist;

							if ( enterFrac >= fraction )
								goto out;
						}
					}
				}

				if ( sign == 1.0 )
					break;

				sign = 1.0;
			}

			if ( bStartSolid )
			{
				if ( bEndSolid == 0 )
					continue;
				if ( Dot2Product(delta, start) > 0.0 )
					continue;

				trace->fraction = 0.0;
				trace->partName = name[localBoneIndex];
				trace->partGroup = classification;

				if ( delta[0] != 0.0 || delta[1] != 0.0 )
				{
					Vector2Copy(start, trace->normal);
					Vec2Normalize(trace->normal);
				}
				else
				{
					trace->normal[2] = -I_sgn(delta[2]);
				}
				return;
			}

			if ( lowestPriority == currentPriority )
			{
				if ( enterFrac >= trace->fraction )
					continue;
			}
			else
			{
				lowestPriority = currentPriority;
			}

			trace->fraction = enterFrac;
			trace->partName = name[localBoneIndex];
			trace->partGroup = classification;
			traceHitT = hitT;
			hitBoneMatrix = boneMatrix;
out:
			;
		}
	}

	if ( hitBoneMatrix )
	{
#line 2050
		assert(hitT >= 0);
#line 2051
		assert(hitT < 3);
#line 2061
		assert(traceHitT >= 0);
#line 2062
		assert(traceHitT < 3);
		ConvertQuatToMat(hitBoneMatrix, axis);
		VectorScale(axis[traceHitT], hitSign, trace->normal);
	}
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

static void DObjClearAngles(DObjAnimMat *rotTrans)
{
	rotTrans->quat[0] = 0.0f;
	rotTrans->quat[1] = 0.0f;
	rotTrans->quat[2] = 0.0f;
	rotTrans->quat[3] = 1.0f;
}

int DObjHasContents(DObj_s *obj, int contentmask)
{
	int i;

	for ( i = 0; i < obj->numModels; ++i )
	{
		if ( (contentmask & XModelGetContents(obj->models[i])) != 0 )
			return 1;
	}

	return 0;
}

static void DObjSetTrans(DObjAnimMat *rotTrans, const float *trans)
{
	rotTrans->transWeight = 0.0f;
	rotTrans->trans[0] = trans[0];
	rotTrans->trans[1] = trans[1];
	rotTrans->trans[2] = trans[2];
}

void DObjSetLocalTagInternal(const DObj_s *obj, const float *trans, const float *angles, int boneIndex)
{
	DObjAnimMat *rotTrans;
	float yaw[2], pitch[2], roll[2];
	float t[4];

	rotTrans = DObjGetRotTransArray(obj);

	if ( rotTrans )
	{
		rotTrans += boneIndex;

		if ( angles )
		{
			/* the asm in FastSinCos stops DObjSetAngles from being inlined, so it is spelled out here */
			FastSinCos(angles[1] * 0.0087266462f, &yaw[0], &yaw[1]);
			FastSinCos(angles[0] * 0.0087266462f, &pitch[0], &pitch[1]);
			FastSinCos(angles[2] * 0.0087266462f, &roll[0], &roll[1]);
			t[0] = -(pitch[0] * yaw[0]);
			t[1] = yaw[1] * pitch[0];
			t[2] = pitch[1] * yaw[0];
			t[3] = pitch[1] * yaw[1];
			rotTrans->quat[0] = roll[0] * t[3] + roll[1] * t[0];
			rotTrans->quat[1] = roll[0] * t[2] + roll[1] * t[1];
			rotTrans->quat[2] = roll[1] * t[2] - roll[0] * t[1];
			rotTrans->quat[3] = roll[1] * t[3] - roll[0] * t[0];
		}
		else
			DObjClearAngles(rotTrans);

		DObjSetTrans(rotTrans, trans);
	}
}

int DObjSetControlTagAngles(const DObj_s *obj, int *partBits, unsigned int boneIndex, float *angles)
{
	int index;

	index = DObjGetBoneIndex(obj, boneIndex);

	if ( index < 0 )
		return false;

	if ( !DObjSetControlRotTransIndex(obj, partBits, index) )
		return false;

	DObjSetLocalTagInternal(obj, vec3_origin, angles, index);
	return true;
}

int DObjSetLocalTag(const DObj_s *obj, int *partBits, unsigned int boneIndex, const float *trans, const float *angles)
{
	int index;

	index = DObjGetBoneIndex(obj, boneIndex);

	if ( index < 0 )
		return false;

	if ( !DObjSetRotTransIndex(obj, partBits, index) )
		return false;

	DObjSetLocalTagInternal(obj, trans, angles, index);
	return true;
}

int DObjSetLocalBoneIndex(const DObj_s *obj, int *partBits, int boneIndex, const float *trans, const float *angles)
{
	if ( !DObjSetRotTransIndex(obj, partBits, boneIndex) )
		return 0;

	DObjSetLocalTagInternal(obj, trans, angles, boneIndex);
	return 1;
}

void DObjSetModel(DObj_s *obj, XModel *model)
{
	obj->skel = &model->parts->skel;
	obj->numBones = (byte)model->parts->numBones;
	obj->models[0] = model;
}
