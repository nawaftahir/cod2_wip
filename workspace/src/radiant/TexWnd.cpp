#include "stdafx.h"
#include "TexWnd.h"
#include "FindTextureDlg.h"
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <malloc.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"

// retail level-1 assert without a message (same shape as brush.cpp)
#define assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)

void Error(const char *error, ...);
void Sys_Printf(const char *text, ...);
int LoadFile(const char *filename, void **bufferptr);
void Com_BeginParseSession(const char *filename);
void Com_EndParseSession(void);
void Com_SetCSV(int csv);
char *Com_Parse(const char **data_p);
char *Com_ParseOnLine(const char **data_p);
void Com_SkipRestOfLine(const char **data);
char *FUN_0046cb10(const char *str);
void FUN_00441460(void);
extern HWND dword_010bcd54;
extern int g_nUpdateBits;
#define ARRAY_COUNT(a) (sizeof(a) / sizeof((a)[0]))
struct RadiantFilterEntry {
    const char *name;
    int id;
};
extern RadiantFilterEntry surfaceTypes[23];

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

// What the renderer fills in for a material (44 B on the stack in the callers);
// the two scale fields are named by the assert text in 0x004406c0.
struct RadMtlInfo {
    int field_00, field_04, field_08;
    unsigned char field_0c;
    unsigned char field_0d;
    unsigned short field_0e, field_10, field_12;
    unsigned char field_14;
    unsigned char field_15;
    unsigned short field_16;
    int field_18;
    unsigned short autoTexScaleWidth;   // +0x1c
    unsigned short autoTexScaleHeight;  // +0x1e
    int pad20;
    int field_24;
    int field_28;
};

struct qtexture_s {
    void *mtl;                  // +0x00
    const char *name;           // +0x04
    unsigned char inuse;        // +0x08
    char field_09;
    unsigned char field_0a;
    char pad0b;
    short field_0c;
    short pad0e;
    int field_10;
    int width;                  // +0x14
    int height;                 // +0x18
    int field_1c;
    int field_20;
    qtexture_s *next;           // +0x24
};

// Renderer export table (Q3Radiant "re"), base 0x59c300; only the slots used here are typed.
struct TexWndRefExport {
    void *pad0[4];
    void *(*field_10)(const char *name, int type, int flags);   // 0x59c310
    void *pad1;
    char (*field_18)(void *handle);                             // 0x59c318
    void *pad2[(0x98 - 0x1c) / 4];
    void (*field_98)(float x, float y, float w, float h, float s0, float t0, float s1, float t1,
                     const float *color, void *material);       // 0x59c398
    void *pad2a[(0xac - 0x9c) / 4];
    void (*BeginScene)();                                       // 0x59c3ac
    void (*EndScene)();                                         // 0x59c3b0
    void *pad2b[4];
    void (*ClearScreen)(int mask, const float *color, float depth, int stencil); // 0x59c3c4
    void *pad2c[(0x114 - 0xc8) / 4];
    int (*field_114)(int arg);                                  // 0x59c414
    void (*field_118)(const char *text, int maxChars, int font, float x, float y,
                      float xScale, float yScale, const float *color, int style); // 0x59c418
    void *pad2d[(0x138 - 0x11c) / 4];
    void (*field_138)(void *handle, RadMtlInfo *info);          // 0x59c438
    void *pad3[1];
    char (*BeginWindow)(HWND hwnd);                             // 0x59c440
    void (*EndWindow)(HWND hwnd);                               // 0x59c444
    void (*ResizeWindow)(HWND hwnd, int width, int height);     // 0x59c448
    void *pad4[(0x160 - 0x14c) / 4];
    void (*AddLines)(int count, int width, const void *verts);  // 0x59c460
    void *pad5;
    void (*ColorToBytes)(const float *color, unsigned char *out); // 0x59c468
    void *pad6[(0x1b0 - 0x16c) / 4];
    void (*field_1b0)();                                        // 0x59c4b0
};
extern TexWndRefExport re;

struct MaterialNameRemap {
    const char *shaderName;     // +0x00
    const char *materialName;   // +0x04
    MaterialNameRemap *next;    // +0x08
};

struct TexWndGlobals_stub {
    int textureOffset;          // +0x00, Q3Radiant g_nTextureOffset
    int usageCount;             // +0x04, "texWndGlobals.usageCount" assert string
    int localeCount;            // +0x08
    unsigned char usageFilter;  // +0x0c
    unsigned char localeFilter; // +0x0d
    unsigned char surfaceTypeFilter; // +0x0e
    bool filterEnabled;         // +0x0f
    CString filter;             // +0x10
    int materialCount;            // +0x14
    qtexture_s *sortedMaterials[0x4000]; // +0x18
    qtexture_s *qtextures;
    int decalLocaleBit;
    MaterialNameRemap *materialNameRemap;
};
extern TexWndGlobals_stub texWndGlobals;

int TexWnd_GetDecalLocaleBit()
{
    return texWndGlobals.decalLocaleBit;
}

extern int dword_01129604;
extern char *dword_01233488;
extern unsigned dword_0123348c;

// 0x00440620 (160 B incl. the 4-entry jump table; the inventory says 159)
void __fastcall Texture_SetMode(int iTexMenu)
{
    int mode;
    switch (iTexMenu)
    {
    case 0x80df:
        mode = 0;
        break;
    case 0x80e0:
        mode = 1;
        break;
    case 0x80e1:
        mode = 2;
        break;
    case 0x80e2:
        mode = 3;
        break;
    default:
#line 134
        assertFailMsg(1, "unhandled case");
        return;
    }

    dword_01129604 = iTexMenu;
    char *cam = *(char **)(dword_01233488 + 0x78c);
    if (*(int *)(cam + 0x78) != mode)
    {
        *(int *)(cam + 0x78) = mode;
        dword_0123348c |= 1;
    }
}

