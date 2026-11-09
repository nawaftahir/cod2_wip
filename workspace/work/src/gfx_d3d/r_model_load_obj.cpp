// Model skin loading. TU name from the Mac 1.3 build path.
#include "gfx.h"
#include "imports.h"

Material *Material_Register(const char *name, int imageTrack);
char *_strlwr(char *string);

// PINNED 10020400/278: API59 slot97; Mac 1.3 calls this R_LoadXSkins.
Material ***R_LoadXModelSkins(const XModel *model)
{
    XSurface **surfaces;
    int *partBits;
    int lodCount = ri.XModelGetNumLods(model);
    int surfaceCount = 0;
    for (int lod = 0; lod < lodCount; ++lod)
        surfaceCount += ri.XModelGetSurfaces(model, &surfaces, lod, &partBits);
    Material ***skins = (Material ***)ri.Hunk_AllocInternal(
        (surfaceCount + lodCount) * sizeof(void *));
    Material **next = (Material **)(skins + lodCount);
    for (int lod = 0; lod < lodCount; ++lod)
    {
        int count = ri.XModelGetSurfaces(model, &surfaces, lod, &partBits);
        Material **end = next + count;
        skins[lod] = next;
        for (int index = 0; index < count; ++index)
        {
            char name[64];
            strcpy(name, ri.XModelGetSurfaceName(model, index, lod));
            _strlwr(name);
            skins[lod][index] = *name ? Material_Register(name, 8) : rgp.defaultMaterial;
        }
        next = end;
    }
    return skins;
}
