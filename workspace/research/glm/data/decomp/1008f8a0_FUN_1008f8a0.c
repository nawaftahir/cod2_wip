// 1008f8a0 size=5621 FUN_1008f8a0

uint * FUN_1008f8a0(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 uVar3;
  uint *puVar4;
  uint *puVar5;
  int in_ECX;
  uint *puVar6;
  int *piVar7;
  int *piVar8;
  uint *puVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  undefined4 *puVar13;
  bool bVar14;
  undefined8 uVar15;
  longlong lVar16;
  uint auStack_c4 [4];
  uint auStack_b4 [4];
  uint auStack_a4 [4];
  undefined1 local_94 [16];
  uint local_84 [4];
  uint local_74 [12];
  undefined4 *local_44;
  uint *local_40;
  int *local_3c;
  uint *local_38;
  uint *local_34;
  uint *local_30;
  uint local_2c;
  uint *local_28;
  uint *local_24;
  uint local_20;
  uint *local_1c;
  uint *local_18;
  uint *local_14;
  uint *local_10;
  uint *local_c;
  uint *local_8;
  
  local_8 = (uint *)0x0;
  FUN_1008a979();
  local_28 = (uint *)0x0;
  local_44 = (undefined4 *)0x0;
  if (*(int *)(in_ECX + 8) != 0) {
    piVar7 = *(int **)(in_ECX + 0x14);
    iVar12 = *(int *)(in_ECX + 8);
    do {
      if ((*(int *)(in_ECX + 0x88) == *(int *)(*piVar7 + 4)) &&
         (puVar6 = *(uint **)(*piVar7 + 0xc), local_28 <= puVar6)) {
        local_28 = (uint *)((int)puVar6 + 1);
      }
      piVar7 = piVar7 + 1;
      iVar12 = iVar12 + -1;
    } while (iVar12 != 0);
  }
  if (((*(byte *)(in_ECX + 0x6c) & 0x20) == 0) &&
     (local_1c = (uint *)0x0, *(int *)(in_ECX + 0xc) != 0)) {
    do {
      local_10 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4);
      if (*local_10 == 0x50000002) {
        iVar12 = FUN_10086199(0x20500002,0xffffffff,0xffffffff);
        if ((iVar12 == -1) ||
           (iVar2 = FUN_10086199(0x20400001,0xffffffff,0xffffffff), puVar6 = local_10, iVar2 == -1))
        goto LAB_10090e7b;
        uVar10 = *(uint *)(*(int *)(in_ECX + 0x18) + iVar12 * 4);
        local_8 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar2 * 4);
        local_20 = uVar10;
        FUN_100853b0();
        FUN_100853b0();
        puVar13 = *(undefined4 **)(uVar10 + 8);
        puVar1 = (undefined4 *)puVar6[2];
        local_14 = (uint *)0x0;
        *puVar13 = *puVar1;
        puVar13[1] = puVar1[1];
        puVar13[2] = puVar1[2];
        puVar13[3] = puVar1[3];
        *(undefined4 *)local_8[4] = *(undefined4 *)local_10[4];
        do {
          uVar10 = local_20;
          iVar12 = (int)local_14 * 4;
          uVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_28,local_14,0);
          *(undefined4 *)(iVar12 + local_8[2]) = uVar3;
          *(undefined4 *)(iVar12 + *(int *)(uVar10 + 0x10)) = *(undefined4 *)(iVar12 + local_8[2]);
          if (*(int *)(iVar12 + *(int *)(uVar10 + 0x10)) == -1) goto LAB_10090e7b;
          local_14 = (uint *)((int)local_14 + 1);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + *(int *)(local_20 + 0x10)) * 4) +
           0x18) = *(undefined4 *)
                    (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_10[4] * 4) + 0x18);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + *(int *)(local_20 + 0x10)) * 4) +
           0x14) = *(undefined4 *)
                    (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_10[4] * 4) + 0x14);
        } while (local_14 < (uint *)0x2);
        puVar6 = *(uint **)(in_ECX + 0xc);
        while (puVar6 = (uint *)((int)puVar6 + -1), local_1c < puVar6) {
          puVar13 = (undefined4 *)(*(int *)(in_ECX + 0x18) + (int)puVar6 * 4);
          *puVar13 = puVar13[-1];
        }
        *(uint *)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4) = local_20;
        *(uint **)(*(int *)(in_ECX + 0x18) + 4 + (int)local_1c * 4) = local_8;
        FUN_1006c418();
        *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + -1;
        local_28 = (uint *)((int)local_28 + 1);
        local_8 = (uint *)0x1;
      }
      local_1c = (uint *)((int)local_1c + 1);
    } while (local_1c < *(uint **)(in_ECX + 0xc));
    if (local_8 != (uint *)0x0) {
      FUN_1008a979();
    }
  }
  if ((*(byte *)(in_ECX + 0x6c) & 1) != 0) {
    local_2c = *(uint *)(in_ECX + 0xc);
    local_20 = 0;
    if (*(uint *)(in_ECX + 0xc) != 0) {
      do {
        iVar12 = *(int *)(*(int *)(in_ECX + 0x18) + local_20 * 4);
        if ((((*(ushort *)(iVar12 + 2) & 0xfff0) != 0) && (*(uint *)(iVar12 + 0xc) != 0)) &&
           ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                               *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                **(int **)(iVar12 + 0x10) * 4) + 4) * 4) + 4) & 0x20
            ) != 0)) {
          uVar10 = 0;
          bVar14 = *(int *)(iVar12 + 4) == 0;
          if (*(int *)(iVar12 + 4) != 0) {
            local_18 = *(uint **)(iVar12 + 8);
            do {
              if (uVar10 != *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_18 * 4) + 0x10))
              break;
              local_18 = local_18 + 1;
              uVar10 = uVar10 + 1;
            } while (uVar10 < *(uint *)(iVar12 + 4));
            bVar14 = uVar10 == *(uint *)(iVar12 + 4);
          }
          if (!bVar14) {
            iVar2 = FUN_10086199(*(uint *)(iVar12 + 0xc) & 0xfffff | 0x10000000,0xffffffff,
                                 0xffffffff);
            if (iVar2 == -1) goto LAB_10090e7b;
            local_18 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar2 * 4);
            FUN_100853b0();
            iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar12 + 0x10) * 4);
            local_14 = (uint *)0x0;
            local_30 = *(uint **)(iVar2 + 0x18);
            local_38 = *(uint **)(iVar2 + 0x14);
            if (*(int *)(iVar12 + 0xc) != 0) {
              do {
                iVar2 = (int)local_14 * 4;
                *(undefined4 *)(iVar2 + local_18[4]) =
                     *(undefined4 *)(iVar2 + *(int *)(iVar12 + 0x10));
                uVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_28,local_14,0);
                *(undefined4 *)(iVar2 + *(int *)(iVar12 + 0x10)) = uVar3;
                *(undefined4 *)(iVar2 + local_18[2]) =
                     *(undefined4 *)(iVar2 + *(int *)(iVar12 + 0x10));
                if (*(int *)(iVar2 + local_18[2]) == -1) goto LAB_10090e7b;
                local_14 = (uint *)((int)local_14 + 1);
                *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + local_18[2]) * 4) +
                          0x18) = local_30;
                *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + local_18[2]) * 4) +
                          0x14) = local_38;
                **(undefined4 **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + local_18[2]) * 4) =
                     **(undefined4 **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + local_18[4]) * 4);
              } while (local_14 < *(uint **)(iVar12 + 0xc));
            }
            local_28 = (uint *)((int)local_28 + 1);
            local_8 = (uint *)0x1;
          }
        }
        local_20 = local_20 + 1;
      } while (local_20 < local_2c);
    }
  }
  if (((*(int *)(in_ECX + 0x4c) != 0) && ((*(byte *)(in_ECX + 0x70) & 0x20) == 0)) &&
     (local_1c = (uint *)0x0, *(int *)(in_ECX + 0xc) != 0)) {
    do {
      local_30 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4);
      if ((*local_30 & 0xf0000000) == 0x60000000) {
        local_18 = (uint *)0x1;
        uVar15 = CONCAT44(&local_20,1);
        while (uVar10 = FUN_100853cf(uVar15), uVar10 != 0) {
          uVar11 = 0;
          if (uVar10 != 0) {
            do {
              if (*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_20 + uVar11 * 4) * 4)
                           + 0x10) != uVar11) break;
              uVar11 = uVar11 + 1;
            } while (uVar11 < uVar10);
          }
          if (uVar11 != uVar10) {
            iVar12 = *(int *)(in_ECX + 0xc);
            local_10 = (uint *)FUN_10089055(local_1c,local_20,uVar10,&local_28);
            if ((int)local_10 < 0) goto LAB_10090541;
            if (*(int *)(in_ECX + 0xc) != iVar12) {
              local_1c = (uint *)((int)local_1c + (*(int *)(in_ECX + 0xc) - iVar12));
              FUN_1008a979();
            }
            local_8 = (uint *)0x1;
          }
          local_18 = (uint *)((int)local_18 + 1);
          uVar15 = CONCAT44(&local_20,local_18);
        }
      }
      local_1c = (uint *)((int)local_1c + 1);
    } while (local_1c < *(uint **)(in_ECX + 0xc));
  }
  if ((*(int *)(in_ECX + 0x4c) != 0) && (local_10 = (uint *)0x0, *(int *)(in_ECX + 0xc) != 0)) {
    do {
      puVar6 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_10 * 4);
      local_1c = puVar6;
      if ((*puVar6 & 0xfff00000) == 0x11000000) {
        if (puVar6[1] == 4) {
          piVar7 = (int *)puVar6[2];
          iVar12 = *(int *)(in_ECX + 0x14);
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(iVar12 + *piVar7 * 4) + 4) * 4) + 5) & 2) == 0) {
            local_18 = (uint *)0x0;
            local_20 = 4;
            do {
              iVar2 = *piVar7;
              piVar7 = piVar7 + 1;
              local_18 = (uint *)((uint)local_18 |
                                 1 << ((byte)*(undefined4 *)(*(int *)(iVar12 + iVar2 * 4) + 0x10) &
                                      0x1f));
              local_20 = local_20 - 1;
            } while (local_20 != 0);
            local_20 = 0;
            if (local_18 == (uint *)0xf) {
              puVar4 = (uint *)puVar6[2];
              local_20 = 4;
              do {
                uVar11 = *puVar4;
                puVar4 = puVar4 + 1;
                uVar10 = local_20 - 1;
                local_20 = uVar10;
                local_74[*(int *)(*(int *)(iVar12 + uVar11 * 4) + 0x10) + 8] = uVar11;
              } while (uVar10 != 0);
              uVar10 = 0;
              do {
                *(undefined4 *)(uVar10 + puVar6[2]) = *(undefined4 *)((int)local_74 + uVar10 + 0x20)
                ;
                uVar10 = uVar10 + 4;
              } while (uVar10 < 0x10);
              goto LAB_1008ff4c;
            }
          }
        }
        puVar4 = (uint *)FUN_10086199(0x10000004,0xffffffff,0xffffffff);
        local_30 = puVar4;
        iVar12 = FUN_10086199(0x11000004,0xffffffff,0xffffffff);
        if ((puVar4 == (uint *)0xffffffff) || (iVar12 == -1)) goto LAB_10090e7b;
        iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + (int)puVar4 * 4);
        local_c = *(uint **)(*(int *)(in_ECX + 0x18) + iVar12 * 4);
        FUN_100853b0();
        FUN_100853b0();
        local_8 = (uint *)0x0;
        do {
          local_14 = local_8;
          if ((uint *)puVar6[1] <= local_8) {
            local_14 = (uint *)((int)puVar6[1] + -1);
          }
          local_14 = (uint *)((int)local_14 * 4);
          iVar12 = (int)local_8 * 4;
          *(undefined4 *)(iVar12 + *(int *)(iVar2 + 8)) =
               *(undefined4 *)((int)local_14 + local_1c[2]);
          uVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_28,local_8,0);
          *(undefined4 *)(iVar12 + *(int *)(iVar2 + 0x10)) = uVar3;
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + *(int *)(iVar2 + 0x10)) * 4) + 0x14
           ) = *(undefined4 *)
                (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)((int)local_14 + local_1c[4]) * 4) +
                0x14);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + *(int *)(iVar2 + 0x10)) * 4) + 0x18
           ) = *(undefined4 *)
                (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)((int)local_14 + local_1c[4]) * 4) +
                0x18);
          if (*(int *)(iVar12 + *(int *)(iVar2 + 0x10)) == -1) goto LAB_10090e7b;
          *(undefined4 *)(iVar12 + local_c[2]) = *(undefined4 *)(iVar12 + *(int *)(iVar2 + 0x10));
          uVar3 = FUN_10086139(*(int *)(in_ECX + 0xa8),
                               *(undefined4 *)
                                (*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0xa8) * 4) + 8
                                ),local_8,0);
          *(undefined4 *)(iVar12 + local_c[4]) = uVar3;
          local_8 = (uint *)((int)local_8 + 1);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + local_c[4]) * 4) + 0x14) =
               *(undefined4 *)
                (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)((int)local_14 + local_1c[4]) * 4) +
                0x14);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + local_c[4]) * 4) + 0x18) =
               *(undefined4 *)
                (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)((int)local_14 + local_1c[4]) * 4) +
                0x18);
          puVar6 = local_1c;
        } while (local_8 < (uint *)0x4);
        piVar7 = (int *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0xa8) * 4) + 8);
        *piVar7 = *piVar7 + 1;
        for (puVar6 = local_30; local_10 < puVar6; puVar6 = (uint *)((int)puVar6 + -1)) {
          puVar13 = (undefined4 *)(*(int *)(in_ECX + 0x18) + (int)puVar6 * 4);
          *puVar13 = puVar13[-1];
        }
        *(int *)(*(int *)(in_ECX + 0x18) + (int)local_10 * 4) = iVar2;
        puVar6 = (uint *)((int)local_10 + 1);
        local_10 = puVar6;
        FUN_1006c418();
        *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + -1;
        local_28 = (uint *)((int)local_28 + 1);
        *(uint **)(*(int *)(in_ECX + 0x18) + (int)puVar6 * 4) = local_c;
        local_8 = (uint *)0x1;
      }
