// 10085251 size=196 FUN_10085251

int FUN_10085251(void)

{
  int iVar1;
  int in_ECX;
  undefined4 *puVar2;
  int *piVar3;
  undefined4 *puVar4;
  uint local_c;
  int local_8;
  
  iVar1 = FUN_1006506e(0x60);
  if (iVar1 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10085142();
  }
  if (local_8 == 0) {
    return 0;
  }
  puVar2 = (undefined4 *)(in_ECX + 0x10);
  puVar4 = (undefined4 *)(local_8 + 0x10);
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar4 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar4 = puVar4 + 1;
  }
  *(undefined4 *)(local_8 + 0x30) = *(undefined4 *)(in_ECX + 0x30);
  *(undefined4 *)(local_8 + 0x34) = *(undefined4 *)(in_ECX + 0x34);
  *(undefined4 *)(local_8 + 0x38) = *(undefined4 *)(in_ECX + 0x38);
  *(undefined4 *)(local_8 + 0x54) = *(undefined4 *)(in_ECX + 0x54);
  *(undefined4 *)(local_8 + 0x58) = *(undefined4 *)(in_ECX + 0x58);
  if (*(int *)(in_ECX + 0x3c) == 0) {
LAB_100852c7:
    if (*(int *)(in_ECX + 0x40) != 0) {
      iVar1 = (**(code **)(**(int **)(in_ECX + 0x40) + 4))();
      *(int *)(local_8 + 0x40) = iVar1;
      if (iVar1 == 0) goto LAB_1008530e;
    }
    local_c = 0;
    piVar3 = (int *)(in_ECX + 0x44);
    do {
      if (*piVar3 != 0) {
        iVar1 = (**(code **)(*(int *)*piVar3 + 4))();
        *(int *)((local_8 - in_ECX) + (int)piVar3) = iVar1;
        if (iVar1 == 0) goto LAB_1008530e;
      }
      local_c = local_c + 1;
      piVar3 = piVar3 + 1;
    } while (local_c < 4);
  }
  else {
    iVar1 = (**(code **)(**(int **)(in_ECX + 0x3c) + 4))();
    *(int *)(local_8 + 0x3c) = iVar1;
    if (iVar1 != 0) goto LAB_100852c7;
LAB_1008530e:
    local_8 = 0;
  }
  return local_8;
}


