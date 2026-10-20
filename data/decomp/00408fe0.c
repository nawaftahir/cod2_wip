
CDialog * FUN_00408fe0(CDialog *param_1,CWnd *param_2)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524778;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0x84,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_0053f4fc;
  CWnd::CWnd((CWnd *)(param_1 + 0x70));
  *(undefined ***)(param_1 + 0x70) = &PTR_LAB_0052d0a4;
  ExceptionList = local_10;
  return param_1;
}

