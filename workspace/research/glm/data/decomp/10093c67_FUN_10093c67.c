// 10093c67 size=2985 FUN_10093c67

int FUN_10093c67(void)

{
  uint *puVar1;
  uint *puVar2;
  uint *puVar3;
  int iVar4;
  uint *puVar5;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;
  int in_ECX;
  uint uVar9;
  int iVar10;
  uint uVar11;
  int *piVar12;
  uint uVar13;
  uint uVar14;
  int local_4c [4];
  uint *local_3c;
  uint *local_38;
  int local_34;
  uint local_30;
  uint *local_2c;
  uint *local_28;
  int local_24;
  uint *local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_8 = 0;
  FUN_1008af0b();
  FUN_1008a979();
  local_24 = -1;
  local_14 = -1;
  local_1c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_1c * 4);
      uVar14 = *puVar1;
      uVar13 = uVar14 & 0xfff00000;
      if (uVar13 != 0) {
        local_10 = *(uint *)(in_ECX + 8);
        if (uVar13 == 0x11000000) {
          uVar14 = 0;
          if (puVar1[1] != 0) {
            piVar12 = (int *)puVar1[2];
            do {
              if ((**(byte **)(*(int *)(in_ECX + 0x14) +
                              *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar12 * 4) + 0x30) * 4)
                  & 4) == 0) break;
              uVar14 = uVar14 + 1;
              piVar12 = piVar12 + 1;
            } while (uVar14 < puVar1[1]);
          }
          if (uVar14 != puVar1[1]) goto LAB_10094739;
LAB_10094728:
          uVar14 = 0;
          puVar1[1] = 0;
          puVar1[3] = 0;
LAB_10094730:
          local_8 = 1;
