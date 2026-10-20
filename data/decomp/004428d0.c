
CWnd * FUN_004428d0(CWnd *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005256c3;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CWnd::CWnd(param_1);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_005491dc;
  CWnd::CWnd(param_1 + 0x50);
  *(undefined ***)(param_1 + 0x50) = &PTR_LAB_00548abc;
  *(undefined4 *)(param_1 + 0xa8) = 0;
  *(undefined ***)(param_1 + 0xa4) = &PTR_LAB_0052f5b4;
  *(undefined4 *)(param_1 + 0xa0) = 0;
  local_8 = CONCAT31(local_8._1_3_,1);
  CWnd::CWnd(param_1 + 0xac);
  *(undefined ***)(param_1 + 0xac) = &PTR_LAB_0052cf5c;
  param_1[0xfc] = (CWnd)0x1;
  ExceptionList = local_10;
  return param_1;
}

