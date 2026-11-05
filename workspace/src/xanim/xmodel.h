#pragma once

typedef float vec_t;
typedef vec_t vec3_t[3];

typedef float vec4_t[4];

struct XBoneHierarchy;

struct DObjAnimMat {
    vec4_t quat;
    vec3_t trans;
    float transWeight;
};

struct DSkelPartBits_s {
    int anim[4];
    int control[4];
    int skel[4];
};

struct DSkel_t {
    struct DSkelPartBits_s partBits;
    struct DObjAnimMat Mat;
};

typedef struct DObjSkelMat_s {
    float axis[3][4];
    float origin[4];
} DObjSkelMat;

typedef struct XModelParts_s {
    short numBones;
    short numRootBones;
    struct XBoneHierarchy *hierarchy;
    short *quats;
    float *trans;
    unsigned char *partClassification;
    struct DSkel_t skel;
} XModelParts;

struct XSurface;

typedef struct XModelSurfs_s {
    struct XSurface *surf;
    int partBits[4];
} XModelSurfs;

typedef struct XModelLodInfo_s {
    float dist;
    const char *filename;
    short numsurfs;
    unsigned short *surfNames;
    struct XModelSurfs_s *surfs;
} XModelLodInfo;

typedef struct XModelCollSurf_s {
    struct XModelCollTri_s *collTris;
    int numCollTris;
    vec3_t mins;
    vec3_t maxs;
    int boneIdx;
    int contents;
    int surfFlags;
} XModelCollSurf;

typedef struct XModel {
    struct XModelParts_s *parts;        // 0x00
    XModelLodInfo lodInfo[4];           // 0x04
    XModelCollSurf *collSurfs;          // 0x54
    int numCollSurfs;                   // 0x58
    int contents;                       // 0x5c
    struct XBoneInfo *boneInfo;         // 0x60
    vec3_t mins;                        // 0x64
    vec3_t maxs;                        // 0x70
    short numLods;                      // 0x7c
    short collLod;                      // 0x7e
    struct Material *xskins;            // 0x80
    int memUsage;                       // 0x84
    const char *name;                   // 0x88
    char flags;                         // 0x8c
    bool bad;                           // 0x8d
} XModel;

const char *XModelGetName(const XModel *model);
char XModelGetFlags(const XModel *model);
int XModelGetNumLods(const XModel *model);
int XModelNumBones(const XModel *model);
struct DObjAnimMat *XModelGetBasePose(const XModel *model);
char *XModelGetBasePoseOffset(const XModel *model, int skelMatBoneOffset);

#define AssertMsg(expr, fmt, a1, a2) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(va("%s\n\t%s", #expr, va(fmt, a1, a2)), __FILE__, __LINE__, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)
