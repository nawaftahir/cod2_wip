
undefined4 __fastcall FUN_004017d0(CWnd *param_1)

{
  long lVar1;
  int iVar2;
  HWND hWnd;
  WINDOWPLACEMENT local_60;
  undefined1 local_34 [28];
  int local_18;
  int local_14;
  int local_10;
  int local_c;
  undefined4 local_8;
  
  lVar1 = CWnd::Default(param_1);
  if (lVar1 == -1) {
    return 0xffffffff;
  }
  FUN_004fae25(local_34);
  if (param_1 == (CWnd *)0x0) {
    hWnd = (HWND)0x0;
  }
  else {
    hWnd = *(HWND *)(param_1 + 0x1c);
  }
  local_60.length = 0x2c;
  local_8 = 0x2c;
  iVar2 = FUN_0047a1d0("Radiant::AdvCurveDlgPlace",&local_60);
  if (iVar2 != 0) {
    SetWindowPlacement(hWnd,&local_60);
  }
  CWnd::SetWindowPos(param_1,(CWnd *)0x0,0,0,local_10 - local_18,local_c - local_14,6);
  return 0;
}

