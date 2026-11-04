// 100b99af size=1122 FUN_100b99af

int FUN_100b99af(uint *param_1,int *param_2,int *param_3,uint *param_4,int param_5,uint *param_6,
                uint param_7,int param_8)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint *puVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  int iVar7;
  int *piVar8;
  uint uVar9;
  uint uVar10;
  int *piVar11;
  int local_1c8 [40];
  int local_128 [40];
  undefined1 local_88 [16];
  int local_78 [16];
  uint local_38;
  int local_34;
  uint local_30;
  uint local_2c;
  uint local_28;
  uint local_24;
  uint local_20;
  undefined4 *local_1c;
  int local_18;
  uint local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  local_20 = *param_1 & 0xfffff;
  local_10 = 0;
  local_14 = 0;
  if ((param_7 < local_20) && (param_8 == 0)) {
    local_10 = 1;
  }
  else if ((*param_1 & 0xfff00000) == param_2[1]) {
    local_30 = 1;
    if ((*param_2 == 0) && (param_8 != 0)) {
      local_30 = 2;
    }
    local_2c = 0;
    local_18 = in_ECX;
    if (local_30 == 0) {
LAB_100b9dac:
      piVar8 = local_78;
      piVar11 = param_3;
      for (uVar10 = local_14 & 0x3fffffff; uVar10 != 0; uVar10 = uVar10 - 1) {
        *piVar11 = *piVar8;
        piVar8 = piVar8 + 1;
        piVar11 = piVar11 + 1;
      }
      for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
        *(char *)piVar11 = (char)*piVar8;
        piVar8 = (int *)((int)piVar8 + 1);
        piVar11 = (int *)((int)piVar11 + 1);
      }
      param_3[local_14] = (int)param_1;
      *param_4 = local_14 + 1;
      uVar10 = 0;
      do {
        iVar7 = *(int *)((int)local_128 + uVar10);
        if ((iVar7 != -1) || (iVar7 = *(int *)((int)local_1c8 + uVar10), iVar7 != -1)) {
          *(int *)(uVar10 + param_5) = iVar7;
        }
        uVar10 = uVar10 + 4;
      } while (uVar10 < 0xa0);
      local_10 = 0;
    }
    else {
      do {
        local_24 = 0;
        if (param_2[7] != -1) {
          do {
            uVar10 = *param_4;
            piVar8 = param_3;
            piVar11 = local_78;
            for (uVar6 = uVar10; uVar6 != 0; uVar6 = uVar6 - 1) {
              *piVar11 = *piVar8;
              piVar8 = piVar8 + 1;
              piVar11 = piVar11 + 1;
            }
            piVar8 = local_128;
            for (iVar7 = 0x28; iVar7 != 0; iVar7 = iVar7 + -1) {
              *piVar8 = -1;
              piVar8 = piVar8 + 1;
            }
            piVar8 = local_1c8;
            for (iVar7 = 0x28; iVar7 != 0; iVar7 = iVar7 + -1) {
              *piVar8 = -1;
              piVar8 = piVar8 + 1;
            }
            local_14 = uVar10;
            local_10 = 0;
            local_c = 0;
            if (param_2[2] != 0) {
              local_8 = 0;
              do {
                uVar10 = local_8;
                uVar6 = local_c;
                if (local_24 != 0) {
                  uVar6 = 1 - local_c;
                }
                if (3 < *param_6) {
                  return 1;
                }
                uVar1 = param_1[2];
                iVar7 = *(int *)(*(int *)(local_18 + 0x14) +
                                *(int *)(uVar1 + (*param_6 + local_8) * 4) * 4);
                uVar6 = param_2[uVar6 + 3];
                if (uVar6 < 0x10) {
                  iVar5 = *(int *)(iVar7 + 0x48);
                  if (iVar5 != -1) {
                    iVar2 = *param_2;
                    iVar3 = *(int *)(local_18 + 0x18);
                    iVar5 = FUN_100b97c4(*(undefined4 *)(iVar3 + iVar5 * 4),uVar1 + local_8 * 4,
                                         local_20,param_6,local_88,
                                         (param_2 + (uVar6 - iVar2) * 8)[6],param_8);
                    if (iVar5 == 0) {
                      local_10 = FUN_100b99af(*(undefined4 *)(iVar3 + *(int *)(iVar7 + 0x48) * 4),
                                              param_2 + (uVar6 - iVar2) * 8,local_78,&local_14,
                                              local_1c8,local_88,param_7,param_8);
                      goto LAB_100b9b51;
                    }
                  }
                  local_10 = 1;
                  break;
                }
                uVar9 = 0;
                piVar8 = local_128 + (uVar6 - 0x10) * 4;
                do {
                  if (param_6[uVar9] < local_20) {
                    *piVar8 = *(int *)(uVar1 + (param_6[uVar9] + uVar10) * 4);
                  }
                  else {
                    *piVar8 = -1;
                  }
                  uVar9 = uVar9 + 1;
                  piVar8 = piVar8 + 1;
                } while (uVar9 < 4);
LAB_100b9b51:
                if (local_10 == 1) break;
                local_c = local_c + 1;
                local_8 = local_8 + local_20;
              } while (local_c < (uint)param_2[2]);
            }
            local_c = 0;
            if (param_2[2] != 0) {
              local_1c = (undefined4 *)0x0;
              do {
                uVar10 = local_c;
                if (local_24 != 0) {
                  uVar10 = 1 - local_c;
                }
                if ((0xf < (uint)param_2[uVar10 + 3]) && (local_28 = 0, local_14 != 0)) {
                  do {
                    uVar10 = 0;
                    if (local_20 != 0) {
                      uVar6 = *(uint *)(local_78[local_28] + 0xc);
                      do {
                        local_8 = 0;
                        if (uVar6 != 0) {
                          piVar8 = *(int **)(local_78[local_28] + 0x10);
                          do {
                            if (*(int *)(param_1[2] + ((int)local_1c + uVar10) * 4) == *piVar8) {
                              local_10 = 1;
                              goto LAB_100b9bf5;
                            }
                            local_8 = local_8 + 1;
                            piVar8 = piVar8 + 1;
                          } while (local_8 < uVar6);
                        }
                        uVar10 = uVar10 + 1;
                      } while (uVar10 < local_20);
                    }
LAB_100b9bf5:
                    local_28 = local_28 + 1;
                  } while (local_28 < local_14);
                }
                local_c = local_c + 1;
                local_1c = (undefined4 *)((int)local_1c + local_20);
              } while (local_c < (uint)param_2[2]);
            }
            if (local_10 == 0) {
              if ((local_2c != 0) || (*param_2 != 0)) goto LAB_100b9dac;
              local_c = 0;
              if (local_14 != 0) {
                do {
                  local_38 = *(uint *)(local_78[local_c] + 0xc);
                  local_8 = 0;
                  if (local_38 != 0) {
                    do {
                      if (*(int *)(local_18 + 0xc) != 0) {
                        local_1c = *(undefined4 **)(local_18 + 0x18);
                        local_34 = *(int *)(local_18 + 0xc);
                        do {
                          puVar4 = (uint *)*local_1c;
                          if ((puVar4 != (uint *)0x0) && (*puVar4 != 0)) {
                            uVar10 = puVar4[1];
                            local_28 = 0;
                            if (uVar10 != 0) {
                              iVar7 = *(int *)(*(int *)(local_78[local_c] + 0x10) + local_8 * 4);
                              piVar8 = (int *)puVar4[2];
                              do {
                                if ((*piVar8 == iVar7) ||
                                   (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + *piVar8 * 4) +
                                            0x38) == iVar7)) {
                                  local_28 = 1;
                                }
                                piVar8 = piVar8 + 1;
                                uVar10 = uVar10 - 1;
                              } while (uVar10 != 0);
                            }
                            uVar10 = local_28;
                            if (puVar4 == param_1) {
                              uVar10 = 0;
                            }
                            if (uVar10 != 0) {
                              uVar6 = 0;
                              do {
                                if (puVar4 == (uint *)local_78[uVar6]) {
                                  uVar10 = 0;
                                }
                                uVar6 = uVar6 + 1;
                              } while (uVar6 < local_14);
                              if (uVar10 != 0) {
                                local_10 = 1;
                              }
                            }
                          }
                          local_1c = local_1c + 1;
                          local_34 = local_34 + -1;
                        } while (local_34 != 0);
                      }
                      local_8 = local_8 + 1;
                    } while (local_8 < local_38);
                  }
                  local_c = local_c + 1;
                } while (local_c < local_14);
              }
              local_8 = 0;
              do {
                iVar7 = local_128[local_8];
                if ((iVar7 != -1) && (uVar10 = 0, local_14 != 0)) {
                  do {
                    iVar5 = *(int *)(local_78[uVar10] + 0xc);
                    if (iVar5 != 0) {
                      piVar8 = *(int **)(local_78[uVar10] + 0x10);
                      do {
                        if ((iVar7 == *piVar8) ||
                           (*(int *)(*(int *)(*(int *)(local_18 + 0x14) + iVar7 * 4) + 0x38) ==
                            *piVar8)) {
                          local_10 = 1;
                        }
                        piVar8 = piVar8 + 1;
                        iVar5 = iVar5 + -1;
                      } while (iVar5 != 0);
                    }
                    uVar10 = uVar10 + 1;
                  } while (uVar10 < local_14);
                }
                local_8 = local_8 + 1;
              } while (local_8 < 0x28);
              if (local_10 == 0) goto LAB_100b9dac;
            }
            local_24 = local_24 + 1;
          } while (local_24 < param_2[7] + 1U);
        }
        if (local_10 == 0) goto LAB_100b9dac;
        local_2c = local_2c + 1;
      } while (local_2c < local_30);
    }
  }
  else {
    local_10 = 1;
  }
  return local_10;
}


