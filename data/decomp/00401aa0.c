
LRESULT FUN_00401aa0(HWND param_1,UINT param_2,WPARAM param_3)

{
  LRESULT LVar1;
  LPARAM unaff_EBP;
  
  if (param_1 == (HWND)0x10) {
    return 0;
  }
  LVar1 = FID_conflict_DefWindowProcA(param_1,param_2,param_3,unaff_EBP);
  return LVar1;
}

