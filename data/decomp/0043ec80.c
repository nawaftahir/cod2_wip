
CDialog * FUN_0043ec80(CDialog *param_1,CWnd *param_2)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524ac3;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0xba,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_0054893c;
  CWnd::CWnd((CWnd *)(param_1 + 0x70));
  *(undefined ***)(param_1 + 0x70) = &PTR_LAB_0052d204;
  local_8 = CONCAT31(local_8._1_3_,1);
  CWnd::CWnd((CWnd *)(param_1 + 0xc0));
  *(undefined ***)(param_1 + 0xc0) = &PTR_LAB_0052d204;
  ExceptionList = local_10;
  return param_1;
}

