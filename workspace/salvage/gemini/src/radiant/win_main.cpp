#include <windows.h>

extern int dword_11298F0;
extern char byte_11298F4[];

BOOL SaveRegistryInfo(const char *pszName, void *pvBuf, long lSize)
{
	HKEY hKey;
	DWORD dwDisposition;
	const char* keyName = dword_11298F0 ? byte_11298F4 : "Software\\id\\Quake3\\Radiant";
	if (RegCreateKeyExA(HKEY_CURRENT_USER, keyName, 0, 0, 0, 0xf003f, 0, &hKey, &dwDisposition) == ERROR_SUCCESS)
	{
		LONG lRes = RegSetValueExA(hKey, pszName, 0, 3, (const BYTE*)pvBuf, lSize);
		RegCloseKey(hKey);
		return lRes == ERROR_SUCCESS;
	}
	return FALSE;
}

BOOL LoadRegistryInfo(const char *pszName, void *pvBuf, long *plSize)
{
	HKEY hKey;
	long lLocalSize;
	if (!plSize)
		plSize = &lLocalSize;
	const char* keyName = dword_11298F0 ? byte_11298F4 : "Software\\id\\Quake3\\Radiant";
	if (RegOpenKeyExA(HKEY_CURRENT_USER, keyName, 0, 0x20019, &hKey) == ERROR_SUCCESS)
	{
		DWORD dwType;
		LONG lRes = RegQueryValueExA(hKey, pszName, 0, &dwType, (LPBYTE)pvBuf, (LPDWORD)plSize);
		RegCloseKey(hKey);
		return lRes == ERROR_SUCCESS;
	}
	return FALSE;
}
