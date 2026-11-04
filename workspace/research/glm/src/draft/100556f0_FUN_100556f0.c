


void FUN_100556f0(int *param_1,int param_2)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  
  iVar1 = param_1[1];
  if ((param_2 < 0) || (1 < param_2)) {
    *(unsigned int *)(*param_1 + 0x14) = 0xe;
    *(int *)(*param_1 + 0x18) = param_2;
    (**(void **)*param_1)(param_1);
  }
  if (param_2 == 1) {
    for (iVar2 = *(int *)(iVar1 + 0x44); iVar2 != 0; iVar2 = *(int *)(iVar2 + 0x24)) {
      if (*(char *)(iVar2 + 0x22) != '\0') {
        *(unsigned char *)(iVar2 + 0x22) = 0;
        (**(void **)(iVar2 + 0x30))(param_1,iVar2 + 0x28);
      }
    }
    iVar2 = *(int *)(iVar1 + 0x48);
    *(unsigned int *)(iVar1 + 0x44) = 0;
    for (; iVar2 != 0; iVar2 = *(int *)(iVar2 + 0x24)) {
      if (*(char *)(iVar2 + 0x22) != '\0') {
        *(unsigned char *)(iVar2 + 0x22) = 0;
        (**(void **)(iVar2 + 0x30))(param_1,iVar2 + 0x28);
      }
    }
    *(unsigned int *)(iVar1 + 0x48) = 0;
  }
  puVar3 = *(unsigned int **)(iVar1 + 0x3c + param_2 * 4);
  *(unsigned int *)(iVar1 + 0x3c + param_2 * 4) = 0;
  while (puVar3 != (unsigned int *)0x0) {
    puVar4 = (unsigned int *)*puVar3;
    iVar2 = puVar3[2] + 0x10 + puVar3[1];
    (*(void *)param_1[7])(puVar3,iVar2);
    *(int *)(iVar1 + 0x4c) = *(int *)(iVar1 + 0x4c) - iVar2;
    puVar3 = puVar4;
  }
  puVar3 = *(unsigned int **)(iVar1 + 0x34 + param_2 * 4);
  *(unsigned int *)(iVar1 + 0x34 + param_2 * 4) = 0;
  while (puVar3 != (unsigned int *)0x0) {
    puVar4 = (unsigned int *)*puVar3;
    iVar2 = puVar3[2] + 0x10 + puVar3[1];
    (*(void *)param_1[7])(puVar3,iVar2);
    *(int *)(iVar1 + 0x4c) = *(int *)(iVar1 + 0x4c) - iVar2;
    puVar3 = puVar4;
  }
  return;
}


