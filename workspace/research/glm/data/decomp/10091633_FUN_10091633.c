// 10091633 size=4195 FUN_10091633

undefined4
FUN_10091633(uint *param_1,uint param_2,int param_3,int *param_4,uint *param_5,uint param_6,
            uint param_7)

{
  int *piVar1;
  double *pdVar2;
  double dVar3;
  int iVar4;
  undefined4 *puVar5;
  int iVar6;
  uint *puVar7;
  int iVar8;
  undefined4 uVar9;
  int in_ECX;
  uint uVar10;
  int *piVar11;
  uint uVar12;
  uint *puVar13;
  bool bVar14;
  uint local_d0 [4];
  double local_c0 [4];
  double adStack_a0 [4];
  undefined8 local_80;
  undefined8 local_78;
  int local_70;
  uint local_6c [4];
  uint *local_5c;
  uint *local_58;
  undefined8 local_54;
  undefined8 local_4c;
  uint *local_44;
  uint local_40 [4];
  uint local_30;
  uint local_2c;
  uint local_28;
  uint local_24;
  int local_20;
  uint *local_1c;
  uint local_18;
  int *local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  if (param_2 == 0) {
    return 1;
  }
  if (4 < param_2) {
    return 0;
  }
  uVar12 = 1;
  if (1 < param_2) {
    do {
      iVar6 = FUN_10089db5(*param_1,param_1[uVar12]);
      if (iVar6 == 0) break;
      uVar12 = uVar12 + 1;
    } while (uVar12 < param_2);
  }
  if (uVar12 != param_2) {
    puVar13 = param_1;
    puVar7 = local_40;
    for (uVar12 = param_2 & 0x3fffffff; uVar12 != 0; uVar12 = uVar12 - 1) {
      *puVar7 = *puVar13;
      puVar13 = puVar13 + 1;
      puVar7 = puVar7 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(char *)puVar7 = (char)*puVar13;
      puVar13 = (uint *)((int)puVar13 + 1);
      puVar7 = (uint *)((int)puVar7 + 1);
    }
    local_30 = param_2 << 2;
    puVar13 = local_6c;
    for (uVar12 = param_2 & 0x3fffffff; uVar12 != 0; uVar12 = uVar12 - 1) {
      *puVar13 = 0;
      puVar13 = puVar13 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(undefined1 *)puVar13 = 0;
      puVar13 = (uint *)((int)puVar13 + 1);
    }
    if ((param_3 == 0) || (local_20 = 0, (*param_5 & 0xfff00000) == 0x11200000)) {
      local_20 = 1;
    }
    local_10 = 0;
    local_8 = 0;
    if (param_2 != 0) {
      puVar13 = local_40;
      local_1c = puVar13;
LAB_100916f1:
      uVar12 = *puVar13;
      local_1c = puVar13;
LAB_100916f3:
      local_24 = uVar12;
      iVar6 = FUN_10089d4b(uVar12,param_5,param_6,param_7);
      if (iVar6 != 0) {
        local_54 = 1.0;
        local_4c = 0.0;
        if (uVar12 != 0xffffffff) {
          piVar11 = *(int **)(in_ECX + 0x14);
          do {
            if (((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(piVar11[uVar12] + 4) * 4) +
                           4) & 0x100) != 0) && (*(int *)(piVar11[uVar12] + 8) == -1)) {
              if ((local_54 == 1.0) && (local_4c == 0.0)) goto LAB_100917f5;
              piVar1 = piVar11 + uVar12;
              uVar12 = 0;
              bVar14 = *(int *)(in_ECX + 8) == 0;
              dVar3 = local_54 * *(double *)(*piVar1 + 0x20) + local_4c;
              if (*(int *)(in_ECX + 8) == 0) goto LAB_100917d0;
              local_14 = piVar11;
              goto LAB_1009179c;
            }
            uVar12 = FUN_10089e08(uVar12,&local_54,&local_4c);
            puVar13 = local_1c;
          } while (uVar12 != 0xffffffff);
        }
      }
      goto LAB_1009181a;
    }
