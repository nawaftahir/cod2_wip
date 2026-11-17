// lane c r6 drafts: FUN_00454f70 (32%) and FUN_00455660 (28%); with both in brush.cpp GraphGetValueFromFraction 0x4832c0 flips (76%). See ledger/defer.tsv lane-c-r6.
int FUN_00454f70(vec3_t *xyz, const brushVertex_t *verts, int count, int faceIndex, int xyzLimit)
{
    int xyzCount = 0;
    for (int i = 0; i < count; ++i)
    {
        if (faceIndex == verts[i].faceIndex[0] || faceIndex == verts[i].faceIndex[1] || faceIndex == verts[i].faceIndex[2])
        {
            for (int j = 0; j < xyzCount; ++j)
            {
                if (VecNCompareCustomEpsilon(xyz[j], verts[i].xyz, 0.01f, 3))
                    goto next;
            }
            if (xyzCount == xyzLimit)
                Error("Winding point limit (%i) exceeded on brush face", xyzLimit);
            float *dst = xyz[xyzCount];
            const brushVertex_t *v = &verts[i];
            dst[0] = v->xyz[0];
            dst[1] = v->xyz[1];
            dst[2] = v->xyz[2];
            ++xyzCount;
        }
next:;
    }
    return xyzCount;
}

winding_t *FUN_00455660(int faceIndex, const brushVertex_t *verts, int count, const brushdef_t *b)
{
    vec3_t pts[MAX_POINTS_ON_WINDING];
    int n = FUN_00454f70(pts, verts, count, faceIndex, MAX_POINTS_ON_WINDING);
    if (n < 3)
        return NULL;
    int offset = faceIndex * sizeof(face_t);
    int axis0, axis1;
    const float *facePlane = b->faces[faceIndex].plane.normal;
    Winding_BestAxes(facePlane, &axis0, &axis1);
    winding_t *w = Winding_Alloc(n);
    VectorCopy(pts[0], w->points[0]);
    VectorCopy(pts[1], w->points[1]);
    w->pointCount = 2;
    for (int i = 2; i < n; ++i)
        Winding_AddPointOrdered(w, pts[i], axis0, axis1);
    int t0, t1, t2;
    vec3_t normal;
    if (!(FUN_004554e0(w, (const float *)((const char *)b->faces + offset + 0x80), &t1, &t0, &t2) >= 0.001f))
    {
        delete w;
        return NULL;
    }
    PlaneFromPoints(normal, w->points[t2], w->points[t0], w->points[t1]);
    if (normal[1] * facePlane[1] + normal[2] * facePlane[2] + normal[0] * facePlane[0] < 0.0f)
    {
        winding_t *r = Winding_Reverse(w);
        delete w;
        return r;
    }
    return w;
}

