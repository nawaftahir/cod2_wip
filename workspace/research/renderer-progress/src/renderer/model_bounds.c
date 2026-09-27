void R_ModelBounds(const float *bounds, float *mins, float *maxs)
{
    if (bounds != 0)
    {
        mins[0] = bounds[0];
        mins[1] = bounds[1];
        mins[2] = bounds[2];
        maxs[0] = bounds[3];
        maxs[1] = bounds[4];
        maxs[2] = bounds[5];
        return;
    }
    mins[0] = 0.0f;
    mins[1] = 0.0f;
    mins[2] = 0.0f;
    maxs[0] = 0.0f;
    maxs[1] = 0.0f;
    maxs[2] = 0.0f;
}
