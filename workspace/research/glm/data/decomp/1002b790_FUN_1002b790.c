// 1002b790 size=82 FUN_1002b790

void FUN_1002b790(void)

{
  uint uVar1;
  uint *in_EAX;
  int iVar2;
  int *piVar3;
  int *piVar4;
  uint uVar5;
  
  uVar1 = *in_EAX;
  piVar4 = *(int **)(in_EAX[2] + 8);
  uVar5 = uVar1 << 0x10 | uVar1;
  piVar3 = (int *)(DAT_101d49b8 + uVar1 * 0xc);
  iVar2 = (int)*(short *)(in_EAX[2] + 4) / 2;
  do {
    *piVar3 = *piVar4 + uVar5;
    piVar3[1] = piVar4[1] + uVar5;
    piVar3[2] = piVar4[2] + uVar5;
    piVar3 = piVar3 + 3;
    piVar4 = piVar4 + 3;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}


