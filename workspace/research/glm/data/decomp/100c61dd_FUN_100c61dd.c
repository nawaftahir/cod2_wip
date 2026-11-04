// 100c61dd size=3212 FUN_100c61dd

int FUN_100c61dd(int param_1)

{
  bool bVar1;
  uint *puVar2;
  uint *puVar3;
  int *piVar4;
  int iVar5;
  int in_ECX;
  int iVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint *puVar10;
  int local_2c8 [40];
  int local_228 [40];
  int local_188 [40];
  uint local_e8 [16];
  uint local_a8 [16];
  undefined1 local_68 [16];
  int local_58;
  uint local_54 [5];
  int local_40;
  uint local_3c;
  int local_38;
  uint local_34;
  uint *local_30;
  uint local_2c;
  uint local_28;
  uint *local_24;
  uint *local_20;
  uint *local_1c;
  uint local_18;
  uint local_14;
  uint *local_10;
  uint *local_c;
  int local_8;
  
  local_c = *(uint **)(in_ECX + 0x100);
  local_28 = *local_c & 0xfffff;
  local_58 = 0;
  local_30 = (uint *)0x0;
  local_54[0] = 0;
  local_54[1] = 1;
  local_54[2] = 2;
  local_54[3] = 3;
  local_40 = 0;
  local_34 = *local_c & 0xfffff;
  if ((local_28 <= (*local_c & 0xfffff)) && ((*local_c & 0xfff00000) == 0x20400000)) {
    local_38 = 0;
LAB_100c624b:
    local_14 = 0;
    do {
      piVar4 = local_228;
      for (iVar6 = 0x28; iVar6 != 0; iVar6 = iVar6 + -1) {
        *piVar4 = -1;
        piVar4 = piVar4 + 1;
      }
      piVar4 = local_2c8;
      for (iVar6 = 0x28; iVar6 != 0; iVar6 = iVar6 + -1) {
        *piVar4 = -1;
        piVar4 = piVar4 + 1;
      }
      local_20 = (uint *)0x0;
      local_8 = 0;
      local_18 = 0;
      local_1c = (uint *)0x0;
      do {
        uVar9 = local_18;
        if (local_14 != 0) {
          uVar9 = 1 - local_18;
        }
        uVar7 = local_c[2];
        uVar9 = *(uint *)(&DAT_10118344 + uVar9 * 4);
        piVar4 = (int *)(uVar7 + (int)local_1c * 4);
        if (uVar9 < 0x10) {
          iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x48);
          if (iVar6 != -1) {
            local_2c = *(uint *)(*(int *)(in_ECX + 0x18) + iVar6 * 4);
            iVar6 = FUN_100b97c4(local_2c,piVar4,local_28,local_54,local_68,
                                 *(undefined4 *)(&DAT_10118350 + uVar9 * 0x20),0);
            if (iVar6 == 0) {
              local_8 = FUN_100b99af(local_2c,&DAT_10118338 + uVar9 * 0x20,local_a8,&local_20,
                                     local_2c8,local_68,local_34,0);
              goto LAB_100c634c;
            }
          }
          local_8 = 1;
          break;
        }
        uVar8 = 0;
        piVar4 = local_228 + (uVar9 - 0x10) * 4;
        do {
          if (local_54[uVar8] < local_28) {
            *piVar4 = *(int *)(uVar7 + ((int)local_1c + local_54[uVar8]) * 4);
          }
          else {
            *piVar4 = -1;
          }
          uVar8 = uVar8 + 1;
          piVar4 = piVar4 + 1;
        } while (uVar8 < 4);
LAB_100c634c:
        if (local_8 == 1) break;
        local_18 = local_18 + 1;
        local_1c = (uint *)((int)local_1c + local_28);
      } while (local_18 < 2);
      puVar2 = local_20;
      local_18 = 0;
      local_10 = (uint *)0x0;
      do {
        uVar9 = local_18;
        if (local_14 != 0) {
          uVar9 = 1 - local_18;
        }
        if ((0xf < *(uint *)(&DAT_10118344 + uVar9 * 4)) &&
           (local_24 = (uint *)0x0, local_20 != (uint *)0x0)) {
          do {
            uVar9 = 0;
            if (local_28 != 0) {
              uVar7 = local_a8[(int)local_24];
              puVar10 = *(uint **)(uVar7 + 0xc);
              do {
                local_1c = (uint *)0x0;
                if (puVar10 != (uint *)0x0) {
                  piVar4 = *(int **)(uVar7 + 0x10);
                  do {
                    if (*(int *)(local_c[2] + ((int)local_10 + uVar9) * 4) == *piVar4) {
                      local_8 = 1;
                      goto LAB_100c63ec;
                    }
                    local_1c = (uint *)((int)local_1c + 1);
                    puVar10 = *(uint **)(uVar7 + 0xc);
                    piVar4 = piVar4 + 1;
                  } while (local_1c < puVar10);
                }
                uVar9 = uVar9 + 1;
              } while (uVar9 < local_28);
            }
LAB_100c63ec:
            local_24 = (uint *)((int)local_24 + 1);
          } while (local_24 < local_20);
        }
        local_18 = local_18 + 1;
        local_10 = (uint *)((int)local_10 + local_28);
      } while (local_18 < 2);
      if (local_8 == 0) {
        if (local_38 != 0) goto LAB_100c6595;
        local_24 = (uint *)0x0;
        if (local_20 != (uint *)0x0) {
          do {
            local_3c = *(uint *)(local_a8[(int)local_24] + 0xc);
            local_1c = (uint *)0x0;
            if (local_3c != 0) {
              do {
                if (*(int *)(in_ECX + 0xc) != 0) {
                  local_10 = *(uint **)(in_ECX + 0x18);
                  local_2c = *(uint *)(in_ECX + 0xc);
                  do {
                    puVar10 = (uint *)*local_10;
                    if ((puVar10 != (uint *)0x0) && (*puVar10 != 0)) {
                      local_18 = 0;
                      if (puVar10[1] != 0) {
                        iVar6 = *(int *)(*(int *)(local_a8[(int)local_24] + 0x10) +
                                        (int)local_1c * 4);
                        piVar4 = (int *)puVar10[2];
                        local_54[4] = puVar10[1];
                        do {
                          if ((*piVar4 == iVar6) ||
                             (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x38) ==
                              iVar6)) {
                            local_18 = 1;
                          }
                          piVar4 = piVar4 + 1;
                          local_54[4] = local_54[4] - 1;
                        } while (local_54[4] != 0);
                      }
                      if (puVar10 == local_c) {
                        local_18 = 0;
                      }
                      if (local_18 != 0) {
                        puVar3 = (uint *)0x0;
                        do {
                          if (puVar10 == (uint *)local_a8[(int)puVar3]) {
                            local_18 = 0;
                          }
                          puVar3 = (uint *)((int)puVar3 + 1);
                        } while (puVar3 < local_20);
                        if (local_18 != 0) {
                          local_8 = 1;
                        }
                      }
                    }
                    local_10 = local_10 + 1;
                    local_2c = local_2c - 1;
                  } while (local_2c != 0);
                }
                local_1c = (uint *)((int)local_1c + 1);
              } while (local_1c < local_3c);
            }
            local_24 = (uint *)((int)local_24 + 1);
          } while (local_24 < local_20);
        }
        local_1c = (uint *)0x0;
        do {
          iVar6 = local_228[(int)local_1c];
          if ((iVar6 != -1) && (puVar10 = (uint *)0x0, local_20 != (uint *)0x0)) {
            local_3c = *(uint *)(*(int *)(in_ECX + 0x14) + iVar6 * 4);
            do {
              uVar9 = *(uint *)(local_a8[(int)puVar10] + 0xc);
              if (uVar9 != 0) {
                piVar4 = *(int **)(local_a8[(int)puVar10] + 0x10);
                local_2c = uVar9;
                do {
                  if ((iVar6 == *piVar4) || (*(int *)(local_3c + 0x38) == *piVar4)) {
                    local_8 = 1;
                  }
                  piVar4 = piVar4 + 1;
                  local_2c = local_2c - 1;
                } while (local_2c != 0);
              }
              puVar10 = (uint *)((int)puVar10 + 1);
            } while (puVar10 < local_20);
          }
          local_1c = (uint *)((int)local_1c + 1);
        } while (local_1c < (uint *)0x28);
        if (local_8 == 0) goto LAB_100c6595;
      }
      local_14 = local_14 + 1;
    } while (local_14 < 2);
    if (local_8 != 0) goto code_r0x100c6586;