// 0x004406c0 (297 B)
qtexture_s *FUN_004406c0(char *name, void *handle, RadMtlInfo *mtlInfo)
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
    newRadMat->field_0a = mtlInfo->field_15;
    newRadMat->field_10 = mtlInfo->field_18;
    newRadMat->field_0c = mtlInfo->field_16;
    newRadMat->field_09 = mtlInfo->field_0c;
    newRadMat->width = mtlInfo->autoTexScaleWidth;
    newRadMat->height = mtlInfo->autoTexScaleHeight;
    newRadMat->field_1c = mtlInfo->field_24;
    newRadMat->field_20 = mtlInfo->field_28;
    qtexture_s **head = &texWndGlobals.qtextures;
    newRadMat->next = *head;
    *head = newRadMat;
    texWndGlobals.sortedMaterials[texWndGlobals.materialCount++] = newRadMat;
    return newRadMat;
}

// 0x004407f0 (77 B)
void FUN_004407f0(qtexture_s *radMat)
{
#line 179
    assert(radMat);
    delete radMat;
}

// 0x00440840 (320 B)
qtexture_s *__fastcall FUN_00440840(char *name)
{
    char lowercaseName[64];
    RadMtlInfo mtlInfo;

    if (strlen(name) >= 64)
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
                q->mtl = re.field_10(lowercaseName, 3, 0);
            return q;
        }
    }
    void *handle = re.field_10(lowercaseName, 3, 0);
    if (re.field_18(handle))
        Sys_Printf("\t\t\tWARNING: Could not find material '%s'\n", name);
    re.field_138(handle, &mtlInfo);
    return FUN_004406c0(lowercaseName, handle, &mtlInfo);
}

qtexture_s *Editor_DoesMaterialExist(const char *name);

// 0x00440980 (31 B)
void FUN_00440980(char *name, RadMtlInfo *mtlInfo)
{
    if (!Editor_DoesMaterialExist(name))
        FUN_004406c0(name, 0, mtlInfo);
}

// 0x004409a0 (563 B)
void FUN_004409a0(void)
{
    char *buffer;
    const char *p;

#line 235
    assert1(texWndGlobals.materialNameRemap == NULL);
    if (LoadFile("MaterialNames.csv", (void **)&buffer) < 0)
        return;
    Com_BeginParseSession("MaterialNames.csv");
    Com_SetCSV(1);
    p = buffer;
    for (;;)
    {
        char *token = Com_Parse(&p);
        if (!p)
            break;
        if (token[0] != '#' && token[0] != 0)
        {
            char *shaderName = FUN_0046cb10(token);
            char *materialName = Com_ParseOnLine(&p);
            if (!materialName)
                Error("shader name '%s' doesn't have a matching material name in MaterialNames.csv", shaderName);
            materialName = FUN_0046cb10(materialName);
            _strlwr(materialName);
            MaterialNameRemap *remap = new MaterialNameRemap;
            remap->shaderName = shaderName;
            remap->materialName = materialName;
            remap->next = texWndGlobals.materialNameRemap;
            texWndGlobals.materialNameRemap = remap;
        }
        Com_SkipRestOfLine(&p);
    }
    Com_EndParseSession();
    free(buffer);
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

// 0x00440c10 (92 B)
qtexture_s *FUN_00440c10(char *name, int flag)
{
    if (!flag)
    {
        char *base = name;
        for (char *p = name; *p; ++p)
        {
            if (*p == '/' || *p == '\\')
                base = p + 1;
        }
        name = (char *)RemapMaterialName(base);
    }
    return FUN_00440840(name);
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

enum FsThread { FS_THREAD_MAIN = 0, FS_THREAD_STREAM = 1 };
enum FsListBehavior { FS_LIST_PURE_ONLY = 0, FS_LIST_ALL = 1 };
int FS_Read(void *buffer, int len, int h);
void FS_FCloseFile(int h);
int FS_FOpenFileRead_Internal(const char *filename, int *file, int uniqueFILE, FsThread thread);
char **FS_ListFiles(const char *path, const char *extension, FsListBehavior behavior, int *numfiles, int allocType);
void FS_FreeFileList(char **list, int allocType);
char *va(const char *format, ...);
extern int dword_01143494;

// 0x00440ca0 (230 B), scan materials/ for material headers and register the new ones
void FUN_00440ca0(void)
{
    char **files;
    int fileCount;
    int file;
    RadMtlInfo info;

    files = FS_ListFiles("materials", "", FS_LIST_PURE_ONLY, &fileCount, 10);
    for (int i = 0; i < fileCount; i++)
    {
        const char *path = va("materials/%s", files[i]);
        dword_01143494 = 1;
        FS_FOpenFileRead_Internal(path, &file, 0, FS_THREAD_MAIN);
        if (file)
        {
            int got = FS_Read(&info, sizeof(info), file);
            FS_FCloseFile(file);
            if (got == sizeof(info) && info.field_15 && info.field_18 && info.autoTexScaleWidth && info.autoTexScaleHeight)
            {
                char *name = files[i];
                if (!Editor_DoesMaterialExist(name))
                    FUN_004406c0(name, 0, &info);
            }
        }
    }
    FS_FreeFileList(files, 10);
}

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

// 0x00440df0 (420 B)
int FUN_00440df0(char *filename, RadiantFilterEntry *table, int count, int limit, int idBase)
{
    char line[1024];

    FILE *f = fopen(filename, "rb");
    if (!f)
        Error("missing file '%s'\n", filename);
    line[1023] = 0;
    while (fgets(line, 1024, f))
    {
        if (line[1023])
        {
            fclose(f);
            Error("line longer than %i characters in '%s'\n", 4, filename);
        }
        char *p = line;
        while (isspace(*p))
            ++p;
        if (strncmp(p, "//", 2))
        {
            size_t len = strlen(p);
            while (len && isspace(p[len - 1]))
                --len;
            if (len)
            {
                p[len] = 0;
                if (count == limit)
                {
                    fclose(f);
                    Error("%i string limit exceeded in '%s'\n", limit, filename);
                }
                if (!_stricmp(p, "<separator>"))
                {
                    table[count].name = 0;
                    table[count].id = -1;
                }
                else
                {
                    table[count].name = FUN_0046cb10(p);
                    table[count].id = idBase++;
                }
                ++count;
            }
        }
    }
    return count;
}

extern RadiantFilterEntry DAT_00590a68[256];
extern RadiantFilterEntry DAT_00591268[256];

// 0x00440fa0 (347 B)
void FUN_00440fa0()
{
    HMENU hMenu = GetSubMenu(GetMenu(dword_010bcd54), 5);
    if (!texWndGlobals.usageCount && !texWndGlobals.localeCount)
    {
        texWndGlobals.usageCount = FUN_00440df0("../deffiles/materials/usage.txt", DAT_00590a68, 1, 256, 1);
        texWndGlobals.localeCount = FUN_00440df0("../deffiles/materials/locale.txt", DAT_00591268, 1, 256, 0);
    }
    AppendTextureFilterMenu(hMenu, "Usage", DAT_00590a68, texWndGlobals.usageCount, 60000);
    AppendTextureFilterMenu(hMenu, "Locale", DAT_00591268, texWndGlobals.localeCount, 60256);
    AppendTextureFilterMenu(hMenu, "Surface type", surfaceTypes, 23, 60512);
    texWndGlobals.usageFilter = 0;
    texWndGlobals.localeFilter = 0;
    texWndGlobals.surfaceTypeFilter = 0;
    for (int i = 0; i < texWndGlobals.localeCount; i++)
    {
        if (DAT_00591268[i].name && !_stricmp(DAT_00591268[i].name, "decal"))
            texWndGlobals.decalLocaleBit = 1 << DAT_00591268[i].id;
    }
    CheckMenuItem(hMenu, texWndGlobals.usageFilter + 60000, MF_CHECKED);
    CheckMenuItem(hMenu, texWndGlobals.localeFilter + 60256, MF_CHECKED);
    CheckMenuItem(hMenu, texWndGlobals.surfaceTypeFilter + 60512, MF_CHECKED);
}

// 0x00441100 (252 B), index in ebx
void FUN_00441100(int index)
{
    FUN_00441460();
#line 471
    assert(index >= 0 && index < texWndGlobals.usageCount);
    if (index != texWndGlobals.usageFilter)
    {
        HMENU hMenu = GetSubMenu(GetMenu(dword_010bcd54), 5);
        CheckMenuItem(hMenu, texWndGlobals.usageFilter + 60000, MF_UNCHECKED);
        CheckMenuItem(hMenu, index + 60000, MF_CHECKED);
        texWndGlobals.usageFilter = index;
#line 480
        assert1(texWndGlobals.usageFilter == index);
        g_nUpdateBits |= 0x10;
    }
}

// 0x00441200 (252 B), index in ebx
void FUN_00441200(int index)
{
    FUN_00441460();
#line 491
    assert(index >= 0 && index < texWndGlobals.localeCount);
    if (index != texWndGlobals.localeFilter)
    {
        HMENU hMenu = GetSubMenu(GetMenu(dword_010bcd54), 5);
        CheckMenuItem(hMenu, texWndGlobals.localeFilter + 60256, MF_UNCHECKED);
        CheckMenuItem(hMenu, index + 60256, MF_CHECKED);
        texWndGlobals.localeFilter = index;
#line 500
        assert1(texWndGlobals.localeFilter == index);
        g_nUpdateBits |= 0x10;
    }
}

// 0x00441300 (249 B), index in ebx
void FUN_00441300(int index)
{
    FUN_00441460();
#line 511
    assert(index >= 0 && index < ARRAY_COUNT(surfaceTypes));
    if (index != texWndGlobals.surfaceTypeFilter)
    {
        HMENU hMenu = GetSubMenu(GetMenu(dword_010bcd54), 5);
        CheckMenuItem(hMenu, texWndGlobals.surfaceTypeFilter + 60512, MF_UNCHECKED);
        CheckMenuItem(hMenu, index + 60512, MF_CHECKED);
        texWndGlobals.surfaceTypeFilter = index;
#line 520
        assert1(texWndGlobals.surfaceTypeFilter == index);
        g_nUpdateBits |= 0x10;
    }
}

// 0x00441400 (27 B)
void Texture_ClearInUse(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 0;
    }
}

void FUN_00441f80(int y, int x);
extern int dword_01128da0;

// 0x00441420 (23 B)
void FUN_00441420(void)
{
    FUN_00441f80(16, 16);
    dword_01128da0 = 0;
}

// 0x00441440 (27 B)
void Texture_ShowAll(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 1;
    }
}
#pragma auto_inline(off)
// 0x00441460 (53 B), out of line: retail 0x41ba70 is a plain jmp to it
void FUN_00441460(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 1;
    }
    Sys_Printf("Showing all textures...\n");
    g_nUpdateBits |= 0x10;
}

