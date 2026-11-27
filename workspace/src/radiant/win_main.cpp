#include "stdafx.h"
#include "win_main.h"

extern int dword_11298F0;
extern char byte_11298F4[];

extern HWND dword_010bcd54;

// the saved-info block of the editor globals (0x294 B at 0x01129600)
struct SavedInfoView
{
    int iSize;
    int iTexMenu;
    char szProject[256];
    float colors[24][4];
    unsigned exclude;
    int field_28c;
    unsigned exclude2;
};
extern SavedInfoView g_savedinfo;

struct MRUMENU
{
    WORD wNbItemFill;
    WORD wNbLruShow;
    WORD wNbLruMenu;
    WORD wMaxSizeLruItem;
    WORD wIdMru;
    LPSTR lpMRU;
};

// the editor globals: main window at 0x40, MRU menu at 0x6c8e8
struct qeglobals_t
{
    unsigned char pad_00[0x40];
    HWND d_hwndMain;
    unsigned char pad_44[0x6c8e8 - 0x44];
    MRUMENU *d_lpMruMenu;
};
extern qeglobals_t g_qeglobals;

bool FUN_0047a890(void);
void AddNewItem(MRUMENU *lpMruMenu, LPSTR lpItem);
int DelMenuItem(MRUMENU *lpMruMenu, WORD wItem, BOOL fIDMBased);
void PlaceMenuMRUItem(MRUMENU *lpMruMenu, HMENU hMenu, UINT uiItem);
void Map_LoadFile(const char *filename);

// Q3 Win_main.cpp FindReplace, retail 0x00479560
void FindReplace(CString &strContents, const char *pTag, const char *pValue)
{
    if (strcmp(pTag, pValue) == 0)
        return;
    for (int nPos = strContents.Find(pTag); nPos >= 0; nPos = strContents.Find(pTag))
    {
        int nRightLen = strContents.GetLength() - strlen(pTag) - nPos;
        CString strLeft = strContents.Left(nPos);
        CString strRight = strContents.Right(nRightLen);
        strLeft += pValue;
        strLeft += strRight;
        strContents = strLeft;
    }
}

// Q3 DoMru, with GetMenuItem inlined; retail 0x00479c00
BOOL DoMru(HWND hWnd, WORD wId)
{
    char szFileName[128];
    OFSTRUCT of;
    BOOL fExist;

    if (!FUN_0047a890())
        return 0;
    {
        MRUMENU *mru = g_qeglobals.d_lpMruMenu;
        WORD wItem = (WORD)(wId - mru->wIdMru - 1);
        if (wItem < mru->wNbItemFill)
        {
            strncpy(szFileName, mru->lpMRU + mru->wMaxSizeLruItem * wItem, sizeof(szFileName));
            szFileName[sizeof(szFileName) - 1] = '\0';
        }
    }
    fExist = OpenFile(szFileName, &of, OF_EXIST) != HFILE_ERROR;
    if (fExist)
    {
        AddNewItem(g_qeglobals.d_lpMruMenu, szFileName);
        Map_LoadFile(szFileName);
    }
    else
        DelMenuItem(g_qeglobals.d_lpMruMenu, wId, TRUE);
    PlaceMenuMRUItem(g_qeglobals.d_lpMruMenu, GetSubMenu(GetMenu(hWnd), 0), 0x80b7);
    return fExist;
}

