#!/usr/bin/env python3
"""Brute-force source variants for stubborn functions: generate N variants,
compile all in one cl pass, diff each against the PE, report the best."""
import os, subprocess, sys, json

GLM = "/home/nawaf/cod2/test/dev/glm"
VAR = f"{GLM}/build/variants"
sys.path.insert(0, f"{GLM}/tools")
import match_gfx as m

def run(addr, variants, label):
    os.makedirs(f"{VAR}/{label}", exist_ok=True)
    for i, src in enumerate(variants):
        open(f"{VAR}/{label}/v{i}.c", "w").write(src)
    objdir = f"{VAR}/{label}"
    subprocess.run(["docker", "run", "--rm", "-v", f"{GLM}:/work", "-w", f"/work/build/variants/{label}",
                    "cod2-msvc71", "sh", "-c",
                    "cl /c /O2 $(ls *.c) /Fo./ 2>&1 | grep -E 'error' || true"], capture_output=True)
    best = (-1, None, None)
    for i in range(len(variants)):
        obj = f"{objdir}/v{i}.obj"
        if not os.path.exists(obj):
            continue
        m.obj_bytes_global = open(obj, "rb").read()
        try:
            coff = m.parse_coff(m.obj_bytes_global)
            cbytes, cmask, cname, cval = m.coff_function_bytes(coff)
            cfn = cbytes[cval:]
            fnb, meta = m.carve(addr)
            pe_mask = m.pe_mask_for(m.rva2off(int(addr, 16) - 0x10000000), len(fnb), fnb, int(addr, 16) - 0x10000000)
            a = m.normalize(fnb, pe_mask)
            b = m.normalize(cfn, {p for p in cmask if p >= cval})
            n = min(len(a), len(b))
            eq = sum(1 for j in range(n) if a[j] == b[j])
            score = eq * 100 // max(len(a), len(b), 1)
            exact = score == 100 and len(a) == len(b)
            print(f"  v{i}: {score:>3}% pe={len(a)} obj={len(b)} {'*** MATCH ***' if exact else ''}")
            if exact:
                return i
            if score > best[0]:
                best = (score, i, len(b))
        except Exception as e:
            print(f"  v{i}: ERR {e}")
    print(f"  best: v{best[1]} at {best[0]}%")
    return None

SUN = [
"""typedef struct { float v[3]; } vec3_t;
extern void *g_world;
void R_SetSunLightOverride(void)
{
    char *w;
    w = g_world;
    *(vec3_t *)(w + 0xC8) = *(vec3_t *)(w + 0xE0);
}""",
"""typedef struct { float v[3]; } vec3_t;
extern void *g_world;
void R_SetSunLightOverride(void)
{
    vec3_t *dst;
    vec3_t *src;
    src = (vec3_t *)((char *)g_world + 0xE0);
    dst = (vec3_t *)((char *)g_world + 0xC8);
    *dst = *src;
}""",
"""#include <string.h>
extern void *g_world;
void R_SetSunLightOverride(void)
{
    memcpy((char *)g_world + 0xC8, (char *)g_world + 0xE0, 12);
}""",
"""typedef struct { float v[3]; } vec3_t;
extern void *g_world;
void R_SetSunLightOverride(void)
{
    vec3_t *dst;
    char *w;
    w = g_world;
    dst = (vec3_t *)(w + 0xC8);
    dst->v[0] = ((vec3_t *)(w + 0xE0))->v[0];
    dst->v[1] = ((vec3_t *)(w + 0xE0))->v[1];
    dst->v[2] = ((vec3_t *)(w + 0xE0))->v[2];
}""",
"""typedef struct { float v[3]; } vec3_t;
extern void *g_world;
void R_SetSunLightOverride(void)
{
    *(vec3_t *)((char *)g_world + 0xC8) = *(vec3_t *)((char *)g_world + 0xE0);
}""",
]

FOGS = [
"""typedef struct { float v[3]; } vec3_t;
extern void *g_world;
extern void *g_dvar_refraction;
void R_ClearFogs(const vec3_t *color)
{
    vec3_t *dst;
    if (*(int *)((char *)g_dvar_refraction + 8) != 2)
    {
        dst = (vec3_t *)((char *)g_world + 0xC8);
        *dst = *color;
    }
}""",
"""typedef struct { float v[3]; } vec3_t;
extern void *g_world;
extern void *g_dvar_refraction;
void R_ClearFogs(const vec3_t *color)
{
    if (*(int *)((char *)g_dvar_refraction + 8) != 2)
        *(vec3_t *)((char *)g_world + 0xC8) = *color;
}""",
"""typedef struct { float v[3]; } vec3_t;
extern char *g_world;
extern int *g_dvar_refraction;
void R_ClearFogs(const vec3_t *color)
{
    char *w;
    if (g_dvar_refraction[2] != 2)
    {
        w = g_world;
        *(vec3_t *)(w + 0xC8) = *color;
    }
}""",
"""#include <string.h>
extern void *g_world;
extern void *g_dvar_refraction;
void R_ClearFogs(const void *color)
{
    if (*(int *)((char *)g_dvar_refraction + 8) != 2)
        memcpy((char *)g_world + 0xC8, color, 12);
}""",
"""typedef struct { float v[3]; } vec3_t;
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
}""",
]

ISDEF = [
"""extern void *g_defaultMaterial;
unsigned char R_Material_IsDefault(void *material)
{
    return *(int *)((char *)material + 0x3C) == *(int *)((char *)g_defaultMaterial + 0x3C)
        && *(int *)((char *)material + 0x40) == *(int *)((char *)g_defaultMaterial + 0x40)
        && *(int *)((char *)material + 0x38) == *(int *)((char *)g_defaultMaterial + 0x38);
}""",
"""extern void *g_defaultMaterial;
unsigned char R_Material_IsDefault(void *material)
{
    char *d;
    d = (char *)g_defaultMaterial;
    if (*(int *)((char *)material + 0x3C) != *(int *)(d + 0x3C))
        return 0;
    if (*(int *)((char *)material + 0x40) != *(int *)(d + 0x40))
        return 0;
    return *(int *)((char *)material + 0x38) == *(int *)(d + 0x38);
}""",
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
"""extern void *g_defaultMaterial;
unsigned char R_Material_IsDefault(void *material)
{
    char *m;
    char *d;
    m = (char *)material;
    d = (char *)g_defaultMaterial;
    return *(int *)(m + 0x3C) == *(int *)(d + 0x3C)
        && *(int *)(m + 0x40) == *(int *)(d + 0x40)
        && *(int *)(m + 0x38) == *(int *)(d + 0x38);
}""",
]

if __name__ == "__main__":
    which = sys.argv[1]
    table = {"sun": ("0x10001460", SUN), "fogs": ("0x10001430", FOGS), "isdef": ("0x10017020", ISDEF)}
    addr, variants = table[which]
    print(f"== {which} @ {addr}")
    i = run(addr, variants, which)
    if i is not None:
        open(f"{GLM}/build/variants/{which}.winner", "w").write(variants[i])
        print(f"WINNER v{i} saved")
