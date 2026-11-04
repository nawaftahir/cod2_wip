
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

LPCWSTR FUN_004206e0(LPCWSTR param_1)

{
  UINT CodePage;
  int iVar1;
  wchar_t *_Source;
  LPSTR lpsz;
  
  CodePage = (*(code *)PTR_FUN_005984fc)();
  if (param_1 == (LPCWSTR)0x0) {
LAB_00420737:
    lpsz = (LPSTR)0x0;
  }
  else {
    iVar1 = lstrlenW(param_1);
    if (&stack0x00000000 == (undefined1 *)0x14) goto LAB_00420737;
    iVar1 = WideCharToMultiByte(CodePage,0,param_1,-1,&stack0xffffffec,iVar1 * 2 + 2,(LPCSTR)0x0,
                                (LPBOOL)0x0);
    lpsz = (LPSTR)(-(uint)(iVar1 != 0) & (uint)&stack0xffffffec);
  }
  CharLowerA(lpsz);
  if (lpsz != (LPSTR)0x0) {
    iVar1 = lstrlenA(lpsz);
    if (&stack0x00000000 != (undefined1 *)0x14) {
      iVar1 = MultiByteToWideChar(CodePage,0,lpsz,-1,(LPWSTR)&stack0xffffffec,iVar1 + 1);
      _Source = (wchar_t *)(-(uint)(iVar1 != 0) & (uint)&stack0xffffffec);
      goto LAB_00420788;
    }
  }
  _Source = (wchar_t *)0x0;
LAB_00420788:
  _wcscpy(param_1,_Source);
  return param_1;
}

