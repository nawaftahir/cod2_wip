
#include "../qcommon/qcommon.h"
#include "../universal/dvar.h"
#include "../universal/com_files.h"
#include "../universal/com_memory.h"
#include "../script/script_public.h"
#include "xanim_public.h"

struct XSurface;

struct refexport_t
{
	void *pad0[119];
	XSurface *(*XModelReadSurface)(XModel *, int *, const unsigned char **, void *(*)(int));
	Material *(*R_LoadXSkins)(XModel *);
};
extern refexport_t re;

void MatrixTransformVector(const float *in, const float (*mat)[3], float *out);


void ConsumeQuat(const unsigned char **pos, short *out)
{
	int iQ[4];
	int temp;

	out[0] = XModelDataReadShort(pos);
	out[1] = XModelDataReadShort(pos);
	out[2] = XModelDataReadShort(pos);

	iQ[0] = out[0];
	iQ[1] = out[1];
	iQ[2] = out[2];
	temp = 1073676289 - iQ[2] * iQ[2] - iQ[1] * iQ[1] - iQ[0] * iQ[0];
	iQ[3] = temp > 0 ? (int)floor(I_sqrt((float)temp) + 0.5f) : 0;
	assert(iQ[3] == (short)iQ[3]);
	out[3] = iQ[3];
}

void XModelCalcBasePose(XModelParts_s *modelParts)
{
	vec4_t tempQuat;
	unsigned char *parentList;
	DObjAnimMat *quatTrans;
	int numBones, numRootBones;
	float *trans;
	short *quats;
	parentList = modelParts->hierarchy->parentList;
	numBones = modelParts->numBones;
	quats = modelParts->quats;
	trans = modelParts->trans;


	quatTrans = &modelParts->skel.Mat;
	numRootBones = modelParts->numRootBones;
	while (numRootBones)
	{
		VectorClear(quatTrans->quat);
		quatTrans->quat[3] = 1.0;
		VectorClear(quatTrans->trans);
		quatTrans->transWeight = 2.0;
		--numRootBones;
		++quatTrans;
	}
	numRootBones = numBones - modelParts->numRootBones;
	while (numRootBones)
	{
		tempQuat[0] = (float)quats[0] * 0.000030518509f;
		tempQuat[1] = (float)quats[1] * 0.000030518509f;
		tempQuat[2] = (float)quats[2] * 0.000030518509f;
		tempQuat[3] = (float)quats[3] * 0.000030518509f;
		QuatMultiply(tempQuat, quatTrans[-*parentList].quat, quatTrans->quat);
		DObjCalcTransWeight(quatTrans);










		MatrixTransformVectorQuatTrans(trans, &quatTrans[-*parentList], quatTrans->trans);
		--numRootBones;
		quats += 4;
		trans += 3;
		++quatTrans;
		++parentList;
	}
	memset(&modelParts->skel, 255, 0x10u);
	memset(modelParts->skel.partBits.skel, 255, sizeof(modelParts->skel.partBits.skel));
}
XModelParts_s *XModelPartsLoadFile(XModel *model, const char *name, void *(*Alloc)(int))
{
	int fileSize;
	short *quats;
	short version;
	unsigned int len;
	float *trans;
	int boneIter;
	int num;
	short numChildBones;
	short numRootBones;
	short numBones;
	byte *parentList;
	unsigned short *boneNames;
	XBoneHierarchy *boneHiearchy;
	const unsigned char *pos;
	void *buf;
	char filename[64];
	XModelParts_s *modelParts;
	int index;

	if (Com_sprintf(filename, sizeof(filename), "xmodelparts/%s", name) < 0)
	{
		Com_Printf("^1ERROR: filename '%s' too long\n", filename);
		return 0;
	}

	fileSize = FS_ReadFile(filename, &buf);

	if (fileSize < 0)
	{
		assert(!buf);
		Com_Printf("^1ERROR: xmodelparts '%s' not found\n", name);
		return 0;
	}

	if (fileSize == 0)
	{
		Com_Printf("^1ERROR: xmodelparts '%s' has 0 length\n", name);
		FS_FreeFile(buf);
		return 0;
	}

	assert(buf);
	pos = (const unsigned char *)buf;
	version = XModelDataReadShort(&pos);

	if (version != XMODEL_VERSION)
	{
		FS_FreeFile(buf);
		Com_Printf("^1ERROR: xmodelparts '%s' out of date (version %d, expecting %d).\n", name, version, XMODEL_VERSION);
		return 0;
	}

	numChildBones = XModelDataReadShort(&pos);
	numRootBones = XModelDataReadShort(&pos);
	numBones = numRootBones + numChildBones;


	boneNames = (unsigned short *)Alloc(sizeof(short) * numBones);
	model->memUsage += sizeof(short) * numBones;

	if (numBones >= 128)
	{
		FS_FreeFile(buf);
		Com_Printf("^1ERROR: xmodel '%s' has more than %d bones\n", name, 127);
		return 0;
	}

	boneHiearchy = (XBoneHierarchy *)Alloc(numChildBones + sizeof(XBoneHierarchy) - 1);
	model->memUsage += numChildBones + sizeof(XBoneHierarchy) - 1;


	boneHiearchy->names = boneNames;
	parentList = boneHiearchy->parentList;
	modelParts = (XModelParts_s *)Alloc(sizeof(DObjAnimMat) * numBones + (sizeof(XModelParts_s) - sizeof(DObjAnimMat)));
	model->memUsage += sizeof(DObjAnimMat) * numBones + sizeof(XModelParts_s) - sizeof(DObjAnimMat);
	modelParts->hierarchy = boneHiearchy;



	if (numChildBones)
	{
		modelParts->quats = (short *)Alloc(8 * numChildBones);
		model->memUsage += 8 * numChildBones;
		modelParts->trans = (float *)Alloc(16 * numChildBones);
		model->memUsage += 16 * numChildBones;
	}
	else
	{
		modelParts->quats = 0;
		modelParts->trans = 0;
	}



	modelParts->partClassification = (byte *)Alloc(numBones);
	model->memUsage += numBones;


	modelParts->numBones = numBones;
	modelParts->numRootBones = numRootBones;
	quats = modelParts->quats;
	trans = modelParts->trans;
	boneIter = numRootBones;






	while (boneIter < numBones)
	{
		index = *pos++;
		assert(index >= 0);
		assert(index < boneIter);
		*parentList = boneIter - index;
		assert(boneIter - index == *parentList);
		trans[0] = XModelDataReadFloat(&pos);
		trans[1] = XModelDataReadFloat(&pos);
		trans[2] = XModelDataReadFloat(&pos);
		ConsumeQuat(&pos, quats);
		++boneIter;
		quats += 4;
		trans += 3;
		++parentList;
	}

	for (num = 0; num < numBones; ++num)
	{
		len = I_strlen((char *)pos) + 1;
		boneNames[num] = SL_GetStringOfLen((const char *)pos, 0, len, 10);
		pos += len;
	}

	memcpy(modelParts->partClassification, pos, numBones);
	FS_FreeFile(buf);
	XModelCalcBasePose(modelParts);

	return modelParts;
}