LAB_10094737:
          *puVar1 = uVar14;
        }
        else {
          uVar9 = uVar14 & 0xf0000000;
          if (uVar9 == 0x10000000) {
            local_c = 0;
            local_10 = 0;
            if (puVar1[3] != 0) {
              do {
                puVar5 = *(uint **)(local_10 * 4 + puVar1[4]);
                iVar7 = *(int *)(in_ECX + 0x14);
                local_2c = *(uint **)(*(int *)(iVar7 + *(int *)(local_10 * 4 + puVar1[2]) * 4) +
                                     0x30);
                if (((*puVar1 & 0xfff00000) == 0x10000000) || ((*puVar1 & 0xfff00000) == 0x10100000)
                   ) {
                  puVar2 = *(uint **)(iVar7 + (int)puVar5 * 4);
                  puVar3 = *(uint **)(iVar7 + (int)local_2c * 4);
                  uVar14 = *puVar2;
                  uVar9 = *puVar3 | uVar14;
                  uVar6 = uVar9 & 0xe000000;
                  uVar13 = 0x2000000;
                  if (((uVar9 & 0x2000000) != 0) ||
                     ((uVar13 = 0x4000000, (uVar9 & 0x4000000) != 0 ||
                      (uVar13 = 0x8000000, (uVar9 & 0x8000000) != 0)))) {
                    uVar6 = uVar13;
                  }
                  if (uVar6 != (uVar14 & 0xe000000)) {
                    *puVar2 = uVar14 & 0xf1ffffff | uVar6;
                    local_8 = 1;
                  }
                  local_30 = *puVar3;
                  if (((uVar6 != (local_30 & 0xe000000)) &&
                      ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar3[1] * 4) + 4) & 2) != 0))
                     && (puVar3[0x17] == 1)) {
                    *puVar3 = local_30 & 0xf1ffffff | uVar6;
                    local_8 = 1;
                  }
                }
                local_28 = puVar5;
                iVar7 = FUN_1008d966(puVar1,puVar5,local_2c);
                if (iVar7 < 0) {
                  return iVar7;
                }
                iVar7 = *(int *)(in_ECX + 0x14);
                piVar12 = (int *)(iVar7 + (int)puVar5 * 4);
                puVar2 = *(uint **)(*piVar12 + 0x30);
                if (puVar2 == puVar5) {
                  local_c = local_c + 1;
                }
                else if (*(int *)(*(int *)(iVar7 + (int)puVar2 * 4) + 0x30) == -1) {
                  iVar10 = *(int *)(*piVar12 + 0x30);
                  *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30) = iVar10;
                }
                local_10 = local_10 + 1;
              } while (local_10 < puVar1[3]);
            }
            if (local_c == puVar1[3]) goto LAB_10094739;
            local_c = 0;
            local_8 = 0;
            if (puVar1[3] == 0) {
LAB_10093ecd:
              uVar14 = 0;
            }
            else {
              do {
                iVar7 = *(int *)(puVar1[4] + local_8 * 4);
                iVar10 = *(int *)(in_ECX + 0x14);
                if (*(int *)(*(int *)(iVar10 + iVar7 * 4) + 0x30) == iVar7) {
                  iVar10 = local_c * 4;
                  local_c = local_c + 1;
                  *(int *)(iVar10 + puVar1[4]) = iVar7;
                  *(undefined4 *)(iVar10 + puVar1[2]) = *(undefined4 *)(puVar1[2] + local_8 * 4);
                }
                else {
                  iVar7 = *(int *)(iVar10 + iVar7 * 4);
                  iVar10 = *(int *)(iVar10 + *(int *)(iVar7 + 0x30) * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 4)
                       & 2) != 0) && (*(int *)(iVar10 + 0x60) == 0)) {
                    *(undefined4 *)(iVar10 + 0x60) = *(undefined4 *)(iVar7 + 0x60);
                    *(undefined4 *)(iVar10 + 100) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + local_8 * 4) * 4)
                          + 100);
                  }
                }
                local_8 = local_8 + 1;
              } while (local_8 < puVar1[3]);
              if (local_c == 0) goto LAB_10093ecd;
              uVar14 = (*puVar1 ^ local_c) & 0xfffff ^ *puVar1;
            }
            puVar1[1] = local_c;
            puVar1[3] = local_c;
            goto LAB_10094730;
          }
          if (uVar9 != 0x20000000) {
            if (uVar9 == 0x30000000) {
              local_18 = 0;
              local_c = 0;
              if (puVar1[3] != 0) {
                do {
                  uVar14 = *(uint *)(puVar1[4] + local_c * 4);
                  uVar13 = puVar1[2];
                  iVar7 = *(int *)(in_ECX + 0x14);
                  local_3c = *(uint **)(*(int *)(iVar7 + *(int *)(uVar13 + local_c * 4) * 4) + 0x30)
                  ;
                  local_28 = *(uint **)(*(int *)(iVar7 + *(int *)(uVar13 + (local_c + puVar1[3]) * 4
                                                                 ) * 4) + 0x30);
                  local_34 = *(int *)(*(int *)(iVar7 + *(int *)(uVar13 + (local_c + puVar1[3] * 2) *
                                                                         4) * 4) + 0x30);
                  if ((*puVar1 & 0xfff00000) == 0x30000000) {
                    local_2c = *(uint **)(iVar7 + (int)local_28 * 4);
                    local_20 = *(uint **)(iVar7 + local_34 * 4);
                    uVar13 = *local_2c;
                    uVar6 = *local_20 | uVar13;
                    uVar11 = uVar6 & 0xe000000;
                    uVar9 = 0x8000000;
                    if ((((uVar6 & 0x8000000) != 0) || (uVar9 = 0x4000000, (uVar6 & 0x4000000) != 0)
                        ) || (uVar9 = 0x2000000, (uVar6 & 0x2000000) != 0)) {
                      uVar11 = uVar9;
                    }
                    uVar11 = uVar11 | **(uint **)(iVar7 + uVar14 * 4) & 0xe000000;
                    uVar9 = 0x2000000;
                    if ((((uVar11 & 0x2000000) != 0) ||
                        (uVar9 = 0x4000000, (uVar11 & 0x4000000) != 0)) ||
                       (uVar9 = 0x8000000, (uVar11 & 0x8000000) != 0)) {
                      uVar11 = uVar9;
                    }
                    if (((uVar11 != (uVar13 & 0xe000000)) &&
                        ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_2c[1] * 4) + 4) & 2) !=
                         0)) && (local_2c[0x17] == 1)) {
                      *local_2c = uVar13 & 0xf1ffffff | uVar11;
                      local_8 = 1;
                    }
                    local_38 = (uint *)*local_20;
                    if (((uVar11 != ((uint)local_38 & 0xe000000)) &&
                        ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_20[1] * 4) + 4) & 2) !=
                         0)) && (local_20[0x17] == 1)) {
                      *local_20 = (uint)local_38 & 0xf1ffffff | uVar11;
                      local_8 = 1;
                    }
                  }
                  local_30 = uVar14;
                  iVar7 = FUN_1008f014(puVar1,uVar14,local_3c,local_28,local_34);
                  if (iVar7 < 0) {
                    return iVar7;
                  }
                  iVar7 = *(int *)(in_ECX + 0x14);
                  piVar12 = (int *)(iVar7 + uVar14 * 4);
                  uVar13 = *(uint *)(*piVar12 + 0x30);
                  if (uVar13 == uVar14) {
                    local_18 = local_18 + 1;
                  }
                  else if (*(int *)(*(int *)(iVar7 + uVar13 * 4) + 0x30) == -1) {
                    iVar10 = *(int *)(*piVar12 + 0x30);
                    *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30) = iVar10;
                  }
                  local_c = local_c + 1;
                } while (local_c < puVar1[3]);
              }
              uVar14 = puVar1[3];
              if (local_18 != uVar14) {
                if (local_18 == 0) {
                  local_20 = (uint *)0x1;
                  if (1 < uVar14) {
                    piVar12 = (int *)puVar1[4];
                    iVar7 = *(int *)(in_ECX + 0x14);
                    iVar10 = *piVar12;
                    do {
                      piVar12 = piVar12 + 1;
                      if (*(int *)(*(int *)(iVar7 + *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30) *
                                                    4) + 4) !=
                          *(int *)(*(int *)(iVar7 + *(int *)(*(int *)(iVar7 + *piVar12 * 4) + 0x30)
                                                    * 4) + 4)) {
                        uVar14 = puVar1[3];
                        if (uVar14 != 0) goto LAB_10094404;
                        break;
                      }
                      local_20 = (uint *)((int)local_20 + 1);
                    } while (local_20 < (uint *)puVar1[3]);
                  }
                  local_10 = 0;
                  if (puVar1[3] != 0) {
                    do {
                      iVar7 = *(int *)(*(int *)(in_ECX + 0x14) +
                                      *(int *)(puVar1[4] + local_10 * 4) * 4);
                      iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar7 + 0x30) * 4);
                      if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) +
                                     4) & 2) != 0) && (*(int *)(iVar10 + 0x60) == 0)) {
                        *(undefined4 *)(iVar10 + 0x60) = *(undefined4 *)(iVar7 + 0x60);
                        *(undefined4 *)(iVar10 + 100) =
                             *(undefined4 *)
                              (*(int *)(*(int *)(in_ECX + 0x14) +
                                       *(int *)(puVar1[4] + local_10 * 4) * 4) + 100);
                      }
                      local_10 = local_10 + 1;
                    } while (local_10 < puVar1[3]);
                  }
                  goto LAB_10094728;
                }
