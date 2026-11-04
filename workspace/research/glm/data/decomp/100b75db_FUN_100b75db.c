// 100b75db size=1666 FUN_100b75db

int FUN_100b75db(void)

{
  int *piVar1;
  int iVar2;
  bool bVar3;
  uint uVar4;
  int *piVar5;
  int *piVar6;
  int in_ECX;
  uint uVar7;
  int iVar8;
  uint *puVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  int aiStack_64 [4];
  uint local_54 [5];
  uint local_40;
  uint local_3c;
  uint local_38;
  uint local_34;
  int *local_30;
  uint *local_2c;
  uint *local_28;
  int local_24;
  int *local_20;
  int *local_1c;
  int local_18;
  uint local_14;
  int local_10;
  int local_c;
  uint local_8;
  
  local_14 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  if (local_14 == 0) {
    return 1;
  }
  local_54[4] = (*(uint **)(in_ECX + 0x100))[1] / local_14;
  local_40 = 0;
  if (local_54[4] != 0) {
    local_34 = 0;
    local_24 = in_ECX;
    do {
      iVar10 = -1;
      local_54[0] = 0xffffffff;
      local_54[1] = 0xffffffff;
      local_54[2] = 0xffffffff;
      local_8 = 0;
      local_20 = (int *)0x0;
      local_1c = (int *)0x0;
      local_28 = (uint *)0x0;
      local_2c = (uint *)0x0;
      local_54[3] = 0xffffffff;
      local_10 = -1;
      local_c = -1;
      if (local_14 != 0) {
        local_30 = (int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + local_34);
        local_3c = local_14;
        do {
          uVar4 = local_8;
          iVar11 = *local_30;
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4);
          iVar2 = *(int *)(iVar8 + 0x10);
          if (iVar2 == 0) {
            if ((*(int *)(iVar8 + 0x48) != -1) && (local_20 == (int *)0x0)) {
              uVar7 = *(uint *)(iVar8 + 0x48);
              local_20 = *(int **)(*(int *)(in_ECX + 0x18) + uVar7 * 4);
LAB_100b77ab:
              local_54[local_8] = uVar7;
              aiStack_64[uVar4] = iVar11;
              goto LAB_100b77b9;
            }
          }
          else if (iVar2 == 1) {
            if ((*(int *)(iVar8 + 0x48) != -1) && (local_1c == (int *)0x0)) {
              uVar7 = *(uint *)(iVar8 + 0x48);
              local_1c = *(int **)(*(int *)(in_ECX + 0x18) + uVar7 * 4);
              goto LAB_100b77ab;
            }
          }
          else if (iVar2 == 2) {
            if (iVar10 == -1) {
              iVar8 = *(int *)(iVar8 + 0x48);
              local_54[local_8] = 0xffffffff;
              local_10 = iVar11;
              aiStack_64[uVar4] = iVar11;
              iVar10 = iVar11;
              if (iVar8 != -1) {
                local_28 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar8 * 4);
                if ((*local_28 & 0xfff00000) == 0x10000000) {
                  uVar7 = 0;
                  uVar4 = *local_28 & 0xfffff;
                  if (uVar4 != 0) {
                    piVar5 = (int *)local_28[4];
                    do {
                      if (*piVar5 == iVar11) {
                        local_10 = *(int *)(local_28[2] + uVar7 * 4);
                        iVar10 = local_10;
                        break;
                      }
                      uVar7 = uVar7 + 1;
                      piVar5 = piVar5 + 1;
                    } while (uVar7 < uVar4);
                  }
                }
                else {
                  local_28 = (uint *)0x0;
                }
              }
              goto LAB_100b77b9;
            }
          }
          else if ((iVar2 == 3) && (local_c == -1)) {
            iVar8 = *(int *)(iVar8 + 0x48);
            local_54[local_8] = 0xffffffff;
            local_c = iVar11;
            aiStack_64[uVar4] = iVar11;
            if (iVar8 != -1) {
              local_2c = *(uint **)(*(int *)(in_ECX + 0x18) + iVar8 * 4);
              if ((*local_2c & 0xfff00000) == 0x10000000) {
                uVar7 = 0;
                uVar4 = *local_2c & 0xfffff;
                if (uVar4 != 0) {
                  piVar5 = (int *)local_2c[4];
                  do {
                    iVar10 = local_10;
                    if (*piVar5 == local_c) {
                      local_c = *(int *)(local_2c[2] + uVar7 * 4);
                      break;
                    }
                    uVar7 = uVar7 + 1;
                    piVar5 = piVar5 + 1;
                  } while (uVar7 < uVar4);
                }
              }
              else {
                local_2c = (uint *)0x0;
              }
            }
LAB_100b77b9:
            local_8 = local_8 + 1;
          }
          local_30 = local_30 + 1;
          local_3c = local_3c - 1;
        } while (local_3c != 0);
      }
      if ((local_8 == local_14) && (1 < local_8)) {
        bVar3 = false;
        if (local_1c != (int *)0x0) {
          if (*local_1c != 0x20500001) goto LAB_100b7832;
          if (((iVar10 != -1) && (iVar10 != *(int *)local_1c[2])) &&
             (iVar10 != ((int *)local_1c[2])[1])) {
            bVar3 = true;
          }
          if (local_c != -1) {
            if ((local_c != *(int *)local_1c[2]) && (local_c != ((int *)local_1c[2])[1])) {
              bVar3 = true;
            }
            if (iVar10 != -1) {
              piVar5 = (int *)local_1c[2];
              if (local_c == iVar10) {
                if (*piVar5 != piVar5[1]) goto LAB_100b7832;
              }
              else if (*piVar5 == piVar5[1]) {
LAB_100b7832:
                bVar3 = true;
              }
            }
          }
        }
        if (local_20 != (int *)0x0) {
          if (*local_20 != 0x10000001) goto LAB_100b7999;
          iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_20[2] * 4);
          if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 5) & 1) ==
               0) || (*(double *)(iVar10 + 0x20) != 1.0)) {
            bVar3 = true;
          }
        }
        if ((!bVar3) && (local_3c = 0, local_8 != 0)) {
          do {
            local_38 = local_54[local_3c];
            if (local_38 != 0xffffffff) {
              local_18 = 1;
              local_20 = (int *)local_14;
              if (local_14 != 0) {
                piVar5 = (int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + local_34);
                local_30 = (int *)local_14;
                do {
                  iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4);
                  if (*(uint *)(iVar10 + 0x50) < *(uint *)(in_ECX + 0xfc)) {
                    local_18 = 0;
                  }
                  if (local_38 < *(uint *)(iVar10 + 0x4c)) {
                    local_18 = 0;
                  }
                  if (((local_28 == (uint *)0x0) && (*(int *)(iVar10 + 0x10) == 2)) ||
                     ((local_2c == (uint *)0x0 && (*(int *)(iVar10 + 0x10) == 3)))) {
                    local_20 = (int *)((int)local_20 - 1);
                  }
                  else if (*(uint *)(iVar10 + 0x54) < local_38) {
                    local_18 = 0;
                  }
                  piVar5 = piVar5 + 1;
                  local_30 = (int *)((int)local_30 - 1);
                } while (local_30 != (int *)0x0);
              }
              piVar5 = local_20;
              local_30 = (int *)0x0;
              do {
                if (local_54[(int)local_30] != 0xffffffff) {
                  iVar10 = *(int *)(*(int *)(in_ECX + 0x18) + local_54[(int)local_30] * 4);
                  iVar11 = *(int *)(iVar10 + 4);
                  if (iVar11 != 0) {
                    piVar1 = (int *)(in_ECX + 0x14);
                    piVar6 = *(int **)(iVar10 + 8);
                    do {
                      iVar10 = *(int *)(*piVar1 + *piVar6 * 4);
                      uVar4 = *(uint *)(iVar10 + 0x48);
                      if (((local_38 < uVar4) && (uVar4 != 0xffffffff)) ||
                         (*(uint *)(iVar10 + 0x50) < local_38)) {
                        local_18 = 0;
                      }
                      piVar6 = piVar6 + 1;
                      iVar11 = iVar11 + -1;
                      in_ECX = local_24;
                    } while (iVar11 != 0);
                  }
                }
                local_30 = (int *)((int)local_30 + 1);
              } while (local_30 < local_8);
              if (local_18 != 0) {
                local_3c = local_54[local_3c];
                if ((local_3c != 0xffffffff) && (1 < local_20)) {
                  iVar10 = FUN_10085814(0x74);
                  if (iVar10 == 0) {
                    iVar10 = 0;
                  }
                  else {
                    iVar10 = FUN_10085379();
                  }
                  if (iVar10 == 0) {
                    return -0x7ff8fff2;
                  }
                  iVar11 = FUN_1008585f((uint)piVar5 & 0xfffff | 0x70900000,(int)piVar5 * 2,piVar5,0
                                       );
                  if ((iVar11 < 0) ||
                     (iVar11 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100)), iVar11 < 0))
                  goto LAB_100b7bc6;
                  uVar4 = 0;
                  if (piVar5 == (int *)0x0) goto LAB_100b7a8a;
                  iVar11 = (int)piVar5 << 2;
                  goto LAB_100b7a1e;
                }
                break;
              }
            }
            local_3c = local_3c + 1;
          } while (local_3c < local_8);
        }
      }
