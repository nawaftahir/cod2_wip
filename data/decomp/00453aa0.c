
void __fastcall FUN_00453aa0(CWnd *param_1)

{
  tagRECT local_14;
  
  CWnd::Default(param_1);
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  DAT_01139e48 = local_14.right;
  DAT_01139e4c = local_14.bottom;
  if (local_14.right < 10) {
    DAT_01139e48 = 10;
  }
  if (local_14.bottom < 10) {
    DAT_01139e4c = 10;
  }
  if (DAT_0059c448 != (code *)0x0) {
    (*DAT_0059c448)(DAT_010bcd6c,DAT_01139e48,DAT_01139e4c);
  }
  InvalidateRect(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,1);
  return;
}

