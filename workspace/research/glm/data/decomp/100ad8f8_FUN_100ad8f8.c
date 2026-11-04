// 100ad8f8 size=3964 FUN_100ad8f8

/* WARNING: Type propagation algorithm not settling */

int FUN_100ad8f8(int param_1,int param_2)

{
  int *piVar1;
  undefined4 uVar2;
  int in_ECX;
  int iVar3;
  uint uVar4;
  uint *puVar5;
  uint *puVar6;
  uint *puVar7;
  int iVar8;
  undefined4 *puVar9;
  int iVar10;
  undefined4 *puVar11;
  uint *puVar12;
  uint uVar13;
  bool bVar14;
  int local_26c [32];
  int local_1ec [32];
  int local_16c [8];
  uint local_14c [24];
  undefined4 auStack_ec [6];
  uint local_d4 [7];
  undefined4 local_b8 [17];
  uint local_74 [6];
  uint local_5c [6];
  int local_44;
  uint *local_40;
  int local_3c;
  uint *local_38;
  int local_34;
  uint *local_30;
  uint *local_2c;
  uint local_28;
  uint *local_24;
  uint *local_20;
  uint *local_1c;
  uint *local_18;
  uint *local_14;
  uint *local_10;
  uint *local_c;
  uint *local_8;
  
  puVar6 = local_14c;
  for (iVar3 = 0x18; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  puVar6 = local_74;
  for (iVar3 = 6; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  puVar6 = local_d4;
  for (iVar3 = 0x18; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  puVar6 = local_5c;
  for (iVar3 = 6; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  uVar4 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
      if (*(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88)) {
        *(undefined4 *)(iVar3 + 0xc) = 0xffffffff;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 8));
  }
  if ((*(int *)(in_ECX + 0x22c) != 0) && (local_14 = (uint *)0x0, *(int *)(in_ECX + 0x220) != 0)) {
    iVar3 = 0;
    do {
      puVar6 = *(uint **)(iVar3 + *(int *)(in_ECX + 0x22c));
      if (((puVar6 != (uint *)0x0) && (uVar4 = *puVar6 & 0xfff00000, uVar4 != 0)) &&
         (uVar4 != 0x11000000)) {
        if (((uVar4 == 0x60000000) || (uVar4 == 0x60500000)) ||
           ((uVar4 == 0x60a00000 || ((uVar4 == 0x60f00000 || (uVar4 == 0x72100000)))))) {
          iVar8 = *(int *)(iVar3 + *(int *)(in_ECX + 0x22c));
          local_28 = 0;
          local_18 = (uint *)0x0;
          local_c = (uint *)0x0;
          FUN_100ac9bb(*(undefined4 *)(in_ECX + 0x230),0,*(undefined4 *)(in_ECX + 0x224),
                       *(undefined4 *)(iVar8 + 0x10),*(undefined4 *)(iVar8 + 0xc),local_1ec,&local_c
                      );
          local_8 = (uint *)0x0;
          if (*(int *)(*(int *)(*(int *)(in_ECX + 0x22c) + iVar3) + 0xc) != 0) {
            local_38 = local_14;
            do {
              iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                              *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 0x22c) + iVar3) + 0x10) +
                                      (int)local_8 * 4) * 4);
              *(uint **)(iVar8 + 0xc) = local_14;
              local_20 = (uint *)FUN_100ab063(*(int *)(in_ECX + 0x22c),(int)local_14 + 1,
                                              *(undefined4 *)(in_ECX + 0x220),
                                              *(undefined4 *)
                                               (*(int *)(*(int *)(*(int *)(in_ECX + 0x22c) + iVar3)
                                                        + 0x10) + (int)local_8 * 4),iVar8,&local_1c)
              ;
              uVar4 = FUN_100ab063(*(undefined4 *)(in_ECX + 0x230),0,*(undefined4 *)(in_ECX + 0x224)
                                   ,*(undefined4 *)
                                     (*(int *)(*(int *)(*(int *)(in_ECX + 0x22c) + iVar3) + 0x10) +
                                     (int)local_8 * 4),iVar8,&local_1c);
              if (local_28 < uVar4) {
                local_28 = uVar4;
              }
              puVar6 = local_20;
              if (local_1c != (uint *)0x0) {
                puVar6 = (uint *)0xffffffff;
              }
              if (local_18 < puVar6) {
                local_18 = puVar6;
              }
              iVar10 = *(int *)(iVar8 + 0x10) + iVar3;
              local_8 = (uint *)((int)local_8 + 1);
              local_d4[iVar10] = uVar4;
              iVar8 = *(int *)(*(int *)(in_ECX + 0x22c) + iVar3);
              local_14c[iVar10] = (uint)puVar6;
            } while (local_8 < *(uint *)(iVar8 + 0xc));
          }
          puVar6 = local_38;
          local_8 = (uint *)0x0;
          bVar14 = local_c != (uint *)0x0;
          local_74[(int)local_38] = (uint)local_18;
          local_5c[(int)puVar6] = local_28;
          if (bVar14) {
            local_38 = local_14;
            do {
              iVar8 = local_1ec[(int)local_8];
              iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + iVar8 * 4);
              *(uint **)(iVar10 + 0xc) = local_14;
              uVar4 = FUN_100ab063(*(undefined4 *)(in_ECX + 0x230),0,*(undefined4 *)(in_ECX + 0x224)
                                   ,iVar8,iVar10,&local_1c);
              if (local_28 < uVar4) {
                local_28 = uVar4;
              }
              local_8 = (uint *)((int)local_8 + 1);
              local_d4[*(int *)(iVar10 + 0x10) + iVar3] = uVar4;
            } while (local_8 < local_c);
          }
          local_5c[(int)local_38] = local_28;
        }
        else {
          uVar4 = puVar6[3];
          local_20 = (uint *)0x0;
          local_c = (uint *)0x0;
          if (uVar4 != 0) {
            piVar1 = (int *)puVar6[4];
            do {
              if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 0xc) == -1) {
                local_20 = (uint *)0x1;
              }
              else {
                local_c = (uint *)0x1;
              }
              piVar1 = piVar1 + 1;
              uVar4 = uVar4 - 1;
            } while (uVar4 != 0);
            if (local_c != (uint *)0x0) {
              if (local_20 == (uint *)0x0) goto LAB_100addfb;
              goto LAB_100ada28;
            }
          }
          iVar8 = *(int *)(*(int *)(in_ECX + 0x22c) + iVar3);
          local_24 = (uint *)0x0;
          local_3c = (int)local_14 + 1;
          FUN_100ac9bb(*(int *)(in_ECX + 0x22c),local_3c,*(undefined4 *)(in_ECX + 0x220),
                       *(undefined4 *)(iVar8 + 0x10),*(undefined4 *)(iVar8 + 0xc),local_26c,
                       &local_24);
          iVar8 = *(int *)(iVar3 + *(int *)(in_ECX + 0x22c));
          iVar10 = 0;
          FUN_100ac9bb(*(undefined4 *)(in_ECX + 0x230),0,*(undefined4 *)(in_ECX + 0x224),
                       *(undefined4 *)(iVar8 + 0x10),*(undefined4 *)(iVar8 + 0xc),local_26c,
                       &local_24);
          iVar8 = *(int *)(iVar3 + *(int *)(in_ECX + 0x22c));
          if ((*(int *)(iVar8 + 0xc) == 1) &&
             (iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar8 + 0x10) * 4),
             *(int *)(iVar10 + 0x10) != 4)) {
            iVar10 = 0;
          }
          local_10 = (uint *)0x0;
          local_c = local_14c;
          do {
            iVar8 = *(int *)(iVar3 + *(int *)(in_ECX + 0x22c));
            iVar8 = FUN_100ad1c2(local_10,*(undefined4 *)(in_ECX + 0x230),
                                 *(undefined4 *)(in_ECX + 0x224),*(undefined4 *)(iVar8 + 0x10),
                                 *(undefined4 *)(iVar8 + 0xc));
            if (iVar8 < 0) {
              return iVar8;
            }
            if (iVar8 != 1) {
              puVar5 = (uint *)0x0;
              puVar6 = local_c;
              if (iVar10 == 0) {
                if ((uint *)local_74[(int)local_10] <= local_14) goto LAB_100adb46;
              }
              else {
                do {
                  if ((uint *)*puVar6 <= local_14) {
                    local_30 = puVar5;
                    break;
                  }
                  puVar5 = (uint *)((int)puVar5 + 1);
                  puVar6 = puVar6 + 1;
                } while (puVar5 < (uint *)0x3);
                if (puVar5 != (uint *)0x3) break;
              }
            }
            local_10 = (uint *)((int)local_10 + 1);
            local_c = local_c + 4;
          } while (local_10 < (uint *)0x6);
          if (iVar10 != 0) {
            *(uint **)(iVar10 + 0x10) = local_30;
          }
