
void FUN_0046fd50(undefined4 param_1)

{
  undefined4 *puVar1;
  char cVar2;
  char *pcVar3;
  int *piVar4;
  int iVar5;
  char *pcVar6;
  undefined4 *puVar7;
  float local_2c;
  float local_1c;
  float local_18;
  char *local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00526358;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar4 = (int *)FUN_004ff4c3();
  iVar5 = (**(code **)(*piVar4 + 0xc))();
  local_14 = (char *)(iVar5 + 0x10);
  local_8 = 0;
  puVar7 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      FUN_0045e1a0(puVar7[5],param_1);
      puVar1 = puVar7 + 1;
      puVar7 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  FUN_00470a50();
  FUN_004075c0(&local_14,"Origin X:: %.1f  Y:: %.1f  Z:: %.1f",(double)local_2c,(double)local_1c,
               (double)local_18);
  pcVar3 = local_14;
  if (local_14 != (char *)0x0) {
    pcVar6 = local_14;
    do {
      cVar2 = *pcVar6;
      pcVar6 = pcVar6 + 1;
    } while (cVar2 != '\0');
    FUN_00402b30(local_14,(int)pcVar6 - (int)(local_14 + 1));
    FUN_00417cf0();
  }
  local_8 = 0xffffffff;
  piVar4 = (int *)(pcVar3 + -4);
  LOCK();
  iVar5 = *piVar4;
  *piVar4 = *piVar4 + -1;
  UNLOCK();
  if (iVar5 == 1 || iVar5 + -1 < 0) {
    (**(code **)(**(int **)(pcVar3 + -0x10) + 4))();
  }
  ExceptionList = local_10;
  return;
}

