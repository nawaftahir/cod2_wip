// 100ac03e size=2050 FUN_100ac03e

uint * FUN_100ac03e(int *param_1)

{
  undefined4 uVar1;
  int *piVar2;
  uint *puVar3;
  int iVar4;
  uint *puVar5;
  int in_ECX;
  undefined4 *puVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int *piVar10;
  uint uVar11;
  uint local_d0 [16];
  int aiStack_90 [16];
  uint local_50 [5];
  uint local_3c;
  int local_38;
  int local_34;
  uint local_30;
  uint local_2c;
  uint local_28;
  uint *local_24;
  int local_20;
  uint local_1c;
  uint *local_18;
  uint *local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_34 = 0;
  local_20 = 0;
  local_2c = 0;
  do {
    iVar7 = *(int *)(*(int *)(in_ECX + 0x22c) + local_2c * 4);
    if (((iVar7 != 0) && (*(int *)(iVar7 + 0xc) != 0)) &&
       (local_10 = 0, *(int *)(in_ECX + 0x224) != 0)) {
      do {
        local_20 = 0;
        puVar3 = *(uint **)(*(int *)(in_ECX + 0x230) + local_10 * 4);
        local_18 = puVar3;
        if ((puVar3 != (uint *)0x0) && (*puVar3 != 0)) {
          local_28 = 0;
          local_50[4] = (uint)(local_10 < 6);
          local_c = *puVar3 & 0xfffff;
          if (local_c != 0) {
            local_3c = puVar3[1] / local_c;
            uVar11 = *(uint *)(*(int *)(in_ECX + 0x22c) + local_2c * 4);
            local_24 = (uint *)0x0;
            local_1c = 0;
            if (*(int *)(uVar11 + 0xc) != 0) {
              local_30 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x22c) + local_2c * 4) + 0xc);
              do {
                if (local_50[4] < local_3c) {
                  iVar7 = local_c * local_50[4] * 4;
                  local_38 = local_3c - local_50[4];
                  do {
                    if (local_c != 0) {
                      local_14 = *(uint **)(*(int *)(uVar11 + 0x10) + local_1c * 4);
                      puVar6 = (undefined4 *)(puVar3[2] + iVar7);
                      local_8 = local_c;
                      do {
                        if ((((uint *)*puVar6 == local_14) ||
                            (*(uint **)(*(int *)(*(int *)(in_ECX + 0x14) + (int)*puVar6 * 4) + 0x38)
                             == local_14)) &&
                           ((local_2c < local_10 &&
                            (((puVar5 = *(uint **)(*(int *)(in_ECX + 0x230) + local_2c * 4),
                              puVar5 != (uint *)0x0 && (uVar8 = *puVar5, uVar8 != 0)) &&
                             ((uVar8 & 0xfff00000) != 0x11000000)))))) {
                          local_24 = (uint *)0x1;
                          local_28 = uVar11;
                        }
                        puVar6 = puVar6 + 1;
                        local_8 = local_8 - 1;
                      } while (local_8 != 0);
                    }
                    iVar7 = iVar7 + local_c * 4;
                    local_38 = local_38 + -1;
                  } while (local_38 != 0);
                }
                local_1c = local_1c + 1;
              } while (local_1c < local_30);
              if (local_24 != (uint *)0x0) {
                if (param_1 == (int *)0x0) {
                  local_50[0] = 0xffffffff;
                  local_50[1] = 0xffffffff;
                  local_50[2] = 0xffffffff;
                  local_8 = 0;
                  local_50[3] = 0xffffffff;
                  local_c = 0;
                  if (puVar3[1] != 0) {
                    do {
                      if (*(uint **)(local_28 + 0xc) != (uint *)0x0) {
                        puVar5 = *(uint **)(local_28 + 0x10);
                        local_30 = *(uint *)(puVar3[2] + local_c * 4);
                        local_24 = *(uint **)(local_28 + 0xc);
                        do {
                          uVar11 = *puVar5;
                          if ((uVar11 == local_30) ||
                             (uVar11 == *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + local_30 * 4) +
                                                 0x38))) {
                            uVar8 = 0;
                            if (local_8 != 0) {
                              do {
                                if (local_50[uVar8] == uVar11) break;
                                uVar8 = uVar8 + 1;
                              } while (uVar8 < local_8);
                            }
                            if (uVar8 == local_8) {
                              local_50[local_8] = uVar11;
                              local_8 = local_8 + 1;
                            }
                          }
                          puVar5 = puVar5 + 1;
                          local_24 = (uint *)((int)local_24 + -1);
                        } while (local_24 != (uint *)0x0);
                      }
                      local_c = local_c + 1;
                    } while (local_c < puVar3[1]);
                  }
                  iVar7 = FUN_10085814(0x74);
                  if (iVar7 == 0) {
                    local_20 = 0;
                  }
                  else {
                    local_20 = FUN_10085379();
                  }
                  if (local_20 != 0) {
                    puVar5 = (uint *)FUN_1008585f(local_8 & 0xfffff | 0x10000000,local_8,local_8,0);
                    local_14 = puVar5;
                    if ((int)puVar5 < 0) goto LAB_100ac822;
                    puVar6 = *(undefined4 **)(local_20 + 0x10);
                    for (uVar11 = local_8; uVar11 != 0; uVar11 = uVar11 - 1) {
                      *puVar6 = 0xffffffff;
                      puVar6 = puVar6 + 1;
                    }
                    local_1c = 0;
                    if (puVar3[1] != 0) {
                      do {
                        local_c = 0;
                        if (*(int *)(local_28 + 0xc) != 0) {
                          do {
                            uVar11 = *(uint *)(puVar3[2] + local_1c * 4);
                            iVar7 = *(int *)(in_ECX + 0x14);
                            local_14 = *(uint **)(iVar7 + uVar11 * 4);
                            uVar8 = *(uint *)(*(int *)(local_28 + 0x10) + local_c * 4);
                            if ((uVar8 == uVar11) || (uVar8 == local_14[0xe])) {
                              local_30 = *(uint *)(iVar7 + uVar8 * 4);
                              iVar9 = (local_1c % local_8) * 4;
                              iVar4 = *(int *)(iVar9 + *(int *)(local_20 + 0x10));
                              if (iVar4 == -1) {
                                uVar11 = *(uint *)(in_ECX + 0x408);
                                if (0x3f < uVar11) goto LAB_100ac4b1;
                                iVar4 = *(int *)(in_ECX + 0x304 + uVar11 * 4);
                                *(uint *)(in_ECX + 0x408) = uVar11 + 1;
                                iVar7 = *(int *)(iVar7 + iVar4 * 4);
                                uVar1 = *(undefined4 *)(in_ECX + 0x88);
                                *(undefined4 *)(iVar7 + 0x3c) = 0;
                                *(undefined4 *)(iVar7 + 0x38) = 0xffffffff;
                                *(undefined4 *)(iVar7 + 4) = uVar1;
                                *(undefined4 *)(iVar7 + 0x10) = *(undefined4 *)(local_30 + 0x10);
                                if (iVar4 == -1) goto LAB_100ac4b1;
                              }
                              if (*(uint *)(*(int *)(local_28 + 0x10) + local_c * 4) ==
                                  local_14[0xe]) {
                                uVar11 = *(uint *)(in_ECX + 0x408);
                                if (0x3f < uVar11) goto LAB_100ac4b1;
                                uVar8 = *(uint *)(in_ECX + 0x304 + uVar11 * 4);
                                *(uint *)(in_ECX + 0x408) = uVar11 + 1;
                                iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
                                *(undefined4 *)(iVar7 + 0x10) = *(undefined4 *)(local_30 + 0x10);
                                *(uint *)(iVar7 + 0x3c) = local_14[0xf];
                                *(int *)(iVar7 + 0x38) = iVar4;
                                *(undefined4 *)(iVar7 + 4) = *(undefined4 *)(in_ECX + 0x88);
                                local_30 = uVar8;
                                *(uint *)(local_18[2] + local_1c * 4) = uVar8;
                              }
                              else {
                                *(int *)(local_18[2] + local_1c * 4) = iVar4;
                              }
                              *(undefined4 *)(iVar9 + *(int *)(local_20 + 8)) =
                                   *(undefined4 *)(*(int *)(local_28 + 0x10) + local_c * 4);
                              *(int *)(iVar9 + *(int *)(local_20 + 0x10)) = iVar4;
                              *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c)
                                   = 0;
                              puVar3 = local_18;
                            }
                            local_c = local_c + 1;
                          } while (local_c < *(uint *)(local_28 + 0xc));
                        }
                        local_1c = local_1c + 1;
                      } while (local_1c < puVar3[1]);
                    }
                    piVar10 = (int *)(in_ECX + 0x220);
                    *(int *)(*(int *)(in_ECX + 0x22c) + *piVar10 * 4) = local_20;
                    *piVar10 = *piVar10 + 1;
                    puVar3 = (uint *)(in_ECX + 0x404);
                    if (*puVar3 < 0xc) {
                      *(int *)(in_ECX + 0x2c4 + *puVar3 * 4) = local_20;
                      *puVar3 = *puVar3 + 1;
                      local_20 = 0;
                      goto LAB_100ac1ba;
                    }
                  }
LAB_100ac4b1:
                  puVar5 = (uint *)0x8007000e;
                  goto LAB_100ac822;
                }
                *param_1 = *param_1 + 1;
                *param_1 = *param_1 + 1;
              }
            }
          }
        }
