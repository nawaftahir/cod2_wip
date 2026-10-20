
void __fastcall FUN_004074f0(CWnd *param_1)

{
  tagRECT local_14;
  
  CWnd::Default(param_1);
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  *(LONG *)(param_1 + 0x54) = local_14.right;
  *(LONG *)(param_1 + 0x58) = local_14.bottom;
  if (DAT_0059c448 != (code *)0x0) {
    (*DAT_0059c448)(DAT_010bcd58,local_14.right,local_14.bottom);
  }
  InvalidateRect(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,0);
  return;
}

