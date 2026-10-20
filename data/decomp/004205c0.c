
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_004205c0(LPCWSTR param_1,LPCWSTR param_2)

{
  UINT CodePage;
  int iVar1;
  LPCSTR lpString2;
  
  CodePage = (*(code *)PTR_FUN_005984fc)();
  if (param_2 != (LPCWSTR)0x0) {
    iVar1 = lstrlenW(param_2);
    if (&stack0x00000000 != (undefined1 *)0x14) {
      iVar1 = WideCharToMultiByte(CodePage,0,param_2,-1,&stack0xffffffec,iVar1 * 2 + 2,(LPCSTR)0x0,
                                  (LPBOOL)0x0);
      lpString2 = (LPCSTR)(-(uint)(iVar1 != 0) & (uint)&stack0xffffffec);
      goto LAB_00420619;
    }
  }
  lpString2 = (LPCSTR)0x0;
LAB_00420619:
  if (param_1 != (LPCWSTR)0x0) {
    iVar1 = lstrlenW(param_1);
    if (&stack0x00000000 != (undefined1 *)0x14) {
      iVar1 = WideCharToMultiByte(CodePage,0,param_1,-1,&stack0xffffffec,iVar1 * 2 + 2,(LPCSTR)0x0,
                                  (LPBOOL)0x0);
      lstrcmpiA((LPCSTR)(-(uint)(iVar1 != 0) & (uint)&stack0xffffffec),lpString2);
      return;
    }
  }
  lstrcmpiA((LPCSTR)0x0,lpString2);
  return;
}

