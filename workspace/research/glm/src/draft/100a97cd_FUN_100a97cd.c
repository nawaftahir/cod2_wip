extern int FUN_100857f7();


unsigned int FUN_100a97cd(int param_1,unsigned int param_2)

{
  unsigned int *puVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int *puVar4;
  unsigned int *puVar5;
  
  if ((*(unsigned int *)(param_1 + 0x1c) & 7) == 0) {
    puVar1 = (unsigned int *)FUN_100857f7(*(unsigned int *)(param_1 + 0x1c) + 8);
    if (puVar1 == (unsigned int *)0x0) {
      return 0x8007000e;
    }
    puVar4 = *(unsigned int **)(param_1 + 0x20);
    puVar5 = puVar1;
    for (uVar2 = *(unsigned int *)(param_1 + 0x1c) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(unsigned char *)puVar5 = *(unsigned char *)puVar4;
      puVar4 = (unsigned int *)((int)puVar4 + 1);
      puVar5 = (unsigned int *)((int)puVar5 + 1);
    }
    *(unsigned int **)(param_1 + 0x20) = puVar1;
  }
  *(unsigned int *)(*(int *)(param_1 + 0x20) + *(int *)(param_1 + 0x1c) * 4) = param_2;
  *(int *)(param_1 + 0x1c) = *(int *)(param_1 + 0x1c) + 1;
  return 0;
}


