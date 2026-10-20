
CDialog * FUN_0043f710(CDialog *param_1,CWnd *param_2)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524a53;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0x9f,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_00548ec4;
  CWnd::CWnd((CWnd *)(param_1 + 0x7c));
  *(undefined ***)(param_1 + 0x7c) = &PTR_LAB_0052dfdc;
  local_8 = CONCAT31(local_8._1_3_,1);
  CWnd::CWnd((CWnd *)(param_1 + 0xcc));
  *(undefined ***)(param_1 + 0xcc) = &PTR_LAB_0052dfdc;
  *(undefined4 *)(param_1 + 0x70) = 0x40800000;
  *(undefined4 *)(param_1 + 0x74) = 0x40800000;
  *(undefined4 *)(param_1 + 0x78) = 0;
  ExceptionList = local_10;
  return param_1;
}

