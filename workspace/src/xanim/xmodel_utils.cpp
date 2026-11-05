#include "xmodel.h"

extern "C" {
__declspec(dllimport) void __stdcall DebugBreak(void);
int AssertFailed(const char *expr, const char *file, int line, int a4, int a5);
char *va(const char *format, ...);
void *SL_GetString(unsigned int stringValue);
}

const char *SL_ConvertToString(unsigned int stringValue);

#define Assert(expr) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\xanim\\xmodel_utils.cpp", __LINE__, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

#define AssertAt(expr, line) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\xanim\\xmodel_utils.cpp", line, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

#define AssertMsgAt(expr, fmt, a1, a2, line) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(va("%s\n\t%s", #expr, va(fmt, a1, a2)), "\\trees\\cod2src\\src\\xanim\\xmodel_utils.cpp", line, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

#define MAX_LODS 4

struct XModelLodOverride {
    bool enabled;
    float dist;
};

static XModelLodOverride xmodelLodOverride[MAX_LODS];

const char *XModelGetName(const XModel *model) {
    return model->name;
}

char XModelGetFlags(const XModel *model) {
    return model->flags;
}

//
// XModelGetSurfaceName
//
const char *XModelGetSurfaceName(const XModel *model, int subMatIndex, int lod)
{
    unsigned short name;

    AssertAt(lod >= 0, 49);
    AssertAt((unsigned)subMatIndex < model->lodInfo[lod].numsurfs, 50);

    name = model->lodInfo[lod].surfNames[subMatIndex];

    if (name)
        return SL_ConvertToString(name);

    return "DEFAULT";
}



int XModelGetSurfaces(const XModel *model, XSurface **surfaces, int lod, int **partBits)
{
    const XModelLodInfo *lodInfo;

    AssertAt(model, 66);
    AssertAt(surfaces, 67);
    AssertAt(lod >= 0, 68);

    lodInfo = &model->lodInfo[lod];
    AssertAt(lodInfo->surfs, 71);

    *surfaces = lodInfo->surfs->surf;
    *partBits = lodInfo->surfs->partBits;

    return lodInfo->numsurfs;
}

int XModelGetNumLods(const XModel *model) {
    return model->numLods;
}

int XModelNumBones(const XModel *model) {
    return model->parts->numBones;
}

DObjAnimMat *XModelGetBasePose(const XModel *model) {
    return &model->parts->skel.Mat;
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
char *XModelGetBasePoseOffset(const XModel *model, int skelMatBoneOffset)
{
    AssertAt(model, 117);
    AssertAt(model->parts, 118);
    AssertMsgAt(skelMatBoneOffset >= 0 && skelMatBoneOffset < model->parts->numBones * sizeof( DObjSkelMat ), "%i, %i", skelMatBoneOffset, model->parts->numBones, 119);

    return (char *)&model->parts->skel.Mat + ((unsigned int)skelMatBoneOffset >> 1);
}

/*
==============
XModelGetLodOutDist
==============
*/
float XModelGetLodOutDist(const XModel *model)
{
    int lod;

    lod = XModelGetNumLods(model) - 1;

    return !xmodelLodOverride[lod].enabled ? model->lodInfo[lod].dist : xmodelLodOverride[lod].dist;
}

/*
==============
XModelGetLodForDist
==============
*/
int XModelGetLodForDist(const XModel *model, float dist)
{
    const XModelLodInfo *lodInfo;
    int numLods;
    int i;
    float lodDist;

    numLods = XModelGetNumLods(model);
    lodInfo = model->lodInfo;

    for ( i = 0; i < numLods; i++ )
    {
        lodDist = !xmodelLodOverride[i].enabled ? lodInfo[i].dist : xmodelLodOverride[i].dist;

        if ( lodDist == 0.0f || dist < lodDist )
            return i;
    }

    return -1;
}







/*
==============
XModelSetLodOverride
==============
*/
void XModelSetLodOverride(int lodLevel, float dist)
{
    AssertAt((unsigned)lodLevel < MAX_LODS, 177);

    xmodelLodOverride[lodLevel].dist = dist;
    xmodelLodOverride[lodLevel].enabled = dist >= 0.0f;
}
