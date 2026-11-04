
undefined4 __thiscall FUN_0047a2b0(undefined4 param_1,HWND param_2)

{
  int iVar1;
  int local_18;
  int local_14;
  int local_10;
  int local_c;
  undefined4 local_8;
  
  local_8 = 0x10;
  iVar1 = FUN_0047a1d0(param_1,&local_18);
  if (iVar1 != 0) {
    if (local_18 < 0) {
      local_18 = 0;
    }
    if (local_14 < 0) {
      local_14 = 0;
    }
    if (local_10 < local_18 + 0x10) {
      local_10 = local_18 + 0x10;
    }
    if (local_c < local_14 + 0x10) {
      local_c = local_14 + 0x10;
    }
    MoveWindow(param_2,local_18,local_14,local_10 - local_18,local_c - local_14,0);
    return 1;
  }
  return 0;
}

