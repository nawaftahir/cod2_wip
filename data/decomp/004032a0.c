
void __thiscall FUN_004032a0(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  FUN_00404dc0(param_3);
  *(undefined4 *)(param_1 + 0xe8) = param_4;
  *(undefined4 *)(param_1 + 0xe4) = param_3;
  return;
}

