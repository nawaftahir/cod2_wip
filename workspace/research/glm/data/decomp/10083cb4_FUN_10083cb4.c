// 10083cb4 size=169 FUN_10083cb4

int FUN_10083cb4(void)

{
  int iVar1;
  int in_ECX;
  undefined4 *puVar2;
  undefined4 *puVar3;
  int local_8;
  
  iVar1 = FUN_1006506e(0x50);
  if (iVar1 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_1008321c();
  }
  if (local_8 == 0) {
    return 0;
  }
  *(undefined4 *)(local_8 + 0x14) = *(undefined4 *)(in_ECX + 0x14);
  *(undefined4 *)(local_8 + 0x18) = *(undefined4 *)(in_ECX + 0x18);
  *(undefined4 *)(local_8 + 0x1c) = *(undefined4 *)(in_ECX + 0x1c);
  *(undefined4 *)(local_8 + 0x28) = *(undefined4 *)(in_ECX + 0x28);
  puVar2 = (undefined4 *)(in_ECX + 0x30);
  puVar3 = (undefined4 *)(local_8 + 0x30);
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  if (*(int *)(in_ECX + 0x10) != 0) {
    iVar1 = (**(code **)(**(int **)(in_ECX + 0x10) + 4))();
    *(int *)(local_8 + 0x10) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
  }
  if (*(int *)(in_ECX + 0x20) != 0) {
    iVar1 = (**(code **)(**(int **)(in_ECX + 0x20) + 4))();
    *(int *)(local_8 + 0x20) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
  }
  if (*(int *)(in_ECX + 0x24) != 0) {
    iVar1 = (**(code **)(**(int **)(in_ECX + 0x24) + 4))();
    *(int *)(local_8 + 0x24) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
    return local_8;
  }
  return local_8;
}


