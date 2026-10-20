
void FUN_00403520(undefined4 param_1,undefined4 param_2,int param_3)

{
  HWND pHVar1;
  CWnd *unaff_ESI;
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(unaff_ESI + 0x1c),&local_14);
  CWnd::SetFocus(unaff_ESI);
  pHVar1 = SetCapture(*(HWND *)(unaff_ESI + 0x1c));
  CWnd::FromHandle(pHVar1);
  FUN_00403fa0(param_2,(local_14.bottom - param_3) + -1,param_1);
  return;
}

