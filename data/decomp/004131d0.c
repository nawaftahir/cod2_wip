
undefined4 __thiscall FUN_004131d0(undefined4 param_1,HWND param_2)

{
  int iVar1;
  WINDOWPLACEMENT local_34;
  undefined4 local_8;
  
  local_34.length = 0x2c;
  local_8 = 0x2c;
  iVar1 = FUN_0047a1d0(param_1,&local_34);
  if (iVar1 != 0) {
    SetWindowPlacement(param_2,&local_34);
    return 1;
  }
  return 0;
}