#pragma auto_inline(on)
// Layout projections for FUN_004414a0 (offsets from retail).
typedef qtexture_s InuseTex;
struct InuseTexdef { InuseTex *radMat; unsigned char pad[0x18]; };
struct InuseFace { unsigned char pad[0x24]; InuseTexdef texdef[2]; unsigned char pad2[0xa8 - 0x24 - 2 * sizeof(InuseTexdef)]; };
struct InusePatch { unsigned char pad[0x18]; InuseTex *radMat[2]; };
struct InuseEclass { unsigned char pad[8]; int fixedsize; };
struct InuseEntityDef { unsigned char pad[0x50]; InuseEclass *eclass; };
struct InuseBrushDef
{
    unsigned char pad[8];
    InuseEntityDef *entdef;
    unsigned char pad1[0x2c];
    int faceCount;
    InuseFace *faces;
    unsigned char pad2[4];
    InusePatch *patch;
};
struct InuseOwner { unsigned char pad[0x38]; char *sub; };
struct InuseBrush
{
    InuseBrush *prev;
    InuseBrush *next;
    InuseOwner *owner;
    unsigned char pad[8];
    InuseBrushDef *def;
};
extern struct { int activeMaterial; } g_qeglobals;

// 0x004414a0 (351 B)
void FUN_004414a0(InuseBrush *head)
{
    for (InuseBrush *b = head->next; b && b != head; b = b->next)
    {
        InuseBrushDef *def = b->def;
        if (def->entdef->eclass->fixedsize)
        {
            if (b->owner->sub)
                FUN_004414a0((InuseBrush *)(b->owner->sub + 0xc));
        }
        else if (def->patch)
        {
#line 575
            assert(def->patch->radMat);
            def->patch->radMat[g_qeglobals.activeMaterial]->inuse = 1;
        }
        else
        {
            for (int i = 0; i < def->faceCount; i++)
            {
                InuseFace *f = &def->faces[i];
#line 583
                assert(f->texdef[g_qeglobals.activeMaterial].radMat);
                f->texdef[g_qeglobals.activeMaterial].radMat->inuse = 1;
            }
        }
    }
}

