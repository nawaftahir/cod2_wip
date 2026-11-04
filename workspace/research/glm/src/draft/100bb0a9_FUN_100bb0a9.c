


void FUN_100bb0a9(unsigned int *param_1,int param_2)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  int iVar5;
  
  puVar3 = param_1;
  uVar1 = *param_1;
  param_1 = (unsigned int *)(param_1[1] / (uVar1 & 0xfffff));
  if (param_1 != (unsigned int *)0x0) {
    iVar5 = param_2 << 2;
    do {
      puVar4 = (unsigned int *)(puVar3[2] + iVar5);
      uVar2 = *puVar4;
      *puVar4 = puVar4[1];
      *(unsigned int *)(puVar3[2] + 4 + iVar5) = uVar2;
      iVar5 = iVar5 + (uVar1 & 0xfffff) * 4;
      param_1 = (unsigned int *)((int)param_1 - 1);
    } while (param_1 != (unsigned int *)0x0);
  }
  puVar4 = (unsigned int *)(puVar3[4] + param_2 * 4);
  uVar2 = *puVar4;
  *puVar4 = puVar4[1];
  *(unsigned int *)(puVar3[4] + 4 + param_2 * 4) = uVar2;
  return;
}


