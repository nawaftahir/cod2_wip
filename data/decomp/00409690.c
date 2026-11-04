
void FUN_00409690(void)

{
  HWND unaff_ESI;
  LPCWSTR unaff_retaddr;
  
  if (DAT_012335bc == 0) {
    (**(code **)(DAT_012335a0 + 0x134))(0x96,0);
  }
  FID_conflict_SetWindowTextW(unaff_ESI,unaff_retaddr);
  CWnd::ShowWindow((CWnd *)&DAT_012335a0,5);
  CWnd::SetFocus(DAT_01233488);
  return;
}

