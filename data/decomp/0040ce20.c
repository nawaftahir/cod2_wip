
CDialog * FUN_0040ce20(CDialog *param_1,CWnd *param_2)

{
  int *piVar1;
  int iVar2;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005254f3;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0xb4,param_2);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_0054048c;
  piVar1 = (int *)FUN_004ff4c3();
  iVar2 = (**(code **)(*piVar1 + 0xc))();
  *(int *)(param_1 + 0x70) = iVar2 + 0x10;
  local_8 = CONCAT31(local_8._1_3_,1);
  FUN_00402b30(&DAT_0053d753,0);
  ExceptionList = local_10;
  return param_1;
}

