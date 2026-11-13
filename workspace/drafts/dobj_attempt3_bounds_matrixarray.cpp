// Drafts saved after 3 attempts (did not match 100% under MSVC 7.1 /LTCG):
// - 0x004a41d0 DObjSetBounds (79%, 688/688, first diff at +0x8a)
// - 0x004a4f90 DObjGetMatrixArray (96%, 236/236, first diff at +0xd5)

#define DOBJ_MAX_PARTS 128

#undef IS_NAN
#define nanmask (255<<23)
#define IS_NAN(x) (((*(int *)&(x))&nanmask)==nanmask)

typedef struct DObjSkelMat_s
{
	vec4_t axis[3];
	vec4_t origin;
} DObjSkelMat;

static inline void LocalConvertQuatToSkelMat(const DObjAnimMat *mat, DObjSkelMat *skelMat)
{
	float xx, xy, xz, xw, yy, yz, yw, zz, zw;
	vec3_t scaledQuat;

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

	assert(!IS_NAN((skelMat->axis[0])[0]) && !IS_NAN((skelMat->axis[0])[1]) && !IS_NAN((skelMat->axis[0])[2]));
	assert(!IS_NAN((skelMat->axis[1])[0]) && !IS_NAN((skelMat->axis[1])[1]) && !IS_NAN((skelMat->axis[1])[2]));
	assert(!IS_NAN((skelMat->axis[2])[0]) && !IS_NAN((skelMat->axis[2])[1]) && !IS_NAN((skelMat->axis[2])[2]));

	VectorCopy(mat->trans, skelMat->origin);
	skelMat->origin[3] = 1.0f;

	assert(!IS_NAN((skelMat->origin)[0]) && !IS_NAN((skelMat->origin)[1]) && !IS_NAN((skelMat->origin)[2]));
}

void DObjSetBounds(DObj *obj)
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

			VectorAdd(modelmins, dobjmins, dobjmins);
			VectorAdd(modelmaxs, dobjmaxs, dobjmaxs);
		}
	}

	VectorCopy(dobjmins, obj->mins);
	VectorCopy(dobjmaxs, obj->maxs);
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

	for ( i = 0; i < boneCount; ++i )
	{
		if ( partBits[i >> 5] & (1 << (i & 0x1F)) )
			LocalConvertQuatToSkelMat(mat, skelMat);
		++skelMat;
		++mat;
	}
}
