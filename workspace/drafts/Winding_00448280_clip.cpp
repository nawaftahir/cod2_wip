#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"
struct facePlane_t { vec3_t normal; int type; double dist; };
struct winding_t { int pointCount; vec3_t points[4]; };
extern void FUN_0047a760(const char *fmt, ...);
extern float FUN_00489940(float value, float granularity, float tolerance);

bool Point_Equal(const vec3_t p1, const vec3_t p2, float epsilon)
{
    for (int i = 0; i < 3; i++) {
        if (fabs(p2[i] - p1[i]) > epsilon)
            return false;
    }
    return true;
}

winding_t *Winding_Alloc(int points)
{
    if (points > 64)
        FUN_0047a760("Winding_Alloc: %i points", points);
    return (winding_t *)new char[points * sizeof(vec3_t) + 4];
}

void Winding_Free(winding_t *w)
{
    delete w;
}

winding_t *Winding_Clone(const winding_t *w)
{
    winding_t *c = Winding_Alloc(w->pointCount);
    c->pointCount = w->pointCount;
    memcpy(c->points, w->points, c->pointCount * sizeof(vec3_t));
    return c;
}

winding_t *Winding_Reverse(winding_t *w)
{
    winding_t *c = Winding_Alloc(w->pointCount);
    c->pointCount = w->pointCount;
    for (int i = 0; i < w->pointCount; i++)
        VectorCopy(w->points[w->pointCount - 1 - i], c->points[i]);
    return c;
}

winding_t *FUN_00448280(winding_t *in, const facePlane_t *split, int keepon)
{
    float dists[65];
    int sides[65];
    int counts[3];
    float dot;
    int i;

    counts[0] = 0;
    counts[1] = 0;
    counts[2] = 0;
    for (i = 0; i < in->pointCount; i++) {
        dot = DotProduct(in->points[i], split->normal) - split->dist;
        dists[i] = dot;
        if (dot > 0.01)
            sides[i] = 0;
        else if (dot < -0.01)
            sides[i] = 1;
        else
            sides[i] = 2;
        counts[sides[i]]++;
    }
    sides[i] = sides[0];
    dists[i] = dists[0];

    if (keepon && !counts[0] && !counts[1])
        return in;
    if (!counts[0]) {
        Winding_Free(in);
        return NULL;
    }
    if (!counts[1])
        return in;

    int maxpts = in->pointCount + 4;
    winding_t *neww = Winding_Alloc(maxpts);
    neww->pointCount = 0;
    for (i = 0; i < in->pointCount; i++) {
        const float *p1 = in->points[i];
        if (sides[i] == 2) {
            VectorCopy(p1, neww->points[neww->pointCount]);
            neww->pointCount++;
            continue;
        }
        if (sides[i] == 0) {
            VectorCopy(p1, neww->points[neww->pointCount]);
            neww->pointCount++;
        }
        if (sides[i + 1] == 2 || sides[i + 1] == sides[i])
            continue;
        const float *p2 = in->points[(i + 1) % in->pointCount];
        float frac = dists[i] / (dists[i] - dists[i + 1]);
        float mid[3];
        for (int j = 0; j < 3; j++) {
            if (split->normal[j] == 1)
                mid[j] = split->dist;
            else if (split->normal[j] == -1)
                mid[j] = -split->dist;
            else
                mid[j] = p1[j] + frac * (p2[j] - p1[j]);
            mid[j] = FUN_00489940(mid[j], 8.0f, 0.01f);
        }
        VectorCopy(mid, neww->points[neww->pointCount]);
        neww->pointCount++;
    }
    if (neww->pointCount > maxpts)
        FUN_0047a760("Winding_Clip: points exceeded estimate");
    Winding_Free(in);
    return neww;
}
