// 100bc34f size=7656 FUN_100bc34f

/* WARNING: Type propagation algorithm not settling */

int FUN_100bc34f(void)

{
  byte *pbVar1;
  undefined4 uVar2;
  int iVar3;
  byte bVar4;
  uint *puVar5;
  int iVar6;
  int iVar7;
  int in_ECX;
  int iVar8;
  uint *puVar9;
  uint uVar10;
  int *piVar11;
  uint *puVar12;
  uint *puVar13;
  uint *puVar14;
  uint **ppuVar15;
  undefined4 *puVar16;
  uint uVar17;
  uint uVar18;
  undefined4 *puVar19;
  bool bVar20;
  int local_2d0 [40];
  uint local_230 [40];
  uint auStack_190 [40];
  uint *local_f0 [16];
  uint local_b0 [16];
  uint local_70 [4];
  int local_60 [4];
  uint *local_50;
  int local_4c;
  uint local_48;
  uint *local_44;
  uint local_40;
  uint *local_3c;
  uint *local_38;
  uint *local_34;
  uint *local_30;
  uint *local_2c;
  uint *local_28;
  uint *local_24;
  uint *local_20;
  uint *local_1c;
  int local_18;
  int local_14;
  uint local_10;
  uint *local_c;
  uint *local_8;
  
  puVar14 = *(uint **)(in_ECX + 0x100);
  local_c = (uint *)(*puVar14 & 0xfffff);
  local_30 = (uint *)(*puVar14 & 0xfffff);
  local_1c = (uint *)0x0;
  local_48 = 0;
  local_44 = (uint *)0x0;
  local_60[0] = 0;
  local_60[1] = 1;
  local_60[2] = 2;
  local_60[3] = 3;
  local_4c = 0;
  local_18 = in_ECX;
  if ((local_c <= (uint *)(*puVar14 & 0xfffff)) && ((*puVar14 & 0xfff00000) == 0x20000000)) {
    local_2c = (uint *)0x0;
LAB_100bc3bc:
    local_10 = 0;
    do {
      puVar12 = local_230;
      for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
        *puVar12 = 0xffffffff;
        puVar12 = puVar12 + 1;
      }
      piVar11 = local_2d0;
      for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
        *piVar11 = -1;
        piVar11 = piVar11 + 1;
      }
      local_20 = (uint *)0x0;
      local_14 = 0;
      local_40 = 0;
      local_28 = (uint *)0x0;
      do {
        uVar17 = local_40;
        if (local_10 != 0) {
          uVar17 = 1 - local_40;
        }
        uVar10 = puVar14[2];
        uVar17 = *(uint *)(&DAT_101188a4 + uVar17 * 4);
        piVar11 = (int *)(uVar10 + (int)local_28 * 4);
        if (uVar17 < 0x10) {
          iVar8 = *(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x48);
          if (iVar8 != -1) {
            uVar2 = *(undefined4 *)(*(int *)(local_18 + 0x18) + iVar8 * 4);
            iVar8 = FUN_100b97c4(uVar2,piVar11,local_c,local_60,local_70,
                                 *(undefined4 *)(&DAT_101188b0 + uVar17 * 0x20),0);
            if (iVar8 == 0) {
              local_14 = FUN_100b99af(uVar2,&DAT_10118898 + uVar17 * 0x20,local_b0,&local_20,
                                      local_2d0,local_70,local_30,0);
              goto LAB_100bc4bf;
            }
          }
          local_14 = 1;
          break;
        }
        uVar18 = 0;
        puVar12 = local_230 + (uVar17 - 0x10) * 4;
        do {
          if ((uint *)local_60[uVar18] < local_c) {
            *puVar12 = *(uint *)(uVar10 + (local_60[uVar18] + (int)local_28) * 4);
          }
          else {
            *puVar12 = 0xffffffff;
          }
          uVar18 = uVar18 + 1;
          puVar12 = puVar12 + 1;
        } while (uVar18 < 4);
LAB_100bc4bf:
        if (local_14 == 1) break;
        local_40 = local_40 + 1;
        local_28 = (uint *)((int)local_28 + (int)local_c);
      } while (local_40 < 2);
      puVar12 = local_20;
      local_40 = 0;
      local_38 = (uint *)0x0;
      do {
        uVar17 = local_40;
        if (local_10 != 0) {
          uVar17 = 1 - local_40;
        }
        if ((0xf < *(uint *)(&DAT_101188a4 + uVar17 * 4)) &&
           (local_28 = (uint *)0x0, local_20 != (uint *)0x0)) {
          do {
            puVar13 = (uint *)0x0;
            if (local_c != (uint *)0x0) {
              uVar17 = local_b0[(int)local_28];
              puVar5 = *(uint **)(uVar17 + 0xc);
              do {
                local_8 = (uint *)0x0;
                if (puVar5 != (uint *)0x0) {
                  piVar11 = *(int **)(uVar17 + 0x10);
                  do {
                    if (*(int *)(puVar14[2] + ((int)local_38 + (int)puVar13) * 4) == *piVar11) {
                      local_14 = 1;
                      goto LAB_100bc55a;
                    }
                    local_8 = (uint *)((int)local_8 + 1);
                    puVar5 = *(uint **)(uVar17 + 0xc);
                    piVar11 = piVar11 + 1;
                  } while (local_8 < puVar5);
                }
                puVar13 = (uint *)((int)puVar13 + 1);
              } while (puVar13 < local_c);
            }
LAB_100bc55a:
            local_28 = (uint *)((int)local_28 + 1);
          } while (local_28 < local_20);
        }
        local_40 = local_40 + 1;
        local_38 = (uint *)((int)local_38 + (int)local_c);
      } while (local_40 < 2);
      if (local_14 == 0) {
        if (local_2c != (uint *)0x0) goto LAB_100bc70d;
        local_28 = (uint *)0x0;
        if (local_20 != (uint *)0x0) {
          do {
            local_3c = *(uint **)(local_b0[(int)local_28] + 0xc);
            local_38 = (uint *)0x0;
            if (local_3c != (uint *)0x0) {
              do {
                if (*(uint **)(local_18 + 0xc) != (uint *)0x0) {
                  local_8 = *(uint **)(local_18 + 0x18);
                  local_34 = *(uint **)(local_18 + 0xc);
                  do {
                    puVar13 = (uint *)*local_8;
                    if ((puVar13 != (uint *)0x0) && (*puVar13 != 0)) {
                      local_40 = 0;
                      if ((uint *)puVar13[1] != (uint *)0x0) {
                        iVar8 = *(int *)(*(int *)(local_b0[(int)local_28] + 0x10) +
                                        (int)local_38 * 4);
                        piVar11 = (int *)puVar13[2];
                        local_24 = (uint *)puVar13[1];
                        do {
                          if ((*piVar11 == iVar8) ||
                             (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x38) ==
                              iVar8)) {
                            local_40 = 1;
                          }
                          piVar11 = piVar11 + 1;
                          local_24 = (uint *)((int)local_24 + -1);
                        } while (local_24 != (uint *)0x0);
                      }
                      if (puVar13 == puVar14) {
                        local_40 = 0;
                      }
                      if (local_40 != 0) {
                        puVar5 = (uint *)0x0;
                        do {
                          if (puVar13 == (uint *)local_b0[(int)puVar5]) {
                            local_40 = 0;
                          }
                          puVar5 = (uint *)((int)puVar5 + 1);
                        } while (puVar5 < local_20);
                        if (local_40 != 0) {
                          local_14 = 1;
                        }
                      }
                    }
                    local_8 = local_8 + 1;
                    local_34 = (uint *)((int)local_34 + -1);
                  } while (local_34 != (uint *)0x0);
                }
                local_38 = (uint *)((int)local_38 + 1);
              } while (local_38 < local_3c);
            }
            local_28 = (uint *)((int)local_28 + 1);
          } while (local_28 < local_20);
        }
        local_38 = (uint *)0x0;
        do {
          uVar17 = local_230[(int)local_38];
          if ((uVar17 != 0xffffffff) && (puVar13 = (uint *)0x0, local_20 != (uint *)0x0)) {
            local_3c = *(uint **)(*(int *)(local_18 + 0x14) + uVar17 * 4);
            do {
              puVar5 = *(uint **)(local_b0[(int)puVar13] + 0xc);
              if (puVar5 != (uint *)0x0) {
                puVar9 = *(uint **)(local_b0[(int)puVar13] + 0x10);
                local_34 = puVar5;
                do {
                  if ((uVar17 == *puVar9) || (local_3c[0xe] == *puVar9)) {
                    local_14 = 1;
                  }
                  puVar9 = puVar9 + 1;
                  local_34 = (uint *)((int)local_34 + -1);
                } while (local_34 != (uint *)0x0);
              }
              puVar13 = (uint *)((int)puVar13 + 1);
            } while (puVar13 < local_20);
          }
          local_38 = (uint *)((int)local_38 + 1);
        } while (local_38 < (uint *)0x28);
        if (local_14 == 0) goto LAB_100bc70d;
      }
      local_10 = local_10 + 1;
    } while (local_10 < 2);
    if (local_14 != 0) goto code_r0x100bc6fe;
