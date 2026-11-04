// Portal clip planes; PC 1.0 addresses pinned from the renderer anchor.
#include "gfx.h"

extern const dvar_t *r_portalBevels;
extern const dvar_t *r_portalBevelsOnly;
extern const dvar_t *r_portalMinClipArea;
extern const dvar_t *r_showPortals;
extern const DpvsPlane *portalNearPlane;
extern const DpvsPlane *portalFarPlane;
void R_GetSidePlaneNormals(const vec3_t *winding, int vertexCount, vec3_t *normals);

// PINNED: view projection 101ce5b8, inverse view projection 101ce5bc.
struct PortalProjectionState
{
    const D3DMATRIX *viewProjectionMatrix;
    const D3DMATRIX *inverseViewProjectionMatrix;
};
PortalProjectionState portalProjectionState;
#define portalViewProjectionMatrix portalProjectionState.viewProjectionMatrix
#define portalInverseViewProjectionMatrix portalProjectionState.inverseViewProjectionMatrix

static __forceinline void R_UnprojectPoint(const float *projected, float *unprojected)
{
    const D3DMATRIX *matrix = portalInverseViewProjectionMatrix;
    unprojected[0] = matrix->m[0][0] * projected[0] + matrix->m[1][0] * projected[1] + matrix->m[3][0];
    unprojected[1] = matrix->m[0][1] * projected[0] + matrix->m[1][1] * projected[1] + matrix->m[3][1];
    unprojected[2] = matrix->m[0][2] * projected[0] + matrix->m[1][2] * projected[1] + matrix->m[3][2];
    unprojected[3] = matrix->m[0][3] * projected[0] + matrix->m[1][3] * projected[1] + matrix->m[3][3];
}

static __forceinline void R_AddPortalDebugLine(const float *start, const float *end, float cyan)
{
    DebugGlobals *debug = &frontEndDataOut->debugGlobals;
    if (debug->lineCount + 1 > debug->lineLimit)
        return;
    if (!debug->lines)
        debug->lines = (trDebugLine_t *)ri.Z_MallocInternal(debug->lineLimit * sizeof(trDebugLine_t));
    trDebugLine_t *line = &debug->lines[debug->lineCount];
    VectorCopy(start, line->start);
    VectorCopy(end, line->end);
    Vector4Set(line->color, 0.0f, cyan, cyan, 1.0f);
    line->depthTest = 0;
    ++debug->lineCount;
}

// PINNED 10006da0/595: NaN W does not take the near-clipped return.
static void R_ProjectPortal(int vertexCount, const vec3_t *winding, float *mins,
    float *maxs, DpvsClipChildren *clipChildren)
{
    vec2_t screenSpaceWinding[132];
    mins[0] = 1.0f;
    mins[1] = 1.0f;
    maxs[0] = -1.0f;
    maxs[1] = -1.0f;
    int index;
    for (index = 0; index < vertexCount; ++index)
    {
        const float *xyz = winding[index];
        float w = portalViewProjectionMatrix->m[0][3] * xyz[0]
            + portalViewProjectionMatrix->m[2][3] * xyz[2]
            + portalViewProjectionMatrix->m[1][3] * xyz[1] + portalViewProjectionMatrix->m[3][3];
        if (w < 0.125f)
        {
            mins[0] = -1.0f;
            mins[1] = -1.0f;
            maxs[0] = 1.0f;
            maxs[1] = 1.0f;
            *clipChildren = DPVS_CLIP_CHILDREN;
            return;
        }
        float invW = 1.0f / w;
        screenSpaceWinding[index][0] = (portalViewProjectionMatrix->m[2][0] * xyz[2]
            + portalViewProjectionMatrix->m[1][0] * xyz[1] + xyz[0] * portalViewProjectionMatrix->m[0][0]
            + portalViewProjectionMatrix->m[3][0]) * invW;
        screenSpaceWinding[index][1] = (portalViewProjectionMatrix->m[0][1] * xyz[0]
            + portalViewProjectionMatrix->m[2][1] * xyz[2] + portalViewProjectionMatrix->m[1][1] * xyz[1]
            + portalViewProjectionMatrix->m[3][1]) * invW;
        if (mins[0] > screenSpaceWinding[index][0]) mins[0] = screenSpaceWinding[index][0];
        if (maxs[0] < screenSpaceWinding[index][0]) maxs[0] = screenSpaceWinding[index][0];
        if (mins[1] > screenSpaceWinding[index][1]) mins[1] = screenSpaceWinding[index][1];
        if (maxs[1] < screenSpaceWinding[index][1]) maxs[1] = screenSpaceWinding[index][1];
    }
    if ((maxs[1] - mins[1]) * (maxs[0] - mins[0]) * 0.25f < r_portalMinClipArea->current.value)
    {
        *clipChildren = DPVS_DONT_CLIP_CHILDREN;
        return;
    }
    Vector2Copy(screenSpaceWinding[0], screenSpaceWinding[vertexCount]);
    Vector2Copy(screenSpaceWinding[1], screenSpaceWinding[vertexCount + 1]);
    float area = 0.0f;
    for (index = 1; index <= vertexCount; ++index)
        area += (screenSpaceWinding[index + 1][1] - screenSpaceWinding[index - 1][1]) * screenSpaceWinding[index][0];
    if (area * 0.125f < r_portalMinClipArea->current.value)
        *clipChildren = DPVS_DONT_CLIP_CHILDREN;
    else
        *clipChildren = DPVS_CLIP_CHILDREN;
}

