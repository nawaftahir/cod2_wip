#include "stdafx.h"
#include "win_main.h"

extern int dword_11298F0;
extern char byte_11298F4[];

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
     COLORREF cr = RGB((int)(DAT_01129708[iIndex][0] * 255), (int)(DAT_01129708[iIndex][1] * 255),
                       (int)(DAT_01129708[iIndex][2] * 255));
     CMyColorDialog dlg(cr, CC_FULLOPEN | CC_RGBINIT);
     if (dlg.DoModal() != IDOK) return FALSE;
     DAT_01129708[iIndex][0] = GetRValue(dlg.GetColor()) * (1.0f / 255.0f);
     DAT_01129708[iIndex][3] = 1.0f;
     dword_0123348c |= 0xffffffff;
     DAT_01129708[iIndex][1] = GetGValue(dlg.GetColor()) * (1.0f / 255.0f);
     DAT_01129708[iIndex][2] = GetBValue(dlg.GetColor()) * (1.0f / 255.0f);
     return TRUE;
}

extern HWND dword_010bcd54;

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
