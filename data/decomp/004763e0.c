
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_004763e0(HWND param_1,float param_2,uint param_3)

{
  float fVar1;
  HWND pHVar2;
  double dVar3;
  CHAR *pCVar4;
  int iVar5;
  undefined1 auStack_138 [12];
  uint uStack_12c;
  float fStack_128;
  float fStack_124;
  float fStack_120;
  uint uStack_11c;
  float fStack_118;
  float fStack_114;
  float fStack_110;
  uint uStack_10c;
  CHAR aCStack_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (param_2 == 3.81153e-43) {
    pHVar2 = GetDlgItem(param_1,0x4cf);
    SetFocus(pHVar2);
  }
  else if (param_2 == 3.82554e-43) {
    if ((param_3 & 0xffff) == 1) {
      iVar5 = 0xff;
      pCVar4 = aCStack_108;
      pHVar2 = GetDlgItem(param_1,0x4d4);
      GetWindowTextA(pHVar2,pCVar4,iVar5);
      dVar3 = _atof(aCStack_108);
      if ((float)dVar3 != _DAT_00556a70) {
        FUN_00470c50();
        fVar1 = -(float)dVar3;
        FUN_004897c0(fVar1,&param_2,&param_3);
        FUN_00485040();
        fStack_118 = -param_2;
        uStack_11c = param_3;
        uStack_10c = param_3;
        fStack_110 = param_2;
        FUN_00470ce0(auStack_138,&uStack_12c,1,0,fVar1);
        DAT_0123348c = 0xffffffff;
      }
      iVar5 = 0xff;
      pCVar4 = aCStack_108;
      pHVar2 = GetDlgItem(param_1,0x478);
      GetWindowTextA(pHVar2,pCVar4,iVar5);
      dVar3 = _atof(aCStack_108);
      if ((float)dVar3 != _DAT_00556a70) {
        FUN_00470c50();
        fVar1 = -(float)dVar3;
        FUN_004897c0(fVar1,&param_2,&param_3);
        FUN_00485040();
        fStack_114 = -param_2;
        uStack_12c = param_3;
        uStack_10c = param_3;
        fStack_124 = param_2;
        FUN_00470ce0(auStack_138,&uStack_12c,1,1,fVar1);
        DAT_0123348c = 0xffffffff;
      }
      iVar5 = 0xff;
      pCVar4 = aCStack_108;
      pHVar2 = GetDlgItem(param_1,0x473);
      GetWindowTextA(pHVar2,pCVar4,iVar5);
      dVar3 = _atof(aCStack_108);
      if ((float)dVar3 != _DAT_00556a70) {
        FUN_00470c50();
        fVar1 = -(float)dVar3;
        FUN_004897c0(fVar1,&param_2,&param_3);
        FUN_00485040();
        fStack_128 = -param_2;
        uStack_12c = param_3;
        uStack_11c = param_3;
        fStack_120 = param_2;
        FUN_00470ce0(auStack_138,&uStack_12c,1,2,fVar1);
        DAT_0123348c = 0xffffffff;
      }
      EndDialog(param_1,1);
      return 1;
    }
    if ((param_3 & 0xffff) == 2) {
      EndDialog(param_1,0);
      return 1;
    }
  }
  return 0;
}