LAB_100bc70d:
    puVar13 = local_b0;
    ppuVar15 = local_f0;
    for (uVar17 = (uint)local_20 & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
      *ppuVar15 = (uint *)*puVar13;
      puVar13 = puVar13 + 1;
      ppuVar15 = ppuVar15 + 1;
    }
    for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
      *(char *)ppuVar15 = (char)*puVar13;
      puVar13 = (uint *)((int)puVar13 + 1);
      ppuVar15 = (uint **)((int)ppuVar15 + 1);
    }
    local_f0[(int)puVar12] = puVar14;
    local_44 = (uint *)((int)local_20 + 1);
    uVar17 = 0;
    do {
      iVar8 = *(int *)((int)local_230 + uVar17);
      if ((iVar8 != -1) || (iVar8 = *(int *)((int)local_2d0 + uVar17), iVar8 != -1)) {
        *(int *)((int)auStack_190 + uVar17) = iVar8;
      }
      uVar17 = uVar17 + 4;
    } while (uVar17 < 0xa0);
    local_14 = 0;
LAB_100bc76c:
    iVar8 = local_14;
    if (local_14 == 1) goto LAB_100bc778;
    goto LAB_100bcb69;
  }
LAB_100bc778:
  local_8 = *(uint **)(local_18 + 0x100);
  uVar17 = **(uint **)(local_18 + 0x100);
  local_20 = (uint *)(uVar17 & 0xfffff);
  if ((local_20 <= local_30) && ((uVar17 & 0xfff00000) == 0x20100000)) {
    local_38 = (uint *)0x0;
    local_40 = (int)local_44 << 2;
LAB_100bc7b7:
    local_28 = (uint *)0x0;
    do {
      uVar17 = local_40;
      ppuVar15 = local_f0;
      puVar14 = local_b0;
      for (uVar10 = local_40 >> 2; uVar10 != 0; uVar10 = uVar10 - 1) {
        *puVar14 = (uint)*ppuVar15;
        ppuVar15 = ppuVar15 + 1;
        puVar14 = puVar14 + 1;
      }
      for (uVar17 = uVar17 & 3; uVar17 != 0; uVar17 = uVar17 - 1) {
        *(undefined1 *)puVar14 = *(undefined1 *)ppuVar15;
        ppuVar15 = (uint **)((int)ppuVar15 + 1);
        puVar14 = (uint *)((int)puVar14 + 1);
      }
      puVar14 = local_230;
      for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
        *puVar14 = 0xffffffff;
        puVar14 = puVar14 + 1;
      }
      piVar11 = local_2d0;
      for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
        *piVar11 = -1;
        piVar11 = piVar11 + 1;
      }
      iVar8 = 0;
      local_c = local_44;
      local_14 = 0;
      local_10 = 0;
      do {
        uVar17 = local_10;
        if (local_28 != (uint *)0x0) {
          uVar17 = 1 - local_10;
        }
        uVar10 = local_8[2];
        uVar17 = *(uint *)(&DAT_10118844 + uVar17 * 4);
        piVar11 = (int *)(uVar10 + iVar8 * 4);
        if (uVar17 < 0x10) {
          iVar7 = *(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x48);
          if (iVar7 != -1) {
            uVar2 = *(undefined4 *)(*(int *)(local_18 + 0x18) + iVar7 * 4);
            iVar7 = FUN_100b97c4(uVar2,piVar11,local_20,local_60,local_70,
                                 *(undefined4 *)(&DAT_10118850 + uVar17 * 0x20),0);
            if (iVar7 == 0) {
              local_14 = FUN_100b99af(uVar2,&DAT_10118838 + uVar17 * 0x20,local_b0,&local_c,
                                      local_2d0,local_70,local_30,0);
              goto LAB_100bc8c8;
            }
          }
          local_14 = 1;
          break;
        }
        uVar18 = 0;
        puVar14 = local_230 + (uVar17 - 0x10) * 4;
        do {
          if ((uint *)local_60[uVar18] < local_20) {
            *puVar14 = *(uint *)(uVar10 + (iVar8 + local_60[uVar18]) * 4);
          }
          else {
            *puVar14 = 0xffffffff;
          }
          uVar18 = uVar18 + 1;
          puVar14 = puVar14 + 1;
        } while (uVar18 < 4);
LAB_100bc8c8:
        if (local_14 == 1) break;
        local_10 = local_10 + 1;
        iVar8 = iVar8 + (int)local_20;
      } while (local_10 < 2);
      local_10 = 0;
      local_1c = (uint *)0x0;
      do {
        uVar17 = local_10;
        if (local_28 != (uint *)0x0) {
          uVar17 = 1 - local_10;
        }
        if ((0xf < *(uint *)(&DAT_10118844 + uVar17 * 4)) &&
           (local_2c = (uint *)0x0, local_c != (uint *)0x0)) {
          do {
            puVar14 = (uint *)0x0;
            if (local_20 != (uint *)0x0) {
              puVar12 = *(uint **)(local_b0[(int)local_2c] + 0xc);
              do {
                local_24 = (uint *)0x0;
                if (puVar12 != (uint *)0x0) {
                  piVar11 = *(int **)(local_b0[(int)local_2c] + 0x10);
                  do {
                    if (*(int *)(local_8[2] + ((int)local_1c + (int)puVar14) * 4) == *piVar11) {
                      local_14 = 1;
                      goto LAB_100bc95f;
                    }
                    local_24 = (uint *)((int)local_24 + 1);
                    piVar11 = piVar11 + 1;
                  } while (local_24 < puVar12);
                }
                puVar14 = (uint *)((int)puVar14 + 1);
              } while (puVar14 < local_20);
            }
LAB_100bc95f:
            local_2c = (uint *)((int)local_2c + 1);
          } while (local_2c < local_c);
        }
        local_10 = local_10 + 1;
        local_1c = (uint *)((int)local_1c + (int)local_20);
      } while (local_10 < 2);
      if (local_14 == 0) {
        if (local_38 != (uint *)0x0) goto LAB_100bcafe;
        local_1c = (uint *)0x0;
        if (local_c != (uint *)0x0) {
          do {
            local_3c = *(uint **)(local_b0[(int)local_1c] + 0xc);
            local_2c = (uint *)0x0;
            if (local_3c != (uint *)0x0) {
              do {
                if (*(uint *)(local_18 + 0xc) != 0) {
                  local_24 = *(uint **)(local_18 + 0x18);
                  local_10 = *(uint *)(local_18 + 0xc);
                  do {
                    puVar14 = (uint *)*local_24;
                    if ((puVar14 != (uint *)0x0) && (*puVar14 != 0)) {
                      uVar17 = puVar14[1];
                      local_34 = (uint *)0x0;
                      if (uVar17 != 0) {
                        iVar8 = *(int *)(*(int *)(local_b0[(int)local_1c] + 0x10) +
                                        (int)local_2c * 4);
                        piVar11 = (int *)puVar14[2];
                        do {
                          if ((*piVar11 == iVar8) ||
                             (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x38) ==
                              iVar8)) {
                            local_34 = (uint *)0x1;
                          }
                          piVar11 = piVar11 + 1;
                          uVar17 = uVar17 - 1;
                        } while (uVar17 != 0);
                      }
                      puVar12 = local_34;
                      if (puVar14 == local_8) {
                        puVar12 = (uint *)0x0;
                      }
                      if (puVar12 != (uint *)0x0) {
                        puVar13 = (uint *)0x0;
                        do {
                          if (puVar14 == (uint *)local_b0[(int)puVar13]) {
                            puVar12 = (uint *)0x0;
                          }
                          puVar13 = (uint *)((int)puVar13 + 1);
                        } while (puVar13 < local_c);
                        if (puVar12 != (uint *)0x0) {
                          local_14 = 1;
                        }
                      }
                    }
                    local_24 = local_24 + 1;
                    local_10 = local_10 - 1;
                  } while (local_10 != 0);
                }
                local_2c = (uint *)((int)local_2c + 1);
              } while (local_2c < local_3c);
            }
            local_1c = (uint *)((int)local_1c + 1);
          } while (local_1c < local_c);
        }
        local_2c = (uint *)0x0;
        do {
          uVar17 = local_230[(int)local_2c];
          if ((uVar17 != 0xffffffff) && (puVar14 = (uint *)0x0, local_c != (uint *)0x0)) {
            do {
              iVar8 = *(int *)(local_b0[(int)puVar14] + 0xc);
              if (iVar8 != 0) {
                puVar12 = *(uint **)(local_b0[(int)puVar14] + 0x10);
                do {
                  if ((uVar17 == *puVar12) ||
                     (*(uint *)(*(int *)(*(int *)(local_18 + 0x14) + uVar17 * 4) + 0x38) == *puVar12
                     )) {
                    local_14 = 1;
                  }
                  puVar12 = puVar12 + 1;
                  iVar8 = iVar8 + -1;
                } while (iVar8 != 0);
              }
              puVar14 = (uint *)((int)puVar14 + 1);
            } while (puVar14 < local_c);
          }
          local_2c = (uint *)((int)local_2c + 1);
        } while (local_2c < (uint *)0x28);
        if (local_14 == 0) goto LAB_100bcafe;
      }
      local_28 = (uint *)((int)local_28 + 1);
    } while (local_28 < (uint *)0x2);
    if (local_14 != 0) goto code_r0x100bcaef;
