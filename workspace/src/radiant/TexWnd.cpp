#include "stdafx.h"
#include "TexWnd.h"
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <malloc.h>
#include "../universal/assertive.h"

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
struct RadiantFilterEntry;

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
    unsigned char pad0[0x0c];
    unsigned char field_0c;
    unsigned char pad1[8];
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
    char inuse;                 // +0x08
    char field_09;
    char field_0a;
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
    void *pad2[(0x138 - 0x1c) / 4];
    void (*field_138)(void *handle, RadMtlInfo *info);          // 0x59c438
    void *pad3[3];
    void (*ResizeWindow)(HWND hwnd, int width, int height);     // 0x59c448
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
    int sortedCount;            // +0x14
    qtexture_s *sorted[0x4000]; // +0x18
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
    texWndGlobals.sorted[texWndGlobals.sortedCount++] = newRadMat;
    return newRadMat;
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

struct RadiantFilterEntry {
    const char *name;
    int id;
};
extern RadiantFilterEntry surfaceTypes[23];

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

// 0x00441440 (27 B)
void Texture_ShowAll(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 1;
    }
}



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

// Retail one-byte RET, existing accepted source.
extern "C" void FUN_00442290() {}

// Layout projection of the main frame: +0x7a0 is the window layout style (retail load at 0x442dbf);
// the three methods are CMainFrame functions called through g_pParentWnd.
class CMainFrame
{
public:
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
};
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar);
struct CTexWndMainProjection {
    BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
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
extern HWND dword_010bcd64;
extern int dword_01128d98;
extern int dword_01128d9c;

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
    ON_WM_MOUSEWHEEL()
END_MESSAGE_MAP()

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

// 0x00443140 (34 B)
BOOL CTexWnd::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
    return reinterpret_cast<CTexWndMainProjection *>(g_pParentWnd)->OnMouseWheel(nFlags, zDelta, pt);
}