LAB_1008ff4c:
      local_10 = (uint *)((int)local_10 + 1);
    } while (local_10 < *(uint **)(in_ECX + 0xc));
  }
  if ((*(byte *)(in_ECX + 0x6c) & 6) != 0) {
    local_c = (uint *)0x0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar6 = *(uint **)((int)local_c * 4 + *(int *)(in_ECX + 0x18));
        local_30 = puVar6;
        if (((*puVar6 & 0xfff00000) == 0x10000000) &&
           (iVar12 = *(int *)(in_ECX + 0x14),
           (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                              *(int *)(*(int *)(iVar12 + *(int *)puVar6[4] * 4) + 4) * 4) + 4) &
           0x20) == 0)) {
          local_14 = (uint *)0x0;
          if (puVar6[3] != 0) {
            piVar7 = (int *)puVar6[2];
            iVar2 = *piVar7;
            do {
              if (*(int *)(*(int *)(iVar12 + iVar2 * 4) + 0x48) !=
                  *(int *)(*(int *)(iVar12 + *piVar7 * 4) + 0x48)) break;
              local_14 = (uint *)((int)local_14 + 1);
              piVar7 = piVar7 + 1;
            } while (local_14 < (uint *)puVar6[3]);
          }
          if (local_14 != (uint *)puVar6[3]) {
            puVar4 = (uint *)puVar6[1];
            local_1c = (uint *)0x0;
            local_8 = (uint *)0x0;
            if (puVar4 != (uint *)0x0) {
              do {
                puVar9 = (uint *)(puVar6[2] + (int)local_8 * 4);
                uVar10 = *puVar9;
                if (uVar10 != 0xffffffff) {
                  local_2c = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar10 * 4) + 0x48);
                  uVar10 = 0;
                  if (local_8 < puVar4) {
                    local_20 = (int)puVar4 - (int)local_8;
                    local_18 = puVar9;
                    do {
                      if ((*local_18 != 0xffffffff) &&
                         (local_2c ==
                          *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_18 * 4) + 0x48))) {
                        uVar10 = uVar10 + 1;
                      }
                      local_18 = local_18 + 1;
                      local_20 = local_20 - 1;
                    } while (local_20 != 0);
                  }
                  iVar12 = FUN_10086199(uVar10 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
                  if (iVar12 == -1) goto LAB_10090e7b;
                  puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar12 * 4);
                  local_24 = puVar4;
                  FUN_100853b0();
                  local_1c = (uint *)((int)local_1c + 1);
                  local_14 = local_8;
                  if (local_8 < (uint *)puVar6[1]) {
                    local_20 = 0;
                    do {
                      iVar12 = (int)local_14 * 4;
                      if ((*(int *)(iVar12 + puVar6[2]) != -1) &&
                         (local_2c ==
                          *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                            *(int *)(iVar12 + puVar6[2]) * 4) + 0x48))) {
                        *(undefined4 *)(local_20 + puVar4[2]) = *(undefined4 *)(iVar12 + puVar6[2]);
                        *(undefined4 *)(local_20 + local_24[4]) =
                             *(undefined4 *)(iVar12 + puVar6[4]);
                        *(undefined4 *)(iVar12 + puVar6[2]) = 0xffffffff;
                        local_20 = local_20 + 4;
                        puVar4 = local_24;
                      }
                      local_14 = (uint *)((int)local_14 + 1);
                    } while (local_14 < (uint *)puVar6[1]);
                  }
                }
                local_8 = (uint *)((int)local_8 + 1);
                puVar4 = (uint *)puVar6[1];
              } while (local_8 < puVar4);
              if (local_1c != (uint *)0x0) {
                puVar4 = (uint *)(*(int *)(in_ECX + 0x18) +
                                 (*(int *)(in_ECX + 0xc) - (int)local_1c) * 4);
                puVar9 = local_74 + 8;
                for (puVar6 = local_1c; puVar6 != (uint *)0x0; puVar6 = (uint *)((int)puVar6 - 1)) {
                  *puVar9 = *puVar4;
                  puVar4 = puVar4 + 1;
                  puVar9 = puVar9 + 1;
                }
              }
            }
            puVar6 = local_1c;
            puVar4 = (uint *)((*(int *)(in_ECX + 0xc) - (int)local_1c) + -1);
            if (local_c < puVar4) {
              iVar12 = ((int)puVar4 + (int)local_1c) * 4;
              do {
                *(undefined4 *)(*(int *)(in_ECX + 0x18) + -4 + iVar12) =
                     *(undefined4 *)(*(int *)(in_ECX + 0x18) + (int)puVar4 * 4);
                puVar4 = (uint *)((int)puVar4 + -1);
                iVar12 = iVar12 + -4;
              } while (local_c < puVar4);
            }
            local_14 = (uint *)0x0;
            if (local_1c != (uint *)0x0) {
              iVar12 = (int)local_c << 2;
              do {
                puVar4 = local_14 + 2;
                local_14 = (uint *)((int)local_14 + 1);
                *(uint *)(iVar12 + *(int *)(in_ECX + 0x18)) = local_74[(int)puVar4];
                iVar12 = iVar12 + 4;
              } while (local_14 < local_1c);
            }
            FUN_1006c418();
            *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + -1;
            local_c = (uint *)((int)local_c + -1 + (int)puVar6);
            local_8 = (uint *)0x1;
          }
        }
        local_c = (uint *)((int)local_c + 1);
      } while (local_c < *(uint **)(in_ECX + 0xc));
    }
    local_1c = (uint *)0x0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar6 = *(uint **)((int)local_1c * 4 + *(int *)(in_ECX + 0x18));
        local_30 = puVar6;
        if ((*puVar6 & 0xfff00000) == 0x10000000) {
          iVar12 = *(int *)(in_ECX + 0x14);
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(iVar12 + *(int *)puVar6[4] * 4) + 4) * 4) + 4) &
              0x20) == 0) {
            local_24 = (uint *)0x0;
            local_14 = (uint *)0x0;
            local_34 = (uint *)0x0;
            puVar4 = (uint *)0x0;
            if (puVar6[3] != 0) {
              local_3c = (int *)puVar6[2];
              local_c = (uint *)0x0;
              local_18 = (uint *)((int)puVar6[4] - (int)local_3c);
              do {
                if (*(int *)(*(int *)(iVar12 + *(int *)((int)local_18 + (int)local_3c) * 4) + 0x10)
                    == *(int *)(*(int *)(iVar12 + *local_3c * 4) + 0x10)) {
                  local_34 = (uint *)((int)local_34 + 1);
                }
                local_10 = (uint *)0x0;
                if (local_c != (uint *)0x0) {
                  piVar8 = (int *)puVar6[2];
                  piVar7 = (int *)((int)local_c + (int)piVar8);
                  do {
                    if (*(int *)(*(int *)(iVar12 + *piVar8 * 4) + 0x10) ==
                        *(int *)(*(int *)(iVar12 + *piVar7 * 4) + 0x10)) {
                      local_24 = (uint *)((int)local_24 + 1);
                      break;
                    }
                    local_10 = (uint *)((int)local_10 + 1);
                    piVar8 = piVar8 + 1;
                  } while (local_10 < local_14);
                }
                local_14 = (uint *)((int)local_14 + 1);
                puVar4 = (uint *)puVar6[3];
                local_c = local_c + 1;
                local_3c = local_3c + 1;
              } while (local_14 < puVar4);
            }
            if (((local_34 != puVar4) && ((uint *)((int)local_24 + 1) != puVar4)) &&
               (((uint *)0x1 < local_34 || (local_24 != (uint *)0x0)))) {
              local_c = (uint *)0x0;
              if ((uint *)0x1 < local_34) {
                iVar12 = FUN_10086199((uint)local_34 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
                if (iVar12 == -1) goto LAB_10090e7b;
                local_20 = *(uint *)(*(int *)(in_ECX + 0x18) + iVar12 * 4);
                FUN_100853b0();
                local_c = (uint *)0x1;
                local_14 = (uint *)0x0;
                if (puVar6[3] != 0) {
                  local_2c = 0;
                  do {
                    iVar12 = (int)local_14 * 4;
                    if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + puVar6[4]) * 4
                                         ) + 0x10) ==
                        *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + puVar6[2]) * 4
                                         ) + 0x10)) {
                      *(int *)(local_2c + *(int *)(local_20 + 0x10)) = *(int *)(iVar12 + puVar6[4]);
                      *(undefined4 *)(local_2c + *(int *)(local_20 + 8)) =
                           *(undefined4 *)(iVar12 + puVar6[2]);
                      *(undefined4 *)(iVar12 + puVar6[2]) = 0xffffffff;
                      local_2c = local_2c + 4;
                    }
                    local_14 = (uint *)((int)local_14 + 1);
                  } while (local_14 < (uint *)puVar6[3]);
                }
              }
              puVar4 = (uint *)puVar6[1];
              local_8 = (uint *)0x0;
              if (puVar4 != (uint *)0x0) {
                do {
                  puVar9 = (uint *)(puVar6[2] + (int)local_8 * 4);
                  uVar10 = *puVar9;
                  if (uVar10 != 0xffffffff) {
                    local_2c = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar10 * 4) + 0x10);
                    uVar10 = 0;
                    if (local_8 < puVar4) {
                      local_20 = (int)puVar4 - (int)local_8;
                      local_24 = puVar9;
                      do {
                        if ((*local_24 != 0xffffffff) &&
                           (local_2c ==
                            *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_24 * 4) + 0x10))) {
                          uVar10 = uVar10 + 1;
                        }
                        local_24 = local_24 + 1;
                        local_20 = local_20 - 1;
                      } while (local_20 != 0);
                    }
                    iVar12 = FUN_10086199(uVar10 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
                    if (iVar12 == -1) goto LAB_10090e7b;
                    puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar12 * 4);
                    local_24 = puVar4;
                    FUN_100853b0();
                    local_c = (uint *)((int)local_c + 1);
                    local_14 = local_8;
                    if (local_8 < (uint *)puVar6[1]) {
                      local_20 = 0;
                      do {
                        iVar12 = (int)local_14 * 4;
                        if ((*(int *)(iVar12 + puVar6[2]) != -1) &&
                           (local_2c ==
                            *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                              *(int *)(iVar12 + puVar6[2]) * 4) + 0x10))) {
                          *(undefined4 *)(local_20 + puVar4[4]) =
                               *(undefined4 *)(iVar12 + puVar6[4]);
                          *(undefined4 *)(local_20 + local_24[2]) =
                               *(undefined4 *)(iVar12 + puVar6[2]);
                          *(undefined4 *)(iVar12 + puVar6[2]) = 0xffffffff;
                          local_20 = local_20 + 4;
                          puVar4 = local_24;
                        }
                        local_14 = (uint *)((int)local_14 + 1);
                      } while (local_14 < (uint *)puVar6[1]);
                    }
                  }
                  local_8 = (uint *)((int)local_8 + 1);
                  puVar4 = (uint *)puVar6[1];
                } while (local_8 < puVar4);
              }
              if (local_c != (uint *)0x0) {
                puVar4 = (uint *)(*(int *)(in_ECX + 0x18) +
                                 (*(int *)(in_ECX + 0xc) - (int)local_c) * 4);
                puVar9 = local_74 + 8;
                for (puVar6 = local_c; puVar6 != (uint *)0x0; puVar6 = (uint *)((int)puVar6 - 1)) {
                  *puVar9 = *puVar4;
                  puVar4 = puVar4 + 1;
                  puVar9 = puVar9 + 1;
                }
              }
              puVar6 = (uint *)((*(int *)(in_ECX + 0xc) - (int)local_c) + -1);
              if (local_1c < puVar6) {
                iVar12 = ((int)puVar6 + (int)local_c) * 4;
                do {
                  *(undefined4 *)(*(int *)(in_ECX + 0x18) + -4 + iVar12) =
                       *(undefined4 *)(*(int *)(in_ECX + 0x18) + (int)puVar6 * 4);
                  puVar6 = (uint *)((int)puVar6 + -1);
                  iVar12 = iVar12 + -4;
                } while (local_1c < puVar6);
              }
              puVar6 = (uint *)0x0;
              if (local_c != (uint *)0x0) {
                iVar12 = (int)local_1c << 2;
                do {
                  *(uint *)(iVar12 + *(int *)(in_ECX + 0x18)) = local_74[(int)(puVar6 + 2)];
                  puVar6 = (uint *)((int)puVar6 + 1);
                  iVar12 = iVar12 + 4;
                } while (puVar6 < local_c);
              }
              FUN_1006c418();
              *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + -1;
              local_1c = (uint *)((int)local_1c + -1 + (int)local_c);
              local_8 = (uint *)0x1;
            }
          }
        }
        local_1c = (uint *)((int)local_1c + 1);
      } while (local_1c < *(uint **)(in_ECX + 0xc));
    }
  }
  if (local_8 != (uint *)0x0) {
    FUN_1008a979();
  }
  puVar6 = local_28;
  local_44 = operator_new((int)local_28 << 2);
  if (local_44 == (undefined4 *)0x0) {
LAB_10090e7b:
    local_10 = (uint *)0x8007000e;
  }
  else {
    puVar13 = local_44;
    for (uVar10 = (uint)puVar6 & 0x3fffffff; uVar10 != 0; uVar10 = uVar10 - 1) {
      *puVar13 = 0;
      puVar13 = puVar13 + 1;
    }
    uVar10 = 0;
    for (iVar12 = 0; iVar12 != 0; iVar12 = iVar12 + -1) {
      *(undefined1 *)puVar13 = 0;
      puVar13 = (undefined4 *)((int)puVar13 + 1);
    }
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar12 = *(int *)(*(int *)(in_ECX + 0x14) + uVar10 * 4);
        *(undefined4 *)(iVar12 + 0x5c) = 0;
        if (*(int *)(in_ECX + 0x88) == *(int *)(iVar12 + 4)) {
          if ((uint)local_44[*(int *)(iVar12 + 0xc)] <= *(uint *)(iVar12 + 0x10)) {
            local_44[*(int *)(iVar12 + 0xc)] = *(uint *)(iVar12 + 0x10) + 1;
          }
        }
        uVar10 = uVar10 + 1;
      } while (uVar10 < *(uint *)(in_ECX + 8));
    }
    uVar10 = *(uint *)(in_ECX + 0xc);
    while (uVar10 != 0) {
      local_20 = uVar10 - 1;
      puVar6 = *(uint **)(*(int *)(in_ECX + 0x18) + (uVar10 - 1) * 4);
      uVar11 = *puVar6;
      local_14 = puVar6;
      uVar10 = local_20;
      if ((uVar11 & 0xfff00000) != 0) {
        local_10 = (uint *)(uVar11 & 0xfffff);
        local_2c = puVar6[1] / (uint)local_10;
        if (((puVar6[3] != 0) && (0xfffffff < (uVar11 & 0xf0000000))) &&
           ((uVar11 & 0xf0000000) < 0x40000001)) {
          FUN_1008a70d(puVar6[4],local_94,local_10,1);
          uVar10 = 0;
          if (local_2c != 0) {
            do {
              FUN_1008a70d(puVar6[2] + puVar6[3] * uVar10 * 4,local_94,local_10,0);
              uVar10 = uVar10 + 1;
            } while (uVar10 < local_2c);
          }
        }
        local_74[4] = 0;
        local_74[5] = 0;
        local_74[6] = 0;
        local_74[7] = 0;
        if ((*puVar6 & 0xfff00000) == 0x10000000) {
          iVar12 = *(int *)(in_ECX + 0x14);
          local_34 = *(uint **)(iVar12 + *(int *)puVar6[4] * 4);
          uVar10 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + local_34[1] * 4) + 4);
          if (((((uVar10 & 4) == 0) &&
               (((*(byte *)(in_ECX + 0x6c) & 1) == 0 || ((uVar10 & 0x20) == 0)))) &&
              (*(int *)(in_ECX + 0x88) == *(int *)(*(int *)(iVar12 + *(int *)puVar6[2] * 4) + 4)))
             && (local_2c = 0, puVar6[1] != 0)) {
            local_24 = (uint *)((int)puVar6[2] - (int)(local_74 + 4));
            local_30 = (uint *)(*(uint *)(in_ECX + 0xcc) & 4);
            do {
              iVar2 = *(int *)(iVar12 + *(int *)((int)(local_74 + 4) + (int)(local_24 + local_2c)) *
                                        4);
              local_18 = *(uint **)(iVar2 + 0x48);
              local_10 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_18 * 4);
              if (local_30 != (uint *)0x0) {
                local_38 = (uint *)local_34[0x18];
                if (((local_38 != (uint *)0x0) && (*(uint **)(iVar2 + 0x60) != (uint *)0x0)) &&
                   (local_38 != *(uint **)(iVar2 + 0x60))) break;
              }
              if ((local_34[6] != *(uint *)(iVar2 + 0x18)) ||
                 (local_34[5] != *(uint *)(iVar2 + 0x14))) break;
              local_8 = (uint *)0x0;
              if (local_10[3] != 0) {
                local_3c = (int *)local_10[4];
                do {
                  iVar2 = *(int *)(iVar12 + *local_3c * 4);
                  if ((local_20 != *(uint *)(iVar2 + 0x54)) || (local_20 != *(uint *)(iVar2 + 0x58))
                     ) break;
                  local_8 = (uint *)((int)local_8 + 1);
                  local_3c = local_3c + 1;
                } while (local_8 < (uint *)local_10[3]);
              }
              if (local_8 != (uint *)local_10[3]) break;
              local_8 = (uint *)0x0;
              if ((uint *)local_10[3] != (uint *)0x0) {
                piVar7 = (int *)local_10[4];
                puVar4 = local_10;
                do {
                  iVar2 = *(int *)(*(int *)(iVar12 + *piVar7 * 4) + 0x14);
                  puVar9 = puVar4;
                  if ((iVar2 != -1) &&
                     (puVar9 = local_10, local_18 <= *(uint **)(*(int *)(iVar12 + iVar2 * 4) + 0x48)
                     )) break;
                  local_8 = (uint *)((int)local_8 + 1);
                  piVar7 = piVar7 + 1;
                  puVar4 = local_10;
                } while (local_8 < (uint *)puVar9[3]);
              }
              if ((local_8 != (uint *)local_10[3]) || ((*local_10 & 0xfff00000) == 0x20700000))
              break;
              local_74[local_2c + 4] = 1;
              local_2c = local_2c + 1;
              if (puVar6[1] <= local_2c) break;
            } while( true );
          }
        }
        if (((*puVar6 & 0xf0000000) < 0x10000000) || (0x40000000 < (*puVar6 & 0xf0000000))) {
          uVar10 = 0;
          do {
            local_84[uVar10] = uVar10;
            uVar10 = uVar10 + 1;
          } while (uVar10 < 4);
        }
        else {
          local_10 = (uint *)0x0;
          if (puVar6[3] != 0) {
            uVar10 = puVar6[4];
            iVar12 = *(int *)(in_ECX + 0x14);
            do {
              iVar2 = (int)local_10 * 4;
              puVar4 = local_84 + (int)local_10;
              local_10 = (uint *)((int)local_10 + 1);
              *puVar4 = *(uint *)(*(int *)(iVar12 + *(int *)(iVar2 + uVar10) * 4) + 0x10);
            } while (local_10 < (uint *)puVar6[3]);
          }
        }
        local_2c = 0;
        lVar16 = ZEXT48(&local_1c) << 0x20;
        while( true ) {
          local_28 = (uint *)FUN_100853cf(lVar16);
          if (local_28 == (uint *)0x0) break;
          local_74[0] = 0;
          local_74[1] = 0;
          local_74[2] = 0;
          local_c = (uint *)0x0;
          local_3c = (int *)0x0;
          local_74[3] = 0;
          local_10 = (uint *)0x0;
          if (local_28 == (uint *)0x0) {
LAB_100909d4:
            if ((*local_14 & 0xfff00000) != 0x10000000) {
              uVar10 = 0;
              do {
                if ((uint *)local_74[uVar10] == local_28) {
                  local_c = (uint *)0x1;
                  break;
                }
                uVar10 = uVar10 + 1;
              } while (uVar10 < 4);
              if (local_c != (uint *)0x0) goto LAB_10090a3e;
            }
            if ((local_3c !=
                 (int *)local_44[*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_1c * 4) + 0xc)])
               && (uVar10 = 0, local_14[3] != 0)) {
              do {
                if (local_74[uVar10 + 4] == 0) {
                  local_c = (uint *)0x1;
                  break;
                }
                uVar10 = uVar10 + 1;
              } while (uVar10 < local_14[3]);
              if (local_c != (uint *)0x0) goto LAB_10090a3e;
            }
            local_18 = (uint *)0x0;
            if (local_28 != (uint *)0x0) {
              do {
                puVar4 = local_14;
                puVar6 = local_18;
                iVar12 = (int)local_18 * 4;
                if (local_74[(int)(local_18 + 1)] == 0) {
                  puVar13 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + local_1c[(int)local_18] * 4);
                  if (local_74[puVar13[4]] == 1) {
                    local_74[(int)(local_18 + 2)] = local_1c[(int)local_18];
                    puVar13[4] = local_84[(int)puVar6];
                  }
                  else {
                    uVar10 = FUN_10086139(puVar13[1],puVar13[3],local_84[(int)local_18],0);
                    local_74[(int)(puVar6 + 2)] = uVar10;
                    if (uVar10 == 0xffffffff) goto LAB_10090e7b;
                    iVar12 = uVar10 * 4;
                    FUN_10085d21();
                    **(undefined4 **)(iVar12 + *(int *)(in_ECX + 0x14)) = *puVar13;
                    *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar12) + 0x18) = puVar13[6];
                    *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar12) + 0x14) = puVar13[5];
                    local_44[puVar13[3]] = local_44[puVar13[3]] + 1;
                    local_74[puVar13[4]] = local_74[puVar13[4]] - 1;
                  }
                }
                else {
                  uVar10 = local_14[4];
                  uVar11 = *(uint *)(uVar10 + iVar12);
                  iVar2 = *(int *)(in_ECX + 0x14);
                  local_74[(int)(local_18 + 2)] = uVar11;
                  if (*(int *)(*(int *)(iVar2 + uVar11 * 4) + 0x60) == 0) {
                    *(undefined4 *)(*(int *)(iVar2 + *(uint *)(uVar10 + iVar12) * 4) + 0x60) =
                         *(undefined4 *)(*(int *)(iVar2 + *(int *)(iVar12 + puVar4[2]) * 4) + 0x60);
                    *(undefined4 *)
                     (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + puVar4[4]) * 4) + 100) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + puVar4[2]) * 4) +
                          100);
                  }
                }
                local_18 = (uint *)((int)local_18 + 1);
              } while (local_18 < local_28);
            }
            local_38 = (uint *)0x0;
            if (local_28 != (uint *)0x0) {
              do {
                puVar6 = *(uint **)(*(int *)(in_ECX + 0x14) + local_1c[(int)local_38] * 4);
                local_30 = puVar6;
                if (puVar6[0x17] == 0) {
                  local_c = (uint *)0x0;
                  for (puVar4 = local_38; puVar9 = local_c, puVar4 < local_28;
                      puVar4 = (uint *)((int)puVar4 + 1)) {
                    iVar12 = *(int *)(*(int *)(in_ECX + 0x14) + local_1c[(int)puVar4] * 4);
                    if (puVar6[0x12] == *(uint *)(iVar12 + 0x48)) {
                      local_c = (uint *)((int)local_c + 1);
                      auStack_b4[(int)puVar9] = local_1c[(int)puVar4];
                      auStack_a4[(int)puVar9] = local_74[(int)(puVar4 + 2)];
                      *(undefined4 *)(iVar12 + 0x5c) = 1;
                    }
                  }
                  puVar6 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar6[0x12] * 4);
                  uVar10 = *puVar6 & 0xf0000000;
                  if ((uVar10 < 0x10000000) || (0x40000000 < uVar10)) {
                    local_18 = (uint *)0x0;
                    if (puVar6[3] != 0) {
                      do {
                        puVar4 = (uint *)(puVar6[4] + (int)local_18 * 4);
                        puVar9 = (uint *)0x0;
                        do {
                          if (*puVar4 == local_1c[(int)puVar9]) {
                            *puVar4 = local_74[(int)(puVar9 + 2)];
                            break;
                          }
                          puVar9 = (uint *)((int)puVar9 + 1);
                        } while (puVar9 < local_28);
                        local_18 = (uint *)((int)local_18 + 1);
                      } while (local_18 < (uint *)puVar6[3]);
                    }
                  }
                  else {
                    puVar4 = (uint *)0x0;
                    local_34 = (uint *)(puVar6[1] / (*puVar6 & 0xfffff));
                    if (local_c != (uint *)0x0) {
                      puVar9 = (uint *)puVar6[3];
                      do {
                        local_18 = (uint *)0x0;
                        if (puVar9 != (uint *)0x0) {
                          puVar5 = (uint *)puVar6[4];
                          do {
                            if (*puVar5 == auStack_b4[(int)puVar4]) {
                              auStack_c4[(int)puVar4] = (uint)local_18;
                              break;
                            }
                            local_18 = (uint *)((int)local_18 + 1);
                            puVar9 = (uint *)puVar6[3];
                            puVar5 = puVar5 + 1;
                          } while (local_18 < puVar9);
                        }
                        puVar4 = (uint *)((int)puVar4 + 1);
                      } while (puVar4 < local_c);
                    }
                    iVar12 = FUN_10085814();
                    if (iVar12 == 0) {
                      iVar12 = 0;
                    }
                    else {
                      iVar12 = FUN_10085379();
                    }
                    if (iVar12 == 0) goto LAB_10090e7b;
                    local_10 = (uint *)FUN_1008585f((*puVar6 ^ (uint)local_c) & 0xfffff ^ *puVar6,
                                                    (int)local_34 * (int)local_c,local_c,0);
                    if (((int)local_10 < 0) ||
                       (local_10 = (uint *)FUN_100853b0(), (int)local_10 < 0)) {
                      FUN_1006c418();
                      goto LAB_10090541;
                    }
                    local_10 = (uint *)0x0;
                    if (local_c != (uint *)0x0) {
                      do {
                        local_18 = (uint *)0x0;
                        *(uint *)((int)local_10 * 4 + *(int *)(iVar12 + 0x10)) =
                             auStack_a4[(int)local_10];
                        if (local_34 != (uint *)0x0) {
                          local_40 = (uint *)auStack_c4[(int)local_10];
                          local_24 = (uint *)((int)local_10 * 4);
                          do {
                            iVar2 = puVar6[3] * (int)local_18;
                            local_18 = (uint *)((int)local_18 + 1);
                            *(undefined4 *)((int)local_24 + *(int *)(iVar12 + 8)) =
                                 *(undefined4 *)(puVar6[2] + (int)(iVar2 + (int)local_40) * 4);
                            local_24 = local_24 + (int)local_c;
                          } while (local_18 < local_34);
                        }
                        local_10 = (uint *)((int)local_10 + 1);
                      } while (local_10 < local_c);
                    }
                    if (*(int *)(*(int *)(in_ECX + 0x18) + local_30[0x12] * 4) != 0) {
                      FUN_1006c418();
                    }
                    *(int *)(*(int *)(in_ECX + 0x18) + local_30[0x12] * 4) = iVar12;
                  }
                }
                local_38 = (uint *)((int)local_38 + 1);
              } while (local_38 < local_28);
            }
            puVar6 = (uint *)0x0;
            if (local_28 != (uint *)0x0) {
              do {
                local_1c[(int)puVar6] = local_74[(int)(puVar6 + 2)];
                puVar4 = local_1c + (int)puVar6;
                puVar6 = (uint *)((int)puVar6 + 1);
                *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *puVar4 * 4) + 0x5c) = 1;
              } while (puVar6 < local_28);
            }
          }
          else {
            do {
              puVar6 = local_10;
              local_30 = local_1c + (int)local_10;
              iVar12 = *(int *)(*(int *)(in_ECX + 0x14) + local_1c[(int)local_10] * 4);
              if ((*(int *)(in_ECX + 0x88) != *(int *)(iVar12 + 4)) ||
                 (iVar2 = *(int *)(iVar12 + 0x48), iVar2 == -1)) break;
              if (*(int *)(iVar12 + 0x5c) != 0) {
                local_c = (uint *)0x1;
              }
              local_38 = *(uint **)(iVar12 + 0x10);
              local_40 = local_74 + (int)*(uint **)(iVar12 + 0x10);
              if (local_74[(int)*(uint **)(iVar12 + 0x10)] == 0) {
                local_3c = (int *)((int)local_3c + 1);
              }
              local_74[*(int *)(iVar12 + 0x10)] = local_74[*(int *)(iVar12 + 0x10)] + 1;
              puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar2 * 4);
              uVar10 = *puVar4;
              uVar11 = uVar10 & 0xfff00000;
              if (((uVar11 == 0x20700000) || (uVar11 == 0x20800000)) || (uVar11 == 0x20900000)) {
LAB_100909a9:
                local_c = (uint *)0x1;
              }
              else if (((uVar10 & 0xf0000000) < 0x10000000) || (0x40000000 < (uVar10 & 0xf0000000)))
              {
                if (((1 < puVar4[3]) && (local_10 != local_38)) || (1 < *local_40))
                goto LAB_100909a9;
              }
              else {
                if ((*(int *)(iVar12 + 0x5c) != 0) &&
                   (local_40 = (uint *)local_84[(int)puVar6], local_40 != local_38)) {
                  local_34 = (uint *)0xffffffff;
                  local_18 = (uint *)0xffffffff;
                  local_8 = (uint *)0x0;
                  if (puVar4[3] != 0) {
                    local_24 = (uint *)puVar4[4];
                    do {
                      if (*local_30 == *local_24) {
                        local_34 = local_8;
                      }
                      if (local_40 ==
                          *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) + *local_24 * 4) + 0x10)) {
                        local_18 = local_8;
                      }
                      local_8 = (uint *)((int)local_8 + 1);
                      local_24 = local_24 + 1;
                    } while (local_8 < (uint *)puVar4[3]);
                    if ((local_34 != (uint *)0xffffffff) && (local_18 != (uint *)0xffffffff)) {
                      local_38 = (uint *)(puVar4[1] / (uVar10 & 0xfffff));
                      local_8 = (uint *)0x0;
                      if (local_38 != (uint *)0x0) {
                        local_24 = (uint *)(puVar4[2] + (int)local_34 * 4);
                        puVar6 = (uint *)(puVar4[2] + (int)local_18 * 4);
                        do {
                          if (*local_24 != *puVar6) break;
                          local_8 = (uint *)((int)local_8 + 1);
                          local_24 = local_24 + puVar4[3];
                          puVar6 = puVar6 + puVar4[3];
                          local_40 = puVar6;
                        } while (local_8 < local_38);
                      }
                      if (local_8 == local_38) {
                        *local_30 = *(uint *)(puVar4[4] + (int)local_18 * 4);
                      }
                    }
                  }
                }
                iVar2 = FUN_1008543f();
                if ((iVar2 != 0) && (1 < local_74[*(int *)(iVar12 + 0x10)])) {
                  local_c = (uint *)0x1;
                }
              }
              local_10 = (uint *)((int)local_10 + 1);
            } while (local_10 < local_28);
            if (local_10 < local_28) {
              local_c = (uint *)0x1;
            }
            if (local_c == (uint *)0x0) goto LAB_100909d4;