LAB_100bcafe:
    puVar14 = local_b0;
    ppuVar15 = local_f0;
    for (uVar17 = (uint)local_c & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
      *ppuVar15 = (uint *)*puVar14;
      puVar14 = puVar14 + 1;
      ppuVar15 = ppuVar15 + 1;
    }
    for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
      *(char *)ppuVar15 = (char)*puVar14;
      puVar14 = (uint *)((int)puVar14 + 1);
      ppuVar15 = (uint **)((int)ppuVar15 + 1);
    }
    local_f0[(int)local_c] = local_8;
    local_44 = (uint *)((int)local_c + 1);
    uVar17 = 0;
    do {
      iVar8 = *(int *)((int)local_230 + uVar17);
      if ((iVar8 != -1) || (iVar8 = *(int *)((int)local_2d0 + uVar17), iVar8 != -1)) {
        *(int *)((int)auStack_190 + uVar17) = iVar8;
      }
      uVar17 = uVar17 + 4;
    } while (uVar17 < 0xa0);
    local_14 = 0;
    iVar8 = local_14;
    goto LAB_100bcb62;
  }
  iVar8 = 1;
LAB_100bcb62:
  local_1c = (uint *)0x1;
LAB_100bcb69:
  if (iVar8 == 0) {
    local_8 = (uint *)0x0;
    local_c = (uint *)0x0;
    puVar14 = auStack_190;
    do {
      puVar14 = puVar14 + 4;
      local_24 = (uint *)0x0;
      if (local_30 == (uint *)0x0) {
LAB_100bcbe4:
        local_8 = auStack_190 + (int)local_c * -4 + 8;
        break;
      }
      local_34 = local_30;
      puVar12 = puVar14;
      do {
        iVar8 = *(int *)(*(int *)(local_18 + 0x14) + *puVar12 * 4);
        if ((((*(byte *)(*(int *)(*(int *)(local_18 + 0x10) + *(int *)(iVar8 + 4) * 4) + 5) & 1) ==
              0) || (*(int *)(iVar8 + 8) != -1)) ||
           (*(double *)(iVar8 + 0x20) != (double)(int)local_1c)) {
          local_24 = (uint *)0x1;
        }
        puVar12 = puVar12 + 1;
        local_34 = (uint *)((int)local_34 + -1);
      } while (local_34 != (uint *)0x0);
      if (local_24 == (uint *)0x0) goto LAB_100bcbe4;
      local_c = (uint *)((int)local_c + 1);
    } while (local_c < (uint *)0x2);
    puVar14 = (uint *)0x0;
    local_34 = (uint *)0x0;
    if (local_30 != (uint *)0x0) {
      do {
        iVar8 = *(int *)(*(int *)(local_18 + 0x14) + auStack_190[(int)puVar14] * 4);
        if ((((*(byte *)(*(int *)(*(int *)(local_18 + 0x10) + *(int *)(iVar8 + 4) * 4) + 5) & 1) !=
              0) && (*(int *)(iVar8 + 8) == -1)) &&
           (*(double *)(iVar8 + 0x20) == (double)(int)local_1c)) {
          local_34 = (uint *)0x1;
        }
        puVar14 = (uint *)((int)puVar14 + 1);
      } while (puVar14 < local_30);
      if (local_34 != (uint *)0x0) {
        local_8 = (uint *)0x0;
      }
    }
    puVar14 = (uint *)0x0;
    if (local_8 == (uint *)0x0) goto LAB_100bdf96;
    puVar12 = local_8;
    if (local_30 != (uint *)0x0) {
      iVar8 = *(int *)(local_18 + 0x14);
      uVar17 = local_48;
      do {
        iVar7 = *(int *)(iVar8 + puVar12[(int)puVar14] * 4);
        uVar10 = 0;
        if (uVar17 != 0) {
          do {
            puVar12 = local_8;
            if (*(int *)(iVar7 + 0x48) == local_60[uVar10]) break;
            uVar10 = uVar10 + 1;
          } while (uVar10 < uVar17);
        }
        if (uVar10 == uVar17) {
          local_60[uVar17] = *(int *)(iVar7 + 0x48);
          uVar17 = uVar17 + 1;
        }
        puVar14 = (uint *)((int)puVar14 + 1);
      } while (puVar14 < local_30);
      local_48 = uVar17;
    }
    local_20 = puVar12;
LAB_100bde27:
    local_8 = (uint *)0x0;
    if (local_48 != 0) {
      do {
        if ((local_60[(int)local_8] == -1) ||
           (puVar14 = *(uint **)(*(int *)(local_18 + 0x18) + local_60[(int)local_8] * 4),
           (*puVar14 & 0xf0000000) == 0x60000000)) goto LAB_100bdf7a;
        puVar12 = (uint *)puVar14[3];
        puVar13 = (uint *)0x0;
        local_1c = (uint *)0x0;
        if (local_30 != (uint *)0x0) {
          do {
            if (puVar12 != (uint *)0x0) {
              puVar5 = (uint *)puVar14[4];
              local_3c = puVar12;
              do {
                if (*puVar5 == local_20[(int)puVar13]) {
                  local_1c = (uint *)((int)local_1c + 1);
                }
                puVar5 = puVar5 + 1;
                local_3c = (uint *)((int)local_3c + -1);
              } while (local_3c != (uint *)0x0);
            }
            puVar13 = (uint *)((int)puVar13 + 1);
          } while (puVar13 < local_30);
        }
        if (local_1c != puVar12) {
          local_4c = 1;
          break;
        }
        local_8 = (uint *)((int)local_8 + 1);
      } while (local_8 < local_48);
    }
    puVar14 = (uint *)0x0;
    if (local_4c == 0) {
      uVar10 = 0;
      uVar17 = 0xffffffff;
      if (local_30 != (uint *)0x0) {
        do {
          iVar8 = *(int *)(*(int *)(local_18 + 0x14) + local_20[(int)puVar14] * 4);
          uVar18 = *(uint *)(iVar8 + 0x58);
          if (uVar10 < uVar18) {
            uVar10 = uVar18;
          }
          uVar18 = *(uint *)(iVar8 + 0x54);
          if (uVar18 < uVar17) {
            uVar17 = uVar18;
          }
          puVar14 = (uint *)((int)puVar14 + 1);
        } while (puVar14 < local_30);
      }
      if (*(uint **)(local_18 + 0xc) != (uint *)0x0) {
        local_1c = *(uint **)(local_18 + 0x18);
        local_34 = *(uint **)(local_18 + 0xc);
        do {
          puVar14 = (uint *)*local_1c;
          if (*puVar14 != 0) {
            puVar12 = (uint *)0x0;
            bVar20 = local_44 == (uint *)0x0;
            if (local_44 != (uint *)0x0) {
              do {
                if (puVar14 == local_f0[(int)puVar12]) break;
                puVar12 = (uint *)((int)puVar12 + 1);
              } while (puVar12 < local_44);
              bVar20 = puVar12 == local_44;
            }
            if ((bVar20) && ((uint *)puVar14[1] != (uint *)0x0)) {
              puVar12 = (uint *)puVar14[2];
              local_3c = (uint *)puVar14[1];
              do {
                puVar14 = (uint *)0x0;
                if (local_30 != (uint *)0x0) {
                  do {
                    if ((local_20[(int)puVar14] == *puVar12) ||
                       (*(uint *)(*(int *)(*(int *)(local_18 + 0x14) + *puVar12 * 4) + 0x38) ==
                        local_20[(int)puVar14])) {
                      local_4c = 1;
                    }
                    puVar14 = (uint *)((int)puVar14 + 1);
                  } while (puVar14 < local_30);
                }
                puVar12 = puVar12 + 1;
                local_3c = (uint *)((int)local_3c + -1);
              } while (local_3c != (uint *)0x0);
            }
          }
          local_1c = local_1c + 1;
          local_34 = (uint *)((int)local_34 + -1);
        } while (local_34 != (uint *)0x0);
        if (local_4c != 0) goto LAB_100bdf7a;
      }
      local_3c = (uint *)0x0;
      if (local_48 != 0) {
        do {
          iVar8 = *(int *)(*(int *)(local_18 + 0x18) + local_60[(int)local_3c] * 4);
          local_50 = *(uint **)(*(int *)(local_18 + 0x100) + 0xc);
          local_c = (uint *)0x0;
          if (local_50 != (uint *)0x0) {
            do {
              local_1c = (uint *)0x0;
              if (*(int *)(iVar8 + 0xc) != 0) {
                do {
                  if (*(uint *)(*(int *)(iVar8 + 0x10) + (int)local_1c * 4) ==
                      local_20[(int)local_c]) {
                    *(undefined4 *)(*(int *)(iVar8 + 0x10) + (int)local_1c * 4) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(local_18 + 0x100) + 0x10) + (int)local_c * 4);
                    pbVar1 = (byte *)(*(int *)(*(int *)(local_18 + 0x14) +
                                              *(int *)(*(int *)(iVar8 + 0x10) + (int)local_1c * 4) *
                                              4) + 0x3d);
                    *pbVar1 = *pbVar1 | 2;
                  }
                  local_1c = (uint *)((int)local_1c + 1);
                } while (local_1c < *(uint *)(iVar8 + 0xc));
              }
              local_c = (uint *)((int)local_c + 1);
            } while (local_c < local_50);
          }
          local_3c = (uint *)((int)local_3c + 1);
        } while (local_3c < local_48);
      }
      puVar14 = (uint *)0x0;
      if (local_44 != (uint *)0x0) {
        do {
          *local_f0[(int)puVar14] = 0;
          puVar14 = (uint *)((int)puVar14 + 1);
        } while (puVar14 < local_44);
      }
    }
    else {
LAB_100bdf7a:
      iVar8 = FUN_10085814(0x74);
      if (iVar8 == 0) {
        iVar8 = 0;
      }
      else {
        iVar8 = FUN_10085379();
      }
      if (iVar8 == 0) goto LAB_100bdf96;
      iVar7 = FUN_1008585f((uint)local_30 & 0xfffff | 0x10000000,local_30,local_30,0);
      if ((iVar7 < 0) || (iVar7 = FUN_100853b0(*(undefined4 *)(local_18 + 0x100)), iVar7 < 0)) {
        FUN_1006c418(1);
        return iVar7;
      }
      puVar14 = local_20;
      puVar12 = *(uint **)(iVar8 + 8);
      for (uVar17 = (uint)local_30 & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
        *puVar12 = *puVar14;
        puVar14 = puVar14 + 1;
        puVar12 = puVar12 + 1;
      }
      for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
        *(char *)puVar12 = (char)*puVar14;
        puVar14 = (uint *)((int)puVar14 + 1);
        puVar12 = (uint *)((int)puVar12 + 1);
      }
      puVar16 = *(undefined4 **)(*(int *)(local_18 + 0x100) + 0x10);
      puVar19 = *(undefined4 **)(iVar8 + 0x10);
      for (uVar17 = (uint)local_30 & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
        *puVar19 = *puVar16;
        puVar16 = puVar16 + 1;
        puVar19 = puVar19 + 1;
      }
      for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
        *(undefined1 *)puVar19 = *(undefined1 *)puVar16;
        puVar16 = (undefined4 *)((int)puVar16 + 1);
        puVar19 = (undefined4 *)((int)puVar19 + 1);
      }
      puVar14 = (uint *)0x0;
      if (local_30 != (uint *)0x0) {
        do {
          pbVar1 = (byte *)(*(int *)(*(int *)(local_18 + 0x14) +
                                    *(int *)(*(int *)(iVar8 + 0x10) + (int)puVar14 * 4) * 4) + 0x3d)
          ;
          *pbVar1 = *pbVar1 | 2;
          puVar14 = (uint *)((int)puVar14 + 1);
        } while (puVar14 < local_30);
      }
      puVar14 = (uint *)0x0;
      if (local_44 != (uint *)0x0) {
        do {
          ppuVar15 = local_f0 + (int)puVar14;
          puVar14 = (uint *)((int)puVar14 + 1);
          **ppuVar15 = 0;
        } while (puVar14 < local_44);
      }
      piVar11 = (int *)(local_18 + 0xfc);
      if (*(int *)(*(int *)(local_18 + 0x18) + *piVar11 * 4) != 0) {
        FUN_1006c418(1);
      }
      *(int *)(*(int *)(local_18 + 0x18) + *piVar11 * 4) = iVar8;
    }
    iVar8 = 0;
  }
  else {
    local_38 = *(uint **)(local_18 + 0x100);
    local_c = (uint *)(*local_38 & 0xfffff);
    local_30 = (uint *)(*local_38 & 0xfffff);
    local_3c = (uint *)0x1;
    if ((local_c <= (uint *)(*local_38 & 0xfffff)) && ((*local_38 & 0xfff00000) == 0x30000000)) {
      local_2c = (uint *)0x0;
      local_40 = (int)local_44 << 2;
LAB_100bccea:
      local_28 = (uint *)0x0;
      do {
        uVar17 = local_40;
        ppuVar15 = local_f0;
        puVar14 = local_b0;
        for (uVar10 = local_40 >> 2; uVar10 != 0; uVar10 = uVar10 - 1) {
          *puVar14 = (uint)*ppuVar15;
          ppuVar15 = ppuVar15 + 1;
          puVar14 = puVar14 + 1;
        }
        for (uVar17 = uVar17 & 3; uVar17 != 0; uVar17 = uVar17 - 1) {
          *(undefined1 *)puVar14 = *(undefined1 *)ppuVar15;
          ppuVar15 = (uint **)((int)ppuVar15 + 1);
          puVar14 = (uint *)((int)puVar14 + 1);
        }
        puVar14 = local_230;
        for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
          *puVar14 = 0xffffffff;
          puVar14 = puVar14 + 1;
        }
        piVar11 = local_2d0;
        for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
          *piVar11 = -1;
          piVar11 = piVar11 + 1;
        }
        iVar8 = 0;
        local_20 = local_44;
        local_14 = 0;
        local_10 = 0;
        do {
          uVar17 = local_10;
          if (local_28 != (uint *)0x0) {
            uVar17 = 1 - local_10;
          }
          uVar10 = local_38[2];
          uVar17 = *(uint *)(&DAT_10118644 + uVar17 * 4);
          piVar11 = (int *)(uVar10 + iVar8 * 4);
          if (uVar17 < 0x10) {
            iVar7 = *(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x48);
            if (iVar7 != -1) {
              uVar2 = *(undefined4 *)(*(int *)(local_18 + 0x18) + iVar7 * 4);
              iVar7 = FUN_100b97c4(uVar2,piVar11,local_c,local_60,local_70,
                                   *(undefined4 *)(&DAT_10118650 + uVar17 * 0x20),0);
              if (iVar7 == 0) {
                local_14 = FUN_100b99af(uVar2,&DAT_10118638 + uVar17 * 0x20,local_b0,&local_20,
                                        local_2d0,local_70,local_30,0);
                goto LAB_100bcdfb;
              }
            }
            local_14 = 1;
            break;
          }
          uVar18 = 0;
          puVar14 = local_230 + (uVar17 - 0x10) * 4;
          do {
            if ((uint *)local_60[uVar18] < local_c) {
              *puVar14 = *(uint *)(uVar10 + (iVar8 + local_60[uVar18]) * 4);
            }
            else {
              *puVar14 = 0xffffffff;
            }
            uVar18 = uVar18 + 1;
            puVar14 = puVar14 + 1;
          } while (uVar18 < 4);
LAB_100bcdfb:
          if (local_14 == 1) break;
          local_10 = local_10 + 1;
          iVar8 = iVar8 + (int)local_c;
        } while (local_10 < 3);
        puVar14 = local_20;
        local_10 = 0;
        local_24 = (uint *)0x0;
        do {
          uVar17 = local_10;
          if (local_28 != (uint *)0x0) {
            uVar17 = 1 - local_10;
          }
          if ((0xf < *(uint *)(&DAT_10118644 + uVar17 * 4)) &&
             (local_8 = (uint *)0x0, local_20 != (uint *)0x0)) {
            do {
              puVar12 = (uint *)0x0;
              if (local_c != (uint *)0x0) {
                puVar13 = *(uint **)(local_b0[(int)local_8] + 0xc);
                do {
                  local_1c = (uint *)0x0;
                  if (puVar13 != (uint *)0x0) {
                    piVar11 = *(int **)(local_b0[(int)local_8] + 0x10);
                    do {
                      if (*(int *)(local_38[2] + ((int)local_24 + (int)puVar12) * 4) == *piVar11) {
                        local_14 = 1;
                        goto LAB_100bce92;
                      }
                      local_1c = (uint *)((int)local_1c + 1);
                      piVar11 = piVar11 + 1;
                    } while (local_1c < puVar13);
                  }
                  puVar12 = (uint *)((int)puVar12 + 1);
                } while (puVar12 < local_c);
              }
LAB_100bce92:
              local_8 = (uint *)((int)local_8 + 1);
            } while (local_8 < local_20);
          }
          local_10 = local_10 + 1;
          local_24 = (uint *)((int)local_24 + (int)local_c);
        } while (local_10 < 3);
        if (local_14 == 0) {
          if (local_2c != (uint *)0x0) goto LAB_100bd031;
          local_1c = (uint *)0x0;
          if (local_20 != (uint *)0x0) {
            do {
              local_50 = *(uint **)(local_b0[(int)local_1c] + 0xc);
              local_8 = (uint *)0x0;
              if (local_50 != (uint *)0x0) {
                do {
                  if (*(uint *)(local_18 + 0xc) != 0) {
                    local_24 = *(uint **)(local_18 + 0x18);
                    local_10 = *(uint *)(local_18 + 0xc);
                    do {
                      puVar12 = (uint *)*local_24;
                      if ((puVar12 != (uint *)0x0) && (*puVar12 != 0)) {
                        uVar17 = puVar12[1];
                        local_34 = (uint *)0x0;
                        if (uVar17 != 0) {
                          iVar8 = *(int *)(*(int *)(local_b0[(int)local_1c] + 0x10) +
                                          (int)local_8 * 4);
                          piVar11 = (int *)puVar12[2];
                          do {
                            if ((*piVar11 == iVar8) ||
                               (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x38)
                                == iVar8)) {
                              local_34 = (uint *)0x1;
                            }
                            piVar11 = piVar11 + 1;
                            uVar17 = uVar17 - 1;
                          } while (uVar17 != 0);
                        }
                        puVar13 = local_34;
                        if (puVar12 == local_38) {
                          puVar13 = (uint *)0x0;
                        }
                        if (puVar13 != (uint *)0x0) {
                          puVar5 = (uint *)0x0;
                          do {
                            if (puVar12 == (uint *)local_b0[(int)puVar5]) {
                              puVar13 = (uint *)0x0;
                            }
                            puVar5 = (uint *)((int)puVar5 + 1);
                          } while (puVar5 < local_20);
                          if (puVar13 != (uint *)0x0) {
                            local_14 = 1;
                          }
                        }
                      }
                      local_24 = local_24 + 1;
                      local_10 = local_10 - 1;
                    } while (local_10 != 0);
                  }
                  local_8 = (uint *)((int)local_8 + 1);
                } while (local_8 < local_50);
              }
              local_1c = (uint *)((int)local_1c + 1);
            } while (local_1c < local_20);
          }
          local_8 = (uint *)0x0;
          do {
            uVar17 = local_230[(int)local_8];
            if ((uVar17 != 0xffffffff) && (puVar12 = (uint *)0x0, local_20 != (uint *)0x0)) {
              do {
                iVar8 = *(int *)(local_b0[(int)puVar12] + 0xc);
                if (iVar8 != 0) {
                  puVar13 = *(uint **)(local_b0[(int)puVar12] + 0x10);
                  do {
                    if ((uVar17 == *puVar13) ||
                       (*(uint *)(*(int *)(*(int *)(local_18 + 0x14) + uVar17 * 4) + 0x38) ==
                        *puVar13)) {
                      local_14 = 1;
                    }
                    puVar13 = puVar13 + 1;
                    iVar8 = iVar8 + -1;
                  } while (iVar8 != 0);
                }
                puVar12 = (uint *)((int)puVar12 + 1);
              } while (puVar12 < local_20);
            }
            local_8 = (uint *)((int)local_8 + 1);
          } while (local_8 < (uint *)0x28);
          if (local_14 == 0) goto LAB_100bd031;
        }
        local_28 = (uint *)((int)local_28 + 1);
      } while (local_28 == (uint *)0x0);
      if (local_14 != 0) goto code_r0x100bd022;
