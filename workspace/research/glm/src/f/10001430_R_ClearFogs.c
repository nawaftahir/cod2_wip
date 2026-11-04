typedef struct { float v[3]; } vec3_t;
extern void *g_world;
extern void *g_dvar_refraction;
void R_ClearFogs(const vec3_t *color)
{
    if (*(int *)((char *)g_dvar_refraction + 8) != 2)
    {
        vec3_t *dst;
        dst = (vec3_t *)((char *)g_world + 0xC8);
        dst->v[0] = color->v[0];
        dst->v[1] = color->v[1];
        dst->v[2] = color->v[2];
    }
}