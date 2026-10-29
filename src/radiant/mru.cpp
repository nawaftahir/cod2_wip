// mru.cpp: most-recently-used file list. Bodies from Q3Radiant MRU.CPP, byte-identical to retail.
#include <windows.h>
#include <windowsx.h>

#define NBMRUMENUSHOW   6
#define NBMRUMENU       9
#define IDMRU           8000
#define MAXSIZEMRUITEM  128

typedef struct
{
    WORD wNbItemFill;
    WORD wNbLruShow;
    WORD wNbLruMenu;
    WORD wMaxSizeLruItem;
    WORD wIdMru;
    LPSTR lpMRU;
} MRUMENU;

typedef MRUMENU * LPMRUMENU;

LPMRUMENU CreateMruMenu(WORD wNbLruShowInit, WORD wNbLruMenuInit, WORD wMaxSizeLruItemInit, WORD wIdMruInit)
{
    LPMRUMENU lpMruMenu;
    lpMruMenu = (LPMRUMENU)GlobalAllocPtr(GHND, sizeof(MRUMENU));

    lpMruMenu->wNbItemFill = 0;
    lpMruMenu->wNbLruMenu = wNbLruMenuInit;
    lpMruMenu->wNbLruShow = wNbLruShowInit;
    lpMruMenu->wIdMru = wIdMruInit;
    lpMruMenu->wMaxSizeLruItem = wMaxSizeLruItemInit;
    lpMruMenu->lpMRU = (LPSTR)GlobalAllocPtr(GHND, lpMruMenu->wNbLruMenu * (UINT)lpMruMenu->wMaxSizeLruItem);
    if (lpMruMenu->lpMRU == NULL)
    {
        GlobalFreePtr(lpMruMenu);
        lpMruMenu = NULL;
    }
    return lpMruMenu;
}

LPMRUMENU CreateMruMenuDefault(void)
{
    return CreateMruMenu(NBMRUMENUSHOW, NBMRUMENU, MAXSIZEMRUITEM, IDMRU);
}

void DeleteMruMenu(LPMRUMENU lpMruMenu)
{
    GlobalFreePtr(lpMruMenu->lpMRU);
    GlobalFreePtr(lpMruMenu);
}

void SetNbLruShow(LPMRUMENU lpMruMenu, WORD wNbLruShowInit)
{
    lpMruMenu->wNbLruShow = min(wNbLruShowInit, lpMruMenu->wNbLruMenu);
}

BOOL SetMenuItem(LPMRUMENU lpMruMenu, WORD wItem, LPSTR lpItem)
{
    if (wItem >= NBMRUMENU)
        return FALSE;
    strncpy((lpMruMenu->lpMRU) + ((lpMruMenu->wMaxSizeLruItem) * (UINT)wItem),
            lpItem, lpMruMenu->wMaxSizeLruItem - 1);
    lpMruMenu->wNbItemFill = max(lpMruMenu->wNbItemFill, wItem + 1);
    return TRUE;
}

BOOL GetMenuItem(LPMRUMENU lpMruMenu, WORD wItem, BOOL fIDMBased, LPSTR lpItem, UINT uiSize)
{
    if (fIDMBased)
        wItem -= (lpMruMenu->wIdMru + 1);
    if (wItem >= lpMruMenu->wNbItemFill)
        return FALSE;
    strncpy(lpItem, (lpMruMenu->lpMRU) + ((lpMruMenu->wMaxSizeLruItem) * (UINT)(wItem)), uiSize);
    *(lpItem + uiSize - 1) = '\0';
    return TRUE;
}

void AddNewItem(LPMRUMENU lpMruMenu, LPSTR lpItem)
{
    WORD i, j;
    for (i = 0; i < lpMruMenu->wNbItemFill; i++)
    {
        if (lstrcmpi(lpItem, (lpMruMenu->lpMRU) + ((lpMruMenu->wMaxSizeLruItem) * (UINT)i)) == 0)
        {
            for (j = i; j > 0; j--)
                lstrcpy((lpMruMenu->lpMRU) + (lpMruMenu->wMaxSizeLruItem * (UINT)j),
                        (lpMruMenu->lpMRU) + (lpMruMenu->wMaxSizeLruItem * (UINT)(j - 1)));
            strncpy(lpMruMenu->lpMRU, lpItem, lpMruMenu->wMaxSizeLruItem - 1);
            return;
        }
    }
    lpMruMenu->wNbItemFill = min(lpMruMenu->wNbItemFill + 1, lpMruMenu->wNbLruMenu);
    for (i = lpMruMenu->wNbItemFill - 1; i > 0; i--)
        lstrcpy(lpMruMenu->lpMRU + (lpMruMenu->wMaxSizeLruItem * (UINT)i),
                lpMruMenu->lpMRU + (lpMruMenu->wMaxSizeLruItem * (UINT)(i - 1)));
    strncpy(lpMruMenu->lpMRU, lpItem, lpMruMenu->wMaxSizeLruItem - 1);
}

BOOL DelMenuItem(LPMRUMENU lpMruMenu, WORD wItem, BOOL fIDMBased)
{
    WORD i;
    if (fIDMBased)
        wItem -= (lpMruMenu->wIdMru + 1);
    if (lpMruMenu->wNbItemFill <= wItem)
        return FALSE;
    lpMruMenu->wNbItemFill--;
    for (i = wItem; i < lpMruMenu->wNbItemFill; i++)
        lstrcpy(lpMruMenu->lpMRU + (lpMruMenu->wMaxSizeLruItem * (UINT)i),
                lpMruMenu->lpMRU + (lpMruMenu->wMaxSizeLruItem * (UINT)(i + 1)));
    return TRUE;
}