LAB_100bd031:
      puVar12 = local_b0;
      ppuVar15 = local_f0;
      for (uVar17 = (uint)local_20 & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
        *ppuVar15 = (uint *)*puVar12;
        puVar12 = puVar12 + 1;
        ppuVar15 = ppuVar15 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(char *)ppuVar15 = (char)*puVar12;
        puVar12 = (uint *)((int)puVar12 + 1);
        ppuVar15 = (uint **)((int)ppuVar15 + 1);
      }
      local_f0[(int)puVar14] = local_38;
      local_44 = (uint *)((int)puVar14 + 1);
      uVar17 = 0;
      do {
        iVar8 = *(int *)((int)local_230 + uVar17);
        if ((iVar8 != -1) || (iVar8 = *(int *)((int)local_2d0 + uVar17), iVar8 != -1)) {
          *(int *)((int)auStack_190 + uVar17) = iVar8;
        }
        uVar17 = uVar17 + 4;
      } while (uVar17 < 0xa0);
      local_14 = 0;
LAB_100bd092:
      iVar8 = local_14;
      if (local_14 == 1) goto LAB_100bd09e;
      goto LAB_100bd48b;
    }
LAB_100bd09e:
    local_38 = *(uint **)(local_18 + 0x100);
    uVar17 = **(uint **)(local_18 + 0x100);
    local_20 = (uint *)(uVar17 & 0xfffff);
    if ((local_20 <= local_30) && ((uVar17 & 0xfff00000) == 0x30000000)) {
      local_2c = (uint *)0x0;
      local_40 = (int)local_44 << 2;
LAB_100bd0dd:
      local_28 = (uint *)0x0;
      do {
        uVar17 = local_40;
        ppuVar15 = local_f0;
        puVar14 = local_b0;
        for (uVar10 = local_40 >> 2; uVar10 != 0; uVar10 = uVar10 - 1) {
          *puVar14 = (uint)*ppuVar15;
          ppuVar15 = ppuVar15 + 1;
          puVar14 = puVar14 + 1;
        }
        for (uVar17 = uVar17 & 3; uVar17 != 0; uVar17 = uVar17 - 1) {
          *(undefined1 *)puVar14 = *(undefined1 *)ppuVar15;
          ppuVar15 = (uint **)((int)ppuVar15 + 1);
          puVar14 = (uint *)((int)puVar14 + 1);
        }
        puVar14 = local_230;
        for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
          *puVar14 = 0xffffffff;
          puVar14 = puVar14 + 1;
        }
        piVar11 = local_2d0;
        for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
          *piVar11 = -1;
          piVar11 = piVar11 + 1;
        }
        iVar8 = 0;
        local_c = local_44;
        local_14 = 0;
        local_10 = 0;
        do {
          uVar17 = local_10;
          if (local_28 != (uint *)0x0) {
            uVar17 = 1 - local_10;
          }
          uVar10 = local_38[2];
          uVar17 = *(uint *)(&DAT_101187a4 + uVar17 * 4);
          piVar11 = (int *)(uVar10 + iVar8 * 4);
          if (uVar17 < 0x10) {
            iVar7 = *(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x48);
            if (iVar7 != -1) {
              uVar2 = *(undefined4 *)(*(int *)(local_18 + 0x18) + iVar7 * 4);
              iVar7 = FUN_100b97c4(uVar2,piVar11,local_20,local_60,local_70,
                                   *(undefined4 *)(&DAT_101187b0 + uVar17 * 0x20),0);
              if (iVar7 == 0) {
                local_14 = FUN_100b99af(uVar2,&DAT_10118798 + uVar17 * 0x20,local_b0,&local_c,
                                        local_2d0,local_70,local_30,0);
                goto LAB_100bd1ed;
              }
            }
            local_14 = 1;
            break;
          }
          uVar18 = 0;
          puVar14 = local_230 + (uVar17 - 0x10) * 4;
          do {
            if ((uint *)local_60[uVar18] < local_20) {
              *puVar14 = *(uint *)(uVar10 + (local_60[uVar18] + iVar8) * 4);
            }
            else {
              *puVar14 = 0xffffffff;
            }
            uVar18 = uVar18 + 1;
            puVar14 = puVar14 + 1;
          } while (uVar18 < 4);
LAB_100bd1ed:
          if (local_14 == 1) break;
          local_10 = local_10 + 1;
          iVar8 = iVar8 + (int)local_20;
        } while (local_10 < 3);
        puVar14 = local_c;
        local_10 = 0;
        local_24 = (uint *)0x0;
        do {
          uVar17 = local_10;
          if (local_28 != (uint *)0x0) {
            uVar17 = 1 - local_10;
          }
          if ((0xf < *(uint *)(&DAT_101187a4 + uVar17 * 4)) &&
             (local_8 = (uint *)0x0, local_c != (uint *)0x0)) {
            do {
              puVar12 = (uint *)0x0;
              if (local_20 != (uint *)0x0) {
                puVar13 = *(uint **)(local_b0[(int)local_8] + 0xc);
                do {
                  local_1c = (uint *)0x0;
                  if (puVar13 != (uint *)0x0) {
                    piVar11 = *(int **)(local_b0[(int)local_8] + 0x10);
                    do {
                      if (*(int *)(local_38[2] + ((int)local_24 + (int)puVar12) * 4) == *piVar11) {
                        local_14 = 1;
                        goto LAB_100bd284;
                      }
                      local_1c = (uint *)((int)local_1c + 1);
                      piVar11 = piVar11 + 1;
                    } while (local_1c < puVar13);
                  }
                  puVar12 = (uint *)((int)puVar12 + 1);
                } while (puVar12 < local_20);
              }
LAB_100bd284:
              local_8 = (uint *)((int)local_8 + 1);
            } while (local_8 < local_c);
          }
          local_10 = local_10 + 1;
          local_24 = (uint *)((int)local_24 + (int)local_20);
        } while (local_10 < 3);
        if (local_14 == 0) {
          if (local_2c != (uint *)0x0) goto LAB_100bd423;
          local_1c = (uint *)0x0;
          if (local_c != (uint *)0x0) {
            do {
              local_50 = *(uint **)(local_b0[(int)local_1c] + 0xc);
              local_8 = (uint *)0x0;
              if (local_50 != (uint *)0x0) {
                do {
                  if (*(uint *)(local_18 + 0xc) != 0) {
                    local_24 = *(uint **)(local_18 + 0x18);
                    local_10 = *(uint *)(local_18 + 0xc);
                    do {
                      puVar12 = (uint *)*local_24;
                      if ((puVar12 != (uint *)0x0) && (*puVar12 != 0)) {
                        uVar17 = puVar12[1];
                        local_34 = (uint *)0x0;
                        if (uVar17 != 0) {
                          iVar8 = *(int *)(*(int *)(local_b0[(int)local_1c] + 0x10) +
                                          (int)local_8 * 4);
                          piVar11 = (int *)puVar12[2];
                          do {
                            if ((*piVar11 == iVar8) ||
                               (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x38)
                                == iVar8)) {
                              local_34 = (uint *)0x1;
                            }
                            piVar11 = piVar11 + 1;
                            uVar17 = uVar17 - 1;
                          } while (uVar17 != 0);
                        }
                        puVar13 = local_34;
                        if (puVar12 == local_38) {
                          puVar13 = (uint *)0x0;
                        }
                        if (puVar13 != (uint *)0x0) {
                          puVar5 = (uint *)0x0;
                          do {
                            if (puVar12 == (uint *)local_b0[(int)puVar5]) {
                              puVar13 = (uint *)0x0;
                            }
                            puVar5 = (uint *)((int)puVar5 + 1);
                          } while (puVar5 < local_c);
                          if (puVar13 != (uint *)0x0) {
                            local_14 = 1;
                          }
                        }
                      }
                      local_24 = local_24 + 1;
                      local_10 = local_10 - 1;
                    } while (local_10 != 0);
                  }
                  local_8 = (uint *)((int)local_8 + 1);
                } while (local_8 < local_50);
              }
              local_1c = (uint *)((int)local_1c + 1);
            } while (local_1c < local_c);
          }
          local_8 = (uint *)0x0;
          do {
            uVar17 = local_230[(int)local_8];
            if ((uVar17 != 0xffffffff) && (puVar12 = (uint *)0x0, local_c != (uint *)0x0)) {
              do {
                iVar8 = *(int *)(local_b0[(int)puVar12] + 0xc);
                if (iVar8 != 0) {
                  puVar13 = *(uint **)(local_b0[(int)puVar12] + 0x10);
                  do {
                    if ((uVar17 == *puVar13) ||
                       (*(uint *)(*(int *)(*(int *)(local_18 + 0x14) + uVar17 * 4) + 0x38) ==
                        *puVar13)) {
                      local_14 = 1;
                    }
                    puVar13 = puVar13 + 1;
                    iVar8 = iVar8 + -1;
                  } while (iVar8 != 0);
                }
                puVar12 = (uint *)((int)puVar12 + 1);
              } while (puVar12 < local_c);
            }
            local_8 = (uint *)((int)local_8 + 1);
          } while (local_8 < (uint *)0x28);
          if (local_14 == 0) goto LAB_100bd423;
        }
        local_28 = (uint *)((int)local_28 + 1);
      } while (local_28 == (uint *)0x0);
      if (local_14 != 0) goto code_r0x100bd414;
