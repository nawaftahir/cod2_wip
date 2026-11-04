
undefined4 * FUN_004534b0(undefined4 *param_1,undefined4 param_2)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  char *pcVar4;
  char *unaff_EBX;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052520b;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar2 = (int *)FUN_004ff4c3();
  iVar3 = (**(code **)(*piVar2 + 0xc))();
  param_1[1] = iVar3 + 0x10;
  local_8 = 0;
  param_1[2] = 0;
  *param_1 = param_2;
  if (unaff_EBX == (char *)0x0) {
    iVar3 = 0;
  }
  else {
    pcVar4 = unaff_EBX;
    do {
      cVar1 = *pcVar4;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    iVar3 = (int)pcVar4 - (int)(unaff_EBX + 1);
  }
  FUN_00402b30(unaff_EBX,iVar3);
  ExceptionList = local_10;
  return param_1;
}

