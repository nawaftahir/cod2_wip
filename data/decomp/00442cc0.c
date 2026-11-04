
void __thiscall FUN_00442cc0(CWnd *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  tagRECT local_14;
  
  CWnd::Default(param_1);
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  CWnd::SetWindowPos(param_1 + 0x50,(CWnd *)0x0,local_14.left + 8,local_14.top + 0x19,
                     local_14.right + -0x10,0x14,0);
  param_1[0xfc] = (CWnd)0x1;
  DAT_01128d98 = param_3;
  DAT_01128d9c = param_4;
  if (DAT_0059c448 != (code *)0x0) {
    (*DAT_0059c448)(DAT_010bcd64,param_3,param_4);
  }
  InvalidateRect(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,0);
  return;
}

