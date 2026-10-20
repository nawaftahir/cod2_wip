
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00402360(CWnd *param_1,float param_2)

{
  HWND hWnd;
  HWND__ in_stack_fffffef8;
  
  _sprintf(&stack0xfffffef8,"%.0f",(double)param_2);
  hWnd = (HWND)&stack0xfffffef8;
  CWnd::GetDlgItem(param_1,0x5bb);
  FID_conflict_SetWindowTextW(hWnd,(LPCWSTR)in_stack_fffffef8.unused);
  return;
}

