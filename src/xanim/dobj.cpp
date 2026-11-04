#include "xmodel.h"

typedef struct XAnimTree_s XAnimTree_s;

typedef unsigned char byte;

struct XBoneInfo
{
    vec3_t bounds[2];
    vec3_t offset;
    float radiusSquared;
};

#define DOBJ_MAX_SUBMODELS 8

typedef struct DObj_s
{
    XAnimTree_s *tree;                     // 0x00
    DSkel_t *skel;                         // 0x04
    int timeStamp;                         // 0x08
    unsigned short *animToModel;           // 0x0C
    unsigned short duplicateParts;         // 0x10
    int locked;                            // 0x14
    byte numModels;                        // 0x18
    byte numBones;                         // 0x19
    byte ignoreCollision;                  // 0x1A
    XModel *models[DOBJ_MAX_SUBMODELS];    // 0x1C
    byte modelParents[DOBJ_MAX_SUBMODELS]; // 0x3C
    byte matOffset[DOBJ_MAX_SUBMODELS];    // 0x44
    vec3_t mins;                           // 0x4C
    vec3_t maxs;                           // 0x58
} DObj;                                    // 0x64

int DObjGetAllocSkelSize(const DObj_s *obj)
{
	return sizeof(DObjAnimMat) * obj->numBones + sizeof(DSkelPartBits_s);
}

int DObjGetNumModels( const DObj_s *obj )
{
	return obj->numModels;
}

XModel *DObjGetModel(const DObj_s *obj, int modelIndex)
{
	return obj->models[modelIndex];
}

void DObjGetBoneInfo( const DObj *obj, XBoneInfo **boneInfo )
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

int DObjNumBones(const DObj *obj)
{
	return obj->numBones;
}
