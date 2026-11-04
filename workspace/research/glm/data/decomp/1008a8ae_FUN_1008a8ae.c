// 1008a8ae size=203 FUN_1008a8ae

undefined4 FUN_1008a8ae(void)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  int in_ECX;
  uint uVar4;
  uint uVar5;
  
  uVar4 = 0;
  bVar3 = false;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
      if (*(int *)(iVar1 + 0x38) != -1) {
        iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar1 + 0x38) * 4);
        *(undefined4 *)(iVar1 + 4) = *(undefined4 *)(iVar2 + 4);
        *(undefined4 *)(iVar1 + 8) = *(undefined4 *)(iVar2 + 8);
        *(undefined4 *)(iVar1 + 0xc) = *(undefined4 *)(iVar2 + 0xc);
        *(undefined4 *)(iVar1 + 0x10) = *(undefined4 *)(iVar2 + 0x10);
        *(undefined4 *)(iVar1 + 0x48) = *(undefined4 *)(iVar2 + 0x48);
        *(undefined4 *)(iVar1 + 0x4c) = *(undefined4 *)(iVar2 + 0x4c);
        *(undefined4 *)(iVar1 + 0x50) = *(undefined4 *)(iVar2 + 0x50);
        uVar5 = *(uint *)(iVar2 + 0x54);
        if (uVar5 == 0xffffffff) {
          *(undefined4 *)(iVar2 + 0x54) = *(undefined4 *)(iVar1 + 0x54);
          *(undefined4 *)(iVar2 + 0x58) = *(undefined4 *)(iVar1 + 0x58);
          *(undefined4 *)(iVar2 + 0x5c) = *(undefined4 *)(iVar1 + 0x5c);
        }
        else {
          if (*(uint *)(iVar1 + 0x54) <= uVar5) {
            uVar5 = *(uint *)(iVar1 + 0x54);
          }
          *(uint *)(iVar1 + 0x54) = uVar5;
          *(uint *)(iVar2 + 0x54) = uVar5;
          uVar5 = *(uint *)(iVar2 + 0x58);
          if (*(uint *)(iVar2 + 0x58) <= *(uint *)(iVar1 + 0x58)) {
            uVar5 = *(uint *)(iVar1 + 0x58);
          }
          *(uint *)(iVar1 + 0x58) = uVar5;
          *(uint *)(iVar2 + 0x58) = uVar5;
          *(int *)(iVar2 + 0x5c) = *(int *)(iVar2 + 0x5c) + *(int *)(iVar1 + 0x5c);
        }
        bVar3 = true;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 8));
    if ((bVar3) && (uVar4 = 0, *(int *)(in_ECX + 8) != 0)) {
      do {
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
        iVar2 = *(int *)(iVar1 + 0x38);
        if (iVar2 != -1) {
          *(undefined4 *)(iVar1 + 0x54) =
               *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4) + 0x54);
        }
        uVar4 = uVar4 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 8));
    }
  }
  return 0;
}


