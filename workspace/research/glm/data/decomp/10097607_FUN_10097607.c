// 10097607 size=3748 FUN_10097607

uint FUN_10097607(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  uint *puVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  int in_ECX;
  int *piVar8;
  uint *puVar9;
  uint uVar10;
  int iVar11;
  uint *puVar12;
  undefined4 *puVar13;
  word *pwVar14;
  IMAGE_DOS_HEADER *pIVar15;
  uint *puVar16;
  undefined4 *puVar17;
  char *pcVar18;
  uint *puVar19;
  undefined1 local_bc [16];
  uint local_ac [4];
  uint local_9c [4];
  uint local_8c [4];
  int local_7c;
  uint local_78 [4];
  int local_68;
  uint *local_64;
  uint local_60;
  uint local_5c;
  uint local_58;
  undefined4 *local_54;
  uint local_50 [4];
  uint *local_40;
  uint *local_3c;
  uint *local_38;
  uint *local_34;
  uint *local_30;
  uint *local_2c;
  uint local_28;
  uint *local_24;
  uint *local_20;
  uint *local_1c;
  uint *local_18;
  uint *local_14;
  IMAGE_DOS_HEADER *local_10;
  uint *local_c;
  uint *local_8;
  
  uVar5 = 0;
  if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) {
    return 1;
  }
  local_68 = 0;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar11 = uVar5 * 4;
      uVar5 = uVar5 + 1;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar11) + 0x10) = 0;
    } while (uVar5 < *(uint *)(in_ECX + 4));
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      iVar7 = *(int *)(iVar11 + 4);
      if (*(int *)(in_ECX + 0x74) != iVar7) {
        iVar7 = *(int *)(*(int *)(in_ECX + 0x10) + iVar7 * 4);
        if ((((*(uint *)(iVar7 + 4) & 2) != 0) && ((*(uint *)(iVar7 + 4) & 0x400) == 0)) &&
           (uVar6 = *(int *)(iVar11 + 0xc) + 1, *(uint *)(iVar7 + 0x10) < uVar6)) {
          *(uint *)(iVar7 + 0x10) = uVar6;
        }
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 4) != 0) {
    piVar8 = *(int **)(in_ECX + 0x10);
    iVar11 = *(int *)(in_ECX + 4);
    do {
      uVar5 = uVar5 + *(int *)(*piVar8 + 0x10);
      piVar8 = piVar8 + 1;
      iVar11 = iVar11 + -1;
    } while (iVar11 != 0);
  }
  local_54 = operator_new(uVar5 << 2);
  if (local_54 == (undefined4 *)0x0) {
LAB_1009849c:
    uVar5 = 0x8007000e;
  }
  else {
    puVar13 = local_54;
    for (uVar5 = uVar5 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar13 = 0;
      puVar13 = puVar13 + 1;
    }
    for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
      *(undefined1 *)puVar13 = 0;
      puVar13 = (undefined4 *)((int)puVar13 + 1);
    }
    uVar5 = 0;
    iVar11 = 0;
    if (*(int *)(in_ECX + 4) != 0) {
      iVar7 = *(int *)(in_ECX + 0x10);
      do {
        iVar7 = *(int *)(iVar7 + uVar5 * 4);
        *(uint *)(iVar7 + 0x1c) = -(uint)(*(int *)(iVar7 + 0x10) != 0) & (uint)(local_54 + iVar11);
        iVar7 = *(int *)(in_ECX + 0x10);
        iVar11 = iVar11 + *(int *)(*(int *)(iVar7 + uVar5 * 4) + 0x10);
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 4));
    }
    uVar5 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
        if ((*(int *)(in_ECX + 0x74) != *(int *)(iVar11 + 4)) &&
           (iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar11 + 4) * 4) + 0x1c),
           iVar7 != 0)) {
          puVar9 = (uint *)(iVar7 + *(int *)(iVar11 + 0xc) * 4);
          uVar6 = *(int *)(iVar11 + 0x10) + 1;
          if (*puVar9 < uVar6) {
            *puVar9 = uVar6;
          }
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 8));
    }
    local_1c = (uint *)0x0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar9 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4);
        if ((((*puVar9 & 0xf0000000) == 0x60000000) || ((*puVar9 & 0xfff00000) == 0x11000000)) &&
           (uVar5 = 0, puVar9[1] != 0)) {
          do {
            iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar9[2] + uVar5 * 4) * 4);
            iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar11 + 4) * 4) + 0x1c);
            if (iVar7 != 0) {
              *(undefined4 *)(iVar7 + *(int *)(iVar11 + 0xc) * 4) = 4;
            }
            uVar5 = uVar5 + 1;
          } while (uVar5 < puVar9[1]);
        }
        local_1c = (uint *)((int)local_1c + 1);
      } while (local_1c < *(uint **)(in_ECX + 0xc));
    }
    if ((*(uint *)(in_ECX + 0x6c) & 6) == 0) {
      FUN_1008a979();
      local_c = (uint *)0x0;
      if (*(int *)(in_ECX + 0xc) != 0) {
        do {
          iVar11 = *(int *)(in_ECX + 0x18);
          local_20 = *(uint **)(iVar11 + (int)local_c * 4);
          if (*local_20 == 0x20400001) {
            iVar7 = *(int *)(in_ECX + 0x14);
            local_2c = *(uint **)(iVar7 + ((int *)local_20[2])[1] * 4);
            iVar2 = *(int *)(iVar7 + *(int *)local_20[2] * 4);
            if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4) + 4) & 2) !=
                 0) && ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_2c[1] * 4) + 4) & 2) !=
                        0)) {
              local_1c = *(uint **)(iVar11 + *(int *)(iVar2 + 0x48) * 4);
              local_14 = *(uint **)(iVar11 + local_2c[0x12] * 4);
              if (((*local_1c == 0x20500001) || ((*local_1c & 0xfff00000) == 0x50000000)) &&
                 ((*local_14 == 0x20500001 || ((*local_14 & 0xfff00000) == 0x50000000)))) {
                local_2c = (uint *)(local_14[1] >> 1);
                uVar5 = local_1c[1] >> 1;
                local_18 = (uint *)((int)local_2c + uVar5);
                if (((uint *)((~*(uint *)(in_ECX + 0x6c) & 0x20 | 0x40) >> 5) <= local_18) &&
                   ((((local_18 < (uint *)0x5 &&
                      (iVar11 = *(int *)(iVar7 + *(int *)local_1c[4] * 4),
                      local_c == *(uint **)(iVar11 + 0x54))) &&
                     (local_c == *(uint **)(iVar11 + 0x58))) &&
                    ((iVar11 = *(int *)(iVar7 + *(int *)local_14[4] * 4),
                     local_c == *(uint **)(iVar11 + 0x54) && (local_c == *(uint **)(iVar11 + 0x58)))
                    )))) {
                  local_30 = (uint *)local_1c[2];
                  puVar9 = local_30;
                  puVar12 = local_78;
                  for (uVar6 = uVar5 & 0x3fffffff; puVar19 = local_14, uVar6 != 0; uVar6 = uVar6 - 1
                      ) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  local_40 = (uint *)puVar19[2];
                  local_24 = (uint *)((int)local_2c << 2);
                  puVar9 = local_40;
                  puVar12 = local_78 + uVar5;
                  for (uVar6 = (uint)local_2c & 0x3fffffff; puVar19 = local_30, uVar6 != 0;
                      uVar6 = uVar6 - 1) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  puVar9 = puVar19 + uVar5;
                  puVar12 = local_9c;
                  for (uVar6 = uVar5 & 0x3fffffff; puVar19 = local_40, uVar6 != 0; uVar6 = uVar6 - 1
                      ) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; puVar16 = local_24, iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  puVar9 = (uint *)((int)puVar19 + (int)local_24);
                  puVar12 = local_9c + uVar5;
                  local_38 = (uint *)(uVar5 * 4);
                  for (uVar6 = (uint)local_24 >> 2; puVar4 = local_18, puVar19 = local_20,
                      uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (uVar5 = (uint)puVar16 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  iVar11 = FUN_10091633(local_78,puVar4,0,0,puVar19,0,0xffffffff);
                  if ((iVar11 == 0) ||
                     (iVar11 = FUN_10091633(local_9c,local_18,0,0,local_20,0,0xffffffff),
                     iVar11 == 0)) {
                    puVar12 = local_38;
                    puVar9 = (uint *)local_1c[2];
                    puVar19 = puVar9;
                    puVar16 = local_50;
                    for (uVar5 = (uint)local_38 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *puVar16 = *puVar19;
                      puVar19 = puVar19 + 1;
                      puVar16 = puVar16 + 1;
                    }
                    for (uVar5 = (uint)puVar12 & 3; puVar12 = local_24, uVar5 != 0;
                        uVar5 = uVar5 - 1) {
                      *(char *)puVar16 = (char)*puVar19;
                      puVar19 = (uint *)((int)puVar19 + 1);
                      puVar16 = (uint *)((int)puVar16 + 1);
                    }
                    local_40 = (uint *)local_14[2];
                    puVar13 = (undefined4 *)((int)local_40 + (int)local_24);
                    puVar17 = (undefined4 *)((int)local_50 + (int)local_38);
                    for (uVar5 = (uint)local_24 >> 2; puVar19 = local_38, uVar5 != 0;
                        uVar5 = uVar5 - 1) {
                      *puVar17 = *puVar13;
                      puVar13 = puVar13 + 1;
                      puVar17 = puVar17 + 1;
                    }
                    for (uVar5 = (uint)puVar12 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *(undefined1 *)puVar17 = *(undefined1 *)puVar13;
                      puVar13 = (undefined4 *)((int)puVar13 + 1);
                      puVar17 = (undefined4 *)((int)puVar17 + 1);
                    }
                    puVar9 = (uint *)((int)puVar9 + (int)puVar19);
                    puVar12 = local_8c;
                    for (uVar5 = (uint)puVar19 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *puVar12 = *puVar9;
                      puVar9 = puVar9 + 1;
                      puVar12 = puVar12 + 1;
                    }
                    for (uVar5 = (uint)puVar19 & 3; puVar16 = local_24, uVar5 != 0;
                        uVar5 = uVar5 - 1) {
                      *(char *)puVar12 = (char)*puVar9;
                      puVar9 = (uint *)((int)puVar9 + 1);
                      puVar12 = (uint *)((int)puVar12 + 1);
                    }
                    puVar9 = local_40;
                    puVar12 = (uint *)((int)local_8c + (int)puVar19);
                    for (uVar5 = (uint)local_24 >> 2; puVar4 = local_18, puVar19 = local_20,
                        uVar5 != 0; uVar5 = uVar5 - 1) {
                      *puVar12 = *puVar9;
                      puVar9 = puVar9 + 1;
                      puVar12 = puVar12 + 1;
                    }
                    for (uVar5 = (uint)puVar16 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *(char *)puVar12 = (char)*puVar9;
                      puVar9 = (uint *)((int)puVar9 + 1);
                      puVar12 = (uint *)((int)puVar12 + 1);
                    }
                    iVar11 = FUN_10091633(local_50,puVar4,0,0,puVar19,0,0xffffffff);
                    if ((iVar11 == 0) ||
                       (iVar11 = FUN_10091633(local_8c,local_18,0,0,local_20,0,0xffffffff),
                       iVar11 == 0)) goto LAB_10097b22;
                    local_38 = (uint *)0x1;
                  }
                  else {
                    local_38 = (uint *)0x0;
                  }
                  iVar11 = FUN_10085814(0x74);
                  if (iVar11 == 0) {
                    local_34 = (uint *)0x0;
                  }
                  else {
                    local_34 = (uint *)FUN_10085379();
                  }
                  puVar9 = local_34;
                  if (local_34 == (uint *)0x0) goto LAB_1009849c;
                  uVar5 = FUN_1008585f((uint)local_18 & 0xfffff | 0x50000000,(int)local_18 * 2,1,0);
                  if (((int)uVar5 < 0) || (uVar5 = FUN_100853b0(local_20), (int)uVar5 < 0))
                  goto LAB_10097be6;
                  *(undefined4 *)puVar9[4] = *(undefined4 *)local_20[4];
                  puVar9 = local_78;
                  if (local_38 != (uint *)0x0) {
                    puVar9 = local_50;
                  }
                  puVar12 = (uint *)local_34[2];
                  for (uVar5 = (uint)local_18 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  puVar9 = local_9c;
                  if (local_38 != (uint *)0x0) {
                    puVar9 = local_8c;
                  }
                  puVar12 = (uint *)(local_34[2] + (int)local_18 * 4);
                  for (uVar5 = (uint)local_18 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_c * 4) = local_34;
                  FUN_1006c418(1);
                  *local_1c = 0;
                  *local_14 = 0;
                }
              }
            }
          }
LAB_10097b22:
          local_c = (uint *)((int)local_c + 1);
        } while (local_c < *(uint **)(in_ECX + 0xc));
      }
    }
    FUN_1008a979();
    local_18 = (uint *)0x0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar9 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_18 * 4);
        uVar5 = *puVar9 & 0xf0000000;
        local_2c = puVar9;
        if ((((0xfffffff < uVar5) && (uVar5 < 0x40000001)) &&
            (((*puVar9 & 0xfff00000) == 0x10000000 || ((*(byte *)(in_ECX + 0x6c) & 6) == 0)))) &&
           (iVar11 = FUN_10085604(), iVar11 == 0)) {
          iVar11 = *(int *)(in_ECX + 0x14);
          local_5c = *(uint *)(*(int *)(iVar11 + *(int *)puVar9[4] * 4) + 4);
          local_24 = *(uint **)(*(int *)(*(int *)(in_ECX + 0x10) + local_5c * 4) + 0x1c);
          if (local_24 != (uint *)0x0) {
            local_38 = *(uint **)(in_ECX + 0xc);
            local_34 = (uint *)0x0;
            if (puVar9[1] != 0) {
              local_1c = (uint *)puVar9[2];
              local_30 = (uint *)puVar9[1];
              do {
                uVar5 = *local_1c;
                while (uVar5 != 0xffffffff) {
                  iVar7 = *(int *)(iVar11 + uVar5 * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4) &
                       2) != 0) &&
                     (puVar12 = (uint *)(*(int *)(iVar7 + 0x48) + 1), local_34 < puVar12)) {
                    local_34 = puVar12;
                  }
                  uVar5 = *(uint *)(iVar7 + 8);
                }
                local_1c = local_1c + 1;
                local_30 = (uint *)((int)local_30 + -1);
              } while (local_30 != (uint *)0x0);
            }
            local_40 = local_38;
            if (puVar9[3] != 0) {
              local_30 = (uint *)puVar9[3];
              piVar8 = (int *)puVar9[4];
              do {
                iVar7 = *(int *)(iVar11 + *piVar8 * 4);
                if (*(uint **)(iVar7 + 0x54) < local_40) {
                  local_40 = *(uint **)(iVar7 + 0x54);
                }
                while (*(int *)(iVar7 + 8) != -1) {
                  iVar7 = *(int *)(iVar11 + *(int *)(iVar7 + 8) * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4) &
                       2) != 0) &&
                     (puVar9 = (uint *)(*(int *)(iVar7 + 0x48) + 1), local_34 < puVar9)) {
                    local_34 = puVar9;
                  }
                }
                piVar8 = piVar8 + 1;
                local_30 = (uint *)((int)local_30 + -1);
              } while (local_30 != (uint *)0x0);
            }
            local_20 = local_34;
