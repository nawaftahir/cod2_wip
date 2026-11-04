// 100ab94e size=211 FUN_100ab94e

undefined4 FUN_100ab94e(void)

{
  uint uVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  undefined4 local_8;
  
  local_8 = 0;
  if (*(uint *)(in_ECX + 0xc) < 0x41) {
    uVar1 = 0;
    if (*(uint *)(in_ECX + 0xc) != 0) {
      do {
        iVar2 = uVar1 * 4;
        uVar1 = uVar1 + 1;
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + iVar2) + 0x28) = 0;
      } while (uVar1 < *(uint *)(in_ECX + 0xc));
    }
    uVar1 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        uVar3 = 0;
        iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + uVar1 * 4);
        *(int *)(in_ECX + 0x100) = iVar2;
        if ((*(int *)(iVar2 + 0x24) != 0) && (*(int *)(iVar2 + 4) != 0)) {
          do {
            if (*(char *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                  *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + uVar3 * 4) * 4)
                         + 0x6c) == '\x01') {
              FUN_1008b0b5();
              local_8 = 1;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < *(uint *)(*(int *)(in_ECX + 0x100) + 4));
        }
        iVar2 = FUN_100ab8d7(*(undefined4 *)(in_ECX + 0x100),0);
        if (iVar2 == 0) {
          return 1;
        }
        uVar1 = uVar1 + 1;
      } while (uVar1 < *(uint *)(in_ECX + 0xc));
    }
  }
  else {
    FUN_1008b0b5();
    local_8 = 1;
  }
  return local_8;
}