extern HWND dword_010bcd70;
extern InuseBrush dword_010a44dc;
extern InuseBrush dword_010a44b4;
extern InuseBrush dword_010a448c;

// 0x00441600 (163 B)
void FUN_00441600(void)
{
    dword_01128da0 = 0;
    texWndGlobals.localeFilter = 0;
    texWndGlobals.usageFilter = 0;
    texWndGlobals.surfaceTypeFilter = 0;
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 0;
    }
    SendMessage(dword_010bcd70, 0x401, 0, (LPARAM)"Selecting active textures\n");
    FUN_004414a0(&dword_010a44dc);
    FUN_004414a0(&dword_010a44b4);
    SortTextures();
    g_nUpdateBits |= 0x10;
    int count = 0;
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        if (q->inuse)
            count++;
    }
    Sys_Printf("%d textures in use\n", count);
}

void FUN_0043dff0();
void __stdcall FUN_0043cf80(void *dlg);
extern int dword_0109fdb4;
extern char dword_01234a38[];
class CTextureBar : public CDialogBar { public: void FUN_0043f460(); };
struct CTexWndFrameProjection { unsigned char pad_00[0x2b8]; CTextureBar m_wndTextureBar; };
class CMainFrame;
extern CMainFrame *g_pParentWnd;
struct brush_t;
void FUN_0045f720(brush_t *head);
void FUN_0045f7e0();
extern int dword_01128d90;
extern int dword_01128d94;
extern float dword_01128dc4;

// 0x004416b0 (152 B), texture in eax
void FUN_004416b0(qtexture_s *tex)
{
    if (tex != (qtexture_s *)dword_01128d90 || tex != (qtexture_s *)dword_01128d94)
    {
        dword_01128d90 = (int)tex;
        dword_01128d94 = (int)tex;
        dword_01128dc4 = 0.25f;
        if (tex)
            dword_01128dc4 = 16.0f;
        if (dword_0109fdb4)
        {
            FUN_0043dff0();
            FUN_0043cf80(dword_01234a38);
        }
        CTextureBar *textureBar = &reinterpret_cast<CTexWndFrameProjection *>(g_pParentWnd)->m_wndTextureBar;
        if (textureBar->GetSafeHwnd())
            textureBar->FUN_0043f460();
        FUN_0045f720((brush_t *)&dword_010a44dc);
        FUN_0045f720((brush_t *)&dword_010a44b4);
        FUN_0045f720((brush_t *)&dword_010a448c);
        FUN_0045f7e0();
        dword_0123348c |= 3;
    }
}

// Texture window walk state: retail passes a pointer in esi to the two functions below.
// Offsets +0x08..+0x28 are pinned by the retail loads and stores, the names are not known.
struct TexIter
{
    qtexture_s *radMat;     // +0x00, "iter.radMat"
    int sortedIndex;        // +0x04, "iter->sortedIndex"
    int field_08;           // output x
    int field_0c;           // output y
    int field_10;           // next x
    int field_14;           // next y
    int field_18;           // scaled width
    int field_1c;           // scaled height
    int field_20;           // tallest entry of the current row
    int field_24;           // value returned by the renderer call in StartPos
    float field_28;         // texture scale / 100
};

extern int dword_011298c4;
extern int dword_01128d98;
extern int dword_01128d9c;
extern int dword_01128da0;
extern RadiantFilterEntry DAT_00590a68[256];
extern RadiantFilterEntry DAT_00591268[256];
extern RadiantFilterEntry surfaceTypes[23];
extern struct TexWndPrefsScale { unsigned char pad[0x2d0]; int field_2d0; } *dword_01233b64_scale;

// 0x00441750 (145 B), iter in esi and one stack argument
void FUN_00441750(TexIter *iter, int arg)
{
#line 678
    assert(iter);
    iter->field_10 = 8;
    iter->field_14 = 8;
    iter->sortedIndex = -1;
    iter->field_28 = (float)dword_01233b64_scale->field_2d0 / 100.0f;
    iter->field_0c = 0;
    iter->field_20 = 0;
    iter->field_24 = ((int (*)(int))re.field_114)(arg);
}

// 0x004417f0 (590 B), iter in esi
bool FUN_004417f0(TexIter *iter)
{
#line 694
    assert(iter);
    for (iter->sortedIndex++; iter->sortedIndex != texWndGlobals.materialCount; iter->sortedIndex++)
    {
#line 702
        assert(iter->sortedIndex >= 0 && iter->sortedIndex < texWndGlobals.materialCount);
        qtexture_s *q = texWndGlobals.sortedMaterials[iter->sortedIndex];
        iter->radMat = q;
        if (!q->field_0a)
            continue;
        if (texWndGlobals.usageFilter && q->field_0a != DAT_00590a68[texWndGlobals.usageFilter].id)
            continue;
        if (texWndGlobals.localeFilter && !(q->field_10 & (1 << DAT_00591268[texWndGlobals.localeFilter].id)))
            continue;
        if (texWndGlobals.surfaceTypeFilter && surfaceTypes[texWndGlobals.surfaceTypeFilter].id != (q->field_1c & 0x1f00000))
            continue;
        if (texWndGlobals.filterEnabled)
        {
            if (_strnicmp(texWndGlobals.filter.GetBuffer(0), q->name, texWndGlobals.filter.GetLength()))
                continue;
        }
        else if (!q->inuse)
            continue;
        iter->field_18 = I_fround((float)q->width * iter->field_28);
        iter->field_1c = I_fround((float)q->height * iter->field_28);
        if (iter->field_10 + iter->field_18 > dword_01128d98 - 8 && iter->field_20 > 0)
        {
            iter->field_10 = 8;
            iter->field_14 += iter->field_20 + iter->field_24 + 4;
            iter->field_20 = 0;
        }
        iter->field_08 = iter->field_10;
        iter->field_0c = iter->field_14;
        if (iter->field_20 < iter->field_1c)
            iter->field_20 = iter->field_1c;
        iter->field_10 = iter->field_08 + (iter->field_18 < 64 ? 64 : iter->field_18) + 8;
        return true;
    }
    return false;
}

