
CDialog * FUN_00424090(CDialog *param_1,char *param_2,CWnd *param_3)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  char *pcVar4;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052546e;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CDialog::CDialog(param_1,0xb2,param_3);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_0054595c;
  piVar2 = (int *)FUN_004ff4c3();
  iVar3 = (**(code **)(*piVar2 + 0xc))();
  *(int *)(param_1 + 0x70) = iVar3 + 0x10;
  local_8._0_1_ = 1;
  piVar2 = (int *)FUN_004ff4c3();
  iVar3 = (**(code **)(*piVar2 + 0xc))();
  *(int *)(param_1 + 0x74) = iVar3 + 0x10;
  local_8 = CONCAT31(local_8._1_3_,2);
  FUN_00402b30(&DAT_0053d753,0);
  if (param_2 == (char *)0x0) {
    iVar3 = 0;
  }
  else {
    pcVar4 = param_2;
    do {
      cVar1 = *pcVar4;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    iVar3 = (int)pcVar4 - (int)(param_2 + 1);
  }
  FUN_00402b30(param_2,iVar3);
  ExceptionList = local_10;
  return param_1;
}

