


void FUN_100298a0(int param_1)

{
  unsigned int *puVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int *puVar4;
  unsigned int *puVar5;
  int iVar6;
  
  if (*(int *)(param_1 + 0x20) != 0) {
    puVar1 = (unsigned int *)(*(void *)RI_Hunk_AllocAlignInternal)(*(int *)(param_1 + 0x20) << 2,4);
    puVar4 = *(unsigned int **)(param_1 + 0x24);
    puVar5 = puVar1;
    for (uVar2 = *(unsigned int *)(param_1 + 0x20) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(unsigned char *)puVar5 = *(unsigned char *)puVar4;
      puVar4 = (unsigned int *)((int)puVar4 + 1);
      puVar5 = (unsigned int *)((int)puVar5 + 1);
    }
    *(unsigned int **)(param_1 + 0x24) = puVar1;
  }
  iVar3 = 0;
  if (0 < *(int *)(param_1 + 0x28)) {
    iVar6 = 0;
    do {
      FUN_100298a0(*(int *)(param_1 + 0x2c) + iVar6);
      iVar3 = iVar3 + 1;
      iVar6 = iVar6 + 0x30;
    } while (iVar3 < *(int *)(param_1 + 0x28));
  }
  return;
}


