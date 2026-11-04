
CWnd * FUN_00449460(CWnd *param_1)

{
  int *piVar1;
  int iVar2;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524f76;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CWnd::CWnd(param_1);
  *(undefined ***)param_1 = &PTR_LAB_0054bf74;
  *(undefined ***)(param_1 + 0xe0) = &PTR_LAB_0052f5d4;
  *(undefined4 *)(param_1 + 0xe4) = 0;
  local_8 = 1;
  piVar1 = (int *)FUN_004ff4c3();
  iVar2 = (**(code **)(*piVar1 + 0xc))();
  *(int *)(param_1 + 0xec) = iVar2 + 0x10;
  *(undefined4 *)(param_1 + 0xe8) = 0;
  *(undefined4 *)(param_1 + 0xf0) = 0;
  DAT_0109fe34 = &DAT_0109fe30;
  DAT_0109fe0c = &DAT_0109fe08;
  param_1[0x50] = (CWnd)0x0;
  param_1[0x84] = (CWnd)0x0;
  *(undefined4 *)(param_1 + 0x70) = 0;
  *(undefined4 *)(param_1 + 0x54) = 2;
  *(undefined4 *)(param_1 + 0xf8) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x74) = 0x41a00000;
  *(undefined4 *)(param_1 + 0x78) = 0x42380000;
  *(undefined4 *)(param_1 + 0x60) = 0x3f800000;
  DAT_0109fe60 = 0;
  DAT_0109fe5f = 0;
  DAT_0109fe5e = 0;
  DAT_0109fe5d = 0;
  DAT_0109fe58 = 0;
  DAT_0109fe5c = 1;
  ExceptionList = local_10;
  return param_1;
}

