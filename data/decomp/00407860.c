
int * __thiscall FUN_00407860(int *param_1,char *param_2)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  char *pcVar4;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005255d8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar2 = (int *)FUN_004ff4c3();
  iVar3 = (**(code **)(*piVar2 + 0xc))();
  *param_1 = iVar3 + 0x10;
  local_8 = 0;
  if (param_2 == (char *)0x0) {
    iVar3 = 0;
  }
  else {
    if (((uint)param_2 & 0xffff0000) == 0) {
      iVar3 = FUN_00501023((uint)param_2 & 0xffff);
      if (iVar3 == 0) {
        ExceptionList = local_10;
        return param_1;
      }
      FUN_00407990(iVar3,(uint)param_2 & 0xffff);
      ExceptionList = local_10;
      return param_1;
    }
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

