
CDialog * FUN_0041f9d0(CDialog *param_1,CWnd *param_2)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524c78;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0x80,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_00545284;
  CWnd::CWnd((CWnd *)(param_1 + 0x70));
  *(undefined ***)(param_1 + 0x70) = &PTR_LAB_0052d0a4;
  ExceptionList = local_10;
  return param_1;
}

