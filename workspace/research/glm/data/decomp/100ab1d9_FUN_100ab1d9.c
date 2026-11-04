// 100ab1d9 size=173 FUN_100ab1d9

undefined4 FUN_100ab1d9(void)

{
  int in_ECX;
  uint uVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  uint local_8;
  
  local_8 = 0;
  if (*(int *)(in_ECX + 0x2c0) != 0) {
    do {
      iVar3 = local_8 * 4;
      iVar2 = *(int *)(iVar3 + *(int *)(in_ECX + 0x2b4));
      puVar4 = *(undefined4 **)(iVar2 + 8);
      puVar5 = *(undefined4 **)(*(int *)(*(int *)(in_ECX + 0x18) + iVar3) + 8);
      for (uVar1 = *(uint *)(iVar2 + 4) & 0x3fffffff; uVar1 != 0; uVar1 = uVar1 - 1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
        puVar4 = (undefined4 *)((int)puVar4 + 1);
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
      iVar2 = *(int *)(iVar3 + *(int *)(in_ECX + 0x2b4));
      puVar4 = *(undefined4 **)(iVar2 + 0x10);
      puVar5 = *(undefined4 **)(*(int *)(*(int *)(in_ECX + 0x18) + iVar3) + 0x10);
      for (uVar1 = *(uint *)(iVar2 + 0xc) & 0x3fffffff; uVar1 != 0; uVar1 = uVar1 - 1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      local_8 = local_8 + 1;
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
        puVar4 = (undefined4 *)((int)puVar4 + 1);
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
    } while (local_8 < *(uint *)(in_ECX + 0x2c0));
  }
  uVar1 = 0;
  if (*(int *)(in_ECX + 700) != 0) {
    do {
      iVar2 = uVar1 * 4;
      iVar3 = uVar1 * 4;
      uVar1 = uVar1 + 1;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3) + 0x38) =
           *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x2b8) + iVar2) + 0x38);
    } while (uVar1 < *(uint *)(in_ECX + 700));
  }
  return 0;
}


