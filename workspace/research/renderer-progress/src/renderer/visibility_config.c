extern float renderer_cull_distance;

void R_SetCullDist(float distance)
{
    if (distance <= 0.0f)
    {
        renderer_cull_distance = 0.0f;
    }
    else
    {
        renderer_cull_distance = distance;
    }
}
