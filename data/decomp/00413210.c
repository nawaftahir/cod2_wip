
void __thiscall FUN_00413210(HWND param_1,undefined4 param_2)

{
  BOOL BVar1;
  WINDOWPLACEMENT local_30;
  
  local_30.length = 0x2c;
  BVar1 = GetWindowPlacement(param_1,&local_30);
  if (BVar1 != 0) {
    FUN_0047a140(param_2,&local_30,0x2c);
  }
  return;
}

