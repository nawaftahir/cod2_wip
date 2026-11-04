// 100bb114 size=178 FUN_100bb114

undefined4 FUN_100bb114(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  uint uVar4;
  uint uVar5;
  uint local_8;
  
  uVar5 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  if ((((uVar5 == (*(uint **)(in_ECX + 0x100))[3]) && (iVar2 = FUN_1008540c(), iVar2 == 0)) &&
      ((iVar2 = FUN_10085604(), iVar2 == 0 || (iVar2 = FUN_1008549a(), iVar2 != 0)))) &&
     ((uVar5 < 5 && (uVar5 != 0)))) {
    local_8 = 0;
    if (uVar5 != 0) {
      do {
        uVar4 = 0;
        if (uVar5 - local_8 != 1) {
          do {
            piVar1 = (int *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + uVar4 * 4);
            if (*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + piVar1[1] * 4) + 0x10) <
                *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 0x10)) {
              FUN_100bb0a9(*(undefined4 *)(in_ECX + 0x100),uVar4);
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < (uVar5 - local_8) - 1);
        }
        local_8 = local_8 + 1;
      } while (local_8 < uVar5);
    }
    uVar3 = 0;
  }
  else {
    uVar3 = 1;
  }
  return uVar3;
}