LAB_100ac1ba:
        local_10 = local_10 + 1;
      } while (local_10 < *(uint *)(in_ECX + 0x224));
    }
    local_20 = 0;
    local_2c = local_2c + 1;
  } while (local_2c < 6);
  local_28 = 0;
  if (*(int *)(in_ECX + 0x220) != 0) {
    do {
      piVar10 = *(int **)(*(int *)(in_ECX + 0x22c) + local_28 * 4);
      if ((piVar10 != (int *)0x0) && (*piVar10 != 0)) {
        iVar7 = piVar10[3];
        local_24 = (uint *)0x0;
        if (iVar7 != 0) {
          puVar3 = (uint *)piVar10[4];
          do {
            if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *puVar3 * 4) + 0x10) == 3) {
              local_24 = (uint *)0x1;
              local_2c = *puVar3;
            }
            puVar3 = puVar3 + 1;
            iVar7 = iVar7 + -1;
          } while (iVar7 != 0);
          if (local_24 != (uint *)0x0) {
            local_8 = 0;
            local_10 = 6;
            if (6 < *(uint *)(in_ECX + 0x224)) {
              piVar10 = (int *)(*(int *)(in_ECX + 0x230) + 0x18);
              do {
                piVar2 = (int *)*piVar10;
                if (((piVar2 != (int *)0x0) && (*piVar2 != 0)) &&
                   (local_18 = (uint *)0x0, piVar2[1] != 0)) {
                  local_14 = (uint *)piVar2[2];
                  do {
                    uVar11 = local_8;
                    if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_14 * 4) + 0x38) ==
                         local_2c) || (*local_14 == local_2c)) {
                      if (0xf < local_8) {
                        return (uint *)0x80004005;
                      }
                      local_8 = local_8 + 1;
                      aiStack_90[uVar11] = (int)piVar2;
                    }
                    local_18 = (uint *)((int)local_18 + 1);
                    local_14 = local_14 + 1;
                  } while (local_18 < (uint *)piVar2[1]);
                }
                local_10 = local_10 + 1;
                piVar10 = piVar10 + 1;
              } while (local_10 < *(uint *)(in_ECX + 0x224));
            }
            if (param_1 != (int *)0x0) {
              local_10 = 0;
              if (*(int *)(in_ECX + 0xc) != 0) {
                local_18 = *(uint **)(in_ECX + 0x18);
                do {
                  piVar10 = (int *)*local_18;
                  if (((piVar10 != (int *)0x0) && (*piVar10 != 0)) && (piVar10[10] != 1)) {
                    local_14 = (uint *)0x0;
                    if ((uint *)piVar10[1] != (uint *)0x0) {
                      puVar3 = (uint *)piVar10[2];
                      do {
                        if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *puVar3 * 4) + 0x38) ==
                             local_2c) || (*puVar3 == local_2c)) {
                          if (0xf < local_8) {
                            return (uint *)0x80004005;
                          }
                          local_8 = local_8 + 1;
                        }
                        local_14 = (uint *)((int)local_14 + 1);
                        puVar3 = puVar3 + 1;
                      } while (local_14 < (uint *)piVar10[1]);
                    }
                  }
                  local_10 = local_10 + 1;
                  local_18 = local_18 + 1;
                } while (local_10 < *(uint *)(in_ECX + 0xc));
              }
              if (local_8 == 0) goto LAB_100ac794;
              *param_1 = *param_1 + 1;
            }
            if ((local_8 != 0) && (param_1 == (int *)0x0)) {
              if (0xb < *(uint *)(in_ECX + 0x404)) {
                return (uint *)0x1;
              }
              iVar7 = FUN_10085814(0x74);
              if (iVar7 == 0) {
                iVar7 = 0;
              }
              else {
                iVar7 = FUN_10085379();
              }
              iVar4 = FUN_10085814(0x74);
              if (iVar4 == 0) {
                local_c = 0;
              }
              else {
                local_c = FUN_10085379();
              }
              if (((iVar7 == 0) || (local_c == 0)) ||
                 (uVar11 = *(uint *)(in_ECX + 0x408), 0x40 < uVar11)) {
                return (uint *)0x8007000e;
              }
              local_30 = *(uint *)(in_ECX + 0x308 + uVar11 * 4);
              iVar4 = *(int *)(in_ECX + 0x304 + uVar11 * 4);
              iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + local_30 * 4);
              *(undefined4 *)(iVar9 + 0x38) = 0xffffffff;
              *(undefined4 *)(iVar9 + 0x10) = 3;
              *(undefined4 *)(iVar9 + 0x3c) = 0;
              iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
              *(undefined4 *)(iVar9 + 0x38) = 0xffffffff;
              *(undefined4 *)(iVar9 + 0x10) = 4;
              *(undefined4 *)(iVar9 + 0x3c) = 0;
              *(int *)(in_ECX + 0x408) = *(int *)(in_ECX + 0x408) + 2;
              local_10 = 0;
              if (local_8 != 0) {
                do {
                  iVar9 = aiStack_90[local_10];
                  local_18 = (uint *)0x0;
                  if (*(int *)(iVar9 + 4) != 0) {
                    do {
                      local_24 = (uint *)(*(int *)(iVar9 + 8) + (int)local_18 * 4);
                      iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *local_24 * 4);
                      if (*(uint *)(iVar9 + 0x38) == local_2c) {
                        *(uint *)(iVar9 + 0x38) = local_30;
                      }
                      else if (*local_24 == local_2c) {
                        *local_24 = local_30;
                      }
                      local_18 = (uint *)((int)local_18 + 1);
                      iVar9 = aiStack_90[local_10];
                    } while (local_18 < *(uint **)(iVar9 + 4));
                  }
                  local_10 = local_10 + 1;
                } while (local_10 < local_8);
              }
              local_14 = (uint *)FUN_1008585f(0x10000001,1,1,0);
              if ((int)local_14 < 0) {
                return local_14;
              }
              local_14 = (uint *)FUN_1008585f(0x10000001,1,1,0);
              iVar9 = local_34;
              if ((int)local_14 < 0) {
                return local_14;
              }
              **(int **)(iVar7 + 0x10) = iVar4;
              **(uint **)(iVar7 + 8) = local_2c;
              *(undefined4 *)(iVar7 + 0x28) = 1;
              **(uint **)(local_c + 0x10) = local_30;
              **(int **)(local_c + 8) = iVar4;
              *(undefined4 *)(iVar7 + 0x28) = 2;
              *(int *)(in_ECX + 0x2c4 + *(int *)(in_ECX + 0x404) * 4) = iVar7;
              *(uint *)(in_ECX + 0x2c8 + *(int *)(in_ECX + 0x404) * 4) = local_c;
              *(int *)(in_ECX + 0x404) = *(int *)(in_ECX + 0x404) + 2;
              *(int *)(*(int *)(in_ECX + 0x22c) + *(int *)(in_ECX + 0x220) * 4) = iVar7;
              *(int *)(in_ECX + 0x220) = *(int *)(in_ECX + 0x220) + 1;
              local_34 = local_34 + 1;
              local_d0[iVar9] = local_c;
            }
          }
        }
      }
