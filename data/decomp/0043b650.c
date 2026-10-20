
void __fastcall FUN_0043b650(CWnd *param_1)

{
  tagRECT local_14;
  
  CWnd::Default(param_1);
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  CWnd::SetWindowPos(param_1 + 0x50,(CWnd *)0x0,local_14.left,local_14.top,
                     local_14.right - local_14.left,local_14.bottom - local_14.top,0x40);
  return;
}

