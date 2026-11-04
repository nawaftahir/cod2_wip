// 1002abf0 size=221 FUN_1002abf0

undefined4 FUN_1002abf0(int param_1,int param_2)

{
  int iVar1;
  int *piVar2;
  undefined4 uVar3;
  int *piVar4;
  
  if (param_2 == 0) {
    uVar3 = FUN_1002ab90();
    return uVar3;
  }
  if (*(int *)(param_1 + 0xc3fc + param_2 * 8) == param_1 + 0xc3f8 + param_2 * 8) {
    uVar3 = FUN_1002abf0(param_1,param_2 + -1);
    if ((char)uVar3 == '\0') {
      return uVar3;
    }
  }
  piVar2 = *(int **)(param_1 + 0xc3fc + param_2 * 8);
  *(int *)piVar2[1] = *piVar2;
  *(int *)(*piVar2 + 4) = piVar2[1];
  piVar4 = (int *)((((int)piVar2 - param_1) / 0x188) * 0x188 + param_1);
  if (param_2 == 1) {
    *piVar4 = param_1 + 0xc428;
    piVar4[1] = *(int *)(param_1 + 0xc42c);
    *(int **)(param_1 + 0xc42c) = piVar4;
    *(int **)piVar4[1] = piVar4;
  }
  iVar1 = param_1 + 0xc400 + param_2 * 8;
  *piVar2 = iVar1;
  piVar2[1] = *(int *)(iVar1 + 4);
  *(int **)(iVar1 + 4) = piVar2;
  *(int **)piVar2[1] = piVar2;
  piVar4 = piVar4 + ((1 << (4U - (char)param_2 & 0x1f)) + ((int)piVar2 + (-0x88 - (int)piVar4) >> 4)
                    ) * 4 + 0x22;
  *piVar4 = iVar1;
  piVar4[1] = *(int *)(iVar1 + 4);
  *(int **)(iVar1 + 4) = piVar4;
  *(int **)piVar4[1] = piVar4;
  return CONCAT31((int3)((uint)piVar4 >> 8),1);
}


