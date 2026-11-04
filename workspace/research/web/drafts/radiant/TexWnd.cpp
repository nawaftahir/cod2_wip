// TexWnd.cpp: placeholder, no function reconstructed yet. Code goes here in retail order.

#include "stdafx.h"
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
// Source-level experiment modeled on the Q3Radiant texture filter.
class CTexWnd : public CWnd { public: void UpdateFilter(const char *text); };
class CMainFrame { unsigned char opaque_before_style[0x7a0]; public: int style; int CurrentStyle() const { return style; } };
extern CMainFrame *g_pParentWnd;
extern int g_nTimerHandle;
extern int g_nLastLen;
extern char g_cLastChar;
extern bool g_bFilterEnabled;
extern CString g_strFilter;
// Retail 0x004405d0 loads pointer-table entries, then compares their
// measured name pointers at +4. Retail 0x004405f0 calls qsort (4-byte slots).
// The original global names/extents are not yet pinned; these are trial externs.
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
    qsort(g_sortedTextureEntries, g_sortedTextureCount, sizeof(g_sortedTextureEntries[0]), FUN_004405d0);
}

// Retail 0x00442290 lies between SortTextures and UpdateFilter in the binary.
extern "C" void FUN_00442290() {}

extern int g_nUpdateBits;
void CTexWnd::UpdateFilter(const char *pFilter)
{
    if (g_nTimerHandle > 0)
        KillTimer(1);
    g_bFilterEnabled = false;
    if (pFilter)
    {
        g_strFilter = pFilter;
        if (g_strFilter.GetLength() > 0)
        {
            CMainFrame *frame = g_pParentWnd;
            g_bFilterEnabled = true;
            const int style = frame->CurrentStyle();
            if (style == 1 || style == 2)
            {
                if (g_strFilter.GetLength() > g_nLastLen)
                {
                    g_cLastChar = (char)toupper(g_strFilter.GetAt(g_strFilter.GetLength() - 1));
                    if (g_cLastChar == 'N' || g_cLastChar == 'O')
                        g_nTimerHandle = (int)SetTimer(1, 800, NULL);
                }
            }
        }
        g_nLastLen = g_strFilter.GetLength();
        SortTextures();
    }
    g_nUpdateBits |= 0x10;
}