bool XModelLoadConfigFile(const char *name, const unsigned char **pos, XModelConfig *config)
{
	short version;
	int i;

	version = XModelDataReadShort(pos);

	if (version != XMODEL_VERSION)
	{
		Com_Printf("^1ERROR: xmodel '%s' out of date (version %d, expecting %d).\n", name, version, XMODEL_VERSION);
		return false;
	}

	config->flags = *(*pos)++;

	config->mins[0] = XModelDataReadFloat(pos);
	config->mins[1] = XModelDataReadFloat(pos);
	config->mins[2] = XModelDataReadFloat(pos);
	config->maxs[0] = XModelDataReadFloat(pos);
	config->maxs[1] = XModelDataReadFloat(pos);
	config->maxs[2] = XModelDataReadFloat(pos);

	for (i = 0; i < 4; i++)
	{
		config->entries[i].dist = XModelDataReadFloat(pos);
		strcpy(config->entries[i].filename, (const char *)*pos);
		*pos += strlen((const char *)*pos) + 1;
	}

	config->collLod = XModelDataReadInt(pos);
	return true;
}





void XModelLoadCollData(const unsigned char **pos, XModel *model, void *(*AllocColl)(int), const char *name)
{
	int j;
	int i;
	XModelCollSurf_s *surf;
	XModelCollTri_s *tri;

	assert(!model->contents);
	model->numCollSurfs = XModelDataReadInt(pos);
	if (!model->numCollSurfs)
	{
		assert(!model->collSurfs);
		return;
	}





	model->collSurfs = (XModelCollSurf_s *)AllocColl(sizeof(XModelCollSurf_s) * model->numCollSurfs);

	for (i = 0; i < model->numCollSurfs; ++i)
	{
		surf = &model->collSurfs[i];
		surf->numCollTris = XModelDataReadInt(pos);
		assert(surf->numCollTris);
		surf->collTris = (XModelCollTri_s *)AllocColl(sizeof(XModelCollTri_s) * surf->numCollTris);

		for (j = 0; j < surf->numCollTris; ++j)
		{



			tri = &surf->collTris[j];
			tri->plane[0] = XModelDataReadFloat(pos);
			tri->plane[1] = XModelDataReadFloat(pos);
			tri->plane[2] = XModelDataReadFloat(pos);
			tri->plane[3] = XModelDataReadFloat(pos);
			assertMsg(I_fabs( VectorLength( tri->plane ) - 1.0f ) < 0.01f, "%s", name);
			tri->svec[0] = XModelDataReadFloat(pos);
			tri->svec[1] = XModelDataReadFloat(pos);
			tri->svec[2] = XModelDataReadFloat(pos);
			tri->svec[3] = XModelDataReadFloat(pos);
			tri->tvec[0] = XModelDataReadFloat(pos);
			tri->tvec[1] = XModelDataReadFloat(pos);
			tri->tvec[2] = XModelDataReadFloat(pos);
			tri->tvec[3] = XModelDataReadFloat(pos);
		}





		surf->mins[0] = XModelDataReadFloat(pos) - 0.001f;
		surf->mins[1] = XModelDataReadFloat(pos) - 0.001f;
		surf->mins[2] = XModelDataReadFloat(pos) - 0.001f;
		surf->maxs[0] = XModelDataReadFloat(pos) + 0.001f;
		surf->maxs[1] = XModelDataReadFloat(pos) + 0.001f;
		surf->maxs[2] = XModelDataReadFloat(pos) + 0.001f;
		surf->boneIdx = XModelDataReadInt(pos);
		surf->contents = XModelDataReadInt(pos) & 0xDFFFFFFB;

		assert(!surf->contents || (surf->boneIdx >= 0));
		surf->surfFlags = XModelDataReadInt(pos);
		model->contents |= surf->contents;
	}
}

