#!/usr/bin/env python3
"""Round-2 variants for the two wave-1 stragglers."""
import sys
sys.path.insert(0, "/home/nawaf/cod2/test/dev/glm/tools")
from bruteforce import run, GLM
import os

SUN2 = [
# real struct-member copy (most plausible original source shape)
"""typedef struct { float v[3]; } vec3_t;
typedef struct {
    char pad0[0xC8];
    vec3_t sunOverride;
    char pad1[0x18 - 12];
    vec3_t sunColor;
} world_t;
extern world_t *g_world;
void R_SetSunLightOverride(void)
{
    g_world->sunOverride = g_world->sunColor;
}""",
# dst pointer assigned first, src second
"""extern void *g_world;
void R_SetSunLightOverride(void)
{
    float *dst;
    float *src;
    dst = (float *)((char *)g_world + 0xC8);
    src = (float *)((char *)g_world + 0xE0);
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
}""",
# int-typed element copy
"""extern void *g_world;
void R_SetSunLightOverride(void)
{
    int *dst;
    int *src;
    dst = (int *)((char *)g_world + 0xC8);
    src = (int *)((char *)g_world + 0xE0);
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
}""",
# ptr++ copy
"""extern void *g_world;
void R_SetSunLightOverride(void)
{
    float *dst;
    float *src;
    dst = (float *)((char *)g_world + 0xC8);
    src = (float *)((char *)g_world + 0xE0);
    *dst++ = *src++;
    *dst++ = *src++;
    *dst = *src;
}""",
# write via world-relative each time, read via advancing pointer
"""extern void *g_world;
void R_SetSunLightOverride(void)
{
    char *src;
    char *w;
    w = (char *)g_world;
    src = w + 0xE0;
    *(float *)(w + 0xC8) = *(float *)src;
    *(float *)(w + 0xCC) = *(float *)(src + 4);
    *(float *)(w + 0xD0) = *(float *)(src + 8);
}""",
# struct copy via world struct without pad arithmetic (fields exactly at C8/E0)
"""typedef struct { float x, y, z; } vec3_t;
extern struct { char a[0xC8]; vec3_t b; char c[0xC]; vec3_t d; } *g_world;
void R_SetSunLightOverride(void)
{
    char *w;
    vec3_t *dst;
    w = (char *)g_world;
    dst = (vec3_t *)(w + 0xC8);
    dst->x = ((vec3_t *)(w + 0xE0))->x;
    dst->y = ((vec3_t *)(w + 0xE0))->y;
    dst->z = ((vec3_t *)(w + 0xE0))->z;
}""",
]

ISDEF2 = [
# && chain, uchar return
"""extern void *g_defaultMaterial;
unsigned char R_Material_IsDefault(void *material)
{
    return *(int *)((char *)material + 0x3C) == *(int *)((char *)g_defaultMaterial + 0x3C)
        && *(int *)((char *)material + 0x40) == *(int *)((char *)g_defaultMaterial + 0x40)
        && *(int *)((char *)material + 0x38) == *(int *)((char *)g_defaultMaterial + 0x38);
}""",
# && chain, int return
"""extern void *g_defaultMaterial;
int R_Material_IsDefault(void *material)
{
    return *(int *)((char *)material + 0x3C) == *(int *)((char *)g_defaultMaterial + 0x3C)
        && *(int *)((char *)material + 0x40) == *(int *)((char *)g_defaultMaterial + 0x40)
        && *(int *)((char *)material + 0x38) == *(int *)((char *)g_defaultMaterial + 0x38);
}""",
# nested if, single exit point
"""extern void *g_defaultMaterial;
unsigned char R_Material_IsDefault(void *material)
{
    if (*(int *)((char *)material + 0x3C) == *(int *)((char *)g_defaultMaterial + 0x3C))
    {
        if (*(int *)((char *)material + 0x40) == *(int *)((char *)g_defaultMaterial + 0x40))
            return *(int *)((char *)material + 0x38) == *(int *)((char *)g_defaultMaterial + 0x38);
    }
    return 0;
}""",
# if != return 0 twice, qboolean int
"""extern void *g_defaultMaterial;
int R_Material_IsDefault(void *material)
{
    if (*(int *)((char *)material + 0x3C) != *(int *)((char *)g_defaultMaterial + 0x3C))
        return 0;
    if (*(int *)((char *)material + 0x40) != *(int *)((char *)g_defaultMaterial + 0x40))
        return 0;
    return *(int *)((char *)material + 0x38) == *(int *)((char *)g_defaultMaterial + 0x38);
}""",
# real struct members (material handle ints)
"""typedef struct { int info; int semantic; int flags; int surfaceBits; int stateBits; } Material;
extern Material *g_defaultMaterial;
int R_Material_IsDefault(Material *m)
{
    if (m->surfaceBits != g_defaultMaterial->surfaceBits)
        return 0;
    if (m->stateBits != g_defaultMaterial->stateBits)
        return 0;
    return m->flags == g_defaultMaterial->flags;
}""",
# reversed comparison order against locals
"""extern void *g_defaultMaterial;
unsigned char R_Material_IsDefault(void *material)
{
    int a, b, c, d, e, f;
    a = *(int *)((char *)material + 0x3C);
    b = *(int *)((char *)g_defaultMaterial + 0x3C);
    if (a != b)
        return 0;
    c = *(int *)((char *)material + 0x40);
    d = *(int *)((char *)g_defaultMaterial + 0x40);
    if (c != d)
        return 0;
    e = *(int *)((char *)material + 0x38);
    f = *(int *)((char *)g_defaultMaterial + 0x38);
    return e == f;
}""",
]

if __name__ == "__main__":
    which = sys.argv[1]
    if which == "sun2":
        addr, V = "0x10001460", SUN2
    else:
        addr, V = "0x10017020", ISDEF2
    print(f"== {which} @ {addr}")
    i = run(addr, V, which)
    if i is not None:
        os.makedirs(f"{GLM}/build/winners", exist_ok=True)
        open(f"{GLM}/build/winners/{which}.winner.c", "w").write(V[i])
        print(f"WINNER v{i} saved")