static int R_AddBevelPlanes(DpvsPlane *planes, int vertexCount, const vec3_t *windingNormals,
    const float *mins, const float *maxs, DpvsForceBevels forceBevels)
{
    vec2_t projected;
    vec4_t unprojected;
    vec3_t bevelVerts[5];
    vec3_t bevelNormals[4];
    int index;
    for (index = 0; index < 4; ++index)
    {
        projected[0] = index < 2 ? mins[0] : maxs[0];
        projected[1] = index == 1 || index == 2 ? mins[1] : maxs[1];
        R_UnprojectPoint(projected, unprojected);
        float invW = 1.0f / unprojected[3];
        VectorScale(unprojected, invW, bevelVerts[index]);
    }
    VectorCopy(bevelVerts[0], bevelVerts[4]);
    R_GetSidePlaneNormals(bevelVerts, 4, bevelNormals);
    int planeCount = 0;
    for (index = 0; index < 4; ++index)
    {
        DpvsPlane *plane = &planes[planeCount];
        memcpy(plane->coeffs, bevelNormals[index], sizeof(vec3_t));
        if (forceBevels == DPVS_DONT_FORCE_BEVELS)
        {
            int vertexIndex;
            for (vertexIndex = 0; vertexIndex < vertexCount; ++vertexIndex)
                if (windingNormals[vertexIndex][0] * plane->coeffs[0]
                    + windingNormals[vertexIndex][2] * plane->coeffs[2]
                    + windingNormals[vertexIndex][1] * plane->coeffs[1] > r_portalBevels->current.value)
                {
                    if (r_showPortals->current.integer & 2)
                        R_AddPortalDebugLine(bevelVerts[index], bevelVerts[index + 1], 0.5f);
                    goto nextBevel;
                }
        }
        if (r_showPortals->current.integer)
            R_AddPortalDebugLine(bevelVerts[index], bevelVerts[index + 1], 0.75f);
        plane->coeffs[3] = 0.001f - (bevelVerts[index][2] * plane->coeffs[2]
            + bevelVerts[index][0] * plane->coeffs[0] + bevelVerts[index][1] * plane->coeffs[1]);
        plane->side[0] = FloatAsInt(plane->coeffs[0]) > 0 ? 12 : 0;
        plane->side[1] = FloatAsInt(plane->coeffs[1]) > 0 ? 16 : 4;
        plane->side[2] = FloatAsInt(plane->coeffs[2]) > 0 ? 20 : 8;
        plane->u.frontal = 255;
        ++planeCount;
    nextBevel:;
    }
    return planeCount;
}

extern "C" double R_NearestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);

// PINNED 10007430/1439. PC has no unused cell parameter found in the CoD4 reference.
int R_PortalClipPlanes(DpvsPlane *planes, int vertexCount, const vec3_t *winding,
    DpvsClipChildren *clipChildren)
{
    vec3_t normals[128];
    vec2_t clipSpaceMins, clipSpaceMaxs;
    bool useNormalPlanes = vertexCount <= 10;
    DpvsForceBevels forceBevels;
    bool useBevelPlanes;
    if (useNormalPlanes && !r_portalBevelsOnly->current.enabled)
    {
        forceBevels = DPVS_DONT_FORCE_BEVELS;
        useBevelPlanes = r_portalBevels->current.value > 0.0f;
    }
    else
    {
        forceBevels = DPVS_FORCE_BEVELS;
        useBevelPlanes = true;
    }
    R_GetSidePlaneNormals(winding, vertexCount, normals);
    int planeCount = 0;
    if (useBevelPlanes || r_portalMinClipArea->current.value > 0.0f)
    {
        R_ProjectPortal(vertexCount, winding, clipSpaceMins, clipSpaceMaxs, clipChildren);
        if (useBevelPlanes)
            planeCount = R_AddBevelPlanes(planes, vertexCount, normals, clipSpaceMins, clipSpaceMaxs, forceBevels);
    }
    else
        *clipChildren = DPVS_CLIP_CHILDREN;
    if (useNormalPlanes)
        for (int index = 0; index < vertexCount; ++index)
            if (DotProduct(normals[index], normals[index]) != 0.0f)
            {
                DpvsPlane *plane = &planes[planeCount];
                VectorCopy(normals[index], plane->coeffs);
                plane->coeffs[3] = 0.001f - DotProduct(winding[index], plane->coeffs);
                plane->side[0] = FloatAsInt(plane->coeffs[0]) > 0 ? 12 : 0;
                plane->side[1] = FloatAsInt(plane->coeffs[1]) > 0 ? 16 : 4;
                plane->side[2] = FloatAsInt(plane->coeffs[2]) > 0 ? 20 : 8;
                plane->u.frontal = 255;
                ++planeCount;
            }
    if (portalNearPlane)
    {
        planes[planeCount] = *portalNearPlane;
        double nearest = R_NearestPointOnWinding(winding, vertexCount, planes[planeCount].coeffs);
        if (nearest > 0.0f)
            planes[planeCount].coeffs[3] = (float)(planes[planeCount].coeffs[3] - nearest);
        ++planeCount;
    }
    if (portalFarPlane)
        planes[planeCount++] = *portalFarPlane;
    return planeCount;
}