XModelParts_s *XModelPartsPrecache(XModel *model, const char *name, void *(*Alloc)(int))
{
	XModelParts_s *parts;

	parts = (XModelParts_s *)Hunk_FindDataForFile(FILEDATA_XMODELPARTS, name);
	if (parts)
		return parts;

	parts = XModelPartsLoadFile(model, name, Alloc);
	if (!parts)
	{
		Com_Printf("^1ERROR: Cannot find xmodelparts '%s'.\n", name);
		return 0;
	}

	Hunk_SetDataForFile(FILEDATA_XMODELPARTS, name, parts, Alloc);
	return parts;
}















XModel *XModelLoadFile(const char *name, void *(*Alloc)(int), void *(*AllocColl)(int))
{
	int fileSize, allocSize, i, j;
	XBoneInfo *boneInfo;
	void *buf;
	char filename[64];
	int nameLenTotal;
	char *dest;
	const unsigned char *pos;
	int lodStringLens[4];
	XModel *model;
	XModelConfig config;

	if (Com_sprintf(filename, sizeof(filename), "xmodel/%s", name) < 0)
	{
		Com_Printf("^1ERROR: filename '%s' too long\n", filename);
		return 0;
	}

	fileSize = FS_ReadFile(filename, &buf);

	if (fileSize < 0)
	{
		assert(!buf);
		if (!strstr(name, "shadow"))
			Com_Printf("^1ERROR: xmodel '%s' not found\n", name);
		return 0;
	}

	if (fileSize == 0)
	{
		Com_Printf("^1ERROR: xmodel '%s' has 0 length\n", name);
		FS_FreeFile(buf);
		return 0;
	}

	pos = (const unsigned char *)buf;

	if (!XModelLoadConfigFile(name, &pos, &config))
	{
		FS_FreeFile(buf);
		return 0;
	}

	nameLenTotal = 0;

	for (i = 0; i < 4; i++)
	{
		lodStringLens[i] = I_strlen(config.entries[i].filename) + 1;
		nameLenTotal += lodStringLens[i];
	}

	model = (XModel *)Alloc(nameLenTotal + sizeof(XModel));
	model->memUsage = nameLenTotal + sizeof(XModel);

	XModelLoadCollData(&pos, model, AllocColl, name);

	dest = (char *)&model[1];
	model->numLods = 0;

	for (i = 0; i < 4; i++)
	{
		strcpy(dest, config.entries[i].filename);
		model->lodInfo[i].filename = dest;

		if (*dest)
		{
			model->numLods++;
			model->lodInfo[i].numsurfs = XModelDataReadShort(&pos);

			allocSize = sizeof(short) * model->lodInfo[i].numsurfs;

			model->lodInfo[i].surfNames = (unsigned short *)Alloc(allocSize);
			model->memUsage += allocSize;

			for (j = 0; j < model->lodInfo[i].numsurfs; j++)
			{
				const char *s = (const char *)pos;
				pos += strlen((const char *)pos) + 1;
				model->lodInfo[i].surfNames[j] = SL_GetStringOfLen(s, 0, strlen(s) + 1, 8);
			}
		}
		else
		{
			model->lodInfo[i].surfNames = 0;
		}

		model->lodInfo[i].dist = config.entries[i].dist;
		dest += lodStringLens[i];
	}

	assert(model->numLods);
	model->parts = XModelPartsPrecache(model, model->lodInfo[0].filename, Alloc);

	if (!model->parts)
	{
		FS_FreeFile(buf);
		XModelFree(model);
		return 0;
	}

	boneInfo = (XBoneInfo *)Alloc(sizeof(XBoneInfo) * model->parts->numBones);
	model->memUsage += sizeof(XBoneInfo) * model->parts->numBones;

	for (i = 0; i < model->parts->numBones; i++)
	{
		boneInfo[i].bounds[0][0] = XModelDataReadFloat(&pos);
		boneInfo[i].bounds[0][1] = XModelDataReadFloat(&pos);
		boneInfo[i].bounds[0][2] = XModelDataReadFloat(&pos);

		boneInfo[i].bounds[1][0] = XModelDataReadFloat(&pos);
		boneInfo[i].bounds[1][1] = XModelDataReadFloat(&pos);
		boneInfo[i].bounds[1][2] = XModelDataReadFloat(&pos);

		boneInfo[i].offset[0] = (boneInfo[i].bounds[0][0] + boneInfo[i].bounds[1][0]) * 0.5f;
		boneInfo[i].offset[1] = (boneInfo[i].bounds[0][1] + boneInfo[i].bounds[1][1]) * 0.5f;
		boneInfo[i].offset[2] = (boneInfo[i].bounds[0][2] + boneInfo[i].bounds[1][2]) * 0.5f;

		vec3_t r;
		VectorSubtract(boneInfo[i].bounds[1], boneInfo[i].offset, r);
		boneInfo[i].radiusSquared = VectorLengthSquared(r);
	}

	model->boneInfo = boneInfo;




	FS_FreeFile(buf);

	VectorCopy(config.mins, model->mins);
	VectorCopy(config.maxs, model->maxs);

	model->collLod = config.collLod;
	assert(model->collLod < model->numLods);

	model->flags = config.flags;

	return model;
}