LAB_100b7999:
      local_40 = local_40 + 1;
      local_34 = local_34 + local_14 * 4;
    } while (local_40 < local_54[4]);
  }
  return 1;
LAB_100b7a1e:
  do {
    if (local_1c == (int *)0x0) {
      if (local_c == -1) {
        iVar8 = local_10;
        if (local_10 != -1) {
LAB_100b7a75:
          *(int *)(*(int *)(iVar10 + 8) + uVar4 * 4) = iVar8;
          goto LAB_100b7a7b;
        }
      }
      else {
        iVar8 = local_c;
        if (local_10 == -1) goto LAB_100b7a75;
      }
      uVar13 = 0x12d9;
      uVar12 = *(undefined4 *)(*(int *)(in_ECX + 0x100) + 0x3c);
      local_24 = in_ECX;
      goto LAB_100b7a5f;
    }
    *(undefined4 *)(*(int *)(iVar10 + 8) + uVar4 * 4) = *(undefined4 *)local_1c[2];
    iVar8 = *(int *)(local_1c[2] + 4);
LAB_100b7a7b:
    *(int *)(iVar11 + *(int *)(iVar10 + 8)) = iVar8;
    uVar4 = uVar4 + 1;
    iVar11 = iVar11 + 4;
  } while (uVar4 < local_20);