LAB_100c6595:
    puVar10 = local_a8;
    puVar3 = local_e8;
    for (uVar9 = (uint)local_20 & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
      *puVar3 = *puVar10;
      puVar10 = puVar10 + 1;
      puVar3 = puVar3 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(char *)puVar3 = (char)*puVar10;
      puVar10 = (uint *)((int)puVar10 + 1);
      puVar3 = (uint *)((int)puVar3 + 1);
    }
    local_e8[(int)puVar2] = (uint)local_c;
    local_30 = (uint *)((int)local_20 + 1);
    uVar9 = 0;
    do {
      iVar6 = *(int *)((int)local_228 + uVar9);
      if ((iVar6 != -1) || (iVar6 = *(int *)((int)local_2c8 + uVar9), iVar6 != -1)) {
        *(int *)((int)local_188 + uVar9) = iVar6;
      }
      uVar9 = uVar9 + 4;
    } while (uVar9 < 0xa0);
    local_8 = 0;
LAB_100c65f7:
    if (local_8 != 0) goto LAB_100c6609;
    goto LAB_100c6d51;
  }
LAB_100c6609:
  local_1c = *(uint **)(in_ECX + 0x100);
  uVar9 = **(uint **)(in_ECX + 0x100);
  local_28 = uVar9 & 0xfffff;
  if ((local_28 <= local_34) && ((uVar9 & 0xfff00000) == 0x20400000)) {
    local_38 = 0;
LAB_100c6639:
    local_18 = 0;
    do {
      puVar2 = local_30;
      puVar10 = local_e8;
      puVar3 = local_a8;
      for (uVar9 = (uint)local_30 & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
        *puVar3 = *puVar10;
        puVar10 = puVar10 + 1;
        puVar3 = puVar3 + 1;
      }
      for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
        *(char *)puVar3 = (char)*puVar10;
        puVar10 = (uint *)((int)puVar10 + 1);
        puVar3 = (uint *)((int)puVar3 + 1);
      }
      piVar4 = local_228;
      for (iVar6 = 0x28; iVar6 != 0; iVar6 = iVar6 + -1) {
        *piVar4 = -1;
        piVar4 = piVar4 + 1;
      }
      piVar4 = local_2c8;
      for (iVar6 = 0x28; iVar6 != 0; iVar6 = iVar6 + -1) {
        *piVar4 = -1;
        piVar4 = piVar4 + 1;
      }
      local_20 = puVar2;
      local_8 = 0;
      local_14 = 0;
      local_10 = (uint *)0x0;
      do {
        uVar9 = local_14;
        if (local_18 != 0) {
          uVar9 = 1 - local_14;
        }
        uVar7 = local_1c[2];
        uVar9 = *(uint *)(&DAT_101183a4 + uVar9 * 4);
        piVar4 = (int *)(uVar7 + (int)local_10 * 4);
        if (uVar9 < 0x10) {
          iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x48);
          if (iVar6 != -1) {
            local_3c = *(uint *)(*(int *)(in_ECX + 0x18) + iVar6 * 4);
            iVar6 = FUN_100b97c4(local_3c,piVar4,local_28,local_54,local_68,
                                 *(undefined4 *)(&DAT_101183b0 + uVar9 * 0x20),0);
            if (iVar6 == 0) {
              local_8 = FUN_100b99af(local_3c,&DAT_10118398 + uVar9 * 0x20,local_a8,&local_20,
                                     local_2c8,local_68,local_34,0);
              goto LAB_100c674e;
            }
          }
          local_8 = 1;
          break;
        }
        uVar8 = 0;
        piVar4 = local_228 + (uVar9 - 0x10) * 4;
        do {
          if (local_54[uVar8] < local_28) {
            *piVar4 = *(int *)(uVar7 + (local_54[uVar8] + (int)local_10) * 4);
          }
          else {
            *piVar4 = -1;
          }
          uVar8 = uVar8 + 1;
          piVar4 = piVar4 + 1;
        } while (uVar8 < 4);
LAB_100c674e:
        if (local_8 == 1) break;
        local_14 = local_14 + 1;
        local_10 = (uint *)((int)local_10 + local_28);
      } while (local_14 < 2);
      puVar2 = local_20;
      local_14 = 0;
      local_24 = (uint *)0x0;
      do {
        uVar9 = local_14;
        if (local_18 != 0) {
          uVar9 = 1 - local_14;
        }
        if ((0xf < *(uint *)(&DAT_101183a4 + uVar9 * 4)) &&
           (local_c = (uint *)0x0, local_20 != (uint *)0x0)) {
          do {
            uVar9 = 0;
            if (local_28 != 0) {
              uVar7 = local_a8[(int)local_c];
              puVar10 = *(uint **)(uVar7 + 0xc);
              do {
                local_10 = (uint *)0x0;
                if (puVar10 != (uint *)0x0) {
                  piVar4 = *(int **)(uVar7 + 0x10);
                  do {
                    if (*(int *)(local_1c[2] + ((int)local_24 + uVar9) * 4) == *piVar4) {
                      local_8 = 1;
                      goto LAB_100c67e9;
                    }
                    local_10 = (uint *)((int)local_10 + 1);
                    puVar10 = *(uint **)(uVar7 + 0xc);
                    piVar4 = piVar4 + 1;
                  } while (local_10 < puVar10);
                }
                uVar9 = uVar9 + 1;
              } while (uVar9 < local_28);
            }
LAB_100c67e9:
            local_c = (uint *)((int)local_c + 1);
          } while (local_c < local_20);
        }
        local_14 = local_14 + 1;
        local_24 = (uint *)((int)local_24 + local_28);
      } while (local_14 < 2);
      if (local_8 == 0) {
        if (local_38 != 0) goto LAB_100c6994;
        local_24 = (uint *)0x0;
        if (local_20 != (uint *)0x0) {
          do {
            local_3c = *(uint *)(local_a8[(int)local_24] + 0xc);
            local_c = (uint *)0x0;
            if (local_3c != 0) {
              do {
                if (*(int *)(in_ECX + 0xc) != 0) {
                  local_10 = *(uint **)(in_ECX + 0x18);
                  local_54[4] = *(uint *)(in_ECX + 0xc);
                  do {
                    puVar10 = (uint *)*local_10;
                    if ((puVar10 != (uint *)0x0) && (*puVar10 != 0)) {
                      local_14 = 0;
                      if (puVar10[1] != 0) {
                        iVar6 = *(int *)(*(int *)(local_a8[(int)local_24] + 0x10) + (int)local_c * 4
                                        );
                        piVar4 = (int *)puVar10[2];
                        local_2c = puVar10[1];
                        do {
                          if ((*piVar4 == iVar6) ||
                             (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x38) ==
                              iVar6)) {
                            local_14 = 1;
                          }
                          piVar4 = piVar4 + 1;
                          local_2c = local_2c - 1;
                        } while (local_2c != 0);
                      }
                      if (puVar10 == local_1c) {
                        local_14 = 0;
                      }
                      if (local_14 != 0) {
                        puVar3 = (uint *)0x0;
                        do {
                          if (puVar10 == (uint *)local_a8[(int)puVar3]) {
                            local_14 = 0;
                          }
                          puVar3 = (uint *)((int)puVar3 + 1);
                        } while (puVar3 < local_20);
                        if (local_14 != 0) {
                          local_8 = 1;
                        }
                      }
                    }
                    local_10 = local_10 + 1;
                    local_54[4] = local_54[4] - 1;
                  } while (local_54[4] != 0);
                }
                local_c = (uint *)((int)local_c + 1);
              } while (local_c < local_3c);
            }
            local_24 = (uint *)((int)local_24 + 1);
          } while (local_24 < local_20);
        }
        local_c = (uint *)0x0;
        do {
          iVar6 = local_228[(int)local_c];
          if ((iVar6 != -1) && (puVar10 = (uint *)0x0, local_20 != (uint *)0x0)) {
            local_3c = *(uint *)(*(int *)(in_ECX + 0x14) + iVar6 * 4);
            do {
              uVar9 = *(uint *)(local_a8[(int)puVar10] + 0xc);
              if (uVar9 != 0) {
                piVar4 = *(int **)(local_a8[(int)puVar10] + 0x10);
                local_2c = uVar9;
                do {
                  if ((iVar6 == *piVar4) || (*(int *)(local_3c + 0x38) == *piVar4)) {
                    local_8 = 1;
                  }
                  piVar4 = piVar4 + 1;
                  local_2c = local_2c - 1;
                } while (local_2c != 0);
              }
              puVar10 = (uint *)((int)puVar10 + 1);
            } while (puVar10 < local_20);
          }
          local_c = (uint *)((int)local_c + 1);
        } while (local_c < (uint *)0x28);
        if (local_8 == 0) goto LAB_100c6994;
      }
      local_18 = local_18 + 1;
    } while (local_18 < 2);
    if (local_8 != 0) goto code_r0x100c6985;
