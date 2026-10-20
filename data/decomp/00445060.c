
CDialog * FUN_00445060(CDialog *param_1,CWnd *param_2)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524a2b;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0xe4,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_00549e0c;
  CWnd::CWnd((CWnd *)(param_1 + 0x70));
  *(undefined ***)(param_1 + 0x70) = &PTR_LAB_0052d34c;
  local_8._0_1_ = 1;
  CWnd::CWnd((CWnd *)(param_1 + 0xc0));
  *(undefined ***)(param_1 + 0xc0) = &PTR_LAB_0052d34c;
  local_8._0_1_ = 2;
  CWnd::CWnd((CWnd *)(param_1 + 0x110));
  *(undefined ***)(param_1 + 0x110) = &PTR_LAB_0052d34c;
  local_8._0_1_ = 3;
  CWnd::CWnd((CWnd *)(param_1 + 0x160));
  *(undefined ***)(param_1 + 0x160) = &PTR_LAB_0052d34c;
  local_8._0_1_ = 4;
  CWnd::CWnd((CWnd *)(param_1 + 0x1b0));
  *(undefined ***)(param_1 + 0x1b0) = &PTR_LAB_0052e12c;
  local_8 = CONCAT31(local_8._1_3_,5);
  CWnd::CWnd((CWnd *)(param_1 + 0x200));
  *(undefined ***)(param_1 + 0x200) = &PTR_LAB_0052d204;
  ExceptionList = local_10;
  return param_1;
}

