
void FUN_0044a210(undefined4 param_1,int param_2)

{
  HWND pHVar1;
  HWND pHVar2;
  undefined4 unaff_EBX;
  CWnd *unaff_ESI;
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(unaff_ESI + 0x1c),&local_14);
  CWnd::SetWindowPos(unaff_ESI,(CWnd *)&DAT_0059a540,0,0,0,0,3);
  pHVar2 = *(HWND *)(unaff_ESI + 0x1c);
  pHVar1 = GetTopWindow(DAT_010bcd54);
  if (pHVar1 != pHVar2) {
    BringWindowToTop(*(HWND *)(unaff_ESI + 0x1c));
  }
  CWnd::SetFocus(unaff_ESI);
  pHVar2 = SetCapture(*(HWND *)(unaff_ESI + 0x1c));
  CWnd::FromHandle(pHVar2);
  FUN_0044c8a0(param_1,((local_14.bottom - local_14.top) - param_2) + -1,unaff_EBX);
  *(undefined4 *)(unaff_ESI + 0xfc) = unaff_EBX;
  return;
}

