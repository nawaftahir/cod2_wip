// 100bb1c6 size=774 FUN_100bb1c6

int FUN_100bb1c6(void)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int in_ECX;
  int *piVar6;
  uint uVar7;
  uint uVar8;
  int *piVar9;
  int local_4c [4];
  int local_3c [4];
  int local_2c;
  int local_28;
  uint local_24;
  undefined4 local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  int local_c;
  uint local_8;
  
  puVar1 = *(uint **)(in_ECX + 0x100);
  uVar8 = *puVar1 & 0xfffff;
  if (((uVar8 != 0) && (puVar1[1] != 0)) && (puVar1[3] != 0)) {
    local_24 = puVar1[1] / uVar8;
    local_8 = 0;
    if (local_24 != 0) {
      iVar3 = *(int *)(in_ECX + 0x14);
      piVar6 = (int *)puVar1[2];
      local_1c = local_24;
      local_10 = uVar8;
      do {
        iVar5 = *(int *)(*(int *)(iVar3 + *piVar6 * 4) + 8);
        if ((iVar5 != -1) &&
           (uVar8 = local_10,
           (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                              *(int *)(*(int *)(iVar3 + iVar5 * 4) + 4) * 4) + 4) & 4) == 0)) {
          piVar9 = local_4c + local_8;
          local_8 = local_8 + 1;
          *piVar9 = iVar5;
        }
        piVar6 = piVar6 + uVar8;
        local_1c = local_1c - 1;
      } while (local_1c != 0);
      uVar7 = 0;
      if (local_8 != 0) {
        local_1c = 0;
        if (local_8 != 0) {
          do {
            uVar2 = uVar7;
            if (local_8 == 1) {
              uVar2 = 3;
            }
            iVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x8c),0,uVar2,0);
            local_3c[uVar7] = iVar3;
            if (iVar3 == -1) {
              return -0x7ff8fff2;
            }
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
            *(undefined4 *)(iVar3 + 0x14) =
                 *(undefined4 *)
                  (*(int *)(*(int *)(in_ECX + 0x14) +
                           **(int **)(*(int *)(in_ECX + 0x100) + 0x10) * 4) + 0x14);
            uVar7 = uVar7 + 1;
            *(undefined4 *)(iVar3 + 0x18) =
                 *(undefined4 *)
                  (*(int *)(*(int *)(in_ECX + 0x14) +
                           **(int **)(*(int *)(in_ECX + 0x100) + 0x10) * 4) + 0x18);
          } while (uVar7 < local_8);
        }
        local_8 = 0;
        local_1c = 0;
        local_14 = 0;
        do {
          iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                   *(int *)(local_14 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) * 4)
                          + 8);
          if ((iVar3 != -1) &&
             ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 4) * 4) +
                        4) & 4) == 0)) {
            local_18 = 0;
            if (uVar8 != 0) {
              local_c = local_14;
              do {
                local_20 = *(undefined4 *)
                            (*(int *)(in_ECX + 0x14) +
                            *(int *)(local_c + *(int *)(*(int *)(in_ECX + 0x100) + 8)) * 4);
                iVar3 = FUN_10086139(0,0,0,0);
                if (iVar3 == -1) {
                  return -0x7ff8fff2;
                }
                iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
                local_2c = iVar3;
                iVar4 = FUN_10085c65();
                if (iVar4 < 0) {
                  return iVar4;
                }
                if (*(int *)(iVar5 + 0x38) != -1) {
                  iVar3 = FUN_10086139(0,0,0,0);
                  if (iVar3 == -1) {
                    return -0x7ff8fff2;
                  }
                  local_28 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
                  FUN_10085c65();
                  iVar4 = local_3c[local_8];
                  *(int *)(iVar5 + 0x38) = iVar3;
                  *(int *)(local_28 + 8) = iVar4;
                  iVar3 = local_2c;
                }
                local_18 = local_18 + 1;
                iVar4 = local_c + 4;
                *(int *)(iVar5 + 8) = local_3c[local_8];
                *(int *)(local_c + *(int *)(*(int *)(in_ECX + 0x100) + 8)) = iVar3;
                uVar8 = local_10;
                local_c = iVar4;
              } while (local_18 < local_10);
            }
            local_8 = local_8 + 1;
          }
          local_1c = local_1c + 1;
          local_14 = local_14 + uVar8 * 4;
          if (local_24 <= local_1c) {
            iVar3 = FUN_10085814();
            if (iVar3 == 0) {
              local_14 = 0;
            }
            else {
              local_14 = FUN_10085379();
            }
            iVar3 = local_14;
            if (local_14 == 0) {
              return -0x7ff8fff2;
            }
            iVar5 = FUN_1008585f(local_8 & 0xfffff | 0x10000000,local_8,local_8,0);
            if ((-1 < iVar5) && (iVar5 = FUN_100853b0(), -1 < iVar5)) {
              piVar6 = local_3c;
              piVar9 = *(int **)(iVar3 + 0x10);
              for (uVar8 = local_8 & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
                *piVar9 = *piVar6;
                piVar6 = piVar6 + 1;
                piVar9 = piVar9 + 1;
              }
              for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
                *(char *)piVar9 = (char)*piVar6;
                piVar6 = (int *)((int)piVar6 + 1);
                piVar9 = (int *)((int)piVar9 + 1);
              }
              piVar6 = local_4c;
              piVar9 = *(int **)(local_14 + 8);
              for (uVar8 = local_8 & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
                *piVar9 = *piVar6;
                piVar6 = piVar6 + 1;
                piVar9 = piVar9 + 1;
              }
              for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
                *(char *)piVar9 = (char)*piVar6;
                piVar6 = (int *)((int)piVar6 + 1);
                piVar9 = (int *)((int)piVar9 + 1);
              }
              iVar5 = FUN_10086026();
              if (-1 < iVar5) {
                return 0;
              }
            }
            FUN_1006c418();
            return iVar5;
          }
        } while( true );
      }
    }
  }
  return 1;
}