LAB_100bd423:
      puVar12 = local_b0;
      ppuVar15 = local_f0;
      for (uVar17 = (uint)local_c & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
        *ppuVar15 = (uint *)*puVar12;
        puVar12 = puVar12 + 1;
        ppuVar15 = ppuVar15 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(char *)ppuVar15 = (char)*puVar12;
        puVar12 = (uint *)((int)puVar12 + 1);
        ppuVar15 = (uint **)((int)ppuVar15 + 1);
      }
      local_f0[(int)puVar14] = local_38;
      local_44 = (uint *)((int)puVar14 + 1);
      uVar17 = 0;
      do {
        iVar8 = *(int *)((int)local_230 + uVar17);
        if ((iVar8 != -1) || (iVar8 = *(int *)((int)local_2d0 + uVar17), iVar8 != -1)) {
          *(int *)((int)auStack_190 + uVar17) = iVar8;
        }
        uVar17 = uVar17 + 4;
      } while (uVar17 < 0xa0);
      local_14 = 0;
      iVar8 = local_14;
      goto LAB_100bd487;
    }
    iVar8 = 1;
LAB_100bd487:
    local_3c = (uint *)0x0;
LAB_100bd48b:
    if (iVar8 == 0) {
      local_8 = (uint *)0x0;
      if (local_30 != (uint *)0x0) {
        do {
          iVar8 = *(int *)(*(int *)(local_18 + 0x14) + auStack_190[(int)local_8] * 4);
          uVar17 = auStack_190[(int)(local_8 + 2)];
          local_34 = *(uint **)(*(int *)(local_18 + 0x14) + auStack_190[(int)(local_8 + 1)] * 4);
          if ((((uVar17 != auStack_190[(int)(local_8 + 5)]) ||
               (auStack_190[(int)(local_8 + 3)] != auStack_190[(int)(local_8 + 6)])) ||
              (auStack_190[(int)(local_8 + 4)] != auStack_190[(int)(local_8 + 7)])) ||
             (uVar17 != auStack_190[(int)(local_8 + 3)])) goto LAB_100bdf96;
          iVar7 = *(int *)(local_18 + 0x10);
          iVar6 = *(int *)(*(int *)(local_18 + 0x14) + auStack_190[(int)(local_8 + 4)] * 4);
          if (((((*(byte *)(*(int *)(iVar7 + *(int *)(iVar8 + 4) * 4) + 5) & 1) == 0) ||
               ((*(byte *)(*(int *)(iVar7 + local_34[1] * 4) + 5) & 1) == 0)) ||
              (((*(byte *)(*(int *)(iVar7 + *(int *)(iVar6 + 4) * 4) + 5) & 1) == 0 ||
               ((*(double *)(iVar8 + 0x20) != 1.0 ||
                (local_50 = (uint *)((uint)(local_3c == (uint *)0x0) * 2 - 1),
                *(double *)(local_34 + 8) != (double)(int)local_50)))))) ||
             (*(double *)(iVar6 + 0x20) != 0.0)) goto LAB_100bdf96;
          iVar8 = *(int *)(*(int *)(local_18 + 0x14) + uVar17 * 4);
          if (*(int *)(iVar8 + 4) != *(int *)(local_18 + 0x88)) {
            local_4c = 1;
          }
          uVar17 = 0;
          if (local_48 != 0) {
            do {
              if (*(int *)(iVar8 + 0x48) == local_60[uVar17]) break;
              uVar17 = uVar17 + 1;
            } while (uVar17 < local_48);
          }
          if ((uVar17 == local_48) && (local_4c == 0)) {
            local_60[local_48] = *(int *)(iVar8 + 0x48);
            local_48 = local_48 + 1;
          }
          local_8 = (uint *)((int)local_8 + 1);
        } while (local_8 < local_30);
      }
      local_20 = auStack_190 + 8;
      goto LAB_100bde27;
    }
    if (iVar8 != 1) {
LAB_100bde1f:
      if (iVar8 != 0) {
        return iVar8;
      }
      goto LAB_100bde27;
    }
    local_38 = *(uint **)(local_18 + 0x100);
    uVar17 = **(uint **)(local_18 + 0x100);
    local_20 = (uint *)(uVar17 & 0xfffff);
    if ((local_30 < local_20) || ((uVar17 & 0xfff00000) != 0x30000000)) {
      iVar8 = 1;
LAB_100bd62c:
      iVar7 = local_18;
      local_c = (uint *)0x0;
      local_34 = (uint *)0x0;
      if (((*(byte *)(local_18 + 0x6e) & 0x40) == 0) ||
         ((iVar6 = FUN_100bb9d8(&local_c,local_f0,&local_44), iVar6 != 0 &&
          (iVar6 = FUN_100bbff0(&local_c,local_f0,&local_44), iVar6 != 0)))) {
        local_44 = (uint *)0x1;
        local_f0[0] = *(uint **)(iVar7 + 0x100);
        local_c = *(uint **)(iVar7 + 0x100);
      }
      else {
        local_34 = local_c;
      }
      if ((local_c != (uint *)0x0) && ((*local_c & 0xfff00000) == 0x70b00000)) {
        local_30 = (uint *)(*local_c & 0xfffff);
        local_3c = (uint *)((int)local_30 << 2);
        local_10 = 0;
        local_8 = (uint *)0x0;
        local_2c = (uint *)((int)local_30 * -4);
        do {
          local_24 = (uint *)0x0;
          if (local_30 != (uint *)0x0) {
            uVar17 = local_c[2];
            iVar8 = *(int *)(local_18 + 0x14);
            local_1c = (uint *)((int)local_3c + uVar17);
            puVar14 = local_8;
            do {
              pbVar1 = *(byte **)(iVar8 + *(int *)((int)puVar14 + uVar17) * 4);
              local_50 = *(uint **)(iVar8 + *local_1c * 4);
              if ((pbVar1[0x3e] & 8) == 0) {
                bVar4 = *pbVar1 & 4;
              }
              else {
                bVar4 = *pbVar1 & 8;
              }
              if ((((bVar4 == 0) ||
                   ((*(byte *)(*(int *)(*(int *)(local_18 + 0x10) + *(int *)((int)local_50 + 4) * 4)
                              + 5) & 1) == 0)) || (*(double *)((int)local_50 + 0x20) != 1.0)) ||
                 (*(int *)((int)local_50 + 8) != -1)) break;
              iVar7 = *(int *)(pbVar1 + 4);
              local_70[(int)local_24] = *(uint *)((int)puVar14 + local_c[2]);
              if (iVar7 != *(int *)(local_18 + 0x88)) {
                local_4c = 1;
              }
              local_1c = local_1c + 1;
              local_24 = (uint *)((int)local_24 + 1);
              puVar14 = puVar14 + 1;
            } while (local_24 < local_30);
          }
          if (local_24 == local_30) {
            if (local_30 != (uint *)0x0) {
              iVar8 = *(int *)(local_18 + 0x14);
              piVar11 = (int *)(local_c[2] + local_10 * (int)local_30 * 4);
              puVar14 = local_30;
              do {
                uVar17 = local_48;
                iVar7 = *(int *)(iVar8 + *piVar11 * 4);
                if (*(int *)(iVar7 + 0x38) == -1) {
                  uVar10 = 0;
                  if (local_48 != 0) {
                    do {
                      if (*(int *)(iVar7 + 0x48) == local_60[uVar10]) break;
                      uVar10 = uVar10 + 1;
                    } while (uVar10 < local_48);
                  }
                  if ((uVar10 == local_48) && (local_4c == 0)) {
                    local_48 = local_48 + 1;
                    local_60[uVar17] = *(int *)(iVar7 + 0x48);
                  }
                }
                else {
                  local_4c = 1;
                }
                piVar11 = piVar11 + 1;
                puVar14 = (uint *)((int)puVar14 + -1);
              } while (puVar14 != (uint *)0x0);
            }
            break;
          }
          local_10 = local_10 + 1;
          local_8 = local_8 + (int)local_30;
          local_3c = (uint *)((int)local_3c + (int)local_2c);
        } while (local_10 < 2);
        if (local_10 == 2) goto LAB_100bdf96;
        local_20 = local_70;
        iVar8 = 0;
      }
      if (local_34 != (uint *)0x0) {
        FUN_1006c418(1);
      }
      goto LAB_100bde1f;
    }
    local_2c = (uint *)0x0;
