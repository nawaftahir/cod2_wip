#include "../qcommon/qcommon.h"
#include <string.h>

// SUPPORTED: Mac 1.3 com_convexhull.c for growth; target 100581e0 has this split.
static void Com_SwapHullPoints(vec2_t *points, int index0, int index1)
{
    if (index0 == index1)
        return;
    vec2_t swapCache;
    Vector2Copy(points[index0], swapCache);
    Vector2Copy(points[index1], points[index0]);
    Vector2Copy(swapCache, points[index1]);
}


// PINNED: extrema selection and swaps at 10057a40; name SUPPORTED by KisakCOD.
static void Com_InitialHull(vec2_t *points, int pointCount, vec2_t *hull)
{
    int minIndex = 0;
    int maxIndex = 0;
    int pointIndex;
    for (int i = 1; i < pointCount; ++i) {
        if (points[maxIndex][1] <= points[i][1])
            maxIndex = i;
        else if (points[minIndex][1] > points[i][1])
            minIndex = i;
    }
    Vector2Copy(points[minIndex], hull[0]);
    Vector2Copy(points[maxIndex], hull[1]);
    if (minIndex > maxIndex) {
        pointIndex = pointCount - 1;
        Com_SwapHullPoints(points, minIndex, pointIndex);
        pointIndex = pointCount - 2;
        Com_SwapHullPoints(points, maxIndex, pointIndex);
    } else {
        pointIndex = pointCount - 1;
        Com_SwapHullPoints(points, maxIndex, pointIndex);
        pointIndex = pointCount - 2;
        Com_SwapHullPoints(points, minIndex, pointIndex);
    }
}

// PINNED 10057cd0: insertion is shared with both hull-growth paths.
static int Com_AddPointToHull(const vec2_t point, int newIndex, vec2_t *hull, int hullPointCount)
{
    memmove(&hull[newIndex + 1], &hull[newIndex],
            (hullPointCount - newIndex) * sizeof(vec2_t));
    Vector2Copy(point, hull[newIndex]);
    return hullPointCount + 1;
}

// Source helper for the repeated inlined two-dimensional dot product.
static inline float HullDot2(const vec2_t a, const vec2_t b)
{
    return a[1] * b[1] + a[0] * b[0];
}

static int Com_RecursivelyGrowHull(vec2_t *points, int pointCount,
    int firstIndex, int secondIndex, vec2_t *hull, int hullPointCount)
{
    vec3_t edgeEq;
    float d, maxDist;
    int topIndex, botIndex, frontIndex, newIndex;

    edgeEq[0] = hull[firstIndex][1] - hull[secondIndex][1];
    edgeEq[1] = hull[secondIndex][0] - hull[firstIndex][0];
    Vec2Normalize(edgeEq);
    edgeEq[2] = HullDot2(edgeEq, hull[firstIndex]);
    botIndex = 0;
    topIndex = pointCount - 1;
    maxDist = 0.001f;
    frontIndex = -1;

    if (botIndex <= topIndex) {
        do {
            d = HullDot2(edgeEq, points[botIndex]) - edgeEq[2];
            // PINNED: unordered distances follow the front scan.
            while (!(d <= 0.0f)) {
                if (maxDist < d) {
                    maxDist = d;
                    frontIndex = botIndex;
                }
                if (++botIndex > topIndex)
                    goto finished;
                d = HullDot2(edgeEq, points[botIndex]) - edgeEq[2];
            }
            d = HullDot2(edgeEq, points[topIndex]) - edgeEq[2];
            while (!(d > 0.0f)) {
                if (botIndex > --topIndex)
                    goto finished;
                d = HullDot2(edgeEq, points[topIndex]) - edgeEq[2];
            }
            if (maxDist < d) {
                maxDist = d;
                frontIndex = botIndex;
            }
            Com_SwapHullPoints(points, botIndex, topIndex);
            ++botIndex;
            --topIndex;
        } while (botIndex <= topIndex);
    }
finished:
    if (frontIndex < 0)
        return hullPointCount;
    Com_SwapHullPoints(points, frontIndex, topIndex);
    newIndex = firstIndex + 1;
    hullPointCount = Com_AddPointToHull(points[topIndex], newIndex, hull, hullPointCount);
    if (topIndex == 0)
        return hullPointCount;
    if (secondIndex != 0)
        secondIndex = firstIndex + 2;
    hullPointCount = Com_RecursivelyGrowHull(points, topIndex, newIndex, secondIndex, hull, hullPointCount);
    hullPointCount = Com_RecursivelyGrowHull(points, topIndex, firstIndex, newIndex, hull, hullPointCount);
    return hullPointCount;
}

