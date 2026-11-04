// 100baac3 size=229 FUN_100baac3

undefined4 FUN_100baac3(void)

{
  int iVar1;
  uint uVar2;
  bool bVar3;
  bool bVar4;
  uint *puVar5;
  int in_ECX;
  uint uVar6;
  int local_14;
  int *local_c;
  uint local_8;
  
  do {
    bVar4 = false;
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) == 0) break;
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      local_14 = *(int *)(iVar1 + 4);
      bVar3 = false;
      if (local_14 != 0) {
        local_c = *(int **)(iVar1 + 8);
        do {
          puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) + *local_c * 4);
          if ((*puVar5 & 0x1000000) != 0) {
            bVar3 = true;
          }
          if (puVar5[0xe] != 0xffffffff) {
            puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) + puVar5[0xe] * 4);
          }
          if ((*puVar5 & 0x1000000) != 0) {
            bVar3 = true;
          }
          local_c = local_c + 1;
          local_14 = local_14 + -1;
        } while (local_14 != 0);
        uVar6 = 0;
        if ((bVar3) && (*(int *)(iVar1 + 0xc) != 0)) {
          do {
            puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) +
                               *(int *)(*(int *)(iVar1 + 0x10) + uVar6 * 4) * 4);
            uVar2 = *puVar5;
            if ((uVar2 & 0x1000000) == 0) {
              *puVar5 = uVar2 | 0x1000000;
              bVar4 = true;
            }
            uVar6 = uVar6 + 1;
          } while (uVar6 < *(uint *)(iVar1 + 0xc));
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  } while (bVar4);
  uVar6 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
      if ((puVar5[0xe] != 0xffffffff) &&
         ((**(uint **)(*(int *)(in_ECX + 0x14) + puVar5[0xe] * 4) & 0x1000000) != 0)) {
        *puVar5 = *puVar5 | 0x1000000;
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


