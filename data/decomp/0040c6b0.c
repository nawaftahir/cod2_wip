
CWnd * FUN_0040c6b0(void)

{
  CWnd *this;
  CWnd *pCVar1;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524e4a;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  this = (CWnd *)FUN_004ff450(0x50);
  local_8 = 0;
  pCVar1 = (CWnd *)0x0;
  if (this != (CWnd *)0x0) {
    CWnd::CWnd(this);
    *(undefined ***)this = &PTR_LAB_0054012c;
    pCVar1 = this;
  }
  ExceptionList = local_10;
  return pCVar1;
}