LAB_10094404:
                local_18 = 0;
                if (uVar14 != 0) {
                  do {
                    uVar14 = *(uint *)(puVar1[4] + local_18 * 4);
                    local_3c = *(uint **)(*(int *)(in_ECX + 0x14) + uVar14 * 4);
                    if (local_3c[0xc] != uVar14) {
                      uVar13 = **(uint **)(*(int *)(in_ECX + 0x14) + local_3c[0xc] * 4) & 0xf1ffffff
                               | *local_3c;
                      if (*local_3c != uVar13) {
                        *local_3c = uVar13;
                        local_8 = 1;
                      }
                      *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar14 * 4) + 0x30) = uVar14;
                    }
                    local_18 = local_18 + 1;
                  } while (local_18 < puVar1[3]);
                }
                uVar14 = local_10;
                uVar13 = local_10;
                if (local_10 < *(uint *)(in_ECX + 8)) {
                  do {
                    if (*(int *)(*(int *)(in_ECX + 0x14) + uVar13 * 4) != 0) {
                      FUN_1006db35();
                      uVar14 = local_10;
                    }
                    uVar13 = uVar13 + 1;
                  } while (uVar13 < *(uint *)(in_ECX + 8));
                }
                goto LAB_1009447c;
              }
              goto LAB_10094739;
            }
            if (uVar13 != 0x50000000) {
              if (uVar14 == 0x50100004) {
                iVar7 = *(int *)(in_ECX + 0x14);
                local_4c[2] = -1;
                local_4c[1] = -1;
                local_4c[3] = 1;
                local_4c[0] = 1;
                piVar12 = (int *)puVar1[2];
                iVar10 = *(int *)(iVar7 + *piVar12 * 4);
                local_18 = *(uint *)(iVar7 + piVar12[3] * 4);
                local_20 = *(uint **)(iVar7 + piVar12[1] * 4);
                iVar4 = *(int *)(in_ECX + 0x10);
                if (((*(byte *)(*(int *)(iVar4 + *(int *)(iVar10 + 4) * 4) + 5) & 1) == 0) ||
                   (*(int *)(iVar10 + 8) != -1)) {
                  if (*(int *)(*(int *)(iVar7 + *(int *)(puVar1[4] + 4) * 4) + 0x5c) == 0) {
                    local_4c[1] = 0;
                  }
LAB_10094609:
                  if (*(int *)(*(int *)(iVar7 + *(int *)(puVar1[4] + 8) * 4) + 0x5c) == 0) {
                    local_4c[2] = 0;
                  }
                  if ((local_4c[1] == -1) || (local_4c[2] == -1)) goto LAB_10094739;
                }
                else if (*(double *)(iVar10 + 0x20) <= 0.0) {
                  local_4c[1] = 0;
LAB_100945f0:
                  local_4c[2] = 0;
                }
                else {
                  local_4c[1] = 2;
                  if (((*(byte *)(*(int *)(iVar4 + local_20[1] * 4) + 5) & 1) == 0) ||
                     (local_20[2] != 0xffffffff)) goto LAB_10094609;
                  if (*(double *)(local_20 + 8) <= 0.0) goto LAB_100945f0;
                  if (((*(byte *)(*(int *)(iVar4 + *(int *)(local_18 + 4) * 4) + 5) & 1) == 0) ||
                     (*(int *)(local_18 + 8) != -1)) goto LAB_10094609;
                  if (*(double *)(local_18 + 0x20) == 0.0) {
                    local_4c[2] = 1;
                  }
                  else {
                    if (*(double *)(local_18 + 0x20) != 1.0) goto LAB_10094609;
                    local_4c[2] = 3;
                  }
                }
                uVar14 = 0;
                do {
                  iVar7 = *(int *)((int)local_4c + uVar14);
                  if (iVar7 == 0) {
                    if (local_14 == -1) {
                      local_14 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0);
                      *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_14 * 4) + 0x30) = local_14;
                    }
                    iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar14 + puVar1[4]) * 4);
                    iVar10 = local_14;