LAB_100c6994:
    puVar10 = local_a8;
    puVar3 = local_e8;
    for (uVar9 = (uint)local_20 & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
      *puVar3 = *puVar10;
      puVar10 = puVar10 + 1;
      puVar3 = puVar3 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(char *)puVar3 = (char)*puVar10;
      puVar10 = (uint *)((int)puVar10 + 1);
      puVar3 = (uint *)((int)puVar3 + 1);
    }
    local_e8[(int)puVar2] = (uint)local_1c;
    local_30 = (uint *)((int)local_20 + 1);
    uVar9 = 0;
    do {
      iVar6 = *(int *)((int)local_228 + uVar9);
      if ((iVar6 != -1) || (iVar6 = *(int *)((int)local_2c8 + uVar9), iVar6 != -1)) {
        *(int *)((int)local_188 + uVar9) = iVar6;
      }
      uVar9 = uVar9 + 4;
    } while (uVar9 < 0xa0);
    local_8 = 0;
    iVar6 = local_8;
    goto LAB_100c69f9;
  }
  iVar6 = 1;
LAB_100c69f9:
  local_40 = 1;
  if (iVar6 == 0) {
LAB_100c6d51:
    iVar6 = FUN_10085814();
    if (iVar6 == 0) {
      iVar6 = 0;
    }
    else {
      iVar6 = FUN_10085379();
    }
    uVar9 = local_34;
    if (iVar6 == 0) {
      return -0x7ff8fff2;
    }
    if (local_40 == 0) {
      uVar7 = local_34 & 0xfffff | 0x70300000;
    }
    else {
      uVar7 = local_34 & 0xfffff | 0x70400000;
    }
    local_8 = FUN_1008585f(uVar7,local_34 * 3,local_34,0);
    if (local_8 < 0) goto LAB_100c6bfb;
    local_8 = FUN_100853b0();
    if (local_8 < 0) goto LAB_100c6bfb;
    local_2c = 0;
    if (uVar9 != 0) {
      local_c = (uint *)(uVar9 << 3);
      local_10 = (uint *)(uVar9 << 2);
      do {
        puVar10 = local_c;
        puVar2 = local_10;
        iVar5 = local_2c * 4;
        *(undefined4 *)(iVar5 + *(int *)(iVar6 + 0x10)) =
             *(undefined4 *)(iVar5 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10));
        *(int *)(iVar5 + *(int *)(iVar6 + 8)) = local_188[local_2c];
        iVar5 = local_188[local_2c + 8];
        local_10 = local_10 + 1;
        *(int *)((int)puVar2 + *(int *)(iVar6 + 8)) = local_188[local_2c + 4];
        local_c = local_c + 1;
        *(int *)((int)puVar10 + *(int *)(iVar6 + 8)) = iVar5;
        local_2c = local_2c + 1;
      } while (local_2c < local_34);
    }
    if (param_1 == 0) {
      iVar6 = FUN_100c10a5(iVar6,local_e8,local_30);
      return iVar6;
    }
    local_8 = FUN_10085abe();
    if (local_8 < 0) goto LAB_100c6bfb;
  }
  else {
    if (param_1 != 0) {
      local_40 = 0;
      iVar6 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118338,local_e8,&local_30,
                           local_188,local_54,local_34,param_1);
      if (iVar6 == 0) goto LAB_100c6d51;
      iVar6 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118398,local_e8,&local_30,
                           local_188,local_54,local_34,param_1);
    }
    uVar9 = local_34;
    local_40 = 1;
    if (iVar6 == 0) goto LAB_100c6d51;
    local_40 = 0;
    iVar6 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_101183f8,local_e8,&local_30,local_188,
                         local_54,local_34,param_1);
    uVar7 = 0;
    if (uVar9 != 0) {
      do {
        if (local_188[uVar7] != local_188[uVar7 + 4]) {
          iVar6 = 1;
        }
        uVar7 = uVar7 + 1;
      } while (uVar7 < uVar9);
    }
    if (iVar6 == 0) {
LAB_100c6c15:
      bVar1 = true;
      uVar7 = 0;
      if (uVar9 != 0) {
        do {
          if (local_188[uVar7] != local_188[uVar7 + 4]) {
            return 1;
          }
          uVar7 = uVar7 + 1;
        } while (uVar7 < uVar9);
      }
      if (*(int *)(in_ECX + 0x160) == -1) {
        iVar6 = FUN_100860e0(&DAT_1010e914,0x311,1,4);
        *(int *)(in_ECX + 0x170) = iVar6;
        if (iVar6 == -1) {
          return -0x7ff8fff2;
        }
        iVar6 = FUN_10086139(iVar6,0,0,0x4000000000000000);
        *(int *)(in_ECX + 0x160) = iVar6;
        if (iVar6 == -1) {
          return -0x7ff8fff2;
        }
      }
      uVar7 = 0;
      if (uVar9 != 0) {
        iVar6 = *(int *)(in_ECX + 0x160);
        do {
          local_188[uVar7] = iVar6;
          if (local_188[uVar7 + 8] != local_188[8]) {
            bVar1 = false;
          }
          uVar7 = uVar7 + 1;
        } while (uVar7 < uVar9);
      }
      iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_188[8] * 4);
      if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) & 1) != 0) &&
         (bVar1)) {
        uVar9 = 0;
        piVar4 = (int *)(in_ECX + 0x164);
        do {
          if ((*piVar4 == -1) ||
             (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x20) ==
              *(double *)(iVar6 + 0x20))) break;
          uVar9 = uVar9 + 1;
          piVar4 = piVar4 + 1;
        } while (uVar9 < 3);
        if (uVar9 != 3) {
          piVar4 = (int *)(in_ECX + 0x164 + uVar9 * 4);
          if (*piVar4 == -1) {
            iVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x170),0,uVar9 + 1,
                                 *(undefined8 *)(iVar6 + 0x20));
            *piVar4 = iVar6;
            if (iVar6 == -1) {
              return -0x7ff8fff2;
            }
          }
          if (local_34 != 0) {
            iVar6 = *piVar4;
            piVar4 = local_188 + 8;
            for (uVar9 = local_34; uVar9 != 0; uVar9 = uVar9 - 1) {
              *piVar4 = iVar6;
              piVar4 = piVar4 + 1;
            }
          }
        }
      }
      goto LAB_100c6d51;
    }
    local_30 = (uint *)0x0;
    local_8 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118458,local_e8,&local_30,
                           local_188,local_54,uVar9,param_1);
    uVar7 = 0;
    local_40 = 1;
    if (uVar9 != 0) {
      do {
        if (local_188[uVar7] != local_188[uVar7 + 4]) {
          local_8 = 1;
        }
        uVar7 = uVar7 + 1;
      } while (uVar7 < uVar9);
    }
    if (local_8 == 0) goto LAB_100c6c15;
    local_40 = 0;
    local_30 = (uint *)0x0;
    local_8 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_101184b8,local_e8,&local_30,
                           local_188,local_54,uVar9,param_1);
    uVar7 = 0;
    if (uVar9 != 0) {
      do {
        if (local_188[uVar7] != local_188[uVar7 + 4]) {
          local_8 = 1;
        }
        uVar7 = uVar7 + 1;
      } while (uVar7 < uVar9);
    }
    if (local_8 == 0) goto LAB_100c6c15;
    local_30 = (uint *)0x0;
    local_8 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118518,local_e8,&local_30,
                           local_188,local_54,uVar9,param_1);
    uVar7 = 0;
    local_40 = 1;
    if (uVar9 != 0) {
      do {
        if (local_188[uVar7] != local_188[uVar7 + 4]) {
          local_8 = 1;
        }
        uVar7 = uVar7 + 1;
      } while (uVar7 < uVar9);
    }
    iVar6 = local_58;
    if (local_8 == 0) goto LAB_100c6c15;
  }
  local_8 = 0;
LAB_100c6bfb:
  if (iVar6 != 0) {
    FUN_1006c418();
  }
  return local_8;
code_r0x100c6586:
  local_38 = local_38 + 1;
  if (local_38 != 0) goto LAB_100c65f7;
  goto LAB_100c624b;
code_r0x100c6985:
  local_38 = local_38 + 1;
  iVar6 = local_8;
  if (local_38 != 0) goto LAB_100c69f9;
  goto LAB_100c6639;
}