LAB_100ac794:
      local_28 = local_28 + 1;
    } while (local_28 < *(uint *)(in_ECX + 0x220));
  }
  uVar11 = *(uint *)(in_ECX + 0x224);
  if (uVar11 + local_34 < 0x201) {
    if (5 < uVar11) {
      iVar7 = (uVar11 + local_34) * 4;
      do {
        *(undefined4 *)(*(int *)(in_ECX + 0x230) + iVar7) =
             *(undefined4 *)(*(int *)(in_ECX + 0x230) + uVar11 * 4);
        uVar11 = uVar11 - 1;
        iVar7 = iVar7 + -4;
      } while (5 < uVar11);
    }
    if (local_34 != 0) {
      iVar7 = 0x18;
      iVar4 = local_34;
      do {
        *(undefined4 *)(iVar7 + *(int *)(in_ECX + 0x230)) =
             *(undefined4 *)((int)local_d0 + iVar7 + -0x18);
        iVar7 = iVar7 + 4;
        iVar4 = iVar4 + -1;
      } while (iVar4 != 0);
    }
    *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + local_34;
    puVar5 = (uint *)0x0;
LAB_100ac822:
    if (local_20 != 0) {
      FUN_1006c418(1);
    }
  }
  else {
    puVar5 = (uint *)0x80004005;
  }
  return puVar5;
}


