#include "stdafx.h"
#include "TexWnd.h"
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
    int textureOffset;          // +0x00, Q3Radiant g_nTextureOffset
    int usageCount;             // +0x04, "texWndGlobals.usageCount" assert string
    int localeCount;            // +0x08
    unsigned char usageFilter;  // +0x0c
    unsigned char localeFilter; // +0x0d
    unsigned char surfaceTypeFilter; // +0x0e
    bool filterEnabled;         // +0x0f
    CString filter;             // +0x10
    int sortedCount;            // +0x14
    char sorted[0x10000];       // +0x18
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

// Layout projection of the main frame: +0x7a0 is the window layout style (retail load at 0x442dbf);
// the three methods are CMainFrame functions called through g_pParentWnd.
class CMainFrame;
struct CTexWndMainProjection {
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    void __stdcall OnKeyUp(UINT nChar);
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
extern int g_nUpdateBits;
extern HWND dword_010bcd60;
extern HWND dword_010bcd64;
extern int dword_01128d98;
extern int dword_01128d9c;
// Renderer export table (Q3Radiant "re"); 0x59c448 is its last member, ResizeWindow.
struct TexWndRefExport {
    void *pad0[0x148 / 4];
    void (*ResizeWindow)(HWND hwnd, int width, int height);
};
extern TexWndRefExport re;

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
    reinterpret_cast<CTexWndMainProjection *>(g_pParentWnd)->OnKeyDown(nChar, nRepCnt, nFlags);
}

// 0x00442f50 (23 B)
void CTexWnd::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    reinterpret_cast<CTexWndMainProjection *>(g_pParentWnd)->OnKeyUp(nChar);
}

// 0x00443140 (34 B)
BOOL CTexWnd::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
    return reinterpret_cast<CTexWndMainProjection *>(g_pParentWnd)->OnMouseWheel(nFlags, zDelta, pt);
}
