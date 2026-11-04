// 100ac974 size=71 FUN_100ac974

undefined4 FUN_100ac974(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  
  uVar1 = 1;
  if (*(int *)(param_1 + 0x28) == 1) {
    uVar3 = 0;
    if (*(int *)(param_1 + 0x14) != 0) {
      do {
        iVar2 = FUN_100ac974(*(undefined4 *)
                              (*(int *)(in_ECX + 0x18) +
                              *(int *)(*(int *)(param_1 + 0x18) + uVar3 * 4) * 4));
        if (iVar2 != 0) {
          return 1;
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(param_1 + 0x14));
    }
    uVar1 = 0;
  }
  return uVar1;
}