LAB_10090a3e:
            local_74[4] = 0;
            local_74[5] = 0;
            local_74[6] = 0;
            local_74[7] = 0;
          }
          local_2c = local_2c + 1;
          lVar16 = CONCAT44(&local_1c,local_2c);
        }
        uVar10 = local_20;
        if ((*local_14 & 0xfff00000) == 0x10000000) {
          uVar11 = 0;
          local_2c = 0;
          if (local_14[3] != 0) {
            do {
              if (local_74[local_2c + 4] == 0) {
                *(undefined4 *)(local_14[4] + uVar11 * 4) =
                     *(undefined4 *)(local_14[4] + local_2c * 4);
                *(undefined4 *)(local_14[2] + uVar11 * 4) =
                     *(undefined4 *)(local_14[2] + local_2c * 4);
                uVar11 = uVar11 + 1;
              }
              else {
                iVar12 = uVar11 * 4;
                local_40 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + local_14[4]) * 4);
                if (local_40[0x18] == 0) {
                  local_40[0x18] =
                       *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(iVar12 + local_14[2]) * 4) + 0x60);
                  *(undefined4 *)
                   (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + local_14[4]) * 4) + 100) =
                       *(undefined4 *)
                        (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar12 + local_14[2]) * 4) +
                        100);
                }
              }
              local_2c = local_2c + 1;
            } while (local_2c < local_14[3]);
          }
          *local_14 = -(uint)(uVar11 != 0) & (uVar11 & 0xfffff | 0x10000000);
          local_14[1] = uVar11;
          local_14[3] = uVar11;
        }
      }
    }
    local_10 = (uint *)0x0;
  }
LAB_10090541:
  _free(local_44);
  return local_10;
}


