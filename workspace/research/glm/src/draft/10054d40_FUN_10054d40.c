extern unsigned int DAT_101910dc;
extern unsigned int DAT_101910e4;


int FUN_10054d40(int *param_1,int param_2,unsigned int param_3)

{
  int iVar1;
  unsigned int *puVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  int iVar5;
  unsigned int uVar6;
  
  iVar1 = param_1[1];
  if (0x3b9ac9f0 < param_3) {
    *(unsigned int *)(*param_1 + 0x14) = 0x36;
    *(unsigned int *)(*param_1 + 0x18) = 1;
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
  puVar3 = *(unsigned int **)(iVar1 + 0x34 + param_2 * 4);
  puVar2 = (unsigned int *)0x0;
  while (puVar4 = puVar3, puVar4 != (unsigned int *)0x0) {
    if (param_3 <= (unsigned int)puVar4[2]) goto LAB_10054e6a;
    puVar2 = puVar4;
    puVar3 = (unsigned int *)*puVar4;
  }
  iVar5 = param_3 + 0x10;
  if (puVar2 == (unsigned int *)0x0) {
    uVar6 = *(unsigned int *)(&DAT_101910dc + param_2 * 4);
  }
  else {
    uVar6 = *(unsigned int *)(&DAT_101910e4 + param_2 * 4);
  }
  if (1000000000U - iVar5 < uVar6) {
    uVar6 = 1000000000U - iVar5;
  }
  puVar4 = (unsigned int *)(*(void *)param_1[6])(uVar6 + iVar5);
  while (puVar4 == (unsigned int *)0x0) {
    uVar6 = uVar6 >> 1;
    if (uVar6 < 0x32) {
      *(unsigned int *)(*param_1 + 0x14) = 0x36;
      *(unsigned int *)(*param_1 + 0x18) = 2;
      (**(void **)*param_1)(param_1);
    }
    puVar4 = (unsigned int *)(*(void *)param_1[6])(uVar6 + iVar5);
  }
  *(unsigned int *)(iVar1 + 0x4c) = *(int *)(iVar1 + 0x4c) + uVar6 + iVar5;
  *puVar4 = 0;
  puVar4[1] = 0;
  puVar4[2] = uVar6 + param_3;
  if (puVar2 == (unsigned int *)0x0) {
    *(unsigned int **)(iVar1 + 0x34 + param_2 * 4) = puVar4;
  }
  else {
    *puVar2 = puVar4;
  }
LAB_10054e6a:
  iVar1 = puVar4[1];
  puVar4[1] = iVar1 + param_3;
  puVar4[2] = puVar4[2] - param_3;
  return iVar1 + 0x10 + (int)puVar4;
}


