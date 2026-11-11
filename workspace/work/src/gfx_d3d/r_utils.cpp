// gfx.h's type set has an empty LargeLocal placeholder; keep it out of the way.
#define LargeLocal LargeLocal_placeholder
#include "gfx.h"
#undef LargeLocal
#include <string.h>
#include <math.h>

// Same class as universal/com_memory.h, which clashes with the gfx.h type set.
class LargeLocal
{
public:
	LargeLocal( int size );
	~LargeLocal();
	void *GetBuf();
private:
	int pos;
	int reserved[3];
};

extern const vec3_t vec3_origin;
extern infoParm_t infoParms[];

int R_HashAssetName(const char *name);
int R_HashString(const char *string);
mnode_t *R_PointInLeaf(const vec_t *point);
int R_CullPointAndRadius(const vec_t *origin, float radius,
    const DpvsPlane *planes, int planeCount);
__declspec(noinline) void R_ConvertColorToBytes(const vec_t *colorFloat, byte *colorBytes);
int R_PickMaterial(const vec_t *org, const vec_t *dir, char *name, char *surfaceFlags, char *contents, size_t charLimit);
bool R_ValidXModelName(const char *name);
float FresnelTerm(float n0, float n1, float cosIncidentAngle);

// r_utils in Mac 1.3; inlined at every call site in retail 1.0.
int R_HashAssetName(const char *name)
{
    int hash;
    int i;

    int mult;

    hash = 0;
    mult = 119;
    for (i = 0; name[i]; i++)
    {
        hash += name[i] * mult;
        mult++;
    }
    return hash;
}

// SUPPORTED Mac name; PINNED folded hash expanded at PC10016445.
int R_HashString(const char *string)
{
    int hash = 0;
    int multiplier = 119;
    for (int index = 0; string[index]; ++index)
    {
        hash += (string[index] | 0x20) * multiplier;
        ++multiplier;
    }
    return hash;
}

/* Name unconfirmed (CoDUO has an R_PointInLeaf of this shape). PINNED 1002c010/70:
   uncalled retail copy, no null-world check; equal or below the plane takes child 1. */
mnode_t *R_PointInLeaf(const vec_t *point)
{
    mnode_t *node = rgp.world->nodes;
    while (node->contents == -1)
    {
        const cplane_t *plane = node->u.node.plane;
        node = node->u.node.children[plane->normal[1] * point[1] + plane->normal[2] * point[2]
            + plane->normal[0] * point[0] <= plane->dist];
    }
    return node;
}

// PINNED 1002c060/71: strict sphere/plane rejection; unordered values stay visible.
int R_CullPointAndRadius(const vec_t *origin, float radius,
    const DpvsPlane *planes, int planeCount)
{
    for (int i = 0; i < planeCount; ++i)
    {
        const float *plane = planes[i].coeffs;
        float distance = plane[1] * origin[1] + plane[2] * origin[2]
            + plane[0] * origin[0] + plane[3];
        if (distance < -radius)
            return 2;
    }
    return 0;
}

// D3DCOLOR byte order (B, G, R, A); a null color means opaque white.
__declspec(noinline) void R_ConvertColorToBytes(const vec_t *colorFloat, byte *colorBytes)
{
    if (!colorFloat)
    {
        *(int *)colorBytes = -1;
        return;
    }
    colorBytes[0] = (byte)(colorFloat[2] * 255.0f);
    colorBytes[1] = (byte)(colorFloat[1] * 255.0f);
    colorBytes[2] = (byte)(colorFloat[0] * 255.0f);
    colorBytes[3] = (byte)(colorFloat[3] * 255.0f);
}

