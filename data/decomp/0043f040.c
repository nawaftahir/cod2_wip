
CDialogBar * FUN_0043f040(CDialogBar *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524aa0;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialogBar::CDialogBar(param_1);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_00548c5c;
  CWnd::CWnd((CWnd *)(param_1 + 0xa0));
  *(undefined ***)(param_1 + 0xa0) = &PTR_LAB_0052dfdc;
  local_8._0_1_ = 1;
  CWnd::CWnd((CWnd *)(param_1 + 0xf0));
  *(undefined ***)(param_1 + 0xf0) = &PTR_LAB_0052dfdc;
  local_8._0_1_ = 2;
  CWnd::CWnd((CWnd *)(param_1 + 0x140));
  *(undefined ***)(param_1 + 0x140) = &PTR_LAB_0052dfdc;
  local_8._0_1_ = 3;
  CWnd::CWnd((CWnd *)(param_1 + 400));
  *(undefined ***)(param_1 + 400) = &PTR_LAB_0052dfdc;
  local_8 = CONCAT31(local_8._1_3_,4);
  CWnd::CWnd((CWnd *)(param_1 + 0x1e0));
  *(undefined ***)(param_1 + 0x1e0) = &PTR_LAB_0052dfdc;
  *(undefined4 *)(param_1 + 0x230) = 0;
  *(undefined4 *)(param_1 + 0x234) = 0;
  *(undefined4 *)(param_1 + 0x238) = 0;
  *(undefined4 *)(param_1 + 0x23c) = 0;
  *(undefined4 *)(param_1 + 0x240) = 0;
  *(undefined4 *)(param_1 + 0x244) = 0x2d;
  ExceptionList = local_10;
  return param_1;
}

