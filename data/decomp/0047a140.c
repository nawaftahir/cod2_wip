
bool FUN_0047a140(LPCSTR param_1,BYTE *param_2,DWORD param_3)

{
  LSTATUS LVar1;
  char *lpSubKey;
  DWORD local_c;
  HKEY local_8;
  
  if (DAT_011298f0 == 0) {
    lpSubKey = "Software\\iw\\CoD2Radiant\\CoD2Radiant";
  }
  else {
    lpSubKey = &DAT_011298f4;
  }
  LVar1 = RegCreateKeyExA((HKEY)0x80000001,lpSubKey,0,(LPSTR)0x0,0,0xf003f,
                          (LPSECURITY_ATTRIBUTES)0x0,&local_8,&local_c);
  if (LVar1 != 0) {
    return false;
  }
  LVar1 = RegSetValueExA(local_8,param_1,0,3,param_2,param_3);
  RegCloseKey(local_8);
  return LVar1 == 0;
}

