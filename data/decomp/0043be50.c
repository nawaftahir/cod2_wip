
int * FUN_0043be50(int *param_1,int *param_2,char *param_3)

{
  int *piVar1;
  char cVar2;
  int *piVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  undefined4 *puVar7;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  piVar1 = param_2;
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525718;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar3 = (int *)(**(code **)(**(int **)(*param_2 + -0x10) + 0x10))();
  iVar4 = (**(code **)(*piVar3 + 0xc))();
  param_2 = (int *)(iVar4 + 0x10);
  local_8 = 0;
  if (param_3 == (char *)0x0) {
    iVar4 = 0;
  }
  else {
    pcVar5 = param_3;
    do {
      cVar2 = *pcVar5;
      pcVar5 = pcVar5 + 1;
    } while (cVar2 != '\0');
    iVar4 = (int)pcVar5 - (int)(param_3 + 1);
  }
  FUN_0043bff0(&param_2,*piVar1,*(undefined4 *)(*piVar1 + -0xc),param_3,iVar4);
  iVar4 = (int)param_2;
  puVar7 = (undefined4 *)((int)param_2 + -0x10);
  iVar6 = FUN_0041f340(puVar7);
  *param_1 = iVar6 + 0x10;
  local_8 = 0xffffffff;
  piVar1 = (int *)(iVar4 + -4);
  LOCK();
  iVar4 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar4 == 1 || iVar4 + -1 < 0) {
    (**(code **)(*(int *)*puVar7 + 4))(puVar7);
  }
  ExceptionList = local_10;
  return param_1;
}

