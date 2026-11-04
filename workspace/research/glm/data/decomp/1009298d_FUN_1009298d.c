// 1009298d size=1739 FUN_1009298d

undefined4 FUN_1009298d(int *param_1,uint param_2,uint param_3)

{
  int *piVar1;
  uint *puVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  void *pvVar6;
  int iVar7;
  int in_ECX;
  int iVar8;
  int iVar9;
  uint uVar10;
  uint uVar11;
  int *piVar12;
  undefined4 *puVar13;
  uint local_24;
  int local_20;
  int local_1c;
  uint local_18;
  uint local_14;
  uint local_c;
  
  piVar4 = param_1;
  FUN_1008a979();
  if (param_1 == (int *)0x0) {
    uVar5 = 0x80004005;
  }
  else {
    piVar12 = param_1;
    for (iVar8 = 0x19; iVar8 != 0; iVar8 = iVar8 + -1) {
      *piVar12 = 0;
      piVar12 = piVar12 + 1;
    }
    param_1[0xb] = param_3;
    *param_1 = param_2;
    uVar11 = 0;
    param_1[0x18] = param_1[0x18] ^ ((*(int *)(in_ECX + 0x6c) << 1) >> 0x1f ^ param_1[0x18]) & 1U;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar11 * 4);
        if ((param_2 == *(int *)(iVar8 + 4)) && (*(int *)(iVar8 + 0x38) == -1)) {
          if ((uint)param_1[10] <= *(uint *)(iVar8 + 0xc)) {
            param_1[10] = *(uint *)(iVar8 + 0xc) + 1;
          }
          *(int *)(iVar8 + 0x74) = param_1[0x12];
          param_1[0x12] = param_1[0x12] + 1;
        }
        uVar11 = uVar11 + 1;
      } while (uVar11 < *(uint *)(in_ECX + 8));
    }
    pvVar6 = operator_new(param_1[10] << 2);
    param_1[4] = (int)pvVar6;
    if (pvVar6 != (void *)0x0) {
      pvVar6 = operator_new(param_1[10] << 4);
      param_1[5] = (int)pvVar6;
      if (pvVar6 != (void *)0x0) {
        pvVar6 = operator_new(param_1[10] << 4);
        param_1[6] = (int)pvVar6;
        if (pvVar6 != (void *)0x0) {
          pvVar6 = operator_new(param_1[10] << 2);
          param_1[2] = (int)pvVar6;
          if (pvVar6 != (void *)0x0) {
            pvVar6 = operator_new(param_1[10] << 2);
            param_1[3] = (int)pvVar6;
            if (pvVar6 != (void *)0x0) {
              pvVar6 = operator_new(param_1[0xb] << 4);
              param_1[7] = (int)pvVar6;
              if (pvVar6 != (void *)0x0) {
                pvVar6 = operator_new(param_1[0xb] << 2);
                param_1[8] = (int)pvVar6;
                if (pvVar6 != (void *)0x0) {
                  pvVar6 = operator_new(param_1[10] << 4);
                  param_1[0xc] = (int)pvVar6;
                  if (pvVar6 != (void *)0x0) {
                    pvVar6 = operator_new(param_1[10] << 4);
                    param_1[0xd] = (int)pvVar6;
                    if (pvVar6 != (void *)0x0) {
                      pvVar6 = operator_new(param_1[10] << 2);
                      param_1[0xf] = (int)pvVar6;
                      if (pvVar6 != (void *)0x0) {
                        pvVar6 = operator_new(param_1[10] << 2);
                        param_1[0x10] = (int)pvVar6;
                        if (pvVar6 != (void *)0x0) {
                          pvVar6 = operator_new(param_1[0x12] << 2);
                          param_1[0x13] = (int)pvVar6;
                          if (pvVar6 != (void *)0x0) {
                            pvVar6 = operator_new(param_1[0x12] << 2);
                            param_1[0x14] = (int)pvVar6;
                            if (pvVar6 != (void *)0x0) {
                              local_c = 0;
                              do {
                                puVar13 = (undefined4 *)param_1[0xc];
                                for (iVar8 = (param_1[10] & 0xfffffffU) << 2; iVar8 != 0;
                                    iVar8 = iVar8 + -1) {
                                  *puVar13 = 0;
                                  puVar13 = puVar13 + 1;
                                }
                                for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
                                  *(undefined1 *)puVar13 = 0;
                                  puVar13 = (undefined4 *)((int)puVar13 + 1);
                                }
                                local_20 = 0;
                                local_14 = 0;
                                if (*(int *)(in_ECX + 0xc) != 0) {
                                  do {
                                    puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_14 * 4);
                                    iVar8 = FUN_1008549a();
                                    if ((iVar8 != 0) &&
                                       (param_2 ==
                                        *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                         *(int *)puVar2[4] * 4) + 4))) {
                                      uVar11 = *puVar2 & 0xfffff;
                                      local_24 = puVar2[1] / uVar11;
                                      if (local_24 != 0) {
                                        local_1c = 0;
                                        do {
                                          piVar12 = (int *)(puVar2[2] + local_1c);
                                          iVar8 = *piVar12;
                                          if ((iVar8 == -1) ||
                                             (iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                                       iVar8 * 4) + 0x38),
                                             iVar7 == -1)) {
                                            iVar7 = iVar8;
                                          }
                                          iVar9 = *(int *)(in_ECX + 0x14);
                                          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                                                 *(int *)(*(int *)(iVar9 + iVar7 * 4
                                                                                  ) + 4) * 4) + 6) &
                                              2) != 0) {
                                            if ((iVar8 == -1) ||
                                               (iVar7 = *(int *)(*(int *)(iVar9 + iVar8 * 4) + 0x38)
                                               , iVar7 == -1)) {
                                              iVar7 = iVar8;
                                            }
                                            piVar12 = *(int **)(*(int *)(*(int *)(in_ECX + 0x18) +
                                                                        *(int *)(*(int *)(iVar9 + 
                                                  iVar7 * 4) + 0x48) * 4) + 8);
                                          }
                                          iVar8 = *piVar12;
                                          if ((iVar8 != -1) &&
                                             (iVar7 = *(int *)(*(int *)(iVar9 + iVar8 * 4) + 0x38),
                                             iVar7 != -1)) {
                                            iVar8 = iVar7;
                                          }
                                          if (param_2 == *(int *)(*(int *)(iVar9 + iVar8 * 4) + 4))
                                          {
                                            local_18 = 0;
                                            param_3 = 0;
                                            if (uVar11 != 0) {
                                              do {
                                                iVar8 = piVar12[param_3];
                                                if ((iVar8 != -1) &&
                                                   (iVar7 = *(int *)(*(int *)(iVar9 + iVar8 * 4) +
                                                                    0x38), iVar7 != -1)) {
                                                  iVar8 = iVar7;
                                                }
                                                uVar10 = 1 << ((byte)*(undefined4 *)
                                                                      (*(int *)(iVar9 + iVar8 * 4) +
                                                                      0x10) & 0x1f);
                                                if ((local_18 & uVar10) != 0) break;
                                                local_18 = local_18 | uVar10;
                                                param_3 = param_3 + 1;
                                              } while (param_3 < uVar11);
                                              if (param_3 < uVar11) goto LAB_10092d46;
                                            }
                                            param_3 = 0;
                                            if (uVar11 != 0) {
                                              do {
                                                iVar8 = *(int *)(in_ECX + 0x14);
                                                iVar7 = piVar12[param_3];
                                                iVar9 = *(int *)(iVar8 + *(int *)(param_3 * 4 +
                                                                                 puVar2[4]) * 4);
                                                if ((iVar7 != -1) &&
                                                   (iVar3 = *(int *)(*(int *)(iVar8 + iVar7 * 4) +
                                                                    0x38), iVar3 != -1)) {
                                                  iVar7 = iVar3;
                                                }
                                                iVar7 = *(int *)(iVar8 + iVar7 * 4);
                                                iVar8 = *(int *)(iVar9 + 0x10) +
                                                        *(int *)(iVar9 + 0xc) * 4;
                                                iVar7 = *(int *)(iVar7 + 0x10) +
                                                        *(int *)(iVar7 + 0xc) * 4;
                                                if ((iVar8 != iVar7) &&
                                                   (*(int *)(iVar9 + 0x3c) == 0)) {
                                                  if (local_c == 1) {
                                                    *(int *)(param_1[0xe] +
                                                            (*(int *)(param_1[0xc] + iVar8 * 4) +
                                                            *(int *)(param_1[0xd] + iVar8 * 4)) * 4)
                                                         = iVar7;
                                                    *(int *)(param_1[0xe] +
                                                            (*(int *)(param_1[0xc] + iVar7 * 4) +
                                                            *(int *)(param_1[0xd] + iVar7 * 4)) * 4)
                                                         = iVar8;
                                                  }
                                                  piVar1 = (int *)(param_1[0xc] + iVar8 * 4);
                                                  *piVar1 = *piVar1 + 1;
                                                  piVar1 = (int *)(param_1[0xc] + iVar7 * 4);
                                                  *piVar1 = *piVar1 + 1;
                                                  local_20 = local_20 + 2;
                                                }
                                                param_3 = param_3 + 1;
                                              } while (param_3 < uVar11);
                                            }
                                          }
LAB_10092d46:
                                          local_1c = local_1c + uVar11 * 4;
                                          local_24 = local_24 - 1;
                                        } while (local_24 != 0);
                                      }
                                    }
                                    local_14 = local_14 + 1;
                                  } while (local_14 < *(uint *)(in_ECX + 0xc));
                                }
                                if (local_c == 0) {
                                  iVar8 = 0;
                                  uVar11 = 0;
                                  if ((param_1[10] & 0x3fffffffU) != 0) {
                                    do {
                                      *(int *)(param_1[0xd] + uVar11 * 4) = iVar8;
                                      iVar8 = iVar8 + *(int *)(param_1[0xc] + uVar11 * 4);
                                      uVar11 = uVar11 + 1;
                                    } while (uVar11 < (uint)(param_1[10] << 2));
                                  }
                                  pvVar6 = operator_new(local_20 << 2);
                                  param_1[0xe] = (int)pvVar6;
                                  if (pvVar6 == (void *)0x0) goto LAB_1009304c;
                                }
                                local_c = local_c + 1;
                              } while (local_c < 2);
                              param_1 = (int *)0x0;
                              do {
                                puVar13 = (undefined4 *)piVar4[0xf];
                                for (uVar11 = piVar4[10] & 0x3fffffff; uVar11 != 0;
                                    uVar11 = uVar11 - 1) {
                                  *puVar13 = 0;
                                  puVar13 = puVar13 + 1;
                                }
                                for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
                                  *(undefined1 *)puVar13 = 0;
                                  puVar13 = (undefined4 *)((int)puVar13 + 1);
                                }
                                local_1c = 0;
                                param_3 = 0;
                                if (*(int *)(in_ECX + 0xc) != 0) {
                                  do {
                                    puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + param_3 * 4);
                                    iVar8 = FUN_100854d2();
                                    if (((iVar8 != 0) || ((*(byte *)(in_ECX + 0x6f) & 0x80) != 0))
                                       && (iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                                                           *(int *)puVar2[4] * 4),
                                          param_2 == *(int *)(iVar8 + 4))) {
                                      uVar11 = *puVar2;
                                      local_18 = puVar2[1] / (uVar11 & 0xfffff);
                                      iVar8 = *(int *)(iVar8 + 0xc);
                                      if (local_18 != 0) {
                                        local_24 = 0;
                                        do {
                                          iVar7 = *(int *)(local_24 + puVar2[2]);
                                          if ((iVar7 != -1) &&
                                             (iVar9 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                                       iVar7 * 4) + 0x38),
                                             iVar9 != -1)) {
                                            iVar7 = iVar9;
                                          }
                                          iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4);
                                          if ((param_2 == *(int *)(iVar7 + 4)) &&
                                             (iVar8 != *(int *)(iVar7 + 0xc))) {
                                            if (param_1 == (int *)0x1) {
                                              *(undefined4 *)
                                               (piVar4[0x11] +
                                               (*(int *)(iVar8 * 4 + piVar4[0x10]) +
                                               *(int *)(piVar4[0xf] + iVar8 * 4)) * 4) =
                                                   *(undefined4 *)(iVar7 + 0xc);
                                              iVar9 = *(int *)(iVar7 + 0xc) * 4;
                                              *(int *)(piVar4[0x11] +
                                                      (*(int *)(iVar9 + piVar4[0x10]) +
                                                      *(int *)(piVar4[0xf] + iVar9)) * 4) = iVar8;
                                            }
                                            piVar12 = (int *)(piVar4[0xf] + iVar8 * 4);
                                            *piVar12 = *piVar12 + 1;
                                            piVar12 = (int *)(piVar4[0xf] +
                                                             *(int *)(iVar7 + 0xc) * 4);
                                            *piVar12 = *piVar12 + 1;
                                            local_1c = local_1c + 2;
                                          }
                                          local_24 = local_24 + (uVar11 & 0xfffff) * 4;
                                          local_18 = local_18 - 1;
                                        } while (local_18 != 0);
                                      }
                                    }
                                    param_3 = param_3 + 1;
                                  } while (param_3 < *(uint *)(in_ECX + 0xc));
                                }
                                uVar11 = 0;
                                if (param_1 == (int *)0x0) {
                                  iVar8 = 0;
                                  if (piVar4[10] != 0) {
                                    do {
                                      *(int *)(piVar4[0x10] + uVar11 * 4) = iVar8;
                                      iVar8 = iVar8 + *(int *)(piVar4[0xf] + uVar11 * 4);
                                      uVar11 = uVar11 + 1;
                                    } while (uVar11 < (uint)piVar4[10]);
                                  }
                                  pvVar6 = operator_new(local_1c << 2);
                                  piVar4[0x11] = (int)pvVar6;
                                  if (pvVar6 == (void *)0x0) goto LAB_1009304c;
                                }
                                param_1 = (int *)((int)param_1 + 1);
                              } while (param_1 < 2);
                              param_2 = 0;
                              puVar13 = (undefined4 *)piVar4[0x13];
                              for (uVar11 = piVar4[0x12] & 0x3fffffff; uVar11 != 0;
                                  uVar11 = uVar11 - 1) {
                                *puVar13 = 0;
                                puVar13 = puVar13 + 1;
                              }
                              for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
                                *(undefined1 *)puVar13 = 0;
                                puVar13 = (undefined4 *)((int)puVar13 + 1);
                              }
                              if (*(int *)(in_ECX + 0xc) != 0) {
                                do {
                                  iVar8 = *(int *)(*(int *)(in_ECX + 0x18) + param_2 * 4);
                                  if ((*(ushort *)(iVar8 + 2) & 0xfff0) != 0) {
                                    param_1 = (int *)0x0;
                                    if (*(int *)(iVar8 + 0xc) != 0) {
                                      do {
                                        FUN_1008a646(piVar4,*(undefined4 *)
                                                             (*(int *)(iVar8 + 0x10) +
                                                             (int)param_1 * 4),param_2);
                                        param_1 = (int *)((int)param_1 + 1);
                                      } while (param_1 < *(uint *)(iVar8 + 0xc));
                                    }
                                    param_1 = (int *)0x0;
                                    if (*(int *)(iVar8 + 4) != 0) {
                                      do {
                                        FUN_1008a4c3(piVar4,*(undefined4 *)
                                                             (*(int *)(iVar8 + 8) + (int)param_1 * 4
                                                             ),param_2);
                                        param_1 = (int *)((int)param_1 + 1);
                                      } while (param_1 < *(uint *)(iVar8 + 4));
                                    }
                                    iVar7 = FUN_1008540c();
                                    if ((iVar7 != 0) &&
                                       (param_1 = (int *)0x0, *(int *)(iVar8 + 0xc) != 0)) {
                                      do {
                                        FUN_1008a4c3(piVar4,*(undefined4 *)
                                                             (*(int *)(iVar8 + 0x10) +
                                                             (int)param_1 * 4),param_2);
                                        param_1 = (int *)((int)param_1 + 1);
                                      } while (param_1 < *(uint *)(iVar8 + 0xc));
                                    }
                                  }
                                  param_2 = param_2 + 1;
                                } while (param_2 < *(uint *)(in_ECX + 0xc));
                              }
                              uVar11 = 0;
                              iVar8 = 0;
                              if (piVar4[0x12] != 0) {
                                do {
                                  *(int *)(piVar4[0x14] + uVar11 * 4) = iVar8;
                                  iVar8 = iVar8 + *(int *)(piVar4[0x13] + uVar11 * 4);
                                  uVar11 = uVar11 + 1;
                                } while (uVar11 < (uint)piVar4[0x12]);
                              }
                              pvVar6 = operator_new(iVar8 << 2);
                              piVar4[0x15] = (int)pvVar6;
                              if (pvVar6 != (void *)0x0) {
                                pvVar6 = operator_new(iVar8 * 0xc);
                                piVar4[0x16] = (int)pvVar6;
                                if (pvVar6 != (void *)0x0) {
                                  return 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LAB_1009304c:
    uVar5 = 0x8007000e;
  }
  return uVar5;
}


