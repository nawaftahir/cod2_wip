
undefined4 FUN_004251c0(void)

{
  HWND hWnd;
  int *unaff_EDI;
  LPCSTR local_18;
  undefined4 local_14;
  undefined4 local_10;
  void *local_c;
  undefined1 *puStack_8;
  undefined4 local_4;
  
  local_4 = 0xffffffff;
  puStack_8 = &LAB_00524b78;
  local_c = ExceptionList;
  if (*unaff_EDI < 2) {
    return 0;
  }
  ExceptionList = &local_c;
  hWnd = GetActiveWindow();
  local_10 = 0;
  local_14 = 0;
  local_18 = &DAT_00598c80;
  local_4 = 0;
  FUN_004be850(&local_18,2);
  MessageBoxA(hWnd,local_18,"Perforce Error",0x10);
  local_4 = 0xffffffff;
  if (local_18 != &DAT_00598c80) {
    _free(local_18);
  }
  ExceptionList = local_c;
  return 1;
}

