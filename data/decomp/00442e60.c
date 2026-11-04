
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00442e60(void)

{
  int unaff_ESI;
  
  if (*(int *)(DAT_01233b64 + 0x1fc) == 0) {
    CWnd::ShowWindow((CWnd *)(unaff_ESI + 0x50),0);
    _DAT_01234d58 = 0;
  }
  else {
    CWnd::ShowWindow((CWnd *)(unaff_ESI + 0x50),5);
    _DAT_01234d58 = 0x19;
  }
  ShowScrollBar(*(HWND *)(unaff_ESI + 0x1c),1,*(BOOL *)(DAT_01233b64 + 0x260));
  *(undefined1 *)(unaff_ESI + 0xfc) = 1;
  InvalidateRect(*(HWND *)(unaff_ESI + 0x1c),(RECT *)0x0,1);
  UpdateWindow(*(HWND *)(unaff_ESI + 0x1c));
  return;
}

