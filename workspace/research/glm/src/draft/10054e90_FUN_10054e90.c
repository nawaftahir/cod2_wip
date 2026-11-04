


unsigned int * FUN_10054e90(int *param_1,int param_2,unsigned int param_3)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int *puVar3;
  
  iVar1 = param_1[1];
  if (0x3b9ac9f0 < param_3) {
    *(unsigned int *)(*param_1 + 0x14) = 0x36;
    *(unsigned int *)(*param_1 + 0x18) = 3;
    (**(void **)*param_1)(param_1);
  }
  if ((param_3 & 7) != 0) {
    param_3 = param_3 + (8 - (param_3 & 7));
  }
  if ((param_2 < 0) || (1 < param_2)) {
    *(unsigned int *)(*param_1 + 0x14) = 0xe;
    *(int *)(*param_1 + 0x18) = param_2;
    (**(void **)*param_1)(param_1);
  }
  puVar3 = (unsigned int *)(*(void *)param_1[6])(param_3 + 0x10);
  if (puVar3 == (unsigned int *)0x0) {
    *(unsigned int *)(*param_1 + 0x14) = 0x36;
    *(unsigned int *)(*param_1 + 0x18) = 4;
    (**(void **)*param_1)(param_1);
  }
  *(unsigned int *)(iVar1 + 0x4c) = *(int *)(iVar1 + 0x4c) + param_3 + 0x10;
  uVar2 = *(unsigned int *)(iVar1 + 0x3c + param_2 * 4);
  puVar3[1] = param_3;
  *puVar3 = uVar2;
  puVar3[2] = 0;
  *(unsigned int **)(iVar1 + 0x3c + param_2 * 4) = puVar3;
  return puVar3 + 4;
}