// Texture selection record kept at 0x01128da8 (28 B): material pointer first, then six floats.
struct TexDef
{
    qtexture_s *radMat;
    float field_04;
    float field_08;
    float field_0c;
    float field_10;
    float field_14;
    float field_18;
};
struct TexCell { int a; int b; };
// Optional extra record: counts at +0 and +4, 8-byte cells from +0x30.
struct TexExtra
{
    int count;
    int rowCount;
    int pad08[10];
    TexCell cell[1];
};
extern TexDef dword_01128da8;
extern int dword_01128dc8;
extern int dword_01128dcc;
extern int dword_01128dd0;
extern TexCell dword_01128dd4[][16];
extern unsigned dword_0123348c;
struct texdef_t;
void FUN_0046ff10(const texdef_t *td, int flags);
void FUN_00442140(int pos);

// 0x00441a40 (517 B), extra in eax, tex on the stack
void FUN_00441a40(TexExtra *extra, TexDef *tex)
{
    if (!tex->radMat->mtl)
        tex->radMat->mtl = re.field_10(tex->radMat->name, 3, 0);
    dword_01128da8 = *tex;
    if (extra)
    {
        dword_01128dc8 = 1;
        dword_01128dcc = extra->count;
        dword_01128dd0 = extra->rowCount;
        for (int i = 0; i < extra->count; i++)
        {
            for (int j = 0; j < extra->rowCount; j++)
                dword_01128dd4[i][j] = extra->cell[g_qeglobals.activeMaterial + i * 0x70 + j * 7];
        }
    }
    else
        dword_01128dc8 = 0;
    dword_0123348c |= 0x10;
    CFindTextureDlg::updateTextures(tex->radMat->name);
    if (!CFindTextureDlg::isOpen())
        FUN_0046ff10((const texdef_t *)tex, 1);
    TexIter iter;
    FUN_00441750(&iter, dword_011298c4);
    while (FUN_004417f0(&iter))
    {
#line 808
        assert(iter.radMat);
        if (!_stricmp(tex->radMat->name, iter.radMat->name))
        {
            int pos = dword_01128da0;
            if (iter.field_0c + iter.field_1c + iter.field_24 + 8 > dword_01128d9c + pos)
                pos = iter.field_24 - dword_01128d9c + iter.field_1c + iter.field_0c + 8;
            if (iter.field_0c < pos)
                pos = iter.field_0c;
            FUN_00442140(pos);
            return;
        }
    }
}

// 0x00441c50 (66 B), material name in ecx
void FUN_00441c50(char *name)
{
    TexDef tex;
    memset(&tex, 0, sizeof(tex));
    tex.field_04 = 64.0f;
    tex.field_08 = 64.0f;
    tex.radMat = FUN_00440840(name);
    FUN_00441a40(0, &tex);
}

// 0x00441ca0 (63 B)
HWND FUN_00441ca0(void)
{
    HWND editPad = FindWindowA("TEditPadForm", NULL);
    HWND result = NULL;
    if (editPad)
    {
        HWND tabs = FindWindowExA(editPad, NULL, "TTabControl", NULL);
        if (tabs)
            result = FindWindowExA(tabs, NULL, "TRicherEdit", NULL);
    }
    return result;
}

// 0x00441ce0 (118 B)
void FUN_00441ce0(float seconds)
{
    MSG msg;
    DWORD end = (DWORD)(seconds * 1000.0f + (float)GetTickCount());
    while (GetTickCount() < end)
    {
        if (PeekMessageA(&msg, NULL, 0, 0, PM_REMOVE))
        {
            TranslateMessage(&msg);
            DispatchMessageA(&msg);
        }
    }
}

int FS_ReadFile(const char *qpath, void **buffer);
void FS_FreeFile(void *buffer);

// 0x00441d60 (540 B), open a shader file in the external editor at the first match
void FUN_00441d60(const char *filename, const char *needle)
{
    CString text;
    char *buffer;
    int len = FS_ReadFile(filename, (void **)&buffer);
    if (len > 0)
        text = buffer;
    int selPos = 0;
    if (text.GetLength() > 0)
    {
        CString pattern(needle);
        CString lowerText(text);
        lowerText.MakeLower();
        pattern.MakeLower();
        int found = lowerText.Find(pattern);
        if (found >= 0)
            selPos = found;
    }
    CString command("editpad ");
    command += buffer;
    WinExec(command, SW_SHOWNORMAL);
    FS_FreeFile(buffer);
    FUN_00441ce0(1.5f);
    HWND hEdit = FUN_00441ca0();
    if (hEdit)
        PostMessage(hEdit, EM_SETSEL, selPos, selPos);
    else
        Sys_Printf("Unable to load shader editor.\n");
}

// Main frame as seen from here: the six status pane texts sit at +0x7a4 (retail load at 0x441fe0..).
class CMainFrame
{
public:
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
    void FUN_00417cf0();
    void SetStatusText(int nPane, const char *pText)
    {
        if (pText && nPane <= 5 && nPane >= 0)
        {
            m_strStatus[nPane] = pText;
            FUN_00417cf0();
        }
    }
    unsigned char pad[0x7a4];
    CString m_strStatus[6];
};
extern CMainFrame *g_pParentWnd;
extern HWND dword_010bcd70;
extern float dword_01128dc4;

// 0x00441f80 (438 B), x and y come in registers
void FUN_00441f80(int y, int x)
{
    TexIter iter;
    int my = y + dword_01128da0;
    FUN_00441750(&iter, dword_011298c4);
    while (FUN_004417f0(&iter))
    {
#line 920
        assert(iter.radMat);
        if (x >= iter.field_08 && x < iter.field_08 + iter.field_18
            && my >= iter.field_0c && my <= iter.field_0c + iter.field_1c + iter.field_24)
        {
            TexDef tex;
            memset(&tex, 0, sizeof(tex));
            tex.radMat = iter.radMat;
            tex.field_04 = (float)iter.radMat->width * dword_01128dc4;
            tex.field_08 = (float)iter.radMat->height * dword_01128dc4;
            FUN_00441a40(0, &tex);
            CString strTex;
            strTex.Format("%s W: %i H: %i", iter.radMat->name, iter.radMat->width, iter.radMat->height);
            g_pParentWnd->SetStatusText(3, strTex);
            return;
        }
    }
    SendMessage(dword_010bcd70, 0x401, 0, (LPARAM)"Did not select a texture\n");
}

