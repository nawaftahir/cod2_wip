#include "stdafx.h"
#include <stdlib.h>
#include <string.h>

// Retail texture comparator: two 32-bit entries, name pointer at +4.
// Original table names/extents are still pending broader TexWnd reconstruction.
struct TextureNameEntry { void *metadata; const char *name; };
extern TextureNameEntry *g_sortedTextureEntries[];
extern int g_sortedTextureCount;

extern "C" int FUN_004405d0(const void *left, const void *right)
{
    TextureNameEntry *a = *(TextureNameEntry * const *)left;
    TextureNameEntry *b = *(TextureNameEntry * const *)right;
    return _stricmp(a->name, b->name);
}

void SortTextures()
{
    qsort(g_sortedTextureEntries, g_sortedTextureCount,
          sizeof(g_sortedTextureEntries[0]), FUN_004405d0);
}

struct qtexture_s {
    void *mtl;                  // +0x00
    const char *name;           // +0x04
    char inuse;                 // +0x08
    char pad[0x1b];             // +0x09..+0x23
    qtexture_s *next;           // +0x24
};

struct MaterialNameRemap {
    const char *shaderName;     // +0x00
    const char *materialName;   // +0x04
    MaterialNameRemap *next;    // +0x08
};

struct TexWndGlobals_stub {
    char pad[0x10018];
    qtexture_s *qtextures;
    int decalLocaleBit;
    MaterialNameRemap *materialNameRemap;
};
extern TexWndGlobals_stub texWndGlobals;

int TexWnd_GetDecalLocaleBit()
{
    return texWndGlobals.decalLocaleBit;
}

// 0x00440be0 (48 B)
const char *RemapMaterialName(const char *name)
{
    for (MaterialNameRemap *remap = texWndGlobals.materialNameRemap; remap; remap = remap->next)
    {
        if (!_stricmp(name, remap->shaderName))
            return remap->materialName;
    }
    return name;
}

// 0x00440c70 (48 B)
qtexture_s *Editor_DoesMaterialExist(const char *name)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        if (!_stricmp(name, q->name))
            return q;
    }
    return NULL;
}

// 0x00441400 (27 B)
void Texture_ClearInUse(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 0;
    }
}

// Retail one-byte RET, existing accepted source.
extern "C" void FUN_00442290() {}
