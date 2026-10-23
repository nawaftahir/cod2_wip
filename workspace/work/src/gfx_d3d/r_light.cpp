// Light definition loading and registry.
#include "r_local.h"
#include "r_light.h"

GfxImage *Image_Register(const char *name, int imageTrack, int semantic);
char *I_strlwr(char *text);

// PINNED 101d7eb0: one count followed by64 definition pointers.
struct LightGlobals
{
    int count;
    GfxLightDef *defs[64];
};
static LightGlobals lightGlobals;
typedef char lightGlobalsLayoutCheck[(sizeof(LightGlobals) == 260 &&
    offsetof(LightGlobals, defs) == 4) ? 1 : -1];

// PINNED in 10013080: the definition pointers are not cleared here.
void R_ShutdownLightDefs()
{
    lightGlobals.count = 0;
}

// PINNED 10015090/68: packed sampler byte and a NUL-terminated image name.
const byte *R_LoadLightImage(const byte *data, GfxLightImage *image)
{
    image->samplerState = *data++;
    int length = strlen((const char *)data);
    image->image = length ? Image_Register((const char *)data, 5, 1) : 0;
    return data + length + 1;
}

// PINNED 100150e0/172: an empty file is freed, a negative read is not.
GfxLightDef *R_LoadLightDef(const char *name)
{
    void *buffer;
    int length = ri.FS_ReadFile(va("lights/%s", name), &buffer);
    if (length < 0)
        return 0;
    if (!length)
    {
        ri.FS_FreeFile(buffer);
        return 0;
    }
    GfxLightDef *definition = (GfxLightDef *)ri.Hunk_AllocInternal(sizeof(GfxLightDef));
    char *copy = (char *)ri.Hunk_AllocInternal(strlen(name) + 1);
    definition->name = copy;
    const byte *data = (const byte *)buffer;
    definition->type = *data++;
    data = R_LoadLightImage(data, &definition->cookie);
    R_LoadLightImage(data, &definition->attenuation);
    strcpy(copy, name);
    I_strlwr(copy);
    ri.FS_FreeFile(buffer);
    return definition;
}

// PINNED 10014c60/243: fallback is the registered default, not a missing-name alias.
GfxLightDef *R_RegisterLightDef(const char *name)
{
    for (;;)
    {
        for (int index = 0; index < lightGlobals.count; ++index)
            if (!_stricmp(name, lightGlobals.defs[index]->name))
                return lightGlobals.defs[index];
        if (lightGlobals.count == 64)
        {
            ri.Printf(0, "Loaded light defs:\n");
            for (int index = 0; index < lightGlobals.count; ++index)
                ri.Printf(0, "%s\n", lightGlobals.defs[index]->name);
            // PINNED original call omits the name argument required by its format.
            R_Error(ERR_DROP, "Can't load light def %s; %i unique light defs already loaded", lightGlobals.count);
        }
        GfxLightDef *definition = R_LoadLightDef(name);
        if (definition)
        {
            lightGlobals.defs[lightGlobals.count] = definition;
            ++lightGlobals.count;
            return definition;
        }
        if (!_stricmp(name, "light_dynamic"))
            R_Error(ERR_DROP, "Can't load the default light def '%s'", name);
        name = "light_dynamic";
    }
}
