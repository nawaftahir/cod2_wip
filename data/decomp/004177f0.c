
void __fastcall FUN_004177f0(int param_1)

{
  HWND hWnd;
  BOOL BVar1;
  
  if (((*(int *)(param_1 + 0x7a0) == 1) && (*(int *)(param_1 + 0x788) != 0)) &&
     (hWnd = *(HWND *)(*(int *)(param_1 + 0x788) + 0x1c), hWnd != (HWND)0x0)) {
    BVar1 = IsWindowVisible(hWnd);
    if (BVar1 != 0) {
      CWnd::ShowWindow(*(CWnd **)(param_1 + 0x788),0);
      return;
    }
    CWnd::ShowWindow(*(CWnd **)(param_1 + 0x788),5);
  }
  return;
}