// Q3 MFCCreate: load the saved info, fill defaults when its size changed, tick the view menu
void MFCCreate(void)
{
    HMENU hMenu = NULL;
    int i = sizeof(g_savedinfo);
    long l = i;

    g_savedinfo.exclude |= 0x1020;
    LoadRegistryInfo("SavedInfo", &g_savedinfo, &l);

    int nOldSize = g_savedinfo.iSize;
    if (g_savedinfo.iSize != sizeof(g_savedinfo))
    {
        g_savedinfo.iSize = sizeof(g_savedinfo);
        g_savedinfo.iTexMenu = 0x80e2;
        g_savedinfo.field_28c = 1;
        g_savedinfo.colors[0][0] = 0.25f;
        g_savedinfo.colors[0][1] = 0.25f;
        g_savedinfo.colors[0][2] = 0.25f;
        g_savedinfo.colors[0][3] = 1.0f;
        g_savedinfo.colors[1][0] = 1.0f;
        g_savedinfo.colors[1][1] = 1.0f;
        g_savedinfo.colors[1][2] = 1.0f;
        g_savedinfo.colors[1][3] = 1.0f;
        g_savedinfo.colors[2][0] = 0.75f;
        g_savedinfo.colors[2][1] = 0.75f;
        g_savedinfo.colors[2][2] = 0.75f;
        g_savedinfo.colors[2][3] = 1.0f;
        g_savedinfo.colors[3][0] = 0.5f;
        g_savedinfo.colors[3][1] = 0.5f;
        g_savedinfo.colors[3][2] = 0.5f;
        g_savedinfo.colors[3][3] = 1.0f;
        g_savedinfo.colors[4][0] = 0.25f;
        g_savedinfo.colors[4][1] = 0.25f;
        g_savedinfo.colors[4][2] = 0.25f;
        g_savedinfo.colors[4][3] = 1.0f;
        g_savedinfo.colors[7][0] = 0.0f;
        g_savedinfo.colors[7][1] = 0.0f;
        g_savedinfo.colors[7][2] = 1.0f;
        g_savedinfo.colors[7][3] = 1.0f;
        g_savedinfo.colors[8][0] = 0.0f;
        g_savedinfo.colors[8][1] = 0.0f;
        g_savedinfo.colors[8][2] = 0.0f;
        g_savedinfo.colors[8][3] = 1.0f;
        g_savedinfo.colors[10][0] = 1.0f;
        g_savedinfo.colors[10][1] = 0.0f;
        g_savedinfo.colors[10][2] = 0.0f;
        g_savedinfo.colors[10][3] = 1.0f;
        g_savedinfo.colors[11][0] = 1.0f;
        g_savedinfo.colors[11][1] = 0.25f;
        g_savedinfo.colors[11][2] = 0.25f;
        g_savedinfo.colors[11][3] = 0.25f;
        g_savedinfo.colors[12][0] = 0.0f;
        g_savedinfo.colors[12][1] = 0.0f;
        g_savedinfo.colors[12][2] = 1.0f;
        g_savedinfo.colors[12][3] = 1.0f;
        g_savedinfo.colors[9][0] = 0.0f;
        g_savedinfo.colors[9][1] = 0.0f;
        g_savedinfo.colors[9][2] = 0.0f;
        g_savedinfo.colors[9][3] = 1.0f;
        g_savedinfo.colors[13][0] = 0.5f;
        g_savedinfo.colors[13][1] = 0.0f;
        g_savedinfo.colors[13][2] = 0.75f;
        g_savedinfo.colors[13][3] = 1.0f;
        g_savedinfo.colors[14][0] = 0.0f;
        g_savedinfo.colors[14][1] = 0.6f;
        g_savedinfo.colors[14][2] = 0.0f;
        g_savedinfo.colors[14][3] = 1.0f;
        g_savedinfo.colors[16][0] = 1.0f;
        g_savedinfo.colors[16][1] = 0.25f;
        g_savedinfo.colors[16][2] = 0.25f;
        g_savedinfo.colors[16][3] = 0.25f;
        g_savedinfo.colors[17][0] = 0.75f;
        g_savedinfo.colors[17][1] = 0.75f;
        g_savedinfo.colors[17][2] = 0.75f;
        g_savedinfo.colors[17][3] = 1.0f;
        g_savedinfo.colors[18][0] = 0.75f;
        g_savedinfo.colors[18][1] = 0.75f;
        g_savedinfo.colors[18][2] = 0.75f;
        g_savedinfo.colors[18][3] = 1.0f;
        g_savedinfo.colors[19][0] = 0.5f;
        g_savedinfo.colors[19][1] = 0.6f;
        g_savedinfo.colors[19][2] = 0.0f;
        g_savedinfo.colors[19][3] = 1.0f;
        g_savedinfo.colors[20][0] = 0.65f;
        g_savedinfo.colors[20][1] = 0.0f;
        g_savedinfo.colors[20][2] = 0.0f;
        g_savedinfo.colors[20][3] = 1.0f;
        g_savedinfo.colors[21][0] = 0.85f;
        g_savedinfo.colors[21][1] = 0.0f;
        g_savedinfo.colors[21][2] = 0.85f;
        g_savedinfo.colors[21][3] = 1.0f;
        g_savedinfo.colors[22][0] = 0.8f;
        g_savedinfo.colors[22][1] = 0.6f;
        g_savedinfo.colors[22][2] = 0.0f;
        g_savedinfo.colors[22][3] = 1.0f;
        if (nOldSize < sizeof(g_savedinfo))
        {
            long l = nOldSize;
            LoadRegistryInfo("SavedInfo", &g_savedinfo, &l);
        }
    }
    if ((hMenu = GetMenu(dword_010bcd54)) != 0)
    {
        if (g_savedinfo.exclude & 0x1)
            CheckMenuItem(hMenu, 0x815e, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x2)
            CheckMenuItem(hMenu, 0x80f9, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x4)
            CheckMenuItem(hMenu, 0x815c, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x8)
            CheckMenuItem(hMenu, 0x8159, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x10)
            CheckMenuItem(hMenu, 0x8155, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x20)
            CheckMenuItem(hMenu, 0x815b, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x1000)
            CheckMenuItem(hMenu, 0x8160, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x2000)
            CheckMenuItem(hMenu, 0x815a, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x8000000)
            CheckMenuItem(hMenu, 0x8165, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude & 0x80000000)
            CheckMenuItem(hMenu, 0x81b0, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x200)
            CheckMenuItem(hMenu, 0x81b5, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x800)
            CheckMenuItem(hMenu, 0x81d4, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x1000)
            CheckMenuItem(hMenu, 0x81dc, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x2000)
            CheckMenuItem(hMenu, 0x81d7, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x4000)
            CheckMenuItem(hMenu, 0x81d9, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x8000)
            CheckMenuItem(hMenu, 0x81da, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x10000)
            CheckMenuItem(hMenu, 0x81db, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x20)
            CheckMenuItem(hMenu, 0x8169, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x40)
            CheckMenuItem(hMenu, 0x8115, MF_BYCOMMAND | MF_UNCHECKED);
        if (g_savedinfo.exclude2 & 0x80)
            CheckMenuItem(hMenu, 0x80e5, MF_BYCOMMAND | MF_UNCHECKED);
    }
}