LAB_100946d4:
                    *(int *)(iVar7 + 0x30) = iVar10;
                  }
                  else {
                    if (iVar7 == 1) {
                      if (local_24 == -1) {
                        local_24 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,
                                                0x3ff0000000000000);
                        *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_24 * 4) + 0x30) = local_24
                        ;
                      }
                      iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar14 + puVar1[4]) * 4);
                      iVar10 = local_24;
                      goto LAB_100946d4;
                    }
                    if (iVar7 == 2) {
                      uVar8 = *(undefined4 *)puVar1[2];
LAB_1009464e:
                      *(undefined4 *)
                       (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar14 + puVar1[4]) * 4) + 0x30)
                           = uVar8;
                    }
                    else if (iVar7 == 3) {
                      uVar8 = *(undefined4 *)(puVar1[2] + 4);
                      goto LAB_1009464e;
                    }
                  }
                  local_3c = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(uVar14 + puVar1[4]) * 4);
                  iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + local_3c[0xc] * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4) &
                       2) != 0) && (*(int *)(iVar7 + 0x60) == 0)) {
                    *(uint *)(iVar7 + 0x60) = local_3c[0x18];
                    *(undefined4 *)(iVar7 + 100) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar14 + puVar1[4]) * 4) +
                          100);
                  }
                  uVar14 = uVar14 + 4;
                } while (uVar14 < 0x10);
                goto LAB_10094728;
              }
              goto LAB_10094739;
            }
            iVar7 = FUN_100873f3(puVar1,1);
            if (iVar7 < 0) {
              return iVar7;
            }
            if (iVar7 != 1) {
              local_8 = 1;
            }
            iVar7 = *(int *)puVar1[4];
            iVar10 = *(int *)(in_ECX + 0x14);
            if (*(int *)(*(int *)(iVar10 + iVar7 * 4) + 0x30) == iVar7) goto LAB_10094739;
            iVar7 = *(int *)(iVar10 + iVar7 * 4);
            iVar10 = *(int *)(iVar10 + *(int *)(iVar7 + 0x30) * 4);
            if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 4) & 2)
                 != 0) && (*(int *)(iVar10 + 0x60) == 0)) {
              *(undefined4 *)(iVar10 + 0x60) = *(undefined4 *)(iVar7 + 0x60);
              *(undefined4 *)(iVar10 + 100) =
                   *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar1[4] * 4) + 100);
            }
            uVar14 = 0;
            puVar1[1] = 0;
            puVar1[3] = 0;
            goto LAB_10094737;
          }
          local_18 = 0;
          local_c = 0;
          if (puVar1[3] != 0) {
            do {
              puVar5 = *(uint **)(local_c * 4 + puVar1[4]);
              iVar7 = *(int *)(in_ECX + 0x14);
              local_2c = *(uint **)(*(int *)(iVar7 + *(int *)(local_c * 4 + puVar1[2]) * 4) + 0x30);
              local_34 = *(int *)(*(int *)(iVar7 + *(int *)(puVar1[2] + (puVar1[3] + local_c) * 4) *
                                                   4) + 0x30);
              if (((*puVar1 & 0xfff00000) == 0x20000000) || ((*puVar1 & 0xfff00000) == 0x20100000))
              {
                local_28 = *(uint **)(iVar7 + (int)local_2c * 4);
                local_20 = *(uint **)(iVar7 + local_34 * 4);
                uVar14 = *local_28;
                uVar9 = *local_20 | uVar14;
                uVar6 = uVar9 & 0xe000000;
                uVar13 = 0x8000000;
                if (((uVar9 & 0x8000000) != 0) ||
                   ((uVar13 = 0x4000000, (uVar9 & 0x4000000) != 0 ||
                    (uVar13 = 0x2000000, (uVar9 & 0x2000000) != 0)))) {
                  uVar6 = uVar13;
                }
                uVar6 = uVar6 | **(uint **)(iVar7 + (int)puVar5 * 4) & 0xe000000;
                uVar13 = 0x2000000;
                if ((((uVar6 & 0x2000000) != 0) || (uVar13 = 0x4000000, (uVar6 & 0x4000000) != 0))
                   || (uVar13 = 0x8000000, (uVar6 & 0x8000000) != 0)) {
                  uVar6 = uVar13;
                }
                if (((uVar6 != (uVar14 & 0xe000000)) &&
                    ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_28[1] * 4) + 4) & 2) != 0))
                   && (local_28[0x17] == 1)) {
                  *local_28 = uVar14 & 0xf1ffffff | uVar6;
                  local_8 = 1;
                }
                local_30 = *local_20;
                if (((uVar6 != (local_30 & 0xe000000)) &&
                    ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_20[1] * 4) + 4) & 2) != 0))
                   && (local_20[0x17] == 1)) {
                  *local_20 = local_30 & 0xf1ffffff | uVar6;
                  local_8 = 1;
                }
              }
              local_38 = puVar5;
              iVar7 = FUN_1008e097(puVar1,puVar5,local_2c,local_34);
              if (iVar7 < 0) {
                return iVar7;
              }
              iVar7 = *(int *)(in_ECX + 0x14);
              piVar12 = (int *)(iVar7 + (int)puVar5 * 4);
              puVar2 = *(uint **)(*piVar12 + 0x30);
              if (puVar2 == puVar5) {
                local_18 = local_18 + 1;
              }
              else if (*(int *)(*(int *)(iVar7 + (int)puVar2 * 4) + 0x30) == -1) {
                iVar10 = *(int *)(*piVar12 + 0x30);
                *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30) = iVar10;
              }
              local_c = local_c + 1;
            } while (local_c < puVar1[3]);
          }
          uVar14 = puVar1[3];
          if (local_18 != uVar14) {
            if (local_18 == 0) {
              local_20 = (uint *)0x1;
              if (1 < uVar14) {
                piVar12 = (int *)puVar1[4];
                iVar7 = *(int *)(in_ECX + 0x14);
                iVar10 = *piVar12;
                do {
                  piVar12 = piVar12 + 1;
                  if (*(int *)(*(int *)(iVar7 + *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30) * 4) +
                              4) !=
                      *(int *)(*(int *)(iVar7 + *(int *)(*(int *)(iVar7 + *piVar12 * 4) + 0x30) * 4)
                              + 4)) {
                    uVar14 = puVar1[3];
                    if (uVar14 != 0) goto LAB_1009412b;
                    break;
                  }
                  local_20 = (uint *)((int)local_20 + 1);
                } while (local_20 < (uint *)puVar1[3]);
              }
              local_c = 0;
              if (puVar1[3] != 0) {
                do {
                  iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + local_c * 4) * 4);
                  iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar7 + 0x30) * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 4)
                       & 2) != 0) && (*(int *)(iVar10 + 0x60) == 0)) {
                    *(undefined4 *)(iVar10 + 0x60) = *(undefined4 *)(iVar7 + 0x60);
                    *(undefined4 *)(iVar10 + 100) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + local_c * 4) * 4)
                          + 100);
                  }
                  local_c = local_c + 1;
                } while (local_c < puVar1[3]);
              }
              goto LAB_10094728;
            }