LAB_10098177:
            if (local_20 < local_40) {
              if (local_18 == local_20) goto LAB_10098171;
              local_64 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_20 * 4);
              local_8 = local_64;
              local_c = local_2c;
              if (local_18 < local_20) {
                local_8 = local_2c;
                local_c = local_64;
              }
              local_58 = *local_c;
              local_10 = (IMAGE_DOS_HEADER *)(local_58 & 0xfff00000);
              if (local_10 != (IMAGE_DOS_HEADER *)(*local_8 & 0xfff00000)) goto LAB_10098171;
              iVar11 = *(int *)(in_ECX + 0x14);
              iVar7 = *(int *)(iVar11 + *(int *)local_8[4] * 4);
              iVar2 = *(int *)(iVar11 + *(int *)local_c[4] * 4);
              local_3c = *(uint **)(iVar2 + 4);
              if ((((local_3c != *(uint **)(iVar7 + 4)) ||
                   (*(int *)(iVar2 + 8) != *(int *)(iVar7 + 8))) ||
                  (*(int *)(iVar2 + 0x14) != *(int *)(iVar7 + 0x14))) ||
                 (*(int *)(iVar2 + 0x18) != *(int *)(iVar7 + 0x18))) goto LAB_10098171;
              local_7c = local_8[1] + local_c[1];
              local_14 = (uint *)local_c[3];
              uVar5 = local_8[3];
              local_28 = (int)local_14 + uVar5;
              local_60 = uVar5;
              if (4 < local_28) goto LAB_10098171;
              local_1c = *(uint **)(iVar2 + 0xc);
              local_30 = *(uint **)(iVar7 + 0xc);
              if ((local_1c != local_30) &&
                 ((((*(byte *)(in_ECX + 0x6c) & 6) != 0 ||
                   ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + (int)local_3c * 4) + 4) & 0x20) !=
                    0)) || (4 < (uint)(*(int *)((int)local_24 + (int)local_30 * 4) +
                                      *(int *)((int)local_24 + (int)local_1c * 4))))))
              goto LAB_10098171;
              local_3c = local_18;
              if (local_20 <= local_18) {
                local_3c = local_20;
              }
              puVar12 = local_3c;
              puVar9 = local_38;
              if ((local_10 != &IMAGE_DOS_HEADER_10000000) &&
                 (local_10 != (IMAGE_DOS_HEADER *)0x10100000)) {
                uVar6 = local_58 & 0xf0000000;
                if (uVar6 == 0x10000000) {
                  puVar9 = (uint *)local_8[2];
                  puVar19 = local_50;
                  for (uVar6 = uVar5 & 0x3fffffff; puVar16 = local_c, uVar6 != 0; uVar6 = uVar6 - 1)
                  {
                    *puVar19 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; puVar4 = local_8, iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  puVar19 = (uint *)puVar16[2];
                  puVar16 = local_50 + uVar5;
                  for (puVar9 = local_14; puVar9 != (uint *)0x0; puVar9 = (uint *)((int)puVar9 + -1)
                      ) {
                    *puVar16 = *puVar19;
                    puVar19 = puVar19 + 1;
                    puVar16 = puVar16 + 1;
                  }
                  iVar7 = FUN_10091633(local_50,local_28,0,0,puVar4,0,puVar12);
LAB_100980d9:
                  puVar9 = local_38;
                  if (iVar7 != 0) goto LAB_10098132;
                }
                else if (uVar6 == 0x20000000) {
                  puVar9 = (uint *)local_8[2];
                  puVar12 = local_50;
                  for (uVar6 = uVar5 & 0x3fffffff; puVar19 = local_c, uVar6 != 0; uVar6 = uVar6 - 1)
                  {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  local_10 = (IMAGE_DOS_HEADER *)puVar19[2];
                  uVar6 = (uint)local_14 & 0x3fffffff;
                  pIVar15 = local_10;
                  puVar9 = local_50 + uVar5;
                  local_14 = (uint *)((int)local_14 << 2);
                  for (; uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar9 = *(uint *)pIVar15;
                    pIVar15 = (IMAGE_DOS_HEADER *)&pIVar15->e_cp;
                    puVar9 = puVar9 + 1;
                  }
                  uVar6 = local_8[2];
                  for (iVar11 = 0; puVar12 = local_3c, iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar9 = pIVar15->e_magic[0];
                    pIVar15 = (IMAGE_DOS_HEADER *)(pIVar15->e_magic + 1);
                    puVar9 = (uint *)((int)puVar9 + 1);
                  }
                  puVar9 = (uint *)(uVar6 + uVar5 * 4);
                  puVar19 = local_78;
                  for (uVar10 = uVar5 & 0x3fffffff; pIVar15 = local_10, uVar10 != 0;
                      uVar10 = uVar10 - 1) {
                    *puVar19 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; puVar16 = local_14, iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  pwVar14 = (word *)(pIVar15->e_magic + (int)local_14);
                  puVar9 = local_78 + uVar5;
                  local_58 = uVar5 * 4;
                  for (uVar6 = (uint)local_14 >> 2; puVar19 = local_8, uVar5 = local_28, uVar6 != 0;
                      uVar6 = uVar6 - 1) {
                    *puVar9 = *(uint *)pwVar14;
                    pwVar14 = pwVar14 + 2;
                    puVar9 = puVar9 + 1;
                  }
                  for (uVar6 = (uint)puVar16 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
                    *(char *)puVar9 = (char)*pwVar14;
                    pwVar14 = (word *)((int)pwVar14 + 1);
                    puVar9 = (uint *)((int)puVar9 + 1);
                  }
                  iVar11 = FUN_10091633(local_50,uVar5,0,0,puVar19,0,puVar12);
                  iVar7 = FUN_10091633(local_78,local_28,0,0,local_8,0,local_3c);
                  if ((iVar11 != 0) && (iVar7 != 0)) goto LAB_10098132;
                  iVar11 = FUN_10085469();
                  uVar5 = local_58;
                  puVar9 = local_38;
                  if (iVar11 != 0) {
                    puVar9 = (uint *)local_8[2];
                    puVar12 = local_8c;
                    for (uVar6 = local_58 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
                      *puVar12 = *puVar9;
                      puVar9 = puVar9 + 1;
                      puVar12 = puVar12 + 1;
                    }
                    for (uVar6 = uVar5 & 3; puVar19 = local_14, uVar6 != 0; uVar6 = uVar6 - 1) {
                      *(char *)puVar12 = (char)*puVar9;
                      puVar9 = (uint *)((int)puVar9 + 1);
                      puVar12 = (uint *)((int)puVar12 + 1);
                    }
                    local_10 = (IMAGE_DOS_HEADER *)local_c[2];
                    pwVar14 = (word *)(local_10->e_magic + (int)local_14);
                    pcVar18 = (char *)((int)local_8c + uVar5);
                    for (uVar6 = (uint)local_14 >> 2; puVar9 = local_3c, uVar6 != 0;
                        uVar6 = uVar6 - 1) {
                      *(undefined4 *)pcVar18 = *(undefined4 *)pwVar14;
                      pwVar14 = pwVar14 + 2;
                      pcVar18 = pcVar18 + 4;
                    }
                    uVar6 = local_8[2];
                    for (uVar10 = (uint)puVar19 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
                      *pcVar18 = (char)*pwVar14;
                      pwVar14 = (word *)((int)pwVar14 + 1);
                      pcVar18 = pcVar18 + 1;
                    }
                    puVar12 = (uint *)(uVar6 + uVar5);
                    puVar19 = local_9c;
                    for (uVar10 = uVar5 >> 2; uVar10 != 0; uVar10 = uVar10 - 1) {
                      *puVar19 = *puVar12;
                      puVar12 = puVar12 + 1;
                      puVar19 = puVar19 + 1;
                    }
                    for (uVar6 = uVar5 & 3; puVar16 = local_14, uVar6 != 0; uVar6 = uVar6 - 1) {
                      *(char *)puVar19 = (char)*puVar12;
                      puVar12 = (uint *)((int)puVar12 + 1);
                      puVar19 = (uint *)((int)puVar19 + 1);
                    }
                    pIVar15 = local_10;
                    piVar8 = (int *)((int)local_9c + uVar5);
                    for (uVar6 = (uint)local_14 >> 2; puVar12 = local_8, uVar5 = local_28,
                        uVar6 != 0; uVar6 = uVar6 - 1) {
                      *piVar8 = *(int *)pIVar15;
                      pIVar15 = (IMAGE_DOS_HEADER *)&pIVar15->e_cp;
                      piVar8 = piVar8 + 1;
                    }
                    for (uVar6 = (uint)puVar16 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
                      *(char *)piVar8 = pIVar15->e_magic[0];
                      pIVar15 = (IMAGE_DOS_HEADER *)(pIVar15->e_magic + 1);
                      piVar8 = (int *)((int)piVar8 + 1);
                    }
                    iVar11 = FUN_10091633(local_8c,uVar5,0,0,puVar12,0,puVar9);
                    iVar7 = FUN_10091633(local_9c,local_28,0,0,local_8,0,local_3c);
                    puVar9 = local_38;
                    if ((iVar11 != 0) && (iVar7 != 0)) {
                      local_14 = (uint *)0x1;
                      goto LAB_10098136;
                    }
                  }
                }
                else if (uVar6 == 0x30000000) {
                  puVar9 = (uint *)local_8[2];
                  puVar12 = local_50;
                  for (uVar6 = uVar5 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  local_10 = (IMAGE_DOS_HEADER *)local_c[2];
                  pIVar15 = local_10;
                  puVar9 = local_50 + uVar5;
                  for (uVar6 = (uint)local_14 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar9 = *(uint *)pIVar15;
                    pIVar15 = (IMAGE_DOS_HEADER *)&pIVar15->e_cp;
                    puVar9 = puVar9 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar9 = pIVar15->e_magic[0];
                    pIVar15 = (IMAGE_DOS_HEADER *)(pIVar15->e_magic + 1);
                    puVar9 = (uint *)((int)puVar9 + 1);
                  }
                  puVar9 = (uint *)(local_8[2] + uVar5 * 4);
                  puVar12 = local_78;
                  for (uVar6 = uVar5 & 0x3fffffff; pIVar15 = local_10, uVar6 != 0; uVar6 = uVar6 - 1
                      ) {
                    *puVar12 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar12 = puVar12 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar12 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar12 = (uint *)((int)puVar12 + 1);
                  }
                  pwVar14 = (word *)(pIVar15->e_magic + (int)local_14 * 4);
                  puVar9 = local_78 + uVar5;
                  for (uVar6 = (uint)local_14 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar9 = *(uint *)pwVar14;
                    pwVar14 = pwVar14 + 2;
                    puVar9 = puVar9 + 1;
                  }
                  uVar6 = local_8[2];
                  for (iVar11 = 0; puVar12 = local_3c, iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar9 = (char)*pwVar14;
                    pwVar14 = (word *)((int)pwVar14 + 1);
                    puVar9 = (uint *)((int)puVar9 + 1);
                  }
                  puVar9 = (uint *)(uVar6 + local_60 * 8);
                  puVar19 = local_ac;
                  for (uVar10 = uVar5 & 0x3fffffff; puVar16 = local_14, uVar10 != 0;
                      uVar10 = uVar10 - 1) {
                    *puVar19 = *puVar9;
                    puVar9 = puVar9 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar9;
                    puVar9 = (uint *)((int)puVar9 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  pwVar14 = (word *)(local_10->e_magic + (int)puVar16 * 8);
                  puVar9 = local_ac + uVar5;
                  for (uVar6 = (uint)puVar16 & 0x3fffffff; puVar19 = local_8, uVar5 = local_28,
                      uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar9 = *(uint *)pwVar14;
                    pwVar14 = pwVar14 + 2;
                    puVar9 = puVar9 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar9 = (char)*pwVar14;
                    pwVar14 = (word *)((int)pwVar14 + 1);
                    puVar9 = (uint *)((int)puVar9 + 1);
                  }
                  iVar11 = FUN_10091633(local_50,uVar5,0,0,puVar19,0,puVar12);
                  local_60 = FUN_10091633(local_78,local_28,0,0,local_8,0,local_3c);
                  iVar7 = FUN_10091633(local_ac,local_28,0,0,local_8,0,local_3c);
                  puVar9 = local_38;
                  if ((iVar11 != 0) && (local_60 != 0)) goto LAB_100980d9;
                }
LAB_1009816c:
                while (puVar9 < *(uint **)(in_ECX + 0xc)) {
                  *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + -1;
                  if (*(int *)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xc) * 4) != 0) {
                    FUN_1006c418(1);
                  }
                }
                goto LAB_10098171;
              }
              local_10 = (IMAGE_DOS_HEADER *)local_c[2];
              iVar7 = *(int *)(iVar11 + *(int *)local_10 * 4);
              iVar11 = *(int *)(iVar11 + *(uint *)local_8[2] * 4);
              if (((*(int *)(iVar7 + 4) != *(int *)(iVar11 + 4)) ||
                  (*(int *)(iVar7 + 8) != *(int *)(iVar11 + 8))) ||
                 (*(int *)(iVar7 + 0xc) != *(int *)(iVar11 + 0xc))) goto LAB_1009816c;
              puVar9 = (uint *)local_8[2];
              puVar12 = local_50;
              for (uVar6 = uVar5 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                *puVar12 = *puVar9;
                puVar9 = puVar9 + 1;
                puVar12 = puVar12 + 1;
              }
              for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                *(char *)puVar12 = (char)*puVar9;
                puVar9 = (uint *)((int)puVar9 + 1);
                puVar12 = (uint *)((int)puVar12 + 1);
              }
              pIVar15 = local_10;
              puVar12 = local_50 + uVar5;
              for (puVar9 = local_14; puVar9 != (uint *)0x0; puVar9 = (uint *)((int)puVar9 + -1)) {
                *puVar12 = *(uint *)pIVar15;
                pIVar15 = (IMAGE_DOS_HEADER *)&pIVar15->e_cp;
                puVar12 = puVar12 + 1;
              }
LAB_10098132:
              local_14 = (uint *)0x0;
LAB_10098136:
              if ((local_1c != local_30) &&
                 (puVar9 = local_38,
                 4 < (uint)(*(int *)((int)local_24 + (int)local_30 * 4) +
                           *(int *)((int)local_24 + (int)local_1c * 4)))) goto LAB_1009816c;
              iVar11 = FUN_10085814(0x74);
              if (iVar11 == 0) {
                local_10 = (IMAGE_DOS_HEADER *)0x0;
              }
              else {
                local_10 = (IMAGE_DOS_HEADER *)FUN_10085379();
              }
              puVar9 = local_c;
              if (local_10 == (IMAGE_DOS_HEADER *)0x0) goto LAB_1009849c;
              uVar5 = FUN_1008585f((*local_c ^ local_28) & 0xfffff ^ *local_c,local_7c,local_28,0);
              if ((-1 < (int)uVar5) &&
                 (uVar5 = FUN_100853b0(puVar9), pIVar15 = local_10, puVar9 = local_2c,
                 -1 < (int)uVar5)) {
                if (local_1c != local_30) {
                  uVar5 = 0;
                  if (*(int *)(in_ECX + 8) != 0) {
                    do {
                      iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
                      if ((local_5c == *(uint *)(iVar11 + 4)) &&
                         (local_1c == *(uint **)(iVar11 + 0xc))) {
                        *(uint **)(iVar11 + 0xc) = local_30;
                        *(int *)(iVar11 + 0x10) =
                             *(int *)(iVar11 + 0x10) + *(int *)((int)local_24 + (int)local_30 * 4);
                      }
                      uVar5 = uVar5 + 1;
                    } while (uVar5 < *(uint *)(in_ECX + 8));
                  }
                  piVar8 = (int *)((int)local_24 + (int)local_30 * 4);
                  piVar1 = (int *)((int)local_24 + (int)local_1c * 4);
                  *piVar8 = *piVar8 + *piVar1;
                  *piVar1 = 0;
                }
                puVar13 = (undefined4 *)local_8[4];
                puVar17 = *(undefined4 **)&local_10->e_sp;
                for (uVar5 = local_8[3] & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                  *puVar17 = *puVar13;
                  puVar13 = puVar13 + 1;
                  puVar17 = puVar17 + 1;
                }
                for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                  *(undefined1 *)puVar17 = *(undefined1 *)puVar13;
                  puVar13 = (undefined4 *)((int)puVar13 + 1);
                  puVar17 = (undefined4 *)((int)puVar17 + 1);
                }
                puVar13 = (undefined4 *)local_c[4];
                puVar17 = (undefined4 *)(*(int *)&local_10->e_sp + local_8[3] * 4);
                for (uVar5 = local_c[3] & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                  *puVar17 = *puVar13;
                  puVar13 = puVar13 + 1;
                  puVar17 = puVar17 + 1;
                }
                for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                  *(undefined1 *)puVar17 = *(undefined1 *)puVar13;
                  puVar13 = (undefined4 *)((int)puVar13 + 1);
                  puVar17 = (undefined4 *)((int)puVar17 + 1);
                }
                if ((*local_c & 0xf0000000) == 0x10000000) {
                  puVar12 = local_50;
                  puVar19 = *(uint **)&local_10->e_cparhdr;
                  for (uVar5 = local_28; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar19 = *puVar12;
                    puVar12 = puVar12 + 1;
                    puVar19 = puVar19 + 1;
                  }
                }
                if ((*local_c & 0xf0000000) == 0x20000000) {
                  puVar12 = local_50;
                  if (local_14 != (uint *)0x0) {
                    puVar12 = local_8c;
                  }
                  uVar5 = local_28 * 4;
                  local_5c = uVar5;
                  puVar19 = *(uint **)&local_10->e_cparhdr;
                  for (uVar6 = local_28 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                    *puVar19 = *puVar12;
                    puVar12 = puVar12 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar12;
                    puVar12 = (uint *)((int)puVar12 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  puVar12 = local_78;
                  if (local_14 != (uint *)0x0) {
                    puVar12 = local_9c;
                  }
                  puVar19 = (uint *)(*(int *)&local_10->e_cparhdr + uVar5);
LAB_10098339:
                  for (uVar5 = uVar5 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar19 = *puVar12;
                    puVar12 = puVar12 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar12;
                    puVar12 = (uint *)((int)puVar12 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                }
                else if ((*local_c & 0xf0000000) == 0x30000000) {
                  puVar12 = local_50;
                  puVar19 = *(uint **)&local_10->e_cparhdr;
                  for (uVar5 = local_28 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar19 = *puVar12;
                    puVar12 = puVar12 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar12;
                    puVar12 = (uint *)((int)puVar12 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  puVar12 = local_78;
                  puVar19 = (uint *)(*(int *)&local_10->e_cparhdr + local_28 * 4);
                  for (uVar5 = local_28 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar19 = *puVar12;
                    puVar12 = puVar12 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (iVar11 = 0; iVar11 != 0; iVar11 = iVar11 + -1) {
                    *(char *)puVar19 = (char)*puVar12;
                    puVar12 = (uint *)((int)puVar12 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  uVar5 = local_28 << 2;
                  puVar12 = local_ac;
                  puVar19 = (uint *)(*(int *)&local_10->e_cparhdr + local_28 * 8);
                  goto LAB_10098339;
                }
                local_2c = (uint *)(local_2c[1] / (*local_2c & 0xfffff));
                uVar3._0_2_ = local_10->e_sp;
                uVar3._2_2_ = local_10->e_csum;
                FUN_1008a70d(uVar3,local_bc,local_28,1);
                local_24 = (uint *)0x0;
                if (local_2c != (uint *)0x0) {
                  do {
                    FUN_1008a70d(*(int *)&pIVar15->e_cparhdr +
                                 *(int *)&pIVar15->e_maxalloc * (int)local_24 * 4,local_bc,local_28,
                                 0);
                    local_24 = (uint *)((int)local_24 + 1);
                  } while (local_24 < local_2c);
                }
                if (local_64 != (uint *)0x0) {
                  FUN_1006c418(1);
                }
                local_24 = (uint *)((int)local_20 * 4);
                *(IMAGE_DOS_HEADER **)((int)local_24 + *(int *)(in_ECX + 0x18)) = pIVar15;
                *puVar9 = 0;
                puVar9[1] = 0;
                puVar9[3] = 0;
                if (local_38 < *(uint **)(in_ECX + 0xc)) {
                  local_64 = (uint *)((int)*(uint **)(in_ECX + 0xc) - (int)local_38);
                  local_30 = (uint *)((int)local_64 * 4);
                  local_2c = operator_new((uint)local_30);
                  if (local_2c != (uint *)0x0) {
                    puVar9 = (uint *)(*(int *)(in_ECX + 0x18) + (int)local_38 * 4);
                    puVar12 = local_2c;
                    for (uVar5 = (uint)local_30 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *puVar12 = *puVar9;
                      puVar9 = puVar9 + 1;
                      puVar12 = puVar12 + 1;
                    }
                    for (uVar5 = (uint)local_30 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *(char *)puVar12 = (char)*puVar9;
                      puVar9 = (uint *)((int)puVar9 + 1);
                      puVar12 = (uint *)((int)puVar12 + 1);
                    }
                    _memmove((void *)(*(int *)(in_ECX + 0x18) +
                                     (int)((int)local_64 + (int)local_20) * 4),
                             (void *)((int)local_24 + *(int *)(in_ECX + 0x18)),
                             ((int)local_38 - (int)local_20) * 4);
                    puVar9 = local_2c;
                    puVar12 = (uint *)(*(int *)(in_ECX + 0x18) + (int)local_24);
                    for (uVar5 = (uint)local_30 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *puVar12 = *puVar9;
                      puVar9 = puVar9 + 1;
                      puVar12 = puVar12 + 1;
                    }
                    for (uVar5 = (uint)local_30 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
                      *(char *)puVar12 = (char)*puVar9;
                      puVar9 = (uint *)((int)puVar9 + 1);
                      puVar12 = (uint *)((int)puVar12 + 1);
                    }
                    _free(local_2c);
                    goto LAB_1009845e;
                  }
                  goto LAB_1009849c;
                }
LAB_1009845e:
                FUN_1008a979();
                local_18 = (uint *)((int)local_34 - 1);
                local_68 = 1;
                goto LAB_10098473;
              }
              goto LAB_10097be6;
            }
          }
        }
LAB_10098473:
        local_18 = (uint *)((int)local_18 + 1);
      } while (local_18 < *(uint **)(in_ECX + 0xc));
    }
    uVar5 = (uint)(local_68 == 0);
  }
LAB_1009848c:
  _free(local_54);
  return uVar5;
LAB_10098171:
  local_20 = (uint *)((int)local_20 + 1);
  goto LAB_10098177;
LAB_10097be6:
  FUN_1006c418(1);
  goto LAB_1009848c;
}