LAB_100bd687:
    local_28 = (uint *)0x0;
    do {
      puVar14 = local_44;
      ppuVar15 = local_f0;
      puVar12 = local_b0;
      for (uVar17 = (uint)local_44 & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
        *puVar12 = (uint)*ppuVar15;
        ppuVar15 = ppuVar15 + 1;
        puVar12 = puVar12 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(undefined1 *)puVar12 = *(undefined1 *)ppuVar15;
        ppuVar15 = (uint **)((int)ppuVar15 + 1);
        puVar12 = (uint *)((int)puVar12 + 1);
      }
      puVar12 = local_230;
      for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
        *puVar12 = 0xffffffff;
        puVar12 = puVar12 + 1;
      }
      iVar7 = 0;
      piVar11 = local_2d0;
      for (iVar8 = 0x28; iVar8 != 0; iVar8 = iVar8 + -1) {
        *piVar11 = -1;
        piVar11 = piVar11 + 1;
      }
      local_c = puVar14;
      local_14 = 0;
      local_10 = 0;
      do {
        uVar17 = local_10;
        if (local_28 != (uint *)0x0) {
          uVar17 = 1 - local_10;
        }
        uVar10 = local_38[2];
        uVar17 = *(uint *)(&DAT_101186e4 + uVar17 * 4);
        piVar11 = (int *)(uVar10 + iVar7 * 4);
        if (uVar17 < 0x10) {
          iVar8 = *(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x48);
          if (iVar8 != -1) {
            uVar2 = *(undefined4 *)(*(int *)(local_18 + 0x18) + iVar8 * 4);
            iVar8 = FUN_100b97c4(uVar2,piVar11,local_20,local_60,local_70,
                                 *(undefined4 *)(&DAT_101186f0 + uVar17 * 0x20),0);
            if (iVar8 == 0) {
              local_14 = FUN_100b99af(uVar2,&DAT_101186d8 + uVar17 * 0x20,local_b0,&local_c,
                                      local_2d0,local_70,local_30,0);
              goto LAB_100bd799;
            }
          }
          local_14 = 1;
          break;
        }
        uVar18 = 0;
        puVar14 = local_230 + (uVar17 - 0x10) * 4;
        do {
          if ((uint *)local_60[uVar18] < local_20) {
            *puVar14 = *(uint *)(uVar10 + (local_60[uVar18] + iVar7) * 4);
          }
          else {
            *puVar14 = 0xffffffff;
          }
          uVar18 = uVar18 + 1;
          puVar14 = puVar14 + 1;
        } while (uVar18 < 4);
LAB_100bd799:
        if (local_14 == 1) break;
        local_10 = local_10 + 1;
        iVar7 = iVar7 + (int)local_20;
      } while (local_10 < 3);
      puVar14 = local_c;
      local_10 = 0;
      local_24 = (uint *)0x0;
      do {
        uVar17 = local_10;
        if (local_28 != (uint *)0x0) {
          uVar17 = 1 - local_10;
        }
        if ((0xf < *(uint *)(&DAT_101186e4 + uVar17 * 4)) &&
           (local_8 = (uint *)0x0, local_c != (uint *)0x0)) {
          do {
            puVar12 = (uint *)0x0;
            if (local_20 != (uint *)0x0) {
              puVar13 = *(uint **)(local_b0[(int)local_8] + 0xc);
              do {
                local_1c = (uint *)0x0;
                if (puVar13 != (uint *)0x0) {
                  piVar11 = *(int **)(local_b0[(int)local_8] + 0x10);
                  do {
                    if (*(int *)(local_38[2] + ((int)local_24 + (int)puVar12) * 4) == *piVar11) {
                      local_14 = 1;
                      goto LAB_100bd830;
                    }
                    local_1c = (uint *)((int)local_1c + 1);
                    piVar11 = piVar11 + 1;
                  } while (local_1c < puVar13);
                }
                puVar12 = (uint *)((int)puVar12 + 1);
              } while (puVar12 < local_20);
            }
LAB_100bd830:
            local_8 = (uint *)((int)local_8 + 1);
          } while (local_8 < local_c);
        }
        local_10 = local_10 + 1;
        local_24 = (uint *)((int)local_24 + (int)local_20);
      } while (local_10 < 3);
      if (local_14 == 0) {
        if (local_2c != (uint *)0x0) goto LAB_100bd9cf;
        local_1c = (uint *)0x0;
        if (local_c != (uint *)0x0) {
          do {
            local_50 = *(uint **)(local_b0[(int)local_1c] + 0xc);
            local_8 = (uint *)0x0;
            if (local_50 != (uint *)0x0) {
              do {
                if (*(uint **)(local_18 + 0xc) != (uint *)0x0) {
                  local_34 = *(uint **)(local_18 + 0x18);
                  local_24 = *(uint **)(local_18 + 0xc);
                  do {
                    puVar12 = (uint *)*local_34;
                    if ((puVar12 != (uint *)0x0) && (*puVar12 != 0)) {
                      uVar17 = puVar12[1];
                      local_3c = (uint *)0x0;
                      if (uVar17 != 0) {
                        iVar8 = *(int *)(*(int *)(local_b0[(int)local_1c] + 0x10) + (int)local_8 * 4
                                        );
                        piVar11 = (int *)puVar12[2];
                        do {
                          if ((*piVar11 == iVar8) ||
                             (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar11 * 4) + 0x38) ==
                              iVar8)) {
                            local_3c = (uint *)0x1;
                          }
                          piVar11 = piVar11 + 1;
                          uVar17 = uVar17 - 1;
                        } while (uVar17 != 0);
                      }
                      puVar13 = local_3c;
                      if (puVar12 == local_38) {
                        puVar13 = (uint *)0x0;
                      }
                      if (puVar13 != (uint *)0x0) {
                        puVar5 = (uint *)0x0;
                        do {
                          if (puVar12 == (uint *)local_b0[(int)puVar5]) {
                            puVar13 = (uint *)0x0;
                          }
                          puVar5 = (uint *)((int)puVar5 + 1);
                        } while (puVar5 < local_c);
                        if (puVar13 != (uint *)0x0) {
                          local_14 = 1;
                        }
                      }
                    }
                    local_34 = local_34 + 1;
                    local_24 = (uint *)((int)local_24 + -1);
                  } while (local_24 != (uint *)0x0);
                }
                local_8 = (uint *)((int)local_8 + 1);
              } while (local_8 < local_50);
            }
            local_1c = (uint *)((int)local_1c + 1);
          } while (local_1c < local_c);
        }
        local_8 = (uint *)0x0;
        do {
          uVar17 = local_230[(int)local_8];
          if ((uVar17 != 0xffffffff) && (puVar12 = (uint *)0x0, local_c != (uint *)0x0)) {
            do {
              iVar8 = *(int *)(local_b0[(int)puVar12] + 0xc);
              if (iVar8 != 0) {
                puVar13 = *(uint **)(local_b0[(int)puVar12] + 0x10);
                do {
                  if ((uVar17 == *puVar13) ||
                     (*(uint *)(*(int *)(*(int *)(local_18 + 0x14) + uVar17 * 4) + 0x38) == *puVar13
                     )) {
                    local_14 = 1;
                  }
                  puVar13 = puVar13 + 1;
                  iVar8 = iVar8 + -1;
                } while (iVar8 != 0);
              }
              puVar12 = (uint *)((int)puVar12 + 1);
            } while (puVar12 < local_c);
          }
          local_8 = (uint *)((int)local_8 + 1);
        } while (local_8 < (uint *)0x28);
        if (local_14 == 0) goto LAB_100bd9cf;
      }
      local_28 = (uint *)((int)local_28 + 1);
    } while (local_28 == (uint *)0x0);
    if (local_14 != 0) goto code_r0x100bd9c0;