static int Com_GrowInitialHull(vec2_t *points, int pointCount, vec2_t *hull)
{
    vec3_t edgeEq;
    float d, maxFrontDist, maxBackDist;
    int topIndex, botIndex, frontIndex, backIndex, hullPointCount;
    vec2_t *backPoints;

    edgeEq[0] = hull[1][1] - hull[0][1];
    edgeEq[1] = hull[0][0] - hull[1][0];
    Vec2Normalize(edgeEq);
    edgeEq[2] = HullDot2(edgeEq, hull[0]);
    botIndex = 0;
    topIndex = pointCount - 1;
    maxFrontDist = 0.001f;
    maxBackDist = -0.001f;
    frontIndex = -1;
    backIndex = -1;

    if (botIndex <= topIndex) {
        do {
            d = HullDot2(edgeEq, points[botIndex]) - edgeEq[2];
            while (!(d < 0.0f)) {
                if (maxFrontDist < d) {
                    maxFrontDist = d;
                    frontIndex = botIndex;
                }
                if (++botIndex > topIndex)
                    goto finished;
                d = HullDot2(edgeEq, points[botIndex]) - edgeEq[2];
            }
            if (maxBackDist > d) {
                maxBackDist = d;
                backIndex = botIndex;
            }
            d = HullDot2(edgeEq, points[topIndex]) - edgeEq[2];
            while (!(d > 0.0f)) {
                if (maxBackDist > d) {
                    maxBackDist = d;
                    backIndex = topIndex;
                }
                if (botIndex > --topIndex)
                    goto finished;
                d = HullDot2(edgeEq, points[topIndex]) - edgeEq[2];
            }
            if (maxFrontDist < d) {
                maxFrontDist = d;
                frontIndex = botIndex;
            }
            Com_SwapHullPoints(points, botIndex, topIndex);
            if (backIndex == botIndex)
                backIndex = topIndex;
            ++botIndex;
            --topIndex;
        } while (botIndex <= topIndex);
    }
finished:
    if (frontIndex < 0 && backIndex < 0)
        return 0;
    hullPointCount = 2;
    if (frontIndex >= 0) {
        Com_SwapHullPoints(points, frontIndex, topIndex);
        hullPointCount = Com_AddPointToHull(points[topIndex], 2, hull, hullPointCount);
        if (topIndex > 0) {
            hullPointCount = Com_RecursivelyGrowHull(points, topIndex, 2, 0, hull, hullPointCount);
            hullPointCount = Com_RecursivelyGrowHull(points, topIndex, 1, 2, hull, hullPointCount);
        }
    }
    if (backIndex >= 0) {
        Com_SwapHullPoints(points, backIndex, botIndex);
        hullPointCount = Com_AddPointToHull(points[botIndex], 1, hull, hullPointCount);
        if (pointCount - botIndex - 1 > 0) {
            backPoints = &points[botIndex + 1];
            hullPointCount = Com_RecursivelyGrowHull(backPoints, pointCount - botIndex - 1, 1, 2, hull, hullPointCount);
            hullPointCount = Com_RecursivelyGrowHull(backPoints, pointCount - botIndex - 1, 0, 1, hull, hullPointCount);
        }
    }
    return hullPointCount;
}

int Com_ConvexHull(vec2_t *points, int pointCount, vec2_t *hull)
{
    Com_InitialHull(points, pointCount, hull);
    return Com_GrowInitialHull(points, pointCount - 2, hull);
}

