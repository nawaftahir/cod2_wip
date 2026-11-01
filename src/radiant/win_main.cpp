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