void *FUN_004ac3e0(XModel *model, int *partBits, const unsigned char **pos, void *(*Alloc)(int))
{
	assert(re.XModelReadSurface);
	return re.XModelReadSurface(model, partBits, pos, Alloc);
}


Material *FUN_004ac430(XModel *model)
{
	assert(re.R_LoadXSkins);
	return re.R_LoadXSkins(model);
}

bool FUN_004ac480()
{
	return re.XModelReadSurface != 0;
}















void FUN_004ac490(XModel *model, int *modelPartBits, const unsigned char **pos, void *(*Alloc)(int), XSurface **modelSurfs, int surfCount)
{
	int i;

	assert(modelSurfs);
	assert(modelPartBits);
	assert(surfCount > 0);
	assert(pos);
	assert(*pos);

	for (i = 0; i < surfCount; i++)
		modelSurfs[i] = (XSurface *)FUN_004ac3e0(model, modelPartBits, pos, Alloc);
}




XModelSurfs_s *FUN_004ac650(short numsurfs, XModel *model, const char *name, void *(*Alloc)(int), const char *modelName)
{
	char filename[64];
	void *buf;
	const unsigned char *pos;
	short version;
	int fileSize, allocSize;
	XModelSurfs_s *surfs;

	if (Com_sprintf(filename, sizeof(filename), "xmodelsurfs/%s", name) < 0)
	{
		Com_Printf("^1ERROR: filename '%s' too long\n", filename);
		return 0;
	}

	fileSize = FS_ReadFile(filename, &buf);

	if (fileSize < 0)
	{
		assert(!buf);
		Com_Printf("^1ERROR: xmodelsurf '%s' not found\n", name);
		return 0;
	}

	if (fileSize == 0)
	{
		Com_Printf("^1ERROR: xmodelsurf '%s' has 0 length\n", name);
		FS_FreeFile(buf);
		return 0;
	}

	assert(buf);
	pos = (const unsigned char *)buf;
	version = XModelDataReadShort(&pos);

	if (version != XMODEL_VERSION)
	{
		FS_FreeFile(buf);
		Com_Printf("^1ERROR: xmodelsurfs '%s' out of date (version %d, expecting %d).\n", name, version, XMODEL_VERSION);
		return 0;
	}

	if (XModelDataReadShort(&pos) != numsurfs)
	{
		FS_FreeFile(buf);
		Com_Printf("^1ERROR: File conflict (between non-iwd and iwd file) on xmodelsurfs '%s' for xmodel '%s'.\nRename the export file to fix.\n", name, modelName);
		return 0;
	}

	allocSize = sizeof(XModelSurfs_s) + sizeof(XSurface *) * numsurfs;
	surfs = (XModelSurfs_s *)Alloc(allocSize);
	model->memUsage += allocSize;
	surfs->surf = (XSurface *)(surfs + 1);
	FUN_004ac490(model, surfs->partBits, &pos, Alloc, (XSurface **)(surfs + 1), numsurfs);
	FS_FreeFile(buf);
	return surfs;
}