LAB_100b7a8a:
  uVar4 = 0;
  uVar7 = 0;
  if (local_8 != 0) {
    do {
      iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + aiStack_64[uVar4] * 4);
      if (((local_28 != (uint *)0x0) || (*(int *)(iVar11 + 0x10) != 2)) &&
         ((local_2c != (uint *)0x0 || (*(int *)(iVar11 + 0x10) != 3)))) {
        *(int *)(*(int *)(iVar10 + 0x10) + uVar7 * 4) = aiStack_64[uVar4];
        uVar7 = uVar7 + 1;
      }
      if (local_20 < uVar7) {
        uVar13 = 0x12da;
        uVar12 = *(undefined4 *)(*(int *)(local_24 + 0x100) + 0x3c);
LAB_100b7a5f:
        FUN_1008b0b5(local_24,uVar12,uVar13,"internal error: DST test failure");
        iVar11 = 1;
LAB_100b7bc6:
        FUN_1006c418(1);
        return iVar11;
      }
      uVar4 = uVar4 + 1;
      in_ECX = local_24;
    } while (uVar4 < local_8);
  }
  uVar4 = *(uint *)(iVar10 + 0xc);
  local_14 = 0;
  if (uVar4 != 0) {
    local_40 = 1;
    do {
      local_34 = local_40;
      if (local_40 < uVar4) {
        do {
          iVar11 = *(int *)(*(int *)(in_ECX + 0x14) +
                           *(int *)(*(int *)(iVar10 + 0x10) + local_14 * 4) * 4);
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                          *(int *)(local_34 * 4 + *(int *)(iVar10 + 0x10)) * 4);
          if (*(uint *)(iVar8 + 0x10) < *(uint *)(iVar11 + 0x10)) {
            puVar9 = (uint *)(local_34 * 4 + *(int *)(iVar10 + 0x10));
            local_54[4] = *puVar9;
            *puVar9 = *(uint *)(*(int *)(iVar10 + 0x10) + local_14 * 4);
            *(uint *)(*(int *)(iVar10 + 0x10) + local_14 * 4) = local_54[4];
            in_ECX = local_24;
          }
          if (*(int *)(iVar11 + 0x10) == *(int *)(iVar8 + 0x10)) {
            FUN_1008b0b5(in_ECX,*(undefined4 *)(*(int *)(in_ECX + 0x100) + 0x3c),0x12db,
                         "internal error: multiple write to same output");
            iVar11 = -0x7fffbffb;
            goto LAB_100b7bc6;
          }
          local_34 = local_34 + 1;
        } while (local_34 < *(uint *)(iVar10 + 0xc));
      }
      local_14 = local_14 + 1;
      uVar4 = *(uint *)(iVar10 + 0xc);
      local_40 = local_40 + 1;
    } while (local_14 < uVar4);
  }
  uVar4 = 0;
  if (local_8 != 0) {
    do {
      if (local_54[uVar4] != 0xffffffff) {
        **(undefined4 **)(*(int *)(in_ECX + 0x18) + local_54[uVar4] * 4) = 0;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < local_8);
  }
  if (local_28 != (uint *)0x0) {
    if (*local_28 == 0x10000001) {
      *local_28 = 0;
    }
    else if (*local_28 == 0x10000002) {
      piVar5 = (int *)local_28[2];
      if ((*piVar5 == local_10) && (piVar5[1] == local_c)) {
        *local_28 = 0;
      }
      if ((piVar5[1] == local_10) && (*piVar5 == local_c)) {
        *local_28 = 0;
      }
    }
  }
  if (local_2c == (uint *)0x0) goto LAB_100b7c39;
  if (*local_2c != 0x10000001) {
    if (*local_2c != 0x10000002) goto LAB_100b7c39;
    piVar5 = (int *)local_2c[2];
    if ((*piVar5 == local_10) && (piVar5[1] == local_c)) {
      *local_2c = 0;
    }
    if ((piVar5[1] != local_10) || (*piVar5 != local_c)) goto LAB_100b7c39;
  }
  *local_2c = 0;
LAB_100b7c39:
  iVar11 = local_3c * 4;
  if (*(int *)(iVar11 + *(int *)(in_ECX + 0x18)) != 0) {
    FUN_1006c418(1);
  }
  *(int *)(iVar11 + *(int *)(in_ECX + 0x18)) = iVar10;
  return 0;
}