LAB_10091848:
    if (local_10 != param_2) {
      local_c = 0;
      if (param_2 != 0) {
        do {
          local_58 = local_6c + local_c;
          if (local_6c[local_c] == 0) {
            uVar12 = local_40[local_c];
            local_5c = local_40 + local_c;
            iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4);
            if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) & 1) ==
                 0) || (*(int *)(iVar6 + 8) != -1)) {
              local_18 = 0xffffffff;
              local_1c = (uint *)0x0;
              local_24 = 0;
              do {
                local_10 = uVar12;
                iVar6 = FUN_10089d4b(local_10,param_5,param_6,param_7);
                if (iVar6 != 0) {
                  local_4c = 1.0;
                  local_54 = 0.0;
                  for (local_28 = local_10; local_28 != 0xffffffff;
                      local_28 = FUN_10089e08(local_28,&local_4c,&local_54)) {
                    local_14 = (int *)0x0;
                    local_8 = 0;
                    if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_28 * 4) + 0x48) == -1) {
                      local_8 = 0xffffffff;
                    }
                    local_2c = 0;
                    do {
                      if (local_6c[local_2c] == 0) {
                        puVar13 = (uint *)local_40[local_2c];
                        local_44 = puVar13;
                        do {
                          iVar6 = FUN_10089d4b(puVar13,param_5,param_6,param_7);
                          puVar7 = puVar13;
                          if (iVar6 != 0) {
                            for (; puVar7 != (uint *)0xffffffff;
                                puVar7 = (uint *)FUN_10089e08(puVar7,0,0)) {
                              iVar6 = FUN_10089db5(local_28,puVar7);
                              if (iVar6 != 0) {
                                local_14 = (int *)((int)local_14 + 1);
                                if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)puVar7 * 4) +
                                            0x48) != -1) {
                                  iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                           (int)puVar7 * 4) + 0x48) - param_6;
                                  local_8 = local_8 + iVar6 * iVar6;
                                }
LAB_1009197a:
                                if (puVar7 != (uint *)0xffffffff) goto LAB_10091994;
                                break;
                              }
                              if (local_20 != 0) {
                                puVar7 = (uint *)0xffffffff;
                                goto LAB_1009197a;
                              }
                            }
                          }
                          puVar13 = *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) + (int)puVar13 * 4)
                                              + 0x34);
                        } while (local_44 != puVar13);
                      }
LAB_10091994:
                      local_2c = local_2c + 1;
                    } while (local_2c < param_2);
                    if ((local_1c < local_14) ||
                       ((local_1c == (uint *)local_14 && (local_24 < local_8)))) {
                      local_78 = local_4c;
                      local_1c = (uint *)local_14;
                      local_80 = local_54;
                      local_18 = local_28;
                      local_24 = local_8;
                    }
                    if (local_20 != 0) break;
                  }
                }
                uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + local_10 * 4) + 0x34);
              } while (*local_5c != uVar12);
              if (local_18 == 0xffffffff) {
                return 0;
              }
              *local_5c = local_18;
              uVar12 = local_c;
              local_8 = 0;
              local_c0[local_c] = local_78;
              adStack_a0[uVar12] = local_80;
              *local_58 = 1;
              do {
                local_44 = local_6c + local_8;
                if (local_6c[local_8] == 0) {
                  puVar13 = local_40 + local_8;
                  uVar12 = *puVar13;
                  do {
                    local_10 = uVar12;
                    iVar6 = FUN_10089d4b(uVar12,param_5,param_6,param_7);
                    if (iVar6 != 0) {
                      local_54 = 1.0;
                      local_4c = 0.0;
                      for (uVar12 = local_10; uVar12 != 0xffffffff;
                          uVar12 = FUN_10089e08(uVar12,&local_54,&local_4c)) {
                        iVar6 = FUN_10089db5(local_18,uVar12);
                        uVar10 = local_8;
                        if (iVar6 != 0) {
                          local_c0[local_8] = local_54;
                          *puVar13 = uVar12;
                          adStack_a0[uVar10] = local_4c;
                          *local_44 = 1;
LAB_10091ade:
                          if (uVar12 != 0xffffffff) goto LAB_10091af7;
                          break;
                        }
                        if (local_20 != 0) {
                          uVar12 = 0xffffffff;
                          goto LAB_10091ade;
                        }
                      }
                    }
                    uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + local_10 * 4) + 0x34);
                  } while (*puVar13 != uVar12);
                }
