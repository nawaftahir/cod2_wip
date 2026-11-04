// 1008f667 size=569 FUN_1008f667

int FUN_1008f667(void)

{
  uint *puVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  undefined4 *puVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  uint local_8;
  
  FUN_1008a979();
  uVar9 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
      iVar11 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4);
      *(undefined4 *)(iVar6 + 0x40) = 0;
      if ((*(byte *)(iVar11 + 4) & 0x40) == 0) {
        *(undefined4 *)(iVar6 + 0xc) = 0xffffffff;
        *(undefined4 *)(iVar6 + 0x10) = 0xffffffff;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 8));
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + uVar9 * 4) + 0x24) = 0;
      iVar6 = uVar9 * 4;
      uVar9 = uVar9 + 1;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + iVar6) + 0x28) = 0;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  FUN_1008a979();
  uVar9 = *(uint *)(in_ECX + 0xc);
  uVar5 = uVar9;
  while( true ) {
    do {
      if (uVar5 == 0) {
        uVar5 = *(int *)(in_ECX + 0xc) - uVar9 >> 1;
        local_8 = 0;
        if (uVar5 != 0) {
          iVar6 = uVar9 << 2;
          do {
            puVar8 = (undefined4 *)(iVar6 + *(int *)(in_ECX + 0x18));
            uVar3 = *puVar8;
            *puVar8 = *(undefined4 *)
                       (*(int *)(in_ECX + 0x18) + -4 + (*(int *)(in_ECX + 0xc) - local_8) * 4);
            iVar11 = *(int *)(in_ECX + 0xc) - local_8;
            local_8 = local_8 + 1;
            *(undefined4 *)(*(int *)(in_ECX + 0x18) + -4 + iVar11 * 4) = uVar3;
            iVar6 = iVar6 + 4;
          } while (local_8 < uVar5);
        }
        uVar5 = 0;
        if (uVar9 != 0) {
          do {
            iVar6 = uVar5 * 4;
            uVar5 = uVar5 + 1;
            **(undefined4 **)(*(int *)(in_ECX + 0x18) + iVar6) = 0;
          } while (uVar5 < uVar9);
        }
        iVar6 = FUN_10086eae();
        if (-1 < iVar6) {
          uVar9 = 0;
          if (*(int *)(in_ECX + 4) != 0) {
            do {
              iVar6 = *(int *)(*(int *)(in_ECX + 0x10) + uVar9 * 4);
              if ((*(byte *)(iVar6 + 4) & 0x40) == 0) {
                *(undefined4 *)(iVar6 + 0x10) = 0;
              }
              uVar9 = uVar9 + 1;
            } while (uVar9 < *(uint *)(in_ECX + 4));
          }
          local_8 = 0;
          if (*(int *)(in_ECX + 0xc) != 0) {
            do {
              iVar6 = *(int *)(*(int *)(in_ECX + 0x18) + local_8 * 4);
              if ((((*(ushort *)(iVar6 + 2) & 0xfff0) != 0) && (*(int *)(iVar6 + 0xc) != 0)) &&
                 (iVar11 = *(int *)(*(int *)(in_ECX + 0x10) +
                                   *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                    **(int **)(iVar6 + 0x10) * 4) + 4) * 4),
                 (*(byte *)(iVar11 + 4) & 0x40) == 0)) {
                uVar9 = 0;
                if (*(int *)(iVar6 + 0xc) != 0) {
                  do {
                    iVar4 = *(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(*(int *)(iVar6 + 0x10) + uVar9 * 4) * 4);
                    uVar3 = *(undefined4 *)(iVar11 + 0x10);
                    *(uint *)(iVar4 + 0x10) = uVar9;
                    uVar9 = uVar9 + 1;
                    *(undefined4 *)(iVar4 + 0xc) = uVar3;
                  } while (uVar9 < *(uint *)(iVar6 + 0xc));
                }
                *(int *)(iVar11 + 0x10) = *(int *)(iVar11 + 0x10) + 1;
              }
              local_8 = local_8 + 1;
            } while (local_8 < *(uint *)(in_ECX + 0xc));
          }
          iVar6 = 0;
        }
        return iVar6;
      }
      uVar5 = uVar5 - 1;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
      uVar10 = *puVar1 & 0xfff00000;
    } while (uVar10 == 0);
    uVar2 = *(uint *)(in_ECX + 0xc);
    uVar7 = *puVar1 & 0xf0000000;
    if ((uVar7 < 0x10000000) || (0x40000000 < uVar7)) {
      if (uVar10 == 0x50000000) {
        iVar6 = FUN_10088905(puVar1);
      }
      else {
        iVar6 = FUN_10088dca(puVar1);
      }
    }
    else {
      iVar6 = FUN_10088517(puVar1);
    }
    if (iVar6 < 0) break;
    uVar7 = *(uint *)(in_ECX + 0xc);
    for (uVar10 = uVar2; uVar10 < uVar7; uVar10 = uVar10 + 1) {
      iVar6 = FUN_10088f70(*(undefined4 *)(*(int *)(in_ECX + 0x18) + uVar10 * 4));
      if (iVar6 < 0) {
        return iVar6;
      }
    }
    local_8 = uVar7 - uVar2 >> 1;
    if (local_8 != 0) {
      iVar11 = uVar2 << 2;
      iVar6 = uVar7 << 2;
      do {
        puVar8 = (undefined4 *)(iVar11 + *(int *)(in_ECX + 0x18));
        uVar3 = *puVar8;
        *puVar8 = *(undefined4 *)(iVar6 + -4 + *(int *)(in_ECX + 0x18));
        *(undefined4 *)(iVar6 + -4 + *(int *)(in_ECX + 0x18)) = uVar3;
        iVar11 = iVar11 + 4;
        iVar6 = iVar6 + -4;
        local_8 = local_8 - 1;
      } while (local_8 != 0);
    }
  }
  return iVar6;
}