LAB_100adb46:
          if (local_10 == (uint *)0x6) goto joined_r0x100adffb;
          local_18 = (uint *)0x0;
          local_28 = 0;
          local_8 = (uint *)0x0;
          if (local_24 != (uint *)0x0) {
            local_38 = local_10;
            do {
              piVar1 = local_26c + (int)local_8;
              iVar8 = *piVar1;
              local_c = *(uint **)(*(int *)(in_ECX + 0x14) + iVar8 * 4);
              local_c[3] = (uint)local_10;
              local_20 = (uint *)FUN_100ab063(*(undefined4 *)(in_ECX + 0x22c),local_3c,
                                              *(undefined4 *)(in_ECX + 0x220),iVar8,local_c,
                                              &local_1c);
              uVar4 = FUN_100ab063(*(undefined4 *)(in_ECX + 0x230),0,*(undefined4 *)(in_ECX + 0x224)
                                   ,*piVar1,local_c,&local_1c);
              if (local_28 < uVar4) {
                local_28 = uVar4;
              }
              if ((*(uint *)(in_ECX + 0x4c) <= uVar4) && (local_c[4] == 3)) {
                auStack_ec[(int)local_10] = 1;
              }
              if (local_1c != (uint *)0x0) {
                auStack_ec[(int)local_10] = 1;
              }
              if ((local_28 != 0) || (puVar6 = local_20, local_1c != (uint *)0x0)) {
                puVar6 = (uint *)0xffffffff;
              }
              if (local_18 < puVar6) {
                local_18 = puVar6;
              }
              iVar8 = local_c[4] + (int)local_10 * 4;
              local_8 = (uint *)((int)local_8 + 1);
              local_d4[iVar8] = uVar4;
              bVar14 = local_8 < local_24;
              local_14c[iVar8] = (uint)puVar6;
            } while (bVar14);
          }
          puVar6 = local_10;
          local_74[(int)local_10] = (uint)local_18;
          local_5c[(int)puVar6] = local_28;
          FUN_100acb1a();
        }
      }
