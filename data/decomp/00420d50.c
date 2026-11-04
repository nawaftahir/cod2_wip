
void FUN_00420d50(undefined4 *param_1,UINT param_2)

{
  code *pcVar1;
  size_t _Size;
  int iVar2;
  void *pvVar3;
  LPCWSTR unaff_EBX;
  
  if (unaff_EBX == (LPCWSTR)0x0) {
    *param_1 = 0;
  }
  else {
    iVar2 = lstrlenW(unaff_EBX);
    _Size = (iVar2 + 1) * 2;
    if (0x80 < (int)_Size) {
      pvVar3 = _malloc(_Size);
      *param_1 = pvVar3;
      if (pvVar3 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_00402c90(0x8007000e);
      }
    }
    iVar2 = WideCharToMultiByte(param_2,0,unaff_EBX,iVar2 + 1,(LPSTR)*param_1,_Size,(LPCSTR)0x0,
                                (LPBOOL)0x0);
    if (iVar2 == 0) {
      FUN_00420020();
      pcVar1 = (code *)swi(3);
      (*pcVar1)();
      return;
    }
  }
  return;
}