extern HWND dword_010bcd64;
extern int dword_01128d9c;
extern int dword_01128da0;
extern int dword_01128da4;

// 0x00442140 (94 B), position in eax
void FUN_00442140(int pos)
{
    if (pos > dword_01128da4 - dword_01128d9c + 16)
        pos = dword_01128da4 - dword_01128d9c + 16;
    if (pos < 0)
        pos = 0;
    if (pos != dword_01128da0)
    {
        SetScrollPos(dword_010bcd64, SB_VERT, pos, TRUE);
        dword_01128da0 = pos;
        InvalidateRect(dword_010bcd64, NULL, FALSE);
        UpdateWindow(dword_010bcd64);
    }
}

// 0x004421a0 (94 B)
void FUN_004421a0(void)
{
    SCROLLINFO si;
    si.cbSize = sizeof(si);
    si.fMask = SIF_RANGE | SIF_PAGE;
    si.nMin = 0;
    si.nMax = dword_01128da4 + 16;
    si.nPage = dword_01128d9c;
    SetScrollInfo(dword_010bcd64, SB_VERT, &si, TRUE);
    if (dword_01128da0 > si.nMax - si.nPage)
        FUN_00442140(si.nMax - si.nPage);
}

extern int dword_0109fdbc;
extern int dword_0109fdc0;
class CPatchDialog : public CDialog { public: void GetPatchInfo(); };
extern CPatchDialog g_PatchDialog;
extern CMainFrame *g_pParentWnd;

// 0x00442200 (135 B), flags in esi
void FUN_00442200(int flags, int x, int y)
{
    POINT pt;
    GetCursorPos(&pt);
    dword_0109fdc0 = pt.x;
    dword_0109fdbc = pt.y;
    if (flags == 1 || flags == 5 || flags == 9)
    {
        FUN_00441f80(y, x);
        if (dword_0109fdb4)
        {
            FUN_0043dff0();
            FUN_0043cf80(dword_01234a38);
        }
        CTextureBar *textureBar = &reinterpret_cast<CTexWndFrameProjection *>(g_pParentWnd)->m_wndTextureBar;
        if (textureBar->GetSafeHwnd())
            textureBar->FUN_0043f460();
        if (g_PatchDialog.GetSafeHwnd())
            g_PatchDialog.GetPatchInfo();
    }
}

// Retail one-byte RET, existing accepted source.
extern "C" void FUN_00442290() {}

// 0x004422a0 (92 B)
void FUN_004422a0(int flags)
{
    int scale = 2;
    if (flags & MK_SHIFT)
        scale = 5;
    if (flags & MK_RBUTTON)
    {
        POINT pt;
        GetCursorPos(&pt);
        if (pt.y != dword_0109fdbc)
        {
            FUN_00442140(dword_01128da0 - (pt.y - dword_0109fdbc) * scale);
            SetCursorPos(dword_0109fdc0, dword_0109fdbc);
        }
    }
}

extern float dword_01129788[4];
extern float dword_011297a8[4];
struct TexLineVert { float x, y, z; unsigned char color[4]; };

// 0x00442300 (942 B), draw the texture tiles; the selected one gets a rectangle
void FUN_00442300()
{
    TexIter iter;
    int ctx = dword_011298c4;

    FUN_00441750(&iter, ctx);
    while (FUN_004417f0(&iter))
    {
#line 1045
        assert(iter.radMat);
        int y = iter.field_0c - dword_01128da0;
        if (y >= -(iter.field_24 + iter.field_1c) && y < dword_01128d9c)
        {
            if (!iter.radMat->mtl)
            {
                qtexture_s *rv = FUN_00440840((char *)iter.radMat->name);
#line 1055
                assert(rv == iter.radMat);
#line 1056
                assert(iter.radMat->mtl);
            }
            float drawX = (float)iter.field_08;
            float drawY = (float)(y + iter.field_24);
            re.field_98(drawX, drawY, (float)iter.field_18, (float)iter.field_1c, 0.0f, 0.0f, 1.0f, 1.0f,
                        colorWhite, iter.radMat->mtl);
            if (!_stricmp(dword_01128da8.radMat->name, iter.radMat->name))
            {
                int x0 = iter.field_08 - 1;
                int y0 = y + iter.field_24 - 1;
                int x1 = x0 + iter.field_18 + 2;
                int y1 = y0 + iter.field_1c + 2;
                unsigned char color[4];
                re.ColorToBytes(dword_011297a8, color);
                TexLineVert v[8];
                v[0].x = (float)x0; v[0].y = (float)y0;
                v[1].x = (float)x1; v[1].y = (float)y0;
                v[2].x = (float)x1; v[2].y = (float)y0;
                v[3].x = (float)x1; v[3].y = (float)y1;
                v[4].x = (float)x1; v[4].y = (float)y1;
                v[5].x = (float)x0; v[5].y = (float)y1;
                v[6].x = (float)x0; v[6].y = (float)y1;
                v[7].x = (float)x0; v[7].y = (float)y0;
                for (int i = 0; i < 8; i++)
                {
                    v[i].z = 0.0f;
                    *(unsigned *)v[i].color = *(unsigned *)color;
                }
                re.AddLines(4, 1, v);
            }
            re.field_118(iter.radMat->name, 0x7fffffff, ctx, drawX, drawY, 1.0f, 1.0f, dword_01129788, 0);
        }
    }
    dword_01128da4 = iter.field_20 + iter.field_0c;
}

// 0x004426b0 (47 B)
void FUN_004426b0(void)
{
    FUN_004409a0();
    dword_01128d90 = 0;
    dword_01128d94 = 0;
    dword_01128dc4 = 0.25f;
    dword_01128da8.radMat = FUN_00440840((char *)"$default");
    FUN_00440ca0();
}

