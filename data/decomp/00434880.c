
undefined4 * FUN_00434880(undefined4 *param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  puVar1 = (undefined4 *)FUN_00425770();
  puVar4 = param_1;
  puVar5 = puVar1;
  for (iVar3 = 0xe0e; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar5 = *puVar4;
    puVar4 = puVar4 + 1;
    puVar5 = puVar5 + 1;
  }
  puVar1[0xe09] = 0;
  uVar2 = FUN_004267d0(DAT_01128d94,0,0);
  puVar1[0xe09] = uVar2;
  FUN_00426a80(*(undefined4 *)(param_1[0xe0a] + 8));
  return puVar1;
}

