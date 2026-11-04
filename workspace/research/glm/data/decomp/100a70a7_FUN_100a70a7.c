// 100a70a7 size=352 FUN_100a70a7

undefined4 FUN_100a70a7(void)

{
  int iVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  uint *puVar5;
  bool bVar6;
  int in_ECX;
  int iVar7;
  int local_14;
  uint local_8;
  
  iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                           *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + 0x1c) * 4) + 0x48);
  if (iVar1 == -1) {
    return 1;
  }
  puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar1 * 4);
  if ((*puVar2 & 0xfff00000) == 0x10000000) {
    local_14 = -1;
    iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
    iVar3 = *(int *)(iVar1 + 0x18);
    iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
    iVar4 = *(int *)(iVar7 + 0x48);
    if ((((iVar4 != -1) && (*(int *)(iVar7 + 0x3c) == 0)) &&
        (puVar5 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar4 * 4),
        (*puVar5 & 0xfff00000) == 0x10000000)) && (local_8 = 0, puVar5[1] != 0)) {
      do {
        if (*(int *)(puVar5[4] + local_8 * 4) == iVar3) {
          local_14 = *(int *)(local_8 * 4 + puVar5[2]);
        }
        local_8 = local_8 + 1;
      } while (local_8 < puVar5[1]);
    }
    bVar6 = false;
    local_8 = 0;
    if (puVar2[1] != 0) {
      do {
        iVar7 = local_8 * 4;
        if ((*(int *)(puVar2[2] + iVar7) == iVar3) &&
           (*(int *)(iVar7 + puVar2[4]) == *(int *)(iVar1 + 0x1c))) {
          bVar6 = true;
        }
        if ((*(int *)(puVar2[2] + iVar7) == local_14) &&
           (*(int *)(iVar7 + puVar2[4]) == *(int *)(iVar1 + 0x1c))) {
          bVar6 = true;
        }
        local_8 = local_8 + 1;
      } while (local_8 < puVar2[1]);
      if (bVar6) {
        **(undefined4 **)(in_ECX + 0x100) = 0x72e00003;
        *(undefined4 *)(*(int *)(in_ECX + 0x100) + 4) = 6;
        iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
        *(undefined4 *)(iVar1 + 0xc) = *(undefined4 *)(iVar1 + 0x10);
        iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
        *(undefined4 *)(iVar1 + 0x10) = *(undefined4 *)(iVar1 + 0x14);
        iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
        *(undefined4 *)(iVar1 + 0x14) = *(undefined4 *)(iVar1 + 0x18);
        return 0;
      }
    }
  }
  return 1;
}


