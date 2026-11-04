
void __thiscall FUN_004537d0(CWnd *param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  HWND pHVar1;
  tagRECT local_14;
  
  CWnd::SetFocus(param_1);
  pHVar1 = SetCapture(*(HWND *)(param_1 + 0x1c));
  CWnd::FromHandle(pHVar1);
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  FUN_0047af50(param_3,((local_14.bottom - local_14.top) - param_4) + -1);
  return;
}

