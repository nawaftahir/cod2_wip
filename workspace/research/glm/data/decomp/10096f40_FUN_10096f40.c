// 10096f40 size=1735 FUN_10096f40

int FUN_10096f40(void)

{
  uint uVar1;
  uint *puVar2;
  uint *puVar3;
  int iVar4;
  int *piVar5;
  int in_ECX;
  uint uVar6;
  int iVar7;
  int *piVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  int local_7c [3];
  undefined1 auStack_70 [4];
  int local_6c [4];
  int *local_5c;
  undefined1 *local_58;
  undefined4 *local_54;
  int *local_50;
  int local_4c;
  undefined4 local_48;
  int local_44;
  uint local_40;
  uint local_3c;
  uint local_38;
  uint local_34;
  uint local_30;
  uint local_2c;
  int *local_28;
  uint local_24;
  uint local_20;
  int local_1c;
  uint local_18;
  uint *local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  local_44 = -1;
  FUN_1008a979();
  iVar4 = *(int *)(in_ECX + 8);
  uVar6 = 0;
  local_24 = 0;
  if (iVar4 != 0) {
    piVar5 = *(int **)(in_ECX + 0x14);
    do {
      if ((*(int *)(in_ECX + 0x88) == *(int *)(*piVar5 + 4)) &&
         (uVar1 = *(uint *)(*piVar5 + 0xc), uVar6 <= uVar1)) {
        uVar6 = uVar1 + 1;
      }
      piVar5 = piVar5 + 1;
      iVar4 = iVar4 + -1;
      local_24 = uVar6;
    } while (iVar4 != 0);
  }
  uVar6 = local_24 + *(int *)(in_ECX + 0xc) * 8;
  local_54 = operator_new(uVar6 * 4);
  if (local_54 == (undefined4 *)0x0) {
LAB_100975f9:
    iVar4 = -0x7ff8fff2;
  }
  else {
    puVar9 = local_54;
    for (uVar6 = uVar6 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
      *puVar9 = 0;
      puVar9 = puVar9 + 1;
    }
    uVar6 = 0;
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(undefined1 *)puVar9 = 0;
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
        if (*(int *)(in_ECX + 0x88) == *(int *)(iVar4 + 4)) {
          if ((uint)local_54[*(int *)(iVar4 + 0xc)] <= *(uint *)(iVar4 + 0x10)) {
            local_54[*(int *)(iVar4 + 0xc)] = *(uint *)(iVar4 + 0x10) + 1;
          }
        }
        uVar6 = uVar6 + 1;
      } while (uVar6 < *(uint *)(in_ECX + 8));
    }
    local_38 = *(uint *)(in_ECX + 0xc);
    local_34 = 0;
    if (local_38 != 0) {
      do {
        puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_34 * 4);
        local_14 = puVar2;
        if ((*puVar2 & 0xfff00000) == 0) goto LAB_10097595;
        iVar7 = 0;
        local_40 = 1;
        iVar4 = FUN_100853cf(0,&local_48);
        if (iVar4 == 0) {
LAB_10097504:
          local_4c = FUN_10086199(*puVar2,puVar2[1],puVar2[3]);
          puVar2 = local_14;
          if (local_4c == -1) {
LAB_10097600:
            iVar4 = -0x7ff8fff2;
            goto LAB_100975e9;
          }
          piVar5 = *(int **)(*(int *)(in_ECX + 0x18) + local_4c * 4);
          local_50 = piVar5;
          FUN_100853b0();
          puVar9 = (undefined4 *)puVar2[2];
          puVar10 = (undefined4 *)piVar5[2];
          for (uVar6 = puVar2[1] & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
            *puVar10 = *puVar9;
            puVar9 = puVar9 + 1;
            puVar10 = puVar10 + 1;
          }
          for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
            *(undefined1 *)puVar10 = *(undefined1 *)puVar9;
            puVar9 = (undefined4 *)((int)puVar9 + 1);
            puVar10 = (undefined4 *)((int)puVar10 + 1);
          }
          puVar9 = (undefined4 *)local_14[4];
          puVar10 = (undefined4 *)local_50[4];
          for (uVar6 = local_14[3] & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
            *puVar10 = *puVar9;
            puVar9 = puVar9 + 1;
            puVar10 = puVar10 + 1;
          }
          for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
            *(undefined1 *)puVar10 = *(undefined1 *)puVar9;
            puVar9 = (undefined4 *)((int)puVar9 + 1);
            puVar10 = (undefined4 *)((int)puVar10 + 1);
          }
          uVar6 = 0;
          if (local_14[3] != 0) {
            do {
              *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_50[4] + uVar6 * 4) * 4) +
                      0x48) = local_4c;
              uVar6 = uVar6 + 1;
            } while (uVar6 < local_14[3]);
          }
        }
        else {
          do {
            iVar4 = FUN_10091633(local_48,iVar4,local_54,&local_24,puVar2,local_38,0xffffffff);
            if (iVar4 == 0) {
              local_40 = 0;
            }
            iVar7 = iVar7 + 1;
            iVar4 = FUN_100853cf(iVar7,&local_48);
          } while (iVar4 != 0);
          if ((local_40 != 0) || (iVar4 = FUN_1008540c(), iVar4 != 0)) goto LAB_10097504;
          local_8 = 0;
          local_c = FUN_100853cf(0,0);
          puVar3 = local_14;
          if (local_c == 0) {
            local_10 = (int *)0x0;
          }
          else {
            local_10 = (int *)(puVar2[1] / local_c);
          }
          local_6c[0] = 0;
          local_6c[1] = 0;
          local_6c[2] = 0;
          local_6c[3] = 0;
          local_20 = 0;
          if (local_c != 0) {
            local_1c = 0;
            local_58 = auStack_70;
            do {
              if (*(int *)(local_58 + local_1c + 4) == 0) {
                local_3c = local_20 + 1;
                local_18 = 1;
                if (local_3c < local_c) {
                  local_30 = (local_1c + 4) - local_1c;
                  do {
                    if (local_6c[local_3c] == 0) {
                      local_28 = (int *)0x0;
                      if (local_10 != (int *)0x0) {
                        piVar5 = (int *)(puVar3[2] + local_1c);
                        do {
                          local_40 = *(int *)(local_30 + (int)piVar5) * 4;
                          iVar4 = *piVar5 * 4;
                          if (((*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4) + 4) !=
                                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_40) + 4)) ||
                              (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4) + 8) !=
                               *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_40) + 8))) ||
                             (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4) + 0xc) !=
                              *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + local_40) + 0xc))) break;
                          local_28 = (int *)((int)local_28 + 1);
                          piVar5 = piVar5 + local_c;
                        } while (local_28 < local_10);
                      }
                      if (local_28 == local_10) {
                        local_18 = local_18 + 1;
                      }
                    }
                    local_30 = local_30 + 4;
                    local_3c = local_3c + 1;
                  } while (local_3c < local_c);
                }
                local_30 = FUN_10086199((*puVar3 ^ local_18) & 0xfffff ^ *puVar3,0xffffffff,
                                        0xffffffff);
                if (local_30 == 0xffffffff) goto LAB_10097600;
                iVar4 = *(int *)(*(int *)(in_ECX + 0x18) + local_30 * 4);
                FUN_100853b0();
                if (local_20 < local_c) {
                  local_2c = local_18 * 4 - 4;
                  local_4c = local_c * 4 - local_1c;
                  local_40 = local_c;
                  do {
                    local_4c = local_4c + -4;
                    local_40 = local_40 - 1;
                    local_5c = local_6c + local_40;
                    if (*local_5c == 0) {
                      local_28 = (int *)0x0;
                      if (local_10 != (int *)0x0) {
                        local_50 = (int *)(puVar3[2] + local_1c);
                        do {
                          local_3c = *local_50 * 4;
                          iVar7 = *(int *)((int)local_50 + local_4c) * 4;
                          if (((*(int *)(*(int *)(local_3c + *(int *)(in_ECX + 0x14)) + 4) !=
                                *(int *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 4)) ||
                              (*(int *)(*(int *)(local_3c + *(int *)(in_ECX + 0x14)) + 8) !=
                               *(int *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 8))) ||
                             (*(int *)(*(int *)(local_3c + *(int *)(in_ECX + 0x14)) + 0xc) !=
                              *(int *)(*(int *)(iVar7 + *(int *)(in_ECX + 0x14)) + 0xc))) break;
                          local_28 = (int *)((int)local_28 + 1);
                          local_50 = local_50 + local_c;
                        } while (local_28 < local_10);
                        if (local_28 < local_10) goto LAB_100972fb;
                        local_3c = local_2c;
                        local_28 = (int *)(local_40 * 4);
                        local_50 = local_10;
                        do {
                          *(undefined4 *)(local_3c + *(int *)(iVar4 + 8)) =
                               *(undefined4 *)((int)local_28 + puVar3[2]);
                          local_28 = local_28 + local_c;
                          local_3c = local_3c + local_18 * 4;
                          local_50 = (int *)((int)local_50 + -1);
                        } while (local_50 != (int *)0x0);
                        *local_5c = 1;
                      }
                      if ((*puVar3 & 0xfff00000) != 0x50000000) {
                        *(undefined4 *)(local_2c + *(int *)(iVar4 + 0x10)) =
                             *(undefined4 *)(local_40 * 4 + puVar3[4]);
                        *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)(local_2c + *(int *)(iVar4 + 0x10)) * 4) + 0x48) =
                             local_30;
                      }
                      local_2c = local_2c - 4;
                    }
