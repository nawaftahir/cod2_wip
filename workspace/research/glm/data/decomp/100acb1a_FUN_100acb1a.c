// 100acb1a size=63 FUN_100acb1a

undefined4 FUN_100acb1a(void)

{
  int iVar1;
  int in_ECX;
  int iVar2;
  uint uVar3;
  
  uVar3 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
      if (*(int *)(iVar1 + 0x38) != -1) {
        iVar2 = *(int *)(iVar1 + 0x38) * 4;
        *(undefined4 *)(iVar1 + 0xc) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2) + 0xc);
        *(undefined4 *)(iVar1 + 0x10) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2) + 0x10);
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


