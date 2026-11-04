
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_0046c090(LPCSTR param_1,LPCSTR param_2)

{
  ushort uVar1;
  HGLOBAL pvVar2;
  char *_Dest;
  uint uVar3;
  ushort *unaff_EDI;
  CHAR local_18 [16];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  pvVar2 = GlobalAlloc(0x42,unaff_EDI[3] + 0x14);
  _Dest = GlobalLock(pvVar2);
  if (_Dest == (char *)0x0) {
    return 0;
  }
  uVar1 = 0;
  if (unaff_EDI[2] != 0) {
    do {
      wsprintfA(local_18,"File%lu",uVar1 + 1);
      uVar3 = (uint)unaff_EDI[3];
      if (uVar1 < *unaff_EDI) {
        _strncpy(_Dest,(char *)(uVar1 * uVar3 + *(int *)(unaff_EDI + 6)),uVar3 + 10);
        _Dest[uVar3 + 9] = '\0';
      }
      else {
        *_Dest = '\0';
      }
      WritePrivateProfileStringA(param_1,local_18,_Dest,param_2);
      uVar1 = uVar1 + 1;
    } while (uVar1 < unaff_EDI[2]);
  }
  pvVar2 = GlobalHandle(_Dest);
  GlobalUnlock(pvVar2);
  pvVar2 = GlobalHandle(_Dest);
  GlobalFree(pvVar2);
  WritePrivateProfileStringA((LPCSTR)0x0,(LPCSTR)0x0,(LPCSTR)0x0,param_2);
  return 1;
}