LAB_1009412b:
            local_18 = 0;
            if (uVar14 != 0) {
              do {
                uVar14 = *(uint *)(puVar1[4] + local_18 * 4);
                local_38 = *(uint **)(*(int *)(in_ECX + 0x14) + uVar14 * 4);
                if (local_38[0xc] != uVar14) {
                  uVar13 = **(uint **)(*(int *)(in_ECX + 0x14) + local_38[0xc] * 4) & 0xf1ffffff |
                           *local_38;
                  if (*local_38 != uVar13) {
                    *local_38 = uVar13;
                    local_8 = 1;
                  }
                  *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar14 * 4) + 0x30) = uVar14;
                }
                local_18 = local_18 + 1;
              } while (local_18 < puVar1[3]);
            }
            uVar14 = local_10;
            uVar13 = local_10;
            if (local_10 < *(uint *)(in_ECX + 8)) {
              do {
                if (*(int *)(*(int *)(in_ECX + 0x14) + uVar13 * 4) != 0) {
                  FUN_1006db35();
                }
                uVar13 = uVar13 + 1;
                uVar14 = local_10;
              } while (uVar13 < *(uint *)(in_ECX + 8));
            }
LAB_1009447c:
            *(uint *)(in_ECX + 8) = uVar14;
          }
        }
