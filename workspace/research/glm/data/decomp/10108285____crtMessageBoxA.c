// 10108285 size=249 ___crtMessageBoxA

/* Library Function - Single Match
    ___crtMessageBoxA
   
   Library: Visual Studio 2003 Release */

int __cdecl ___crtMessageBoxA(LPCSTR _LpText,LPCSTR _LpCaption,UINT _UType)

{
  HMODULE hModule;
  int iVar1;
  int iVar2;
  undefined1 local_14 [8];
  byte local_c;
  undefined1 local_8 [4];
  
  iVar2 = 0;
  if (DAT_101ae23c == (FARPROC)0x0) {
    hModule = LoadLibraryA("user32.dll");
    if ((hModule == (HMODULE)0x0) ||
       (DAT_101ae23c = GetProcAddress(hModule,"MessageBoxA"), DAT_101ae23c == (FARPROC)0x0)) {
      return 0;
    }
    DAT_101ae240 = GetProcAddress(hModule,"GetActiveWindow");
    DAT_101ae244 = GetProcAddress(hModule,"GetLastActivePopup");
    if ((DAT_101ae00c == 2) &&
       (DAT_101ae24c = GetProcAddress(hModule,"GetUserObjectInformationA"),
       DAT_101ae24c != (FARPROC)0x0)) {
      DAT_101ae248 = GetProcAddress(hModule,"GetProcessWindowStation");
    }
  }
  if ((DAT_101ae248 == (FARPROC)0x0) ||
     (((iVar1 = (*DAT_101ae248)(), iVar1 != 0 &&
       (iVar1 = (*DAT_101ae24c)(iVar1,1,local_14,0xc,local_8), iVar1 != 0)) && ((local_c & 1) != 0))
     )) {
    if (((DAT_101ae240 != (FARPROC)0x0) && (iVar2 = (*DAT_101ae240)(), iVar2 != 0)) &&
       (DAT_101ae244 != (FARPROC)0x0)) {
      iVar2 = (*DAT_101ae244)(iVar2);
    }
  }
  else if (DAT_101ae018 < 4) {
    _UType = _UType | 0x40000;
  }
  else {
    _UType = _UType | 0x200000;
  }
  iVar2 = (*DAT_101ae23c)(iVar2,_LpText,_LpCaption,_UType);
  return iVar2;
}


