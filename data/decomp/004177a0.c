
void __fastcall FUN_004177a0(int param_1)

{
  HWND hWnd;
  BOOL BVar1;
  
  if ((((0 < *(int *)(param_1 + 0x7a0)) && (*(int *)(param_1 + 0x7a0) < 3)) &&
      (*(int *)(param_1 + 0x79c) != 0)) &&
     (hWnd = *(HWND *)(*(int *)(param_1 + 0x79c) + 0x1c), hWnd != (HWND)0x0)) {
    BVar1 = IsWindowVisible(hWnd);
    if (BVar1 != 0) {
      CWnd::ShowWindow(*(CWnd **)(param_1 + 0x79c),0);
      return;
    }
    CWnd::ShowWindow(*(CWnd **)(param_1 + 0x79c),5);
  }
  return;
}

