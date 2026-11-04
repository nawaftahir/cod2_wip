// 10086eae size=95 FUN_10086eae

undefined4 FUN_10086eae(void)

{
  undefined4 uVar1;
  int in_ECX;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  
  uVar4 = 0;
  iVar3 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      if ((*(ushort *)(iVar2 + 2) & 0xfff0) == 0) {
        FUN_1006c418(1);
      }
      else {
        *(int *)(*(int *)(in_ECX + 0x18) + iVar3 * 4) = iVar2;
        iVar3 = iVar3 + 1;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  if (iVar3 == *(int *)(in_ECX + 0xc)) {
    uVar1 = 1;
  }
  else {
    puVar5 = (undefined4 *)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
    for (uVar4 = *(int *)(in_ECX + 0xc) - iVar3 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar5 = 0;
      puVar5 = puVar5 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)puVar5 = 0;
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    *(int *)(in_ECX + 0xc) = iVar3;
    uVar1 = 0;
  }
  return uVar1;
}


