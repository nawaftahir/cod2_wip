
int * __fastcall FUN_0043bf10(int *param_1,char *param_2,int *param_3)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  char *pcVar4;
  int iVar5;
  undefined4 *puVar6;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005256f8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar2 = (int *)(**(code **)(**(int **)(*param_1 + -0x10) + 0x10))();
  local_14 = (**(code **)(*piVar2 + 0xc))();
  local_14 = local_14 + 0x10;
  local_8 = 0;
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
  FUN_0043bff0(&local_14,param_2,iVar3,*param_1,*(undefined4 *)(*param_1 + -0xc));
  iVar3 = local_14;
  puVar6 = (undefined4 *)(local_14 + -0x10);
  iVar5 = FUN_0041f340(puVar6);
  *param_3 = iVar5 + 0x10;
  local_8 = 0xffffffff;
  piVar2 = (int *)(iVar3 + -4);
  LOCK();
  iVar3 = *piVar2;
  *piVar2 = *piVar2 + -1;
  UNLOCK();
  if (iVar3 == 1 || iVar3 + -1 < 0) {
    (**(code **)(*(int *)*puVar6 + 4))(puVar6);
  }
  ExceptionList = local_10;
  return param_3;
}