LAB_10091af7:
                local_8 = local_8 + 1;
              } while (local_8 < param_2);
            }
          }
          local_c = local_c + 1;
        } while (local_c < param_2);
      }
      uVar12 = 0;
      bVar14 = false;
      local_14 = (int *)0x0;
      local_1c = (uint *)0x0;
      local_2c = 0;
      if (param_2 != 0) {
        do {
          iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[uVar12] * 4);
          iVar8 = FUN_10089db5(local_40[uVar12],local_40[0]);
          if (iVar8 == 0) {
            bVar14 = true;
          }
          if (local_c0[uVar12] != 1.0) {
            local_14 = (int *)0x1;
          }
          if (adStack_a0[uVar12] != 0.0) {
            local_1c = (uint *)0x1;
          }
          if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) & 1) != 0
              ) && (*(int *)(iVar6 + 8) == -1)) {
            local_2c = 1;
          }
          uVar12 = uVar12 + 1;
        } while (uVar12 < param_2);
        if (((local_14 != (int *)0x0) || (local_1c != (uint *)0x0)) || (bVar14)) {
          if (local_20 == 0) {
            param_7 = 0;
            local_c = 0;
            local_10 = (*(int *)(in_ECX + 0x6c) << 0x1d) >> 0x1f;
            param_6 = 0;
            do {
              iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[local_c] * 4);
              uVar10 = 0;
              uVar12 = local_c;
              if ((local_10 == 0) && ((*(byte *)(in_ECX + 0x6c) & 2) == 0)) {
                iVar8 = *(int *)(iVar6 + 4);
                uVar12 = uVar10;
                if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar8 * 4) + 5) & 1) == 0) ||
                   (*(int *)(iVar6 + 8) != -1)) {
                  if (param_6 != 0) {
                    do {
                      iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[uVar10] * 4);
                      if (((*(double *)((int)local_c0 + param_6) == local_c0[uVar10]) &&
                          (*(double *)((int)adStack_a0 + param_6) == adStack_a0[uVar10])) &&
                         ((iVar8 == *(int *)(iVar4 + 4) &&
                          (((*(int *)(iVar6 + 8) == *(int *)(iVar4 + 8) &&
                            (*(int *)(iVar6 + 0xc) == *(int *)(iVar4 + 0xc))) &&
                           (uVar12 = uVar10, *(int *)(iVar6 + 0x10) == *(int *)(iVar4 + 0x10)))))))
                      break;
                      uVar10 = uVar10 + 1;
                      uVar12 = uVar10;
                    } while (uVar10 < local_c);
                  }
                }
                else if (param_6 != 0) {
                  do {
                    iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[uVar10] * 4);
                    if (((iVar8 == *(int *)(iVar4 + 4)) && (*(int *)(iVar4 + 8) == -1)) &&
                       (uVar12 = uVar10, *(double *)(iVar6 + 0x20) == *(double *)(iVar4 + 0x20)))
                    break;
                    uVar10 = uVar10 + 1;
                    uVar12 = uVar10;
                  } while (uVar10 < local_c);
                }
              }
              local_d0[local_c] = uVar12;
              uVar10 = local_30;
              if (local_c == uVar12) {
                param_7 = param_7 + 1;
              }
              param_6 = param_6 + 8;
              local_c = local_c + 1;
            } while (local_c < param_2);
            local_24 = 0xffffffff;
            bVar14 = true;
            local_8 = 0;
            local_c = 0;
            do {
              if (local_c == local_d0[local_c]) {
                iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[local_c] * 4);
                if (*(int *)(in_ECX + 0x88) == *(int *)(iVar6 + 4)) {
                  local_18 = param_7;
                  uVar12 = 0;
                  do {
                    if (((uVar12 == local_d0[uVar12]) &&
                        (iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[uVar12] * 4),
                        *(int *)(in_ECX + 0x88) == *(int *)(iVar8 + 4))) &&
                       ((*(int *)(iVar6 + 0xc) == *(int *)(iVar8 + 0xc) &&
                        ((local_c0[uVar12] == 1.0 && (adStack_a0[uVar12] == 0.0)))))) {
                      local_18 = local_18 - 1;
                    }
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < param_2);
                  if ((*(int *)(param_3 + *(int *)(iVar6 + 0xc) * 4) + local_18 < 5) &&
                     (local_18 < local_24)) {
                    bVar14 = false;
                    local_24 = local_18;
                    local_8 = local_c;
                  }
                }
              }
              local_c = local_c + 1;
            } while (local_c < param_2);
            if ((((local_10 != 0) || ((*(byte *)(in_ECX + 0x6c) & 2) != 0)) &&
                (0xfffffff < (*param_5 & 0xf0000000))) && ((*param_5 & 0xf0000000) < 0x40000001)) {
              local_10 = 0;
              do {
                if (bVar14) break;
                iVar6 = *(int *)(in_ECX + 0x14);
                iVar8 = *(int *)(iVar6 + local_40[local_10] * 4);
                if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 5) &
                      1) == 0) || (*(int *)(iVar8 + 8) == -1)) &&
                   (*(int *)(iVar8 + 0x10) !=
                    *(int *)(*(int *)(iVar6 + *(int *)(local_10 * 4 + param_5[4]) * 4) + 0x10))) {
                  local_18 = 0;
                  param_7 = 0;
                  do {
                    iVar4 = *(int *)(iVar6 + local_40[param_7] * 4);
                    if (((*(int *)(iVar4 + 4) == *(int *)(iVar8 + 4)) &&
                        (*(int *)(iVar4 + 0xc) == *(int *)(iVar8 + 0xc))) &&
                       (*(int *)(iVar4 + 8) == *(int *)(iVar8 + 8))) {
                      local_18 = local_18 + 1;
                    }
                    param_7 = param_7 + 1;
                  } while (param_7 < param_2);
                  if (1 < local_18) {
                    bVar14 = true;
                  }
                }
                local_10 = local_10 + 1;
              } while (local_10 < param_2);
            }
            uVar12 = *param_5 & 0xfff00000;
            if (((((uVar12 == 0x10000000) && ((*(byte *)(in_ECX + 0x6c) & 8) == 0)) &&
                 ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                     *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                      *(int *)param_5[4] * 4) + 4) * 4) + 4) & 0x20)
                  != 0)) || ((uVar12 == 0x11200000 || (uVar12 != 0x10000000)))) ||
               ((local_14 != (int *)0x0 || ((local_1c != (uint *)0x0 || (local_2c != 0)))))) {
              local_70 = -1;
              if (bVar14) {
                iVar6 = *param_4;
                *param_4 = iVar6 + 1;
              }
              else {
                iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_40[local_8] * 4) + 0xc);
              }
              iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)param_5[4] * 4);
              local_58 = (uint *)*(uint *)(iVar8 + 0x14);
              local_5c = (uint *)*(uint *)(iVar8 + 0x18);
              puVar13 = local_6c;
              for (uVar12 = local_30 >> 2; uVar12 != 0; uVar12 = uVar12 - 1) {
                *puVar13 = 0;
                puVar13 = puVar13 + 1;
              }
              for (uVar10 = uVar10 & 3; uVar10 != 0; uVar10 = uVar10 - 1) {
                *(undefined1 *)puVar13 = 0;
                puVar13 = (uint *)((int)puVar13 + 1);
              }
              local_1c = (uint *)iVar6;
              uVar12 = 0;
              do {
                if ((uVar12 != local_d0[uVar12]) ||
                   ((((iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[uVar12] * 4),
                      *(int *)(in_ECX + 0x88) == *(int *)(iVar8 + 4) &&
                      (iVar6 == *(int *)(iVar8 + 0xc))) && (local_c0[uVar12] == 1.0)) &&
                    (adStack_a0[uVar12] == 0.0)))) {
                  local_6c[uVar12] = 1;
                }
                uVar12 = uVar12 + 1;
              } while (uVar12 < param_2);
              if (!bVar14) {
                local_c = 0;
                do {
                  if (local_6c[local_c] == 0) {
                    uVar12 = local_40[local_c];
                    iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4);
                    if (*(int *)(in_ECX + 0x88) == *(int *)(iVar6 + 4)) {
                      local_14 = (int *)0x0;
                      local_18 = 0;
                      param_6 = 0;
                      do {
                        if (local_6c[param_6] == 0) {
                          local_14 = (int *)((int)local_14 + 1);
                          iVar8 = FUN_10089db5(uVar12,local_40[param_6]);
                          if ((iVar8 != 0) &&
                             ((local_18 = local_18 + 1, local_c0[param_6] != 1.0 ||
                              (adStack_a0[param_6] != 0.0)))) break;
                        }
                        param_6 = param_6 + 1;
                      } while (param_6 < param_2);
                      if (param_2 <= param_6) {
                        iVar6 = *(int *)(iVar6 + 0xc);
                        piVar11 = (int *)(param_3 + (int)local_1c * 4);
                        if ((*(int *)(param_3 + iVar6 * 4) - local_18) + *piVar11 + (int)local_14 <
                            5) {
                          uVar12 = 0;
                          do {
                            if (((local_6c[uVar12] == 0) &&
                                (iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[uVar12] * 4),
                                *(int *)(in_ECX + 0x88) == *(int *)(iVar8 + 4))) &&
                               (iVar6 == *(int *)(iVar8 + 0xc))) {
                              local_6c[uVar12] = 1;
                            }
                            uVar12 = uVar12 + 1;
                          } while (uVar12 < param_2);
                          uVar12 = 0;
                          if (*(int *)(in_ECX + 8) != 0) {
                            do {
                              iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4);
                              if ((*(int *)(in_ECX + 0x88) == *(int *)(iVar8 + 4)) &&
                                 (iVar6 == *(int *)(iVar8 + 0xc))) {
                                *(uint **)(iVar8 + 0xc) = local_1c;
                                *(int *)(iVar8 + 0x10) = *(int *)(iVar8 + 0x10) + *piVar11;
                              }
                              uVar12 = uVar12 + 1;
                            } while (uVar12 < *(uint *)(in_ECX + 8));
                          }
                          piVar1 = (int *)(param_3 + iVar6 * 4);
                          *piVar11 = *piVar11 + *piVar1;
                          *piVar1 = 0;
                        }
                      }
                    }
                  }
                  local_c = local_c + 1;
                } while (local_c < param_2);
              }
              if ((*(byte *)(in_ECX + 0x6c) & 6) == 0) {
                local_c = 0;
                do {
                  if (local_6c[local_c] == 0) {
                    puVar13 = local_40 + local_c;
                    uVar12 = *puVar13;
                    iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4);
                    if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5)
                         & 1) == 0) || (*(int *)(iVar6 + 8) != -1)) {
                      param_6 = 0;
                      param_7 = 0;
                      do {
                        if ((local_6c[param_7] == 0) &&
                           (iVar6 = FUN_10089db5(uVar12,local_40[param_7]), iVar6 != 0)) {
                          param_6 = param_6 + 1;
                        }
                        param_7 = param_7 + 1;
                      } while (param_7 < param_2);
                      param_7 = 0;
                      do {
                        if (3 < param_6) break;
                        if (local_6c[param_7] == 0) {
                          iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_40[param_7] * 4);
                          if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4
                                                  ) + 5) & 1) != 0) && (*(int *)(iVar6 + 8) == -1))
                          {
                            dVar3 = *(double *)(iVar6 + 0x20);
                            local_40[param_7] = *puVar13;
                            param_6 = param_6 + 1;
                            adStack_a0[param_7] = dVar3 * local_c0[param_7] + adStack_a0[param_7];
                            local_c0[param_7] = 0.0;
                          }
                        }
                        param_7 = param_7 + 1;
                      } while (param_7 < param_2);
                    }
                  }
                  local_c = local_c + 1;
                } while (local_c < param_2);
              }
              local_c = 0;
              do {
                uVar12 = 0;
                if (local_6c[local_c] == 0) {
                  uVar10 = local_40[local_c];
                  local_80 = (double)CONCAT44(uVar10,(undefined4)local_80);
                  param_7 = 0;
                  local_28 = 0;
                  local_18 = 1;
                  local_20 = 0;
                  local_30 = 1;
                  do {
                    if ((local_6c[uVar12] == 0) &&
                       (iVar6 = FUN_10089db5(uVar10,local_40[uVar12]), iVar6 != 0)) {
                      param_7 = param_7 + 1;
                      pdVar2 = local_c0 + uVar12;
                      if (*pdVar2 != 1.0) {
                        local_28 = 1;
                      }
                      if (*pdVar2 != -1.0) {
                        local_18 = 0;
                      }
                      if (adStack_a0[uVar12] != 0.0) {
                        local_20 = 1;
                      }
                      if (*pdVar2 != 0.0) {
                        local_30 = 0;
                      }
                    }
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < param_2);
                  if (local_30 != 0) {
                    local_28 = 0;
                    local_20 = 0;
                  }
                  if (local_28 == 0) {
LAB_100922f5:
                    if (local_20 != 0) goto LAB_100922fa;
LAB_10092340:
                    if ((local_28 == 0) && (local_20 == 0)) {
                      local_24 = FUN_10086199(param_7 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
                      if (local_24 == 0xffffffff) {
                        return 0;
                      }
                      local_2c = *(uint *)(*(int *)(in_ECX + 0x18) + local_24 * 4);
                      local_10 = local_24;
                      local_8 = local_2c;
                      FUN_100853b0();
                    }
                  }
                  else {
                    if (local_18 == 0) {
                      uVar12 = param_7 & 0xfffff | 0x20500000;
                    }
                    else {
                      uVar12 = param_7 & 0xfffff | 0x10100000;
                    }
                    uVar12 = FUN_10086199(uVar12,0xffffffff,0xffffffff);
                    if (uVar12 == 0xffffffff) {
                      return 0;
                    }
                    uVar10 = *(uint *)(*(int *)(in_ECX + 0x18) + uVar12 * 4);
                    local_2c = uVar10;
                    local_10 = uVar12;
                    FUN_100853b0();
                    if (local_20 == 0) {
                      local_24 = uVar12;
                      local_8 = uVar10;
                      goto LAB_100922f5;
                    }
LAB_100922fa:
                    uVar12 = FUN_10086199(param_7 & 0xfffff | 0x20400000,0xffffffff,0xffffffff);
                    if (uVar12 == 0xffffffff) {
                      return 0;
                    }
                    uVar10 = *(uint *)(*(int *)(in_ECX + 0x18) + uVar12 * 4);
                    local_24 = uVar12;
                    local_8 = uVar10;
                    FUN_100853b0();
                    if (local_28 == 0) {
                      local_10 = uVar12;
                      local_2c = uVar10;
                      goto LAB_10092340;
                    }
                  }
                  local_14 = (int *)(param_7 << 2);
                  iVar6 = 0;
                  param_6 = 0;
                  local_4c = (double)CONCAT44((int)param_1 - (int)local_40,(undefined4)local_4c);
                  do {
                    local_54 = (double)CONCAT44(local_6c + param_6,(undefined4)local_54);
                    if (local_6c[param_6] == 0) {
                      local_44 = local_40 + param_6;
                      uVar12 = *local_44;
                      iVar8 = FUN_10089db5(local_80._4_4_,uVar12);
                      if (iVar8 != 0) {
                        if (local_30 != 0) {
                          uVar12 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,
                                                adStack_a0[param_6]);
                        }
                        uVar10 = local_2c;
                        if (uVar12 == 0xffffffff) {
                          return 0;
                        }
                        iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4);
                        *(uint *)(iVar6 + *(int *)(local_2c + 8)) = uVar12;
                        local_78 = (double)CONCAT44(iVar8,(undefined4)local_78);
                        if (local_30 != 0) {
                          *(uint *)(iVar8 + 0x34) = uVar12;
                        }
                        if (local_28 == 0) {
LAB_10092502:
                          uVar12 = 0;
                          if (local_20 != 0) {
                            bVar14 = *(int *)(in_ECX + 8) == 0;
                            if (*(int *)(in_ECX + 8) != 0) {
                              piVar11 = *(int **)(in_ECX + 0x14);
                              do {
                                iVar8 = *piVar11;
                                if (((*(int *)(in_ECX + 0x78) == *(int *)(iVar8 + 4)) &&
                                    (*(int *)(iVar8 + 8) == -1)) &&
                                   (*(double *)(iVar8 + 0x20) == adStack_a0[param_6])) break;
                                uVar12 = uVar12 + 1;
                                piVar11 = piVar11 + 1;
                              } while (uVar12 < *(uint *)(in_ECX + 8));
                              bVar14 = uVar12 == *(uint *)(in_ECX + 8);
                            }
                            if (bVar14) {
                              uVar12 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,
                                                    adStack_a0[param_6]);
                              if (uVar12 == 0xffffffff) {
                                return 0;
                              }
                              *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4) + 0x34) =
                                   uVar12;
                            }
                            *(uint *)((int)local_14 + *(int *)(local_8 + 8)) = uVar12;
                          }
                        }
                        else {
                          if (local_18 == 0) {
                            uVar9 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,
                                                 local_c0[param_6]);
                            *(undefined4 *)((int)local_14 + *(int *)(uVar10 + 8)) = uVar9;
                            if (*(int *)((int)local_14 + *(int *)(uVar10 + 8)) == -1) {
                              return 0;
                            }
                          }
                          if (local_20 != 0) {
                            if (local_70 == -1) {
                              local_70 = *param_4;
                              *param_4 = local_70 + 1;
                            }
                            puVar13 = (uint *)(param_3 + local_70 * 4);
                            uVar12 = *puVar13;
                            *puVar13 = uVar12 + 1;
                            iVar8 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_70,uVar12,0);
                            if (iVar8 == -1) {
                              return 0;
                            }
                            if (4 < *puVar13) {
                              FUN_1008b0b5();
                            }
                            puVar13 = *(uint **)(*(int *)(in_ECX + 0x14) + iVar8 * 4);
                            puVar13[5] = (uint)local_58;
                            puVar13[6] = (uint)local_5c;
                            *puVar13 = *local_78._4_4_ & 0xe000000;
                            puVar13[0x12] = local_10;
                            *(int *)(iVar6 + *(int *)(local_8 + 8)) = iVar8;
                            *(int *)(iVar6 + *(int *)(local_2c + 0x10)) = iVar8;
                            goto LAB_10092502;
                          }
                        }
                        puVar13 = (uint *)(param_3 + (int)local_1c * 4);
                        uVar12 = *puVar13;
                        *puVar13 = uVar12 + 1;
                        iVar8 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_1c,uVar12,0);
                        if (iVar8 == -1) {
                          return 0;
                        }
                        if (4 < *puVar13) {
                          FUN_1008b0b5();
                        }
                        puVar5 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + iVar8 * 4);
                        puVar5[5] = local_58;
                        puVar5[6] = local_5c;
                        piVar11 = (int *)(local_4c._4_4_ + (int)local_44);
                        *puVar5 = **(undefined4 **)(*(int *)(in_ECX + 0x14) + *piVar11 * 4);
                        puVar5[0x12] = local_24;
                        *(int *)(iVar6 + *(int *)(local_8 + 0x10)) = iVar8;
                        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar8 * 4) + 0x34) =
                             *(undefined4 *)
                              (*(int *)(*(int *)(in_ECX + 0x14) + *piVar11 * 4) + 0x34);
                        *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar11 * 4) + 0x34) = iVar8;
                        *local_44 = *(uint *)(iVar6 + *(int *)(local_8 + 0x10));
                        iVar6 = iVar6 + 4;
                        local_14 = (int *)((int)local_14 + 4);
                        *local_54._4_4_ = 1;
                      }
                    }
                    param_6 = param_6 + 1;
                  } while (param_6 < param_2);
                }
                local_c = local_c + 1;
                if (param_2 <= local_c) {
                  iVar6 = (int)local_d0 - (int)param_1;
                  uVar12 = param_2;
                  do {
                    *param_1 = local_40[*(int *)(iVar6 + (int)param_1)];
                    param_1 = param_1 + 1;
                    uVar12 = uVar12 - 1;
                  } while (uVar12 != 0);
                  uVar12 = 0;
                  do {
                    if (local_6c[uVar12] == 0) {
                      return 0;
                    }
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < param_2);
                  return 1;
                }
              } while( true );
            }
            puVar13 = local_40;
            for (uVar12 = local_30 >> 2; uVar12 != 0; uVar12 = uVar12 - 1) {
              *param_1 = *puVar13;
              puVar13 = puVar13 + 1;
              param_1 = param_1 + 1;
            }
            for (local_30 = local_30 & 3; local_30 != 0; local_30 = local_30 - 1) {
              *(char *)param_1 = (char)*puVar13;
              puVar13 = (uint *)((int)puVar13 + 1);
              param_1 = (uint *)((int)param_1 + 1);
            }
          }
          return 0;
        }
      }
    }
    puVar13 = local_40;
    for (uVar12 = local_30 >> 2; uVar12 != 0; uVar12 = uVar12 - 1) {
      *param_1 = *puVar13;
      puVar13 = puVar13 + 1;
      param_1 = param_1 + 1;
    }
    for (local_30 = local_30 & 3; local_30 != 0; local_30 = local_30 - 1) {
      *(char *)param_1 = (char)*puVar13;
      puVar13 = (uint *)((int)puVar13 + 1);
      param_1 = (uint *)((int)param_1 + 1);
    }
  }
  return 1;
  while( true ) {
    local_14 = local_14 + 1;
    uVar12 = uVar12 + 1;
    if (*(uint *)(in_ECX + 8) <= uVar12) break;
LAB_1009179c:
    iVar6 = *local_14;
    if ((((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 4) & 0x100) != 0)
        && (*(int *)(iVar6 + 8) == -1)) && (dVar3 == *(double *)(iVar6 + 0x20))) break;
  }
  bVar14 = uVar12 == *(uint *)(in_ECX + 8);
LAB_100917d0:
  if ((bVar14) &&
     (uVar12 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,dVar3), uVar12 == 0xffffffff)) {
    return 0;
  }
LAB_100917f5:
  uVar10 = local_8;
  puVar13 = local_1c;
  local_10 = local_10 + 1;
  local_c0[local_8] = 1.0;
  adStack_a0[uVar10] = 0.0;
  *puVar13 = uVar12;
  if (uVar12 != 0xffffffff) goto LAB_10091831;
LAB_1009181a:
  uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + local_24 * 4) + 0x34);
  if (*puVar13 == uVar12) goto LAB_10091831;
  goto LAB_100916f3;
LAB_10091831:
  local_8 = local_8 + 1;
  puVar13 = puVar13 + 1;
  local_1c = puVar13;
  if (param_2 <= local_8) goto LAB_10091848;
  goto LAB_100916f1;
}


