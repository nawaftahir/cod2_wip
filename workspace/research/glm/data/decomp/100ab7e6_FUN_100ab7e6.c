// 100ab7e6 size=142 FUN_100ab7e6

int FUN_100ab7e6(void)

{
  int iVar1;
  uint *puVar2;
  int iVar3;
  uint uVar4;
  int in_ECX;
  undefined4 extraout_ECX;
  undefined8 uVar5;
  uint local_8;
  
  iVar3 = FUN_100a9827(*(undefined4 *)(in_ECX + 0x18),*(undefined4 *)(in_ECX + 0xc));
  if (-1 < iVar3) {
    uVar4 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + uVar4 * 4) + 0x28) = 0;
        iVar1 = uVar4 * 4;
        uVar4 = uVar4 + 1;
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + iVar1) + 0x24) = 0;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
        uVar5 = FUN_100a6e19(*puVar2 & 0xfff00000);
        if (((int)uVar5 != 0) || ((int)((ulonglong)uVar5 >> 0x20) == 0x11000000)) {
          uVar4 = puVar2[9];
          FUN_100b9ffd(extraout_ECX,puVar2,1);
          puVar2[9] = uVar4;
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(uint *)(in_ECX + 0xc));
    }
  }
  return iVar3;
}


