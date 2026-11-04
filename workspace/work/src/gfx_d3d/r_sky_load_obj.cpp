// Sun file loading.
#include "gfx.h"
#include "r_sun_state.h"

extern const char *sunDvarNames[21];
void R_SetSunFromDvars(sunflare_t *sun);
void Com_Memset(void *dest, int val, int count);

// PINNED 100291c0/102: parse success updates the sun before freeing the input.
void R_LoadSunThroughDvars(const char *name, sunflare_t *sun)
{
    const char *path = va("sun/%s.sun", name);
    void *buffer;
    if (ri.FS_ReadFile(path, &buffer) < 0)
    {
        Com_Printf("^3WARNING: couldn't load sun file '%s'\n", path);
        return;
    }
    if (ri.Com_LoadDvarsFromBuffer(sunDvarNames, 21, (const char *)buffer, path))
        R_SetSunFromDvars(sun);
    ri.FS_FreeFile(buffer);
}

// PINNED 10029230: strip the path and extension, then load sun/<name>.sun.
void R_LoadSun(const char *name, sunflare_t *sun)
{
    char sunFile[64];
    const char *base;
    const char *p;
    char *dot;
    Com_Memset(sun, 0, sizeof(*sun));
    base = name;
    for (p = name; *p; p++)
    {
        if (*p == '/' || *p == '\\')
            base = p + 1;
    }
    I_strncpyz(sunFile, base, sizeof(sunFile));
    dot = strchr(sunFile, '.');
    if (dot)
        *dot = 0;
    if (sunFile[0])
        R_LoadSunThroughDvars(sunFile, sun);
}
