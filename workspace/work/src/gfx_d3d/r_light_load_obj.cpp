// Light definition file loading.
#include "r_local.h"
#include "r_light.h"

GfxImage *Image_Register(const char *name, int semantic, int imageTrack);
char *I_strlwr(char *text);

// PINNED 10015090/68: packed sampler byte and a NUL-terminated image name.
const byte *R_LoadLightImage(const byte *data, GfxLightImage *image)
{
    image->samplerState = *data++;
    int length = strlen((const char *)data);
    image->image = length ? Image_Register((const char *)data, 1, 5) : 0;
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