BOOL SaveRegistryInfo(const char *pszName, void *pvBuf, long lSize)
{
    HKEY hKey;
    DWORD disposition;
    LONG status;
    if (dword_11298F0)
        status = RegCreateKeyExA(HKEY_CURRENT_USER, byte_11298F4, 0, 0, 0,
                                KEY_ALL_ACCESS, 0, &hKey, &disposition);
    else
        status = RegCreateKeyExA(HKEY_CURRENT_USER,
                                "Software\\iw\\CoD2Radiant\\CoD2Radiant", 0, 0, 0,
                                KEY_ALL_ACCESS, 0, &hKey, &disposition);
    if (status != ERROR_SUCCESS) return FALSE;
    status = RegSetValueExA(hKey, pszName, 0, REG_BINARY, (const BYTE *)pvBuf, lSize);
    RegCloseKey(hKey);
    return status == ERROR_SUCCESS;
}

BOOL LoadRegistryInfo(const char *pszName, void *pvBuf, long *plSize)
{
    HKEY hKey;
    long localSize;
    DWORD type;
    if (!plSize) plSize = &localSize;
    if (dword_11298F0)
        RegOpenKeyExA(HKEY_CURRENT_USER, byte_11298F4, 0, KEY_READ, &hKey);
    else
        RegOpenKeyExA(HKEY_CURRENT_USER, "Software\\iw\\CoD2Radiant\\CoD2Radiant",
                      0, KEY_READ, &hKey);
    // PINNED: retail queries and closes the handle regardless of the open result.
    LONG status = RegQueryValueExA(hKey, pszName, 0, &type, (LPBYTE)pvBuf, (LPDWORD)plSize);
    RegCloseKey(hKey);
    return status == ERROR_SUCCESS;
}
// Q3Radiant win_main.cpp: colour dialog that keeps custom colours in the registry
class CMyColorDialog : public CColorDialog
{
	DECLARE_DYNCREATE(CMyColorDialog)
public:
	CMyColorDialog(COLORREF clrInit = 0, DWORD dwFlags = 0, CWnd *pParentWnd = NULL);
	virtual int DoModal();
	virtual void DoDataExchange(CDataExchange *pDX);
protected:
	DECLARE_MESSAGE_MAP()
	static void InitCustColors();
	static void SaveCustColors();
	static bool c_NeedToInitCustColors;
	static COLORREF c_CustColors[16];
	static COLORREF c_LastCustColors[16];
};

bool CMyColorDialog::c_NeedToInitCustColors = true;
COLORREF CMyColorDialog::c_CustColors[];
COLORREF CMyColorDialog::c_LastCustColors[];

#define SECTION _T("Custom Colors")

IMPLEMENT_DYNCREATE(CMyColorDialog, CColorDialog)