// 0x004426e0 (372 B), free the filter menus' strings, every material and the name remaps
void FUN_004426e0(void)
{
    int i;
    for (i = 1; i < texWndGlobals.usageCount; i++)
        delete[] DAT_00590a68[i].name;
    texWndGlobals.usageCount = 0;
    for (i = 1; i < texWndGlobals.localeCount; i++)
        delete[] DAT_00591268[i].name;
    texWndGlobals.localeCount = 0;
    for (int materialIndex = 0; materialIndex < texWndGlobals.materialCount; materialIndex++)
    {
#line 1131
        assert(texWndGlobals.sortedMaterials[materialIndex]);
        delete[] texWndGlobals.sortedMaterials[materialIndex]->name;
        FUN_004407f0(texWndGlobals.sortedMaterials[materialIndex]);
    }
    texWndGlobals.materialCount = 0;
    texWndGlobals.qtextures = NULL;
    if (re.field_1b0)
        re.field_1b0();
    while (texWndGlobals.materialNameRemap)
    {
        MaterialNameRemap *remap = texWndGlobals.materialNameRemap;
        texWndGlobals.materialNameRemap = remap->next;
        delete[] remap->shaderName;
        delete[] remap->materialName;
        delete remap;
    }
}

// Layout projection of the main frame: +0x7a0 is the window layout style (retail load at 0x442dbf);
// the three methods are CMainFrame functions called through g_pParentWnd.
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar);
struct CTexWndMainProjection {
    unsigned char inheritedAndFrameFields[0x7a0];
    int m_nCurrentStyle;
};
// Layout projection of the preferences object at 0x1233b64 (retail loads at 0x442c70, 0x442c90).
struct CTexWndPrefsProjection {
    unsigned char pad0[0x1fc];
    int textureWindow;          // +0x1fc
    unsigned char pad1[0x60];
    int textureScrollbar;       // +0x260
};
extern CMainFrame *g_pParentWnd;
extern CTexWndPrefsProjection *dword_01233b64;
extern HWND dword_010bcd60;
extern int dword_01128d98;

// Names follow Q3Radiant TexWnd.cpp (same shape, same globals).
extern int g_nTimerHandle;
extern int g_nLastLen;
extern char g_cLastChar;

IMPLEMENT_DYNCREATE(CTexWnd, CWnd)

CTexWnd::CTexWnd()
{
    m_bNeedRange = true;
}

CTexWnd::~CTexWnd() { }

BEGIN_MESSAGE_MAP(CTexWnd, CWnd)
    ON_WM_CREATE()
    ON_WM_SIZE()
    ON_WM_PARENTNOTIFY()
    ON_WM_TIMER()
    ON_WM_KEYDOWN()
    ON_WM_KEYUP()
    ON_WM_PAINT()
    ON_WM_VSCROLL()
    ON_WM_MOUSEWHEEL()
END_MESSAGE_MAP()

extern int dword_01234d58;