LAB_100bd9cf:
    puVar12 = local_b0;
    ppuVar15 = local_f0;
    for (uVar17 = (uint)local_c & 0x3fffffff; uVar17 != 0; uVar17 = uVar17 - 1) {
      *ppuVar15 = (uint *)*puVar12;
      puVar12 = puVar12 + 1;
      ppuVar15 = ppuVar15 + 1;
    }
    for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
      *(char *)ppuVar15 = (char)*puVar12;
      puVar12 = (uint *)((int)puVar12 + 1);
      ppuVar15 = (uint **)((int)ppuVar15 + 1);
    }
    local_f0[(int)puVar14] = local_38;
    local_44 = (uint *)((int)puVar14 + 1);
    uVar17 = 0;
    do {
      iVar8 = *(int *)((int)local_230 + uVar17);
      if ((iVar8 != -1) || (iVar8 = *(int *)((int)local_2d0 + uVar17), iVar8 != -1)) {
        *(int *)((int)auStack_190 + uVar17) = iVar8;
      }
      uVar17 = uVar17 + 4;
    } while (uVar17 < 0xa0);
    local_14 = 0;
LAB_100bda30:
    iVar8 = local_14;
    if (local_14 != 0) goto LAB_100bd62c;
    local_24 = (uint *)0x0;
    if (local_30 == (uint *)0x0) goto LAB_100bde27;
    while( true ) {
      local_8 = (uint *)0x0;
      local_34 = (uint *)auStack_190[(int)(local_24 + 1)];
      if (local_34 != (uint *)auStack_190[(int)(local_24 + 3)]) break;
      local_1c = (uint *)auStack_190[(int)(local_24 + 2)];
      if (((local_1c != (uint *)auStack_190[(int)(local_24 + 4)]) ||
          (puVar14 = (uint *)auStack_190[(int)(local_24 + 5)],
          puVar14 != (uint *)auStack_190[(int)(local_24 + 7)])) ||
         (puVar12 = (uint *)auStack_190[(int)(local_24 + 6)],
         puVar12 != (uint *)auStack_190[(int)(local_24 + 8)])) break;
      iVar8 = *(int *)(*(int *)(local_18 + 0x14) + (int)puVar14 * 4);
      iVar7 = *(int *)(*(int *)(local_18 + 0x14) + (int)puVar12 * 4);
      local_3c = *(uint **)(*(int *)(local_18 + 0x10) + *(int *)(iVar8 + 4) * 4);
      local_c = (uint *)0x0;
      iVar6 = *(int *)(*(int *)(local_18 + 0x10) + *(int *)(iVar7 + 4) * 4);
      if ((((puVar14 == local_1c) && ((*(byte *)(iVar6 + 5) & 1) != 0)) &&
          (*(double *)(iVar7 + 0x20) == -1.0)) ||
         (((puVar12 == local_1c && ((*(byte *)((int)local_3c + 5) & 1) != 0)) &&
          (*(double *)(iVar8 + 0x20) == -1.0)))) {
        local_c = (uint *)0x1;
      }
      local_20 = auStack_190 + 8;
      if (local_c == (uint *)0x0) {
        iVar3 = *(int *)(*(int *)(local_18 + 0x14) + (int)local_34 * 4);
        puVar14 = *(uint **)(iVar8 + 0x38);
        if ((((puVar14 == local_34) ||
             ((puVar14 != (uint *)0xffffffff && (*(uint **)(iVar3 + 0x38) == puVar14)))) &&
            (*(uint *)(iVar8 + 0x3c) == (*(uint *)(iVar3 + 0x3c) ^ 0x80000))) &&
           (((*(byte *)(iVar6 + 5) & 1) != 0 && (*(double *)(iVar7 + 0x20) == 1.0)))) {
          local_c = (uint *)0x1;
        }
        puVar14 = *(uint **)(iVar7 + 0x38);
        if (((puVar14 == local_34) ||
            ((puVar14 != (uint *)0xffffffff && (*(uint **)(iVar3 + 0x38) == puVar14)))) &&
           ((*(uint *)(iVar7 + 0x3c) == (*(uint *)(iVar3 + 0x3c) ^ 0x80000) &&
            (((*(byte *)((int)local_3c + 5) & 1) != 0 && (*(double *)(iVar8 + 0x20) == 1.0)))))) {
          local_c = (uint *)0x1;
        }
        local_8 = (uint *)0x1;
        if (local_c == (uint *)0x0) {
          return 1;
        }
        local_20 = auStack_190 + 4;
      }
      iVar8 = *(int *)(local_18 + 0x14);
      iVar7 = *(int *)(iVar8 + auStack_190[(int)local_24] * 4);
      if (local_8 == (uint *)0x0) {
        iVar6 = *(int *)(iVar8 + (int)local_34 * 4);
      }
      else {
        iVar6 = *(int *)(iVar8 + (int)local_1c * 4);
      }
      if (((((*(byte *)(*(int *)(*(int *)(local_18 + 0x10) + *(int *)(iVar7 + 4) * 4) + 5) & 1) == 0
            ) || (*(double *)(iVar7 + 0x20) != 0.0)) ||
          ((*(byte *)(*(int *)(*(int *)(local_18 + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) & 1) == 0))
         || (*(double *)(iVar6 + 0x20) != 1.0)) break;
      iVar8 = *(int *)(iVar8 + local_20[(int)local_24] * 4);
      if (*(int *)(iVar8 + 4) != *(int *)(local_18 + 0x88)) {
        local_4c = 1;
      }
      uVar17 = 0;
      if (local_48 != 0) {
        do {
          if (*(int *)(iVar8 + 0x48) == local_60[uVar17]) break;
          uVar17 = uVar17 + 1;
        } while (uVar17 < local_48);
      }
      if ((uVar17 == local_48) && (local_4c == 0)) {
        local_60[local_48] = *(int *)(iVar8 + 0x48);
        local_48 = local_48 + 1;
      }
      local_24 = (uint *)((int)local_24 + 1);
      if (local_30 <= local_24) goto LAB_100bde27;
    }
LAB_100bdf96:
    iVar8 = 1;
  }
  return iVar8;
code_r0x100bc6fe:
  local_2c = (uint *)((int)local_2c + 1);
  if (local_2c != (uint *)0x0) goto LAB_100bc76c;
  goto LAB_100bc3bc;
code_r0x100bcaef:
  local_38 = (uint *)((int)local_38 + 1);
  iVar8 = local_14;
  if (local_38 != (uint *)0x0) goto LAB_100bcb62;
  goto LAB_100bc7b7;
code_r0x100bd022:
  local_2c = (uint *)((int)local_2c + 1);
  if (local_2c != (uint *)0x0) goto LAB_100bd092;
  goto LAB_100bccea;
code_r0x100bd414:
  local_2c = (uint *)((int)local_2c + 1);
  iVar8 = local_14;
  if (local_2c != (uint *)0x0) goto LAB_100bd487;
  goto LAB_100bd0dd;
code_r0x100bd9c0:
  local_2c = (uint *)((int)local_2c + 1);
  if (local_2c != (uint *)0x0) goto LAB_100bda30;
  goto LAB_100bd687;
}