int R_PickMaterial(const vec_t *org, const vec_t *dir, char *name, char *surfaceFlags, char *contents, size_t charLimit)
{
    trace_t trace;
    vec3_t end;
    int index;
    int surfaceFlagsLen;
    int contentsLen;
    int i;

    end[0] = dir[0] * 262144.0f + org[0];
    end[1] = dir[1] * 262144.0f + org[1];
    end[2] = dir[2] * 262144.0f + org[2];
    ri.CM_BoxTrace(&trace, org, end, vec3_origin, vec3_origin, 0, 0xf83fff7);
    if (trace.startsolid || trace.allsolid || trace.fraction == 1.0f || !trace.material)
        return 0;
    strcpy(name, trace.material);
    surfaceFlags[0] = 0;
    surfaceFlags[charLimit - 1] = 0;
    contents[0] = 0;
    contents[charLimit - 1] = 0;
    index = (trace.surfaceFlags >> 20) & 0x1f;
    if (index > 0 && index < 23)
        strncpy(surfaceFlags, infoParms[index - 1].name, charLimit);
    else
        strncpy(surfaceFlags, "^1default^7", charLimit);
    if (surfaceFlags[charLimit - 1])
        return 0;
    surfaceFlagsLen = strlen(surfaceFlags);
    if (trace.contents & 1)
        strncpy(contents, "solid", charLimit);
    else
        strncpy(contents, "^3nonsolid^7", charLimit);
    if (contents[charLimit - 1])
        return 0;
    contentsLen = strlen(contents);
    for (i = 22; infoParms[i].name; ++i)
    {
        if (infoParms[i].surfaceFlags & trace.surfaceFlags)
        {
            surfaceFlags[surfaceFlagsLen++] = ' ';
            strncpy(&surfaceFlags[surfaceFlagsLen], infoParms[i].name, charLimit - surfaceFlagsLen);
            if (surfaceFlags[charLimit - 1])
                return 0;
            surfaceFlagsLen += strlen(&surfaceFlags[surfaceFlagsLen]);
        }
        if (infoParms[i].contents & trace.contents)
        {
            contents[contentsLen++] = ' ';
            strncpy(&contents[contentsLen], infoParms[i].name, charLimit - contentsLen);
            if (contents[charLimit - 1])
                return 0;
            contentsLen += strlen(&contents[contentsLen]);
        }
    }
    return 1;
}

// PINNED 1002c330/62.
bool R_ValidXModelName(const char *name)
{
    if (strlen(name) >= 0x40)
        return false;
    if (_strnicmp(name, "xmodel", 6))
        return false;
    return name[6] == '/' || name[6] == '\\';
}

// UNACCEPTED: PC1002c370/201; one x87 cleanup instruction still differs.
#pragma intrinsic(fabs, sin, tan)

float FresnelTerm(float n0, float n1, float cosIncidentAngle)
{
    double incidentAngle, sinRefracted, refractedAngle, sumAngle, diffAngle;
    double rs, rp, reflectance;
    float result;
    cosIncidentAngle = (float)fabs(cosIncidentAngle);
    incidentAngle = acos(cosIncidentAngle);
    sinRefracted = (n0 / n1) * sin(incidentAngle);
    if (sinRefracted > 1.0)
        sinRefracted = 1.0;
    else if (sinRefracted < -1.0)
        sinRefracted = -1.0;
    refractedAngle = asin(sinRefracted);
    sumAngle = incidentAngle + refractedAngle;
    diffAngle = incidentAngle - refractedAngle;
    rs = sin(diffAngle) / sin(sumAngle);
    rp = tan(diffAngle) / tan(sumAngle);
    reflectance = rs * rs + rp * rp;
    result = (float)(reflectance * 0.5);
    if (result < 0.0f)
        result = 0.0f;
    if (result > 1.0f)
        result = 1.0f;
    return result;
}

/* Mac STABS names (r_dpvs.c LargeLocal externs). PINNED 1002c440/15, 1002c450/11,
   1002c460/13: uncalled retail copies; r_dpvs inlines them as the ri.Hi* calls. */
LargeLocal::LargeLocal(int size)
{
    pos = ri.HiAlloc(size);
}

LargeLocal::~LargeLocal()
{
    ri.HiSetOffset(pos);
}

void *LargeLocal::GetBuf()
{
    return ri.HiOffToPtr(pos);
}
