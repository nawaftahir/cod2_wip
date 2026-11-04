// 100b4147 size=287 FUN_100b4147

int * FUN_100b4147(int *param_1,uint param_2)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  int *piVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  int aiStack_14 [4];
  
  piVar1 = param_1;
  iVar5 = *(int *)(in_ECX + 8);
  uVar4 = 0;
  if (iVar5 != 0) {
    piVar3 = *(int **)(in_ECX + 0x14);
    do {
      if ((*(int *)(in_ECX + 0x88) == *(int *)(*piVar3 + 4)) &&
         (uVar6 = *(uint *)(*piVar3 + 0xc), uVar4 <= uVar6)) {
        uVar4 = uVar6 + 1;
      }
      piVar3 = piVar3 + 1;
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
  }
  uVar6 = 0;
  do {
    iVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),uVar4,uVar6,0);
    aiStack_14[uVar6] = iVar5;
    if (iVar5 == -1) goto LAB_100b41c5;
    uVar6 = uVar6 + 1;
  } while (uVar6 < 4);
  iVar5 = FUN_10085814();
  if (iVar5 == 0) {
    iVar5 = 0;
  }
  else {
    iVar5 = FUN_10085379();
  }
  *param_1 = iVar5;
  if (iVar5 == 0) {
LAB_100b41c5:
    param_1 = (int *)0x8007000e;
  }
  else {
    iVar2 = FUN_1008585f(param_2 & 0xfffff | 0x10000000,param_2,param_2,0);
    iVar5 = *param_1;
    if (-1 < iVar2) {
      iVar2 = FUN_100853b0();
      if (-1 < iVar2) {
        param_1 = (int *)0x0;
        if (param_2 != 0) {
          do {
            iVar2 = (int)param_1 * 4;
            iVar5 = aiStack_14[(int)param_1];
            *(int *)(iVar2 + *(int *)(*piVar1 + 8)) = iVar5;
            *(undefined4 *)(iVar2 + *(int *)(*piVar1 + 0x10)) =
                 *(undefined4 *)(iVar2 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10));
            *(int *)(iVar2 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) = iVar5;
            param_1 = (int *)((int)param_1 + 1);
          } while (param_1 < param_2);
        }
        return (int *)0;
      }
      iVar5 = *param_1;
    }
    param_1 = (int *)iVar2;
    if (iVar5 != 0) {
      FUN_1006c418();
    }
  }
  return param_1;
}


