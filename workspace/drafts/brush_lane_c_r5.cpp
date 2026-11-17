// lane c r5 drafts for FUN_00454f70 / FUN_004554e0 / FUN_00455660; see ledger/defer.tsv (lane-c-r5 rows).
// Adding the 455660 body flips Winding_InsertEdgePoint and Winding_AddPointOrdered (99%), so they stay out of src.
int FUN_00454f70(float *out, const brushVertex_t *verts, int count, int faceIndex, int maxPoints)
{
    int n = 0;
    float *dst = out;
    const brushVertex_t *v = verts;
    for (int i = 0; i < count; ++i, ++v)
    {
        if (faceIndex != v->faceIndex[0] && faceIndex != v->faceIndex[1] && faceIndex != v->faceIndex[2])
            continue;
        int j;
        for (j = 0; j < n; ++j)
        {
            int k;
            for (k = 0; k < 3; ++k)
            {
                float d = out[j * 3 + k] - v->xyz[k];
                if (d * d > 0.0001f)
                    break;
            }
            if (k == 3)
                break;
        }
        if (j < n)
            continue;
        if (n == maxPoints)
            Error("Winding point limit (%i) exceeded on brush face", maxPoints);
        dst[0] = v->xyz[0];
        dst[1] = v->xyz[1];
        dst[2] = v->xyz[2];
        dst += 3;
        ++n;
    }
    return n;
}

float FUN_004554e0(const winding_t *w, const float *normal, int *i0, int *i1, int *i2)
{
    float best = 0.0f;
    float d;
    vec3_t b, a, c;
    *i0 = 0;
    *i1 = 1;
    *i2 = 2;
    for (int k = 2; k < w->pointCount; ++k)
    {
        for (int j = 1; j < k; ++j)
        {
            VectorSubtract(w->points[k], w->points[j], a);
            for (int i = 0; i < j; ++i)
            {
                VectorSubtract(w->points[i], w->points[j], b);
                c[0] = b[1] * a[2] - b[2] * a[1];
                c[1] = b[2] * a[0] - a[2] * b[0];
                c[2] = b[0] * a[1] - b[1] * a[0];
                d = c[0] * normal[0] + c[2] * normal[2] + c[1] * normal[1];
                d = (float)fabs(d);
                if (d > best)
                {
                    *i0 = i;
                    best = d;
                    *i1 = j;
                    *i2 = k;
                }
            }
        }
    }
    return best;
}

winding_t *FUN_00455660(int faceIndex, const brushVertex_t *verts, int count, const brushdef_t *b)
{
    vec3_t pts[MAX_POINTS_ON_WINDING];
    int n = FUN_00454f70(pts[0], verts, count, faceIndex, MAX_POINTS_ON_WINDING);
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

