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
winding_t *Winding_Alloc(int points);

bool Point_Equal(const vec3_t p1, const vec3_t p2, float epsilon)
{
    for (int i = 0; i < 3; i++) {
        if (fabs(p2[i] - p1[i]) > epsilon)
            return false;
    }
    return true;
}

static inline float Dot3(const float *a, const float *b) { return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]; }

winding_t *Winding_BaseForPlane(const facePlane_t *p)
{
    vec3_t org, vright, vup;
#line 79
    assert(p);
    {
        float v[3];
        v[0] = fabs(p->normal[0]);
        v[1] = fabs(p->normal[1]);
        v[2] = fabs(p->normal[2]);
        int x = v[1] > v[0] ? 1 : 0;
        if (v[2] > v[x]) {
            vup[0] = 1;
            vup[1] = 0;
            vup[2] = 0;
        } else {
            vup[0] = 0;
            vup[1] = 0;
            vup[2] = 1;
        }
    }
    float d = DotProduct(vup, p->normal);
    VectorMA(vup, -d, p->normal, vup);
    Vec3Normalize(vup);
    VectorScale(p->normal, (float)p->dist, org);
    Vec3Cross(vup, p->normal, vright);
    VectorScale(vup, 131072.0f, vup);
    VectorScale(vright, 131072.0f, vright);
    winding_t *w = Winding_Alloc(4);
    w->pointCount = 4;
    VectorSubtract(org, vright, w->points[0]);
    VectorAdd(w->points[0], vup, w->points[0]);
    VectorAdd(org, vright, w->points[1]);
    VectorAdd(w->points[1], vup, w->points[1]);
    VectorAdd(org, vright, w->points[2]);
    VectorSubtract(w->points[2], vup, w->points[2]);
    VectorSubtract(org, vright, w->points[3]);
    VectorSubtract(w->points[3], vup, w->points[3]);
    return w;
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
