// 100cc1bb size=109 FUN_100cc1bb

int FUN_100cc1bb(void)

{
  uint uVar1;
  int iVar2;
  int in_ECX;
  
  FUN_100cbc0c(in_ECX + 0x50,in_ECX + 0x4c);
  uVar1 = 0;
  if (*(int *)(in_ECX + 0x38) != 0) {
    do {
      *(uint *)(*(int *)(in_ECX + 0x30) + uVar1 * 4) = uVar1;
      *(undefined4 *)(*(int *)(in_ECX + 0x40) + uVar1 * 4) =
           *(undefined4 *)(*(int *)(in_ECX + 0x3c) + uVar1 * 4);
      uVar1 = uVar1 + 1;
    } while (uVar1 < *(uint *)(in_ECX + 0x38));
  }
  FUN_10086920(FUN_100cbb65,*(undefined4 *)(in_ECX + 0x30),*(undefined4 *)(in_ECX + 0x38),in_ECX);
  uVar1 = 0;
  if (*(int *)(in_ECX + 0x38) != 0) {
    do {
      iVar2 = FUN_100cbd29(*(undefined4 *)(*(int *)(in_ECX + 0x30) + uVar1 * 4));
      if (iVar2 < 0) {
        return iVar2;
      }
      if (iVar2 == 0) {
        return 0;
      }
      uVar1 = uVar1 + 1;
    } while (uVar1 < *(uint *)(in_ECX + 0x38));
  }
  return 1;
}


