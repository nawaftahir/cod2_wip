
void __thiscall FUN_004032f0(CWnd *param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  HWND pHVar1;
  tagRECT local_14;
  
  *(undefined4 *)(param_1 + 0xe4) = param_3;
  *(int *)(param_1 + 0xe8) = param_4;
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  CWnd::SetFocus(param_1);
  pHVar1 = SetCapture(*(HWND *)(param_1 + 0x1c));
  CWnd::FromHandle(pHVar1);
  FUN_00403fa0(param_3,(local_14.bottom - param_4) + -1,param_2);
  return;
}

