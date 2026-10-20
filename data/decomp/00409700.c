
CDialog * FUN_00409700(CDialog *param_1,CWnd *param_2)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524e98;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0x96,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_0053f6d4;
  CWnd::CWnd((CWnd *)(param_1 + 0x70));
  *(undefined ***)(param_1 + 0x70) = &PTR_LAB_0052d34c;
  ExceptionList = local_10;
  return param_1;
}

