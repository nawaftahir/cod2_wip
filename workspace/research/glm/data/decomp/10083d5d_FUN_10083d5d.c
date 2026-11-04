// 10083d5d size=105 FUN_10083d5d

int FUN_10083d5d(void)

{
  int iVar1;
  int in_ECX;
  undefined4 *puVar2;
  undefined4 *puVar3;
  int local_8;
  
  iVar1 = FUN_1006506e(0x40);
  if (iVar1 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10083324();
  }
  if (local_8 != 0) {
    *(int *)(local_8 + 0x10) = *(int *)(in_ECX + 0x10);
    *(undefined4 *)(local_8 + 0x14) = *(undefined4 *)(in_ECX + 0x14);
    *(undefined4 *)(local_8 + 0x18) = *(undefined4 *)(in_ECX + 0x18);
    *(undefined4 *)(local_8 + 0x1c) = *(undefined4 *)(in_ECX + 0x1c);
    puVar2 = (undefined4 *)(in_ECX + 0x20);
    puVar3 = (undefined4 *)(local_8 + 0x20);
    for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
      *puVar3 = *puVar2;
      puVar2 = puVar2 + 1;
      puVar3 = puVar3 + 1;
    }
    if (*(int *)(in_ECX + 0x10) != 4) {
      return local_8;
    }
    if (*(int *)(in_ECX + 0x18) == 0) {
      return local_8;
    }
    iVar1 = FUN_10082816(*(int *)(in_ECX + 0x18));
    *(int *)(in_ECX + 0x18) = iVar1;
    if (iVar1 != 0) {
      return local_8;
    }
  }
  return 0;
}