XModelSurfs_s *FUN_004ac860(void *(*Alloc)(int), const char *name, XModel *model, short numsurfs, const char *modelName)
{
	XModelSurfs_s *surfs;

	surfs = (XModelSurfs_s *)Hunk_FindDataForFile(FILEDATA_XMODELSURFS, name);
	if (surfs)
		return surfs;

	surfs = FUN_004ac650(numsurfs, model, name, Alloc, modelName);
	if (!surfs)
	{
		Com_Printf("^1ERROR: Cannot find 'xmodelsurfs '%s'.\n", name);
		return 0;
	}

	Hunk_SetDataForFile(FILEDATA_XMODELSURFS, name, surfs, Alloc);
	return surfs;
}











bool FUN_004ac8d0(XModel *model, void *(*Alloc)(int))
{
	int i;

	assert(model);
	assert(model->lodInfo[0].filename[0]);

	for (i = 0; i < 4 && model->lodInfo[i].filename[0]; i++)
	{
		model->lodInfo[i].surfs = FUN_004ac860(Alloc, model->lodInfo[i].filename, model, model->lodInfo[i].numsurfs, model->name);
		if (!model->lodInfo[i].surfs)
			return false;
	}

	return true;
}

XModel *XModelLoad(const char *name, void *(*Alloc)(int), void *(*AllocColl)(int))
{
	XModel *model;

	model = XModelLoadFile(name, Alloc, AllocColl);
	if (!model)
		return 0;

	if (re.XModelReadSurface)
	{
		if (!FUN_004ac8d0(model, Alloc))
		{
			XModelFree(model);
			return 0;
		}
		model->xskins = FUN_004ac430(model);
	}

	return model;
}

















int FUN_004ac9f0(const float (*axis)[3], XModel *model, float *mins, float *maxs)
{
	int i, j, k;
	XModelCollSurf_s *surf;
	float in[3], out[3];

	if (!model->numCollSurfs)
	{
		assert(!model->contents);
		return 0;
	}

	mins[0] = 3.4028235e+38f;
	mins[1] = 3.4028235e+38f;
	mins[2] = 3.4028235e+38f;
	maxs[0] = -3.4028235e+38f;
	maxs[1] = -3.4028235e+38f;
	maxs[2] = -3.4028235e+38f;

	for (i = 0; i < model->numCollSurfs; i++)
	{
		surf = &model->collSurfs[i];
		for (k = 0; k < 8; k++)
		{
			in[0] = (k & 1) ? surf->mins[0] : surf->maxs[0];
			in[1] = (k & 2) ? surf->mins[1] : surf->maxs[1];
			in[2] = (k & 4) ? surf->mins[2] : surf->maxs[2];
			MatrixTransformVector(in, axis, out);
			for (j = 0; j < 3; j++)
			{
				if (mins[j] > out[j])
					mins[j] = out[j];
				if (maxs[j] < out[j])
					maxs[j] = out[j];
			}
		}
	}

	return 1;
}
