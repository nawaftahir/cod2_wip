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
public:
	virtual int DoModal();
protected:
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

int CMyColorDialog::DoModal() {
     int code = CColorDialog::DoModal();
     SaveCustColors();
     return code;
}