LAB_10094739:
        if (puVar1[3] != 0) {
          local_18 = 0;
          if (puVar1[3] != 0) {
            piVar12 = (int *)puVar1[4];
            do {
              puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) + *piVar12 * 4);
              local_30 = *puVar5;
              if (((((local_30 & 0x40) != 0) ||
                   ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar5[1] * 4) + 4) & 0x11028) !=
                    0)) || ((local_30 & 4) == 0)) || ((local_30 & 8) == 0)) break;
              local_18 = local_18 + 1;
              piVar12 = piVar12 + 1;
            } while (local_18 < puVar1[3]);
          }
          if (local_18 == puVar1[3]) {
            if (local_14 == -1) {
              local_14 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0);
              *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_14 * 4) + 0x30) = local_14;
            }
            uVar14 = 0;
            if (puVar1[3] != 0) {
              do {
                iVar7 = uVar14 * 4;
                uVar14 = uVar14 + 1;
                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + iVar7) * 4) + 0x30)
                     = local_14;
              } while (uVar14 < puVar1[3]);
            }
            *puVar1 = 0;
            puVar1[1] = 0;
            puVar1[3] = 0;
            local_8 = 1;
          }
        }
      }
      local_1c = local_1c + 1;
    } while (local_1c < *(uint *)(in_ECX + 0xc));
    if (local_8 != 0) {
      FUN_1008af24();
      return 0;
    }
  }
  return 1;
}