LAB_100addfb:
      local_14 = (uint *)((int)local_14 + 1);
      iVar3 = iVar3 + 4;
    } while (local_14 < *(uint **)(in_ECX + 0x220));
  }
  if ((*(int *)(in_ECX + 0x230) != 0) && (local_14 = (uint *)0x0, *(int *)(in_ECX + 0x224) != 0)) {
    do {
      puVar5 = local_14;
      local_30 = (uint *)((int)local_14 * 4);
      puVar6 = *(uint **)((int)local_30 + *(int *)(in_ECX + 0x230));
      if ((puVar6 != (uint *)0x0) &&
         ((uVar4 = *puVar6 & 0xfff00000, uVar4 != 0 && (uVar4 != 0x11000000)))) {
        if (((uVar4 == 0x60000000) ||
            (((((uVar4 == 0x60500000 || (uVar4 == 0x60a00000)) || (uVar4 == 0x60f00000)) ||
              (((uVar4 == 0x72300000 || (uVar4 == 0x72500000)) ||
               ((uVar4 == 0x72100000 || ((uVar4 == 0x72600000 || (uVar4 == 0x72700000)))))))) ||
             (uVar4 == 0x72800000)))) ||
           (((uVar4 == 0x72a00000 || (uVar4 == 0x72900000)) || (uVar4 == 0x72b00000)))) {
          local_10 = (uint *)0x0;
          local_8 = (uint *)0x0;
          if (puVar6[3] != 0) {
            do {
              local_40 = (uint *)((int)local_8 * 4);
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)((int)local_40 + puVar6[4]) * 4);
              if ((*(uint *)(in_ECX + 200) & 0xffff) == 0x104) {
                *(uint **)(iVar3 + 0xc) = local_14;
                local_38 = local_14;
              }
              else {
                local_38 = (uint *)((int)local_14 + 2);
                *(uint **)(iVar3 + 0xc) = local_38;
              }
              puVar5 = (uint *)FUN_100ab063(*(int *)(in_ECX + 0x230),(int)local_14 + 1,
                                            *(undefined4 *)(in_ECX + 0x224),
                                            *(undefined4 *)
                                             (*(int *)(*(int *)((int)local_30 +
                                                               *(int *)(in_ECX + 0x230)) + 0x10) +
                                             (int)local_40),iVar3,&local_1c);
              puVar6 = local_38;
              if (local_10 < puVar5) {
                local_10 = puVar5;
              }
              iVar8 = *(int *)(in_ECX + 0x230);
              local_d4[*(int *)(iVar3 + 0x10) + (int)local_38 * 4] = (uint)puVar5;
              iVar3 = *(int *)((int)local_30 + iVar8);
              local_20 = (uint *)0x0;
              FUN_100ac9bb(iVar8,(int)local_14 + 1,*(undefined4 *)(in_ECX + 0x224),
                           *(undefined4 *)(iVar3 + 0x10),*(undefined4 *)(iVar3 + 0xc),local_1ec,
                           &local_20);
              local_c = (uint *)0x0;
              if (local_20 != (uint *)0x0) {
                do {
                  iVar3 = local_1ec[(int)local_c];
                  iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
                  *(uint **)(iVar8 + 0xc) = puVar6;
                  puVar5 = (uint *)FUN_100ab063(*(undefined4 *)(in_ECX + 0x230),(int)local_14 + 1,
                                                *(undefined4 *)(in_ECX + 0x224),iVar3,iVar8,
                                                &local_1c);
                  if (local_10 < puVar5) {
                    local_10 = puVar5;
                  }
                  local_c = (uint *)((int)local_c + 1);
                  local_d4[*(int *)(iVar8 + 0x10) + (int)puVar6 * 4] = (uint)puVar5;
                } while (local_c < local_20);
              }
              FUN_100acb1a();
              local_8 = (uint *)((int)local_8 + 1);
              local_30 = (uint *)((int)local_14 * 4);
              puVar6 = *(uint **)((int)local_30 + *(int *)(in_ECX + 0x230));
            } while (local_8 < (uint *)puVar6[3]);
          }
          if ((uint *)local_5c[(int)local_38] < local_10) {
            local_5c[(int)local_38] = (uint)local_10;
          }
        }
        else if ((uVar4 != 0x72200000) && (uVar4 != 0x72400000)) {
          if ((*(uint *)(in_ECX + 200) & 0xffff) == 0x101) {
            puVar7 = *(uint **)((int)local_30 + *(int *)(in_ECX + 0x230));
            uVar4 = *puVar7 & 0xfffff;
            local_30 = (uint *)(puVar7[1] / uVar4);
            local_20 = (uint *)0x0;
            local_2c = (uint *)0x0;
            if (local_30 != (uint *)0x0) {
              local_18 = (uint *)puVar6[2];
              local_34 = uVar4 * 4;
              do {
                local_24 = (uint *)0x0;
                iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_18 * 4);
                if (local_2c != (uint *)0x0) {
                  local_c = (uint *)puVar6[2];
                  do {
                    iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + *local_c * 4);
                    if (((*(int *)(iVar3 + 4) == *(int *)(iVar8 + 4)) &&
                        (*(int *)(iVar3 + 8) == *(int *)(iVar8 + 8))) &&
                       (*(int *)(iVar3 + 0xc) == *(int *)(iVar8 + 0xc))) break;
                    local_24 = (uint *)((int)local_24 + 1);
                    local_c = local_c + uVar4;
                  } while (local_24 < local_2c);
                }
                if (((local_2c == local_24) && (*(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88))) &&
                   (1 < *(uint *)(iVar3 + 0xc))) {
                  local_20 = (uint *)((int)local_20 + 1);
                }
                local_18 = local_18 + uVar4;
                local_2c = (uint *)((int)local_2c + 1);
              } while (local_2c < local_30);
              if ((uint *)0x2 < local_20) {
                if (param_1 != 0) {
                  return -0x7fffbffb;
                }
                if (param_2 != 0) {
                  return -0x7fffbffb;
                }
                goto LAB_100ada28;
              }
            }
          }
          uVar4 = puVar6[3];
          bVar14 = false;
          local_c = (uint *)0x0;
          if (uVar4 != 0) {
            piVar1 = (int *)puVar6[4];
            do {
              if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 0xc) == -1) {
                local_c = (uint *)0x1;
              }
              else {
                bVar14 = true;
              }
              piVar1 = piVar1 + 1;
              uVar4 = uVar4 - 1;
            } while (uVar4 != 0);
            if (bVar14) {
              if (local_c == (uint *)0x0) goto LAB_100ae7ac;
              goto LAB_100ada28;
            }
          }
          iVar3 = *(int *)(*(int *)(in_ECX + 0x230) + (int)local_14 * 4);
          local_2c = (uint *)0x0;
          FUN_100ac9bb(*(int *)(in_ECX + 0x230),(int)local_14 + 1,*(undefined4 *)(in_ECX + 0x224),
                       *(undefined4 *)(iVar3 + 0x10),*(undefined4 *)(iVar3 + 0xc),local_16c,
                       &local_2c);
          local_1c = (uint *)0xffffffff;
          local_10 = (uint *)0xffffffff;
          local_8 = (uint *)(*(uint *)(in_ECX + 200) & 0xffff);
          if (((local_8 == (uint *)0x102) || (local_8 == (uint *)0x103)) &&
             (piVar1 = *(int **)(*(int *)(in_ECX + 0x230) + (int)puVar5 * 4), *piVar1 == 0x50000004)
             ) {
            piVar1 = (int *)piVar1[2];
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4);
            if (*(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88)) {
              local_1c = *(uint **)(iVar3 + 0xc);
            }
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + piVar1[4] * 4);
            if (*(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88)) {
              local_10 = *(uint **)(iVar3 + 0xc);
            }
          }
          local_34 = 0;
          local_24 = (uint *)0x0;
          if (local_2c == (uint *)0x0) {
LAB_100ae15f:
            local_18 = (uint *)0x1;
            if (*(int *)(in_ECX + 0x44c) == 0) goto LAB_100ae16e;
          }
          else {
            do {
              uVar4 = (int)puVar5 + 1;
              if (uVar4 < *(uint *)(in_ECX + 0x224)) {
                local_c = (uint *)(*(int *)(in_ECX + 0x230) + uVar4 * 4);
                iVar3 = *(uint *)(in_ECX + 0x224) - uVar4;
                do {
                  puVar6 = (uint *)*local_c;
                  if (((puVar6 != (uint *)0x0) && ((*puVar6 & 0xfff00000) == 0x70f00000)) &&
                     (puVar7 = (uint *)(*puVar6 & 0xfffff), puVar7 != (uint *)0x0)) {
                    piVar1 = (int *)puVar6[2];
                    local_20 = puVar7;
                    do {
                      if (*piVar1 == local_16c[(int)local_24]) {
                        local_34 = 1;
                      }
                      piVar1 = piVar1 + 1;
                      local_20 = (uint *)((int)local_20 - 1);
                    } while (local_20 != (uint *)0x0);
                  }
                  local_c = local_c + 1;
                  iVar3 = iVar3 + -1;
                } while (iVar3 != 0);
              }
              local_24 = (uint *)((int)local_24 + 1);
            } while (local_24 < local_2c);
            if (local_34 == 0) goto LAB_100ae15f;
LAB_100ae16e:
            local_18 = (uint *)0x0;
          }
          local_30 = *(uint **)((int)puVar5 * 4 + *(int *)(in_ECX + 0x230));
          uVar4 = *local_30;
          if (((((uVar4 & 0xfffff) == 1) && ((uVar4 & 0xfff00000) != 0x50000000)) &&
              (local_2c == (uint *)0x1)) &&
             ((*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_16c[0] * 4) + 0x10) == 3 &&
              (local_18 != (uint *)0x0)))) {
            local_24 = (uint *)0x1;
            puVar9 = local_b8;
            do {
              if ((local_14 < (uint *)local_5c[(int)local_24]) && ((uint *)*puVar9 <= local_14))
              break;
              local_24 = (uint *)((int)local_24 + 1);
              puVar9 = puVar9 + 4;
            } while (local_24 < (uint *)0x6);
            if (local_24 == (uint *)0x6) goto LAB_100ae1ed;
          }
          else {
LAB_100ae1ed:
            for (local_24 = (uint *)(uint)(local_18 != (uint *)0x0);
                (local_24 < (uint *)0x6 &&
                (((local_14 < (uint *)local_5c[(int)local_24] || (local_24 == local_1c)) ||
                 (local_24 == local_10)))); local_24 = (uint *)((int)local_24 + 1)) {
            }
          }
          if (((local_24 != (uint *)0x0) && (local_18 == (uint *)0x0)) &&
             (*(int *)(in_ECX + 0x44c) != 0)) goto joined_r0x100adffb;
          if (local_24 == (uint *)0x6) {
            if ((*(uint *)(in_ECX + 200) & 0xffff) == 0x104) goto joined_r0x100ae004;
            goto LAB_100ada28;
          }
          local_3c = 0;
          if ((((uVar4 & 0xfff00000) == 0x50000000) && (local_8 < (uint *)0x104)) &&
             (local_30[3] == 1)) {
            iVar8 = (int)local_14 * 4;
            iVar3 = *(int *)(iVar8 + *(int *)(in_ECX + 0x230));
            FUN_100acb59(*(int *)(in_ECX + 0x230),(int)local_14 + 1,*(undefined4 *)(in_ECX + 0x224),
                         *(undefined4 *)(iVar3 + 0x10),*(undefined4 *)(iVar3 + 0xc),&local_28,
                         &local_44,&local_40);
            if (local_44 != 0) {
              local_28 = 4;
            }
            bVar14 = local_28 < 4;
            if (bVar14) {
              local_28 = 3;
            }
            if (!bVar14 && local_28 != 4) {
              local_28 = 4;
            }
            iVar3 = FUN_10085814();
            if (iVar3 == 0) {
              local_8 = (uint *)0x0;
            }
            else {
              local_8 = (uint *)FUN_10085379();
            }
            if (local_8 == (uint *)0x0) {
              return -0x7ff8fff2;
            }
            puVar9 = *(undefined4 **)(iVar8 + *(int *)(in_ECX + 0x230));
            iVar3 = FUN_1008585f(*puVar9,puVar9[1],local_28,0);
            if (iVar3 < 0) {
              return iVar3;
            }
            iVar3 = FUN_100853b0();
            puVar6 = local_8;
            if (iVar3 < 0) {
              return iVar3;
            }
            iVar3 = (int)local_14 * 4;
            puVar9 = *(undefined4 **)(*(int *)(iVar3 + *(int *)(in_ECX + 0x230)) + 8);
            puVar11 = (undefined4 *)local_8[2];
            for (uVar4 = local_8[1] & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
              *puVar11 = *puVar9;
              puVar9 = puVar9 + 1;
              puVar11 = puVar11 + 1;
            }
            for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
              *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
              puVar9 = (undefined4 *)((int)puVar9 + 1);
              puVar11 = (undefined4 *)((int)puVar11 + 1);
            }
            iVar8 = *(int *)(iVar3 + *(int *)(in_ECX + 0x230));
            puVar5 = *(uint **)(iVar8 + 0xc);
            puVar7 = *(uint **)(iVar8 + 0x10);
            puVar12 = local_74 + 2;
            local_30 = puVar5;
            for (; puVar5 != (uint *)0x0; puVar5 = (uint *)((int)puVar5 + -1)) {
              *puVar12 = *puVar7;
              puVar7 = puVar7 + 1;
              puVar12 = puVar12 + 1;
            }
            *(uint **)(iVar3 + *(int *)(in_ECX + 0x230)) = puVar6;
            iVar3 = FUN_10086026();
            if (iVar3 < 0) {
              return iVar3;
            }
            puVar6 = (uint *)0x0;
            local_10 = (uint *)0x0;
            local_c = (uint *)0x0;
            if (local_30 != (uint *)0x0) {
              do {
                local_18 = (uint *)0x0;
                if (*(int *)(in_ECX + 8) != 0) {
                  do {
                    uVar4 = 0;
                    iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4);
                    if ((local_18 == (uint *)local_74[(int)local_c + 2]) ||
                       (*(uint **)(iVar3 + 0x38) == (uint *)local_74[(int)local_c + 2])) {
                      if (local_28 != 0) {
                        do {
                          uVar2 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_24,uVar4,0);
                          *(undefined4 *)(local_8[4] + uVar4 * 4) = uVar2;
                          if (*(int *)(local_8[4] + uVar4 * 4) == -1) {
                            return -0x7ff8fff2;
                          }
                          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)(local_8[4] + uVar4 * 4) * 4);
                          *(undefined4 *)(iVar8 + 0x48) = *(undefined4 *)(iVar3 + 0x48);
                          *(undefined4 *)(iVar8 + 0x54) = *(undefined4 *)(iVar3 + 0x54);
                          *(undefined4 *)(iVar8 + 0x58) = *(undefined4 *)(iVar3 + 0x58);
                          uVar4 = uVar4 + 1;
                          *(undefined4 *)(iVar8 + 0x3c) = *(undefined4 *)(iVar3 + 0x3c);
                        } while (uVar4 < local_28);
                      }
                      local_1c = (uint *)((int)local_14 + 1);
                      while (local_1c < *(uint **)(in_ECX + 0x224)) {
                        puVar6 = *(uint **)(*(int *)(in_ECX + 0x230) + (int)local_1c * 4);
                        if ((puVar6 != (uint *)0x0) && (*puVar6 != 0)) {
                          uVar4 = *puVar6 & 0xfffff;
                          local_40 = (uint *)(puVar6[1] / uVar4);
                          local_20 = (uint *)0x0;
                          if (local_40 != (uint *)0x0) {
                            local_34 = 0;
                            do {
                              if (uVar4 < 3) {
                                if (uVar4 == 1) {
                                  puVar5 = (uint *)(puVar6[2] + (int)local_20 * 4);
                                  if ((uint *)*puVar5 == local_18) {
                                    if (local_28 == 4) {
                                      uVar13 = ((uint *)local_8[4])[3];
                                    }
                                    else {
                                      uVar13 = *(uint *)local_8[4];
                                    }
                                    *puVar5 = uVar13;
                                    if (local_10 < local_1c) {
                                      local_10 = local_1c;
                                    }
                                  }
                                }
                                else {
                                  uVar13 = 0;
                                  iVar3 = local_34;
                                  if (uVar4 != 0) {
                                    do {
                                      if ((*(uint **)(iVar3 + puVar6[2]) == local_18) &&
                                         (*(uint *)(iVar3 + puVar6[2]) =
                                               *(uint *)(local_8[4] + uVar13 * 4),
                                         local_10 < local_1c)) {
                                        local_10 = local_1c;
                                      }
                                      uVar13 = uVar13 + 1;
                                      iVar3 = iVar3 + 4;
                                    } while (uVar13 < uVar4);
                                  }
                                }
                              }
                              else {
                                uVar13 = 0;
                                iVar3 = local_34;
                                if (uVar4 != 0) {
                                  do {
                                    if ((*(uint **)(iVar3 + puVar6[2]) == local_18) &&
                                       (*(uint *)(iVar3 + puVar6[2]) =
                                             *(uint *)(local_8[4] + uVar13 * 4), local_10 < local_1c
                                       )) {
                                      local_10 = local_1c;
                                    }
                                    uVar13 = uVar13 + 1;
                                    iVar3 = iVar3 + 4;
                                  } while (uVar13 < uVar4);
                                }
                              }
                              local_20 = (uint *)((int)local_20 + 1);
                              local_34 = local_34 + uVar4 * 4;
                            } while (local_20 < local_40);
                          }
                        }
                        local_1c = (uint *)((int)local_1c + 1);
                      }
                      local_3c = 1;
                      puVar6 = local_10;
                    }
                    local_18 = (uint *)((int)local_18 + 1);
                  } while (local_18 < *(uint **)(in_ECX + 8));
                }
                local_c = (uint *)((int)local_c + 1);
              } while (local_c < local_30);
            }
            puVar5 = local_24;
            if ((uint *)local_5c[(int)local_24] < puVar6) {
              local_5c[(int)local_24] = (uint)puVar6;
            }
            if ((uint *)local_d4[(int)puVar5 * 4] < puVar6) {
              local_d4[(int)puVar5 * 4] = (uint)puVar6;
            }
            if ((uint *)local_d4[(int)puVar5 * 4 + 1] < puVar6) {
              local_d4[(int)puVar5 * 4 + 1] = (uint)puVar6;
            }
            if ((uint *)local_d4[(int)puVar5 * 4 + 2] < puVar6) {
              local_d4[(int)puVar5 * 4 + 2] = (uint)puVar6;
            }
            if ((uint *)local_d4[(int)puVar5 * 4 + 3] < puVar6) {
              local_d4[(int)puVar5 * 4 + 3] = (uint)puVar6;
            }
            if (local_3c != 0) goto LAB_100ae7ac;
          }
          puVar6 = local_24;
          local_10 = (uint *)0x0;
          if (local_2c == (uint *)0x0) {
            **(undefined4 **)((int)local_14 * 4 + *(int *)(in_ECX + 0x230)) = 0;
          }
          else {
            local_8 = (uint *)0x0;
            if (local_2c != (uint *)0x0) {
              do {
                iVar3 = local_16c[(int)local_8];
                iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
                *(uint **)(iVar8 + 0xc) = puVar6;
                puVar5 = (uint *)FUN_100ab063(*(undefined4 *)(in_ECX + 0x230),(int)local_14 + 1,
                                              *(undefined4 *)(in_ECX + 0x224),iVar3,iVar8,&local_1c)
                ;
                if (local_10 < puVar5) {
                  local_10 = puVar5;
                }
                local_8 = (uint *)((int)local_8 + 1);
                local_d4[*(int *)(iVar8 + 0x10) + (int)puVar6 * 4] = (uint)puVar5;
              } while (local_8 < local_2c);
            }
            if ((uint *)local_5c[(int)puVar6] < local_10) {
              local_5c[(int)puVar6] = (uint)local_10;
            }
            FUN_100acb1a();
          }
        }
      }
LAB_100ae7ac:
      local_14 = (uint *)((int)local_14 + 1);
    } while (local_14 < *(uint **)(in_ECX + 0x224));
  }
  if ((((*(int *)(in_ECX + 0x22c) == 0) || ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)) ||
      (param_1 != 0)) || (iVar3 = FUN_100ad87a(), -1 < iVar3)) {
    iVar3 = 0;
  }
  return iVar3;
joined_r0x100adffb:
  if (param_1 == 0) {
joined_r0x100ae004:
    if (param_2 == 0) {
LAB_100ada28:
      FUN_1008b0b5();
    }
  }
  return -0x7fffbffb;
}


