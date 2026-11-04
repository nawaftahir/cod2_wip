
bool FUN_0047a1d0(LPCSTR param_1,LPBYTE param_2)

{
  DWORD *in_EAX;
  LSTATUS LVar1;
  char *lpSubKey;
  DWORD local_10;
  DWORD local_c;
  HKEY local_8;
  
  if (in_EAX == (LPDWORD)0x0) {
    in_EAX = &local_c;
  }
  if (DAT_011298f0 == 0) {
    lpSubKey = "Software\\iw\\CoD2Radiant\\CoD2Radiant";
  }
  else {
    lpSubKey = &DAT_011298f4;
  }
  RegOpenKeyExA((HKEY)0x80000001,lpSubKey,0,0x20019,&local_8);
  LVar1 = RegQueryValueExA(local_8,param_1,(LPDWORD)0x0,&local_10,param_2,in_EAX);
  RegCloseKey(local_8);
  return LVar1 == 0;
}