// 0x004429f0 (293 B), the texture window procedure
LRESULT CALLBACK FUN_004429f0(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    RECT rect;
    GetClientRect(hwnd, &rect);
    switch (msg)
    {
    case WM_CREATE:
        dword_010bcd64 = hwnd;
        return 0;
    case WM_DESTROY:
        return 0;
    case WM_MOUSEMOVE:
        FUN_004422a0(wParam);
        return 0;
    case WM_LBUTTONDOWN:
    case WM_RBUTTONDOWN:
    case WM_MBUTTONDOWN:
        SetCapture(dword_010bcd64);
        FUN_00442200(wParam, (short)LOWORD(lParam), (short)HIWORD(lParam) - dword_01234d58);
        return 0;
    case WM_LBUTTONUP:
    case WM_RBUTTONUP:
    case WM_MBUTTONUP:
        if (!(wParam & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
            ReleaseCapture();
        return 0;
    case WM_MOUSEWHEEL:
        return g_pParentWnd->OnMouseWheel(LOWORD(wParam), HIWORD(wParam), CPoint(LOWORD(lParam), HIWORD(lParam)));
    }
    return DefWindowProc(hwnd, msg, wParam, lParam);
}

#define QE3_STYLE (WS_OVERLAPPED | WS_CLIPCHILDREN | WS_CLIPSIBLINGS | WS_VISIBLE | WS_CHILD)
#define QE3_CHILDSTYLE (QE3_STYLE | WS_CAPTION | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX)
#define QE3_SPLITTER_STYLE (WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX | WS_CLIPCHILDREN | WS_CLIPSIBLINGS)

// 0x00442b20 (189 B)
BOOL CTexWnd::PreCreateWindow(CREATESTRUCT &cs)
{
    WNDCLASS wc;
    HINSTANCE hInstance = AfxGetInstanceHandle();
    if (::GetClassInfo(hInstance, "QTEX", &wc) == FALSE)
    {
        memset(&wc, 0, sizeof(wc));
        wc.style = CS_NOCLOSE;
        wc.lpszClassName = "QTEX";
        wc.hCursor = LoadCursor(NULL, IDC_ARROW);
        wc.lpfnWndProc = FUN_004429f0;
        if (AfxRegisterClass(&wc) == FALSE)
            Error("CZWnd RegisterClass: failed");
    }
    cs.lpszClass = "QTEX";
    cs.lpszName = "TEX";
    if (cs.style != QE3_CHILDSTYLE && cs.style != QE3_SPLITTER_STYLE)
        cs.style = QE3_STYLE;
    return CWnd::PreCreateWindow(cs);
}

// 0x00442be0 (212 B)
int CTexWnd::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
    if (CWnd::OnCreate(lpCreateStruct) == -1)
        return -1;
    CRect rctEdit(8, 5, 20, 20);
    texWndGlobals.textureOffset = 0;
    rctEdit.SetRect(8, 0, 20, 20);
    m_wndFilter.Create(WS_CHILD | WS_VISIBLE | ES_AUTOHSCROLL, rctEdit, this, 1201);
    m_wndFilter.ModifyStyleEx(0, WS_EX_CLIENTEDGE, 0);
    m_wndFilter.m_pTexWnd = this;
    texWndGlobals.textureOffset += 25;
    if (!dword_01233b64->textureWindow)
    {
        m_wndFilter.ShowWindow(SW_HIDE);
        texWndGlobals.textureOffset -= 25;
    }
    ShowScrollBar(SB_VERT, dword_01233b64->textureScrollbar);
    m_bNeedRange = true;
    return 0;
}

// 0x00442cc0 (131 B)
void CTexWnd::OnSize(UINT nType, int cx, int cy)
{
    Default();
    CRect rctClient;
    GetClientRect(rctClient);
    m_wndFilter.SetWindowPos(NULL, rctClient.left + 8, rctClient.top + 25, rctClient.right - 16, 20, 0);
    m_bNeedRange = true;
    dword_01128d98 = cx;
    dword_01128d9c = cy;
    if (re.ResizeWindow)
        re.ResizeWindow(dword_010bcd64, cx, cy);
    InvalidateRect(NULL, FALSE);
}

// 0x00442d50 (9 B)
void CTexWnd::OnParentNotify(UINT message, LPARAM lParam)
{
    CWnd::OnParentNotify(message, lParam);
}

// 0x00442d60 (242 B)
void CTexWnd::UpdateFilter(const char *pFilter)
{
    if (g_nTimerHandle > 0)
        KillTimer(1);
    texWndGlobals.filterEnabled = false;
    if (pFilter)
    {
        texWndGlobals.filter = pFilter;
        if (texWndGlobals.filter.GetLength() > 0)
        {
            texWndGlobals.filterEnabled = true;
            int style = reinterpret_cast<const CTexWndMainProjection *>(g_pParentWnd)->m_nCurrentStyle;
            if (style == 1 || style == 2)
            {
                if (texWndGlobals.filter.GetLength() > g_nLastLen)
                {
                    g_cLastChar = toupper(texWndGlobals.filter.GetAt(texWndGlobals.filter.GetLength() - 1));
                    if (g_cLastChar == 'N' || g_cLastChar == 'O')
                        g_nTimerHandle = SetTimer(1, 800, NULL);
                }
            }
        }
        g_nLastLen = texWndGlobals.filter.GetLength();
        SortTextures();
    }
    g_nUpdateBits |= 0x10;
}

// 0x00442e60 (111 B)
void CTexWnd::UpdatePrefs()
{
    if (!dword_01233b64->textureWindow)
    {
        m_wndFilter.ShowWindow(SW_HIDE);
        texWndGlobals.textureOffset = 0;
    }
    else
    {
        m_wndFilter.ShowWindow(SW_SHOW);
        texWndGlobals.textureOffset = 25;
    }
    ShowScrollBar(SB_VERT, dword_01233b64->textureScrollbar);
    m_bNeedRange = true;
    Invalidate();
    UpdateWindow();
}

// 0x00442ed0 (23 B)
void CTexWnd::FocusEdit()
{
    if (m_wndFilter.IsWindowVisible())
        m_wndFilter.SetFocus();
}

// 0x00442ef0 (75 B)
void CTexWnd::OnTimer(UINT nIDEvent)
{
    KillTimer(1);
    g_nLastLen = 0;
    g_nTimerHandle = -1;
    ::SetFocus(dword_010bcd60);
    ::PostMessage(dword_010bcd60, WM_CHAR, g_cLastChar, 0);
}

// 0x00442f40 (15 B)
void CTexWnd::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    g_pParentWnd->OnKeyDown(nChar, nRepCnt, nFlags);
}

// 0x00442f50 (23 B)
void CTexWnd::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    FUN_004137d0(g_pParentWnd, nChar);
}

extern int g_hunkTempSyncEnabled;
extern int g_hunkTempLowWater;
extern int g_hunkTempHighWater;
extern float dword_01129708[];

// 0x00442f70 (224 B)
void CTexWnd::OnPaint()
{
    PAINTSTRUCT ps;
    if (re.BeginWindow && re.BeginWindow(dword_010bcd64))
    {
        CDC::FromHandle(::BeginPaint(m_hWnd, &ps));
        int nOld = dword_01128da4;
        re.BeginScene();
        re.ClearScreen(7, dword_01129708, 1.0f, 0);
        FUN_00442300();
        re.EndScene();
        re.EndWindow(dword_010bcd64);
        if (g_hunkTempSyncEnabled)
            g_hunkTempHighWater = g_hunkTempLowWater;
        if (dword_01233b64->textureScrollbar && (m_bNeedRange || dword_01128da4 != nOld))
        {
            FUN_004421a0();
            m_bNeedRange = false;
        }
        ::EndPaint(m_hWnd, &ps);
    }
}

// 0x00443050 (229 B)
void CTexWnd::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar *pScrollBar)
{
    CWnd::OnVScroll(nSBCode, nPos, pScrollBar);
    SCROLLINFO si;
    memset(&si, 0, sizeof(si));
    si.cbSize = sizeof(si);
    si.fMask = SIF_ALL;
    GetScrollInfo(SB_VERT, &si, SIF_ALL);
    int n = si.nPos;
    int next;
    switch (nSBCode)
    {
    case SB_LINEUP:
        n -= 15;
        n = n > 0 ? n : 0;
        break;
    case SB_LINEDOWN:
        next = n + 15;
        if (next < dword_01128da4)
            n = next;
        break;
    case SB_PAGEUP:
        n -= dword_01128d9c;
        n = n > 0 ? n : 0;
        break;
    case SB_PAGEDOWN:
        next = n + dword_01128d9c;
        if (next < dword_01128da4)
            n = next;
        break;
    case SB_THUMBPOSITION:
    case SB_THUMBTRACK:
        n = si.nTrackPos;
        break;
    }
    FUN_00442140(n);
}

// 0x00443140 (34 B)
BOOL CTexWnd::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
    return g_pParentWnd->OnMouseWheel(nFlags, zDelta, pt);
}

// 0x00443170: window layout style of the main frame
int FUN_00443170(CTexWndMainProjection *frame)
{
    return frame->m_nCurrentStyle;
}

// 0x004431a0
struct TexWndField50
{
    unsigned char pad00[0x50];
    int field50;
};

void FUN_004431a0(int value, TexWndField50 *p)
{
    p->field50 = value;
}
