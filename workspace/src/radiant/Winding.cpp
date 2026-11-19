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

bool FUN_00447a50(const facePlane_t *a, const facePlane_t *b, bool flip)
{
    vec3_t normal;
    float dist;

    if (flip) {
        normal[0] = -b->normal[0];
        normal[1] = -b->normal[1];
        normal[2] = -b->normal[2];
        dist = -b->dist;
    } else {
        normal[0] = b->normal[0];
        normal[1] = b->normal[1];
        normal[2] = b->normal[2];
        dist = b->dist;
    }
    if (fabs(a->normal[0] - normal[0]) >= 0.0001f)
        return false;
    if (fabs(a->normal[1] - normal[1]) >= 0.0001f)
        return false;
    if (fabs(a->normal[2] - normal[2]) >= 0.0001f)
        return false;
    if (fabs(a->dist - dist) >= 0.02f)
        return false;
    return true;
}

bool FUN_00447b50(const vec3_t p1, const vec3_t p2, const vec3_t p3, facePlane_t *plane)
{
    vec3_t v1, v2;

    VectorSubtract(p2, p1, v1);
    VectorSubtract(p3, p1, v2);
    Vec3Cross(v1, v2, plane->normal);
    if (Vec3Normalize(plane->normal) < 0.1f)
        return false;
    plane->dist = DotProduct(p1, plane->normal);
    return true;
}

bool Point_Equal(const vec3_t p1, const vec3_t p2, float epsilon)
{
    for (int i = 0; i < 3; i++) {
        if (fabs(p1[i] - p2[i]) > epsilon)
            return false;
    }
    return true;
}

winding_t *Winding_Alloc(int points);