void CMyColorDialog::InitCustColors() {
     for (int i = 0; i < 16; i++) {
          CString entry; entry.Format("%d",i);
          c_LastCustColors[i] = c_CustColors[i] =
		::AfxGetApp()->GetProfileInt(SECTION,entry,RGB(255,255,255));
     }
     c_NeedToInitCustColors= false;
}

void CMyColorDialog::SaveCustColors() {
     for (int i = 0; i < 16; i++) {
          if (c_LastCustColors[i] != c_CustColors[i]) {
               CString entry; entry.Format("%d",i);
               if (c_CustColors[i] == RGB(255,255,255)) {
                    ::AfxGetApp()->WriteProfileString(SECTION,entry,NULL);
               } else {
                    ::AfxGetApp()->WriteProfileInt(SECTION, entry,c_CustColors[i]);
               }
               c_LastCustColors[i] = c_CustColors[i];
          }
     }
}

CMyColorDialog::CMyColorDialog(COLORREF clrInit, DWORD dwFlags, CWnd *pParentWnd)
	: CColorDialog(clrInit, dwFlags, pParentWnd) {
     if (c_NeedToInitCustColors) InitCustColors();
     m_cc.lpCustColors = c_CustColors;
}

int CMyColorDialog::DoModal() {
     int code = CColorDialog::DoModal();
     SaveCustColors();
     return code;
}

void CMyColorDialog::DoDataExchange(CDataExchange *pDX) {
}

BEGIN_MESSAGE_MAP(CMyColorDialog, CColorDialog)
END_MESSAGE_MAP()

extern float DAT_01129708[][4];
extern unsigned dword_0123348c;

BOOL DoColor(int iIndex) {
     int r = (int)(DAT_01129708[iIndex][0] * 255);
     int g = (int)(DAT_01129708[iIndex][1] * 255);
     int b = (int)(DAT_01129708[iIndex][2] * 255);
     CMyColorDialog dlg(RGB(r, g, b), CC_FULLOPEN | CC_RGBINIT);
     if (dlg.DoModal() != IDOK) return FALSE;
     COLORREF clr = dlg.GetColor();
     DAT_01129708[iIndex][0] = GetRValue(clr) * (1.0f / 255.0f);
     DAT_01129708[iIndex][1] = GetGValue(clr) * (1.0f / 255.0f);
     DAT_01129708[iIndex][2] = GetBValue(clr) * (1.0f / 255.0f);
     DAT_01129708[iIndex][3] = 1.0f;
     dword_0123348c = 0xffffffff;
     return TRUE;
}

// Q3 SaveWindowState: stores the window rect relative to the main window
void FUN_0047a250(HWND hWnd, const char *pszName)
{
    RECT rc;
    GetWindowRect(hWnd, &rc);
    if (hWnd != dword_010bcd54)
    {
        if (GetParent(hWnd) != dword_010bcd54)
            SetParent(hWnd, dword_010bcd54);
        MapWindowPoints(NULL, dword_010bcd54, (LPPOINT)&rc, 2);
    }
    SaveRegistryInfo(pszName, &rc, sizeof(rc));
}

// Q3 LoadWindowState: restores the window rect saved by SaveWindowState
BOOL FUN_0047a2b0(const char *pszName, HWND hWnd)
{
    RECT rc;
    long lSize = sizeof(rc);
    if (LoadRegistryInfo(pszName, &rc, &lSize))
    {
        if (rc.left < 0)
            rc.left = 0;
        if (rc.top < 0)
            rc.top = 0;
        if (rc.right < rc.left + 16)
            rc.right = rc.left + 16;
        if (rc.bottom < rc.top + 16)
            rc.bottom = rc.top + 16;
        MoveWindow(hWnd, rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top, FALSE);
        return TRUE;
    }
    return FALSE;
}

extern int DAT_010bcd20;
extern int DAT_010bcd24;
class CMainFrame
{
public:
    void FUN_00417cf0();
    void SetStatusText(int nPane, const char *pText)
    {
        if (pText && nPane <= 5 && nPane > 0)
        {
            m_strStatus[nPane] = pText;
            FUN_00417cf0();
        }
    }
    unsigned char pad[0x7a4];
    CString m_strStatus[6];
};
extern CMainFrame *dword_01233488;

// Q3 Sys_UpdateStatusBar: brush and entity counts in status pane 2
void Sys_UpdateStatusBar(void)
{
    char numbrushbuffer[100] = "";

    sprintf(numbrushbuffer, "Brushes: %d Entities: %d", DAT_010bcd24, DAT_010bcd20);
    dword_01233488->SetStatusText(2, numbrushbuffer);
}
