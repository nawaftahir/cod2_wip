#include "stdafx.h"
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"

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
    char f09;                   // +0x09
    char f0a;                   // +0x0a
    short f0c;                  // +0x0c
    int f10;                    // +0x10
    int width;                  // +0x14
    int height;                 // +0x18
    int f1c;                    // +0x1c
    int f20;                    // +0x20
    qtexture_s *next;           // +0x24
};

struct MaterialNameRemap {
    const char *shaderName;     // +0x00
    const char *materialName;   // +0x04
    MaterialNameRemap *next;    // +0x08
};

struct TexWndGlobals_stub {
    char pad[0x14];
    int textureCount;
    qtexture_s *textureArray[0x4000];
    qtexture_s *qtextures;
    int decalLocaleBit;
    MaterialNameRemap *materialNameRemap;
};
extern TexWndGlobals_stub texWndGlobals;

int TexWnd_GetDecalLocaleBit()
{
    return texWndGlobals.decalLocaleBit;
}

// material info filled by the renderer (0x2c bytes); only the fields the retail code reads are named
struct MaterialInfo {
    char pad00[0x0c];
    char f0c;
    char pad0d[8];
    char f15;
    short f16;
    int f18;
    unsigned short autoTexScaleWidth;
    unsigned short autoTexScaleHeight;
    char pad20[4];
    int f24;
    int f28;
};

extern void *(*FUN_0059c310)(const char *name, int a, int b);
extern bool (*FUN_0059c318)(void *handle);
extern void (*FUN_0059c438)(void *handle, MaterialInfo *info);
void Error(const char *fmt, ...);
void Sys_Printf(const char *fmt, ...);
char *FUN_0046cb10(const char *str);

// 0x004406c0 (297 B): mtlInfo comes in edi
qtexture_s *FUN_004406c0(const MaterialInfo *mtlInfo, const char *name, void *handle)
{
#line 151
    assert(mtlInfo->autoTexScaleWidth != 0 && mtlInfo->autoTexScaleHeight != 0);
    qtexture_s *newRadMat = new qtexture_s;
#line 154
    assert(newRadMat);
    memset(newRadMat, 0, sizeof(*newRadMat));
    newRadMat->mtl = handle;
    newRadMat->name = FUN_0046cb10(name);
    newRadMat->inuse = 1;
    newRadMat->f0a = mtlInfo->f15;
    newRadMat->f10 = mtlInfo->f18;
    newRadMat->f0c = mtlInfo->f16;
    newRadMat->f09 = mtlInfo->f0c;
    newRadMat->width = mtlInfo->autoTexScaleWidth;
    newRadMat->height = mtlInfo->autoTexScaleHeight;
    newRadMat->f1c = mtlInfo->f24;
    newRadMat->f20 = mtlInfo->f28;
    qtexture_s **head = &texWndGlobals.qtextures;
    newRadMat->next = *head;
    *head = newRadMat;
    texWndGlobals.textureArray[texWndGlobals.textureCount++] = newRadMat;
    return newRadMat;
}

// 0x00440840 (320 B)
qtexture_s *FUN_00440840(const char *name)
{
    char lowercaseName[0x40];
    MaterialInfo info;

    if (strlen(name) >= 0x40)
        Error("texture name '%s' is too long", name);
    strcpy(lowercaseName, name);
    _strlwr(lowercaseName);
#line 195
    assert(lowercaseName[0] != '(');

    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        if (!_stricmp(lowercaseName, q->name))
        {
            q->inuse = 1;
            if (!q->mtl)
                q->mtl = FUN_0059c310(lowercaseName, 3, 0);
            return q;
        }
    }
    void *handle = FUN_0059c310(lowercaseName, 3, 0);
    if (FUN_0059c318(handle))
        Sys_Printf("\t\t\tWARNING: Could not find material '%s'\n", name);
    FUN_0059c438(handle, &info);
    return FUN_004406c0(&info, lowercaseName, handle);
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

struct RadiantFilterEntry {
    const char *name;
    int pad;
};

// 0x00440d90 (90 B)
BOOL AppendTextureFilterMenu(HMENU hMenu, LPCSTR lpNewItem,
                            const RadiantFilterEntry *array, int count, int idBase)
{
    HMENU sub = CreateMenu();
    for (int v5 = 0; v5 < count; ++v5)
    {
        const char *name = array[v5].name;
        if (!name)
        {
            AppendMenuA(sub, MF_SEPARATOR, (UINT_PTR)name, name);
        }
        else
        {
            AppendMenuA(sub, MF_STRING, v5 + idBase, name);
        }
    }
    return AppendMenuA(hMenu, MF_POPUP, (UINT_PTR)sub, lpNewItem);
}

// 0x00441400 (27 B)
void Texture_ClearInUse(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 0;
    }
}

// 0x00441440 (27 B)
void Texture_ShowAll(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 1;
    }
}



// Retail one-byte RET, existing accepted source.
extern "C" void FUN_00442290() {}