void PlaceMenuMRUItem(LPMRUMENU lpMruMenu, HMENU hMenu, UINT uiItem)
{
    int i;
    WORD wNbShow;
    if (hMenu == NULL)
        return;
    for (i = 0; i <= (int)(lpMruMenu->wNbLruMenu); i++)
        RemoveMenu(hMenu, i + lpMruMenu->wIdMru, MF_BYCOMMAND);

    if (lpMruMenu->wNbItemFill == 0)
        return;

    InsertMenu(hMenu, uiItem, MF_SEPARATOR, lpMruMenu->wIdMru, NULL);

    wNbShow = min(lpMruMenu->wNbItemFill, lpMruMenu->wNbLruShow);
    for (i = (int)wNbShow - 1; i >= 0; i--)
    {
        LPSTR lpTxt;
        if ((lpTxt = (LPSTR)GlobalAllocPtr(GHND, lpMruMenu->wMaxSizeLruItem + 20)))
        {
            wsprintf(lpTxt, "&%lu %s", (DWORD)(i + 1), lpMruMenu->lpMRU + (lpMruMenu->wMaxSizeLruItem * (UINT)i));
            InsertMenu(hMenu, (((WORD)i) != (wNbShow - 1)) ? (lpMruMenu->wIdMru + i + 2) : lpMruMenu->wIdMru,
                       MF_STRING, lpMruMenu->wIdMru + i + 1, lpTxt);
            GlobalFreePtr(lpTxt);
        }
    }
}

BOOL SaveMruInIni(LPMRUMENU lpMruMenu, LPSTR lpszSection, LPSTR lpszFile)
{
    LPSTR lpTxt;
    WORD i;

    lpTxt = (LPSTR)GlobalAllocPtr(GHND, lpMruMenu->wMaxSizeLruItem + 20);
    if (lpTxt == NULL)
        return FALSE;

    for (i = 0; i < lpMruMenu->wNbLruMenu; i++)
    {
        char szEntry[16];
        wsprintf(szEntry, "File%lu", (DWORD)i + 1);
        if (!GetMenuItem(lpMruMenu, i, FALSE, lpTxt, lpMruMenu->wMaxSizeLruItem + 10))
            *lpTxt = '\0';
        WritePrivateProfileString(lpszSection, szEntry, lpTxt, lpszFile);
    }
    GlobalFreePtr(lpTxt);
    WritePrivateProfileString(NULL, NULL, NULL, lpszFile);
    return TRUE;
}

BOOL LoadMruInIni(LPMRUMENU lpMruMenu, LPSTR lpszSection, LPSTR lpszFile)
{
    LPSTR lpTxt;
    WORD i;
    lpTxt = (LPSTR)GlobalAllocPtr(GHND, lpMruMenu->wMaxSizeLruItem + 20);
    if (lpTxt == NULL)
        return FALSE;

    for (i = 0; i < lpMruMenu->wNbLruMenu; i++)
    {
        char szEntry[16];
        wsprintf(szEntry, "File%lu", (DWORD)i + 1);
        GetPrivateProfileString(lpszSection, szEntry, "", lpTxt,
                                lpMruMenu->wMaxSizeLruItem + 10, lpszFile);
        if (*lpTxt == '\0')
            break;
        SetMenuItem(lpMruMenu, i, lpTxt);
    }
    GlobalFreePtr(lpTxt);
    return TRUE;
}

BOOL IsWin395OrHigher(void)
{
    WORD wVer;

    wVer = LOWORD(GetVersion());
    wVer = (((WORD)LOBYTE(wVer)) << 8) | (WORD)HIBYTE(wVer);

    return (wVer >= 0x035F);
}

BOOL SaveMruInReg(LPMRUMENU lpMruMenu, LPSTR lpszKey)
{
    LPSTR lpTxt;
    WORD i;
    HKEY hCurKey;
    DWORD dwDisp;

    lpTxt = (LPSTR)GlobalAllocPtr(GHND, lpMruMenu->wMaxSizeLruItem + 20);
    if (lpTxt == NULL)
        return FALSE;

    RegCreateKeyEx(HKEY_CURRENT_USER, lpszKey, 0, NULL,
                   REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &hCurKey, &dwDisp);

    for (i = 0; i < lpMruMenu->wNbLruMenu; i++)
    {
        char szEntry[16];
        wsprintf(szEntry, "File%lu", (DWORD)i + 1);
        if (!GetMenuItem(lpMruMenu, i, FALSE, lpTxt, lpMruMenu->wMaxSizeLruItem + 10))
            *lpTxt = '\0';
        RegSetValueEx(hCurKey, szEntry, 0, REG_SZ, (unsigned char*)lpTxt, lstrlen(lpTxt));
    }
    RegCloseKey(hCurKey);
    GlobalFreePtr(lpTxt);
    return TRUE;
}

BOOL LoadMruInReg(LPMRUMENU lpMruMenu, LPSTR lpszKey);





























typedef enum 
{
    WIN32S,
    WINNT,
    WIN95ORGREATHER
} WIN32KIND;

WIN32KIND GetWin32Kind(void)
{
    WORD wVer;

    if ((GetVersion() & 0x80000000) == 0)
        return WINNT;
    wVer = LOWORD(GetVersion());
    wVer = (((WORD)LOBYTE(wVer)) << 8) | (WORD)HIBYTE(wVer);

    if (wVer >= 0x035F)
        return WIN95ORGREATHER;
    else
        return WIN32S;
}
