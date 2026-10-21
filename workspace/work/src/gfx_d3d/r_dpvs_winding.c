/* Scalar C-kernel experiment; no historical TU or C linkage is claimed. */
typedef float vec3_t[3];

static __inline float WindingDot3(const float *a, const float *b)
{
    return a[0] * b[0] + b[1] * a[1] + a[2] * b[2];
}

/* PINNED 1.0 convex-winding search and plane coefficients at offsets 0..12. */
double R_FurthestPointOnWinding(const vec3_t *points, int pointCount, const float *plane)
{
    int index;
    float furthest;
    float first;
    float last;

    first = WindingDot3(plane, points[0]) + plane[3];
    last = WindingDot3(plane, points[pointCount - 1]) + plane[3];

    if (first > last)
    {
        furthest = first;
        for (index = 1; index < pointCount - 1; ++index)
        {
            float distance = WindingDot3(plane, points[index]) + plane[3];
            if (furthest > distance)
                break;
            furthest = distance;
        }
    }
    else
    {
        furthest = last;
        for (index = pointCount - 2; index > 0; --index)
        {
            float distance = WindingDot3(plane, points[index]) + plane[3];
            if (furthest > distance)
                break;
            furthest = distance;
        }
    }
    return furthest;
}

double R_NearestPointOnWinding(const vec3_t *points, int pointCount, const float *plane)
{
    int index;
    float nearest;
    float first;
    float last;

    first = WindingDot3(plane, points[0]) + plane[3];
    last = WindingDot3(plane, points[pointCount - 1]) + plane[3];

    if (first < last)
    {
        nearest = first;
        for (index = 1; index < pointCount - 1; ++index)
        {
            float distance = WindingDot3(plane, points[index]) + plane[3];
            if (nearest < distance)
                break;
            nearest = distance;
        }
    }
    else
    {
        nearest = last;
        for (index = pointCount - 2; index > 0; --index)
        {
            float distance = WindingDot3(plane, points[index]) + plane[3];
            if (nearest < distance)
                break;
            nearest = distance;
        }
    }
    return nearest;
}