winding_t *Winding_BaseForPlane(const facePlane_t *p)
{
    vec3_t org, vright, vup;
#line 79
    assert(p);
    const float *normal = p->normal;
    {
        float v[3];
        v[0] = fabs(normal[0]);
        v[1] = fabs(normal[1]);
        v[2] = fabs(normal[2]);
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
    VectorMA(vup, -d, normal, vup);
    Vec3Normalize(vup);
    VectorScale(normal, (float)p->dist, org);
    Vec3Cross(vup, normal, vright);
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

void Winding_RemovePoint(winding_t *w, int point)
{
    if (point < 0 || point >= w->pointCount)
        FUN_0047a760("Winding_RemovePoint: point out of range");
    w->pointCount--;
    if (point < w->pointCount)
        memmove(w->points[point], w->points[point + 1], (w->pointCount - point) * sizeof(vec3_t));
}

winding_t *Winding_InsertPoint(winding_t *w, const vec3_t point, int pointIndex)
{
    if (pointIndex > w->pointCount)
        FUN_0047a760("Winding_InsertPoint: pointIndex > w->pointCount");
    else if (pointIndex < 0)
        FUN_0047a760("Winding_InsertPoint: pointIndex < 0");
    winding_t *neww = Winding_Alloc(w->pointCount + 1);
    neww->pointCount = w->pointCount + 1;
    const float *src = w->points[0];
    for (int i = 0; i < neww->pointCount; i++) {
        if (pointIndex == 0) {
            VectorCopy(point, neww->points[0]);
        } else {
            VectorCopy(src, neww->points[0]);
            i++;
            src += 3;
        }
        i++;
        src += 3;
    }
    return neww;
}

bool FUN_00448100(const winding_t *w)
{
    int edges = 0;
    int prev = w->pointCount - 1;
    for (int i = 0; i < w->pointCount; prev = i, i++) {
        vec3_t delta;
        VectorSubtract(w->points[i], w->points[prev], delta);
        if (VectorLengthSquared(delta) > 0.04) {
            if (++edges == 3)
                return false;
        }
    }
    return true;
}

bool FUN_00448190(const winding_t *w)
{
    for (int i = 0; i < w->pointCount; i++) {
        for (int j = 0; j < 3; j++) {
            if (w->points[i][j] < -131071.0f || w->points[i][j] > 131071.0f)
                return true;
        }
    }
    return false;
}

bool FUN_004481e0(const winding_t *w1, const winding_t *w2, const vec3_t normal1, const vec3_t normal2, float dist1, float dist2)
{
    int i;

    if (!w1 || !w2)
        return false;
    for (i = 0; i < w1->pointCount; i++) {
        if (DotProduct(normal2, w1->points[i]) - dist2 > 0.2)
            return true;
    }
    for (i = 0; i < w2->pointCount; i++) {
        if (DotProduct(normal1, w2->points[i]) - dist1 > 0.2)
            return true;
    }
    return false;
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
        const float *normal = split->normal;
        for (int j = 0; j < 3; j++) {
            if (normal[j] == 1)
                mid[j] = split->dist;
            else if (normal[j] == -1)
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

int FUN_00448550(const winding_t *in, const vec3_t normal, double dist, float epsilon, winding_t **front, winding_t **back)
{
    float dists[69];
    int sides[69];
    int counts[3];
    float dot;
    int i, j;
    const float *p1, *p2;
    vec3_t mid;
    winding_t *f, *b;
    int maxpts;

    counts[0] = counts[1] = counts[2] = 0;
    for (i = 0; i < in->pointCount; i++) {
        dot = DotProduct(in->points[i], normal) - dist;
        dists[i] = dot;
        if (dot > epsilon)
            sides[i] = 0;
        else if (dot < -epsilon)
            sides[i] = 1;
        else
            sides[i] = 2;
        counts[sides[i]]++;
    }
    sides[i] = sides[0];
    dists[i] = dists[0];
    *front = *back = NULL;
    if (!counts[0]) {
        *back = Winding_Clone(in);
        return (counts[1] == 0) + 1;
    }
    if (!counts[1]) {
        *front = Winding_Clone(in);
        return 0;
    }
    maxpts = in->pointCount + 4;
    *front = f = Winding_Alloc(maxpts);
    f->pointCount = 0;
    *back = b = Winding_Alloc(maxpts);
    b->pointCount = 0;
    for (i = 0; i < in->pointCount; i++) {
        p1 = in->points[i];
        if (sides[i] == 2) {
            VectorCopy(p1, f->points[f->pointCount]);
            f->pointCount++;
            VectorCopy(p1, b->points[b->pointCount]);
            b->pointCount++;
            continue;
        }
        if (sides[i] == 0) {
            VectorCopy(p1, f->points[f->pointCount]);
            f->pointCount++;
        }
        if (sides[i] == 1) {
            VectorCopy(p1, b->points[b->pointCount]);
            b->pointCount++;
        }
        if (sides[i + 1] == 2 || sides[i + 1] == sides[i])
            continue;
        p2 = in->points[(i + 1) % in->pointCount];
        dot = dists[i] / (dists[i] - dists[i + 1]);
        for (j = 0; j < 3; j++) {
            if (normal[j] == 1)
                mid[j] = dist;
            else if (normal[j] == -1)
                mid[j] = -dist;
            else
                mid[j] = p1[j] + (p2[j] - p1[j]) * dot;
        }
        VectorCopy(mid, f->points[f->pointCount]);
        f->pointCount++;
        VectorCopy(mid, b->points[b->pointCount]);
        b->pointCount++;
    }
    if (f->pointCount > maxpts || b->pointCount > maxpts)
        FUN_0047a760("Winding_Clip: points exceeded estimate");
    if (f->pointCount > 64 || b->pointCount > 64)
        FUN_0047a760("Winding_Clip: MAX_POINTS_ON_WINDING");
    return 3;
}

bool FUN_00448940(const winding_t *w1, const winding_t *w2, int *outI, int *outJ)
{
    int i, j;
    const float *p1, *p2, *p3, *p4;

    for (i = 0; i < w1->pointCount; i++) {
        p1 = w1->points[i];
        p2 = w1->points[(i + 1) % w1->pointCount];
        for (j = 0; j < w2->pointCount; j++) {
            p3 = w2->points[j];
            p4 = w2->points[(j + 1) % w2->pointCount];
            if (Point_Equal(p1, p4, 0.1f) && Point_Equal(p2, p3, 0.1f)) {
                *outI = i;
                *outJ = j;
                return true;
            }
        }
    }
    return false;
}

winding_t *FUN_00448a10(const winding_t *f1, const winding_t *f2, const vec3_t planenormal, bool keep)
{
    const float *p1, *p2, *back;
    winding_t *newf;
    int i, j, k, l;
    vec3_t normal, delta;
    float dot;
    bool keep1, keep2;

    if (!FUN_00448940(f1, f2, &i, &j))
        return NULL;
    p1 = f1->points[i];
    p2 = f1->points[(i + 1) % f1->pointCount];
    back = f1->points[(i + f1->pointCount - 1) % f1->pointCount];
    VectorSubtract(p1, back, delta);
    Vec3Cross(planenormal, delta, normal);
    Vec3Normalize(normal);
    back = f2->points[(j + 2) % f2->pointCount];
    VectorSubtract(back, p1, delta);
    dot = DotProduct(delta, normal);
    if (dot > 0.005)
        return NULL;
    keep1 = dot < -0.005;

    back = f1->points[(i + 2) % f1->pointCount];
    VectorSubtract(back, p2, delta);
    Vec3Cross(planenormal, delta, normal);
    Vec3Normalize(normal);
    back = f2->points[(j + f2->pointCount - 1) % f2->pointCount];
    VectorSubtract(back, p2, delta);
    dot = DotProduct(delta, normal);
    if (dot > 0.005)
        return NULL;
    keep2 = dot < -0.005;

    newf = Winding_Alloc(f1->pointCount + f2->pointCount);
    newf->pointCount = 0;
    for (k = (i + 1) % f1->pointCount; k != i; k = (k + 1) % f1->pointCount) {
        if (!keep && k == (i + 1) % f1->pointCount && !keep2)
            continue;
        VectorCopy(f1->points[k], newf->points[newf->pointCount]);
        newf->pointCount++;
    }
    for (l = (j + 1) % f2->pointCount; l != j; l = (l + 1) % f2->pointCount) {
        if (!keep && l == (j + 1) % f2->pointCount && !keep1)
            continue;
        VectorCopy(f2->points[l], newf->points[newf->pointCount]);
        newf->pointCount++;
    }
    return newf;
}

void FUN_00448d00(const winding_t *w, vec3_t normal, double *dist)
{
    vec3_t v1, v2;
    int i;

    for (i = 0; i < w->pointCount; i++) {
        VectorSubtract(w->points[(i + 1) % w->pointCount], w->points[i], v1);
        VectorSubtract(w->points[(i + 2) % w->pointCount], w->points[i], v2);
        if (VectorLengthSquared(v1) > 0.25f && VectorLengthSquared(v2) > 0.25f)
            break;
    }
    Vec3Cross(v2, v1, normal);
    Vec3Normalize(normal);
    *dist = DotProduct(w->points[0], normal);
}

float FUN_004490a0(const winding_t *w)
{
    vec3_t d1, d2, cross;
    float total = 0;

    for (int i = 2; i < w->pointCount; i++) {
        VectorSubtract(w->points[i - 1], w->points[0], d1);
        VectorSubtract(w->points[i], w->points[0], d2);
        Vec3Cross(d1, d2, cross);
        total += VectorLength(cross);
    }
    return total * 0.5f;
}

void FUN_00449180(const winding_t *w, vec3_t mins, vec3_t maxs)
{
    mins[0] = mins[1] = mins[2] = 131072.0f;
    maxs[0] = maxs[1] = maxs[2] = -131072.0f;
    for (int i = 0; i < w->pointCount; i++)
        AddPointToBounds(w->points[i], mins, maxs);
}

bool FUN_004491d0(const winding_t *w, const facePlane_t *plane, const vec3_t point, float epsilon)
{
    vec3_t dir, normal, pointvec;

    for (int i = 0; i < w->pointCount; i++) {
        VectorSubtract(w->points[(i + 1) % w->pointCount], w->points[i], dir);
        VectorSubtract(point, w->points[i], pointvec);
        Vec3Cross(dir, plane->normal, normal);
        if (DotProduct(pointvec, normal) < -epsilon)
            return false;
    }
    return true;
}

bool FUN_004492b0(const winding_t *w, const facePlane_t *plane, const vec3_t p1, const vec3_t p2, float epsilon)
{
    float front, back, frac;
    vec3_t mid;

    front = DotProduct(p1, plane->normal) - plane->dist;
    back = DotProduct(p2, plane->normal) - plane->dist;
    if (front < -epsilon && back < -epsilon)
        return false;
    if (front > epsilon && back > epsilon)
        return false;
    if (fabs(front - back) < 0.001f) {
        VectorCopy(p2, mid);
    } else {
        frac = front / (front - back);
        mid[0] = p1[0] + (p2[0] - p1[0]) * frac;
        mid[1] = p1[1] + (p2[1] - p1[1]) * frac;
        mid[2] = p1[2] + (p2[2] - p1[2]) * frac;
    }
    return FUN_004491d0(w, plane, mid, epsilon);
}

int FUN_004493c0(int a, int b)
{
    return b;
}

float FUN_004493d0(float x)
{
    return (float)fabs(x);
}