LAB_100972fb:
                  } while (local_20 < local_40);
                }
                if ((*puVar3 & 0xfff00000) == 0x50000000) {
                  if (local_18 == local_c) {
                    **(undefined4 **)(iVar4 + 0x10) = *(undefined4 *)puVar3[4];
                  }
                  else {
                    iVar7 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_24,local_8,0);
                    local_7c[local_8] = iVar7;
                    **(int **)(iVar4 + 0x10) = iVar7;
                    if (**(int **)(iVar4 + 0x10) == -1) goto LAB_10097600;
                    *(undefined4 *)
                     (*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar4 + 0x10) * 4) + 0x14) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4) + 0x14);
                    *(undefined4 *)
                     (*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar4 + 0x10) * 4) + 0x18) =
                         *(undefined4 *)
                          (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4) + 0x18);
                    iVar7 = FUN_100873f3(iVar4,0);
                    if (iVar7 < 0) {
                      return iVar7;
                    }
                    local_8 = local_8 + 1;
                  }
                  *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar4 + 0x10) * 4) + 0x48)
                       = local_30;
                }
              }
              local_20 = local_20 + 1;
              local_1c = local_1c + 4;
            } while (local_20 < local_c);
            if (local_8 == 0) goto LAB_10097595;
            if (local_8 == 2) {
              iVar4 = FUN_10086199(0x20400001,0xffffffff,0xffffffff);
              local_30 = 0;
              do {
                iVar7 = local_7c[local_30] * 4;
                if ((**(uint **)(*(int *)(in_ECX + 0x18) +
                                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x48) * 4) &
                    0xfff00000) == 0x10000000) {
                  **(undefined4 **)
                    (*(int *)(in_ECX + 0x18) +
                    *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x48) * 4) = 0;
                  local_7c[local_30] =
                       **(int **)(*(int *)(*(int *)(in_ECX + 0x18) +
                                          *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x48)
                                          * 4) + 8);
                }
                local_30 = local_30 + 1;
              } while (local_30 < 2);
            }
            else {
              iVar4 = FUN_10086199(local_8 & 0xfffff | 0x50000000,0xffffffff,0xffffffff);
            }
            if (iVar4 != -1) {
              piVar5 = *(int **)(*(int *)(in_ECX + 0x18) + iVar4 * 4);
              local_5c = piVar5;
              FUN_100853b0();
              *(undefined4 *)piVar5[4] = *(undefined4 *)local_14[4];
              *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)piVar5[4] * 4) + 0x48) = iVar4;
              piVar8 = local_7c;
              piVar5 = (int *)piVar5[2];
              for (uVar6 = local_8 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                *piVar5 = *piVar8;
                piVar8 = piVar8 + 1;
                piVar5 = piVar5 + 1;
              }
              for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
                *(char *)piVar5 = (char)*piVar8;
                piVar8 = (int *)((int)piVar8 + 1);
                piVar5 = (int *)((int)piVar5 + 1);
              }
              if (local_8 == 2) {
LAB_100974fc:
                local_24 = local_24 + 1;
                goto LAB_10097595;
              }
              if ((local_44 != -1) ||
                 (local_44 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0x3ff0000000000000),
                 local_44 != -1)) {
                if (local_8 != 0) {
                  iVar4 = local_8 << 2;
                  uVar6 = local_8;
                  do {
                    *(int *)(iVar4 + local_5c[2]) = local_44;
                    iVar4 = iVar4 + 4;
                    uVar6 = uVar6 - 1;
                  } while (uVar6 != 0);
                }
                goto LAB_100974fc;
              }
              goto LAB_10097600;
            }
            goto LAB_100975f9;
          }
        }
LAB_10097595:
        local_34 = local_34 + 1;
      } while (local_34 < local_38);
    }
    uVar6 = 0;
    if (local_38 != 0) {
      do {
        **(undefined4 **)(*(int *)(in_ECX + 0x18) + uVar6 * 4) = 0;
        uVar6 = uVar6 + 1;
      } while (uVar6 < local_38);
    }
    iVar4 = FUN_1008bec4();
    if ((iVar4 == 0) || (-1 < iVar4)) {
      iVar4 = FUN_10086eae();
      if ((iVar4 == 0) || (-1 < iVar4)) {
        iVar4 = FUN_10094810();
        if ((iVar4 == 0) || (-1 < iVar4)) {
          iVar4 = 0;
        }
      }
    }
LAB_100975e9:
    _free(local_54);
  }
  return iVar4;
}


