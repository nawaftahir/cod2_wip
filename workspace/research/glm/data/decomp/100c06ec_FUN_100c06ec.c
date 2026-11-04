// 100c06ec size=1539 FUN_100c06ec

uint FUN_100c06ec(void)

{
  uint *puVar1;
  int *piVar2;
  int in_ECX;
  int iVar3;
  uint uVar4;
  uint uVar5;
  undefined4 *puVar6;
  uint uVar7;
  undefined4 *puVar8;
  int *piVar9;
  int local_27c [40];
  int local_1dc [40];
  int local_13c [40];
  undefined1 local_9c [16];
  int local_8c [16];
  uint local_4c [5];
  uint local_38;
  int local_34;
  undefined4 *local_30;
  uint local_2c;
  uint local_28;
  uint *local_24;
  int local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_4c[0] = 0;
  piVar2 = local_13c;
  for (iVar3 = 0x28; iVar3 != 0; iVar3 = iVar3 + -1) {
    *piVar2 = -1;
    piVar2 = piVar2 + 1;
  }
  local_24 = *(uint **)(in_ECX + 0x100);
  local_28 = *local_24 & 0xfffff;
  local_4c[1] = 1;
  local_4c[2] = 2;
  local_4c[3] = 3;
  local_1c = *local_24 & 0xfffff;
  if ((local_28 <= (*local_24 & 0xfffff)) && ((*local_24 & 0xfff00000) == 0x20500000)) {
    local_34 = 0;
LAB_100c075e:
    local_10 = 0;
    do {
      piVar2 = local_1dc;
      for (iVar3 = 0x28; iVar3 != 0; iVar3 = iVar3 + -1) {
        *piVar2 = -1;
        piVar2 = piVar2 + 1;
      }
      piVar2 = local_27c;
      for (iVar3 = 0x28; iVar3 != 0; iVar3 = iVar3 + -1) {
        *piVar2 = -1;
        piVar2 = piVar2 + 1;
      }
      local_2c = 0;
      local_20 = 0;
      local_8 = 0;
      local_c = 0;
      do {
        uVar5 = local_8;
        if (local_10 != 0) {
          uVar5 = 1 - local_8;
        }
        uVar7 = local_24[2];
        uVar5 = *(uint *)(&DAT_10118a64 + uVar5 * 4);
        piVar2 = (int *)(uVar7 + local_c * 4);
        if (uVar5 < 0x10) {
          iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4) + 0x48);
          if (iVar3 != -1) {
            local_18 = *(undefined4 *)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
            iVar3 = FUN_100b97c4(local_18,piVar2,local_28,local_4c,local_9c,
                                 *(undefined4 *)(&DAT_10118a70 + uVar5 * 0x20),0);
            if (iVar3 == 0) {
              local_20 = FUN_100b99af(local_18,&DAT_10118a58 + uVar5 * 0x20,local_8c,&local_2c,
                                      local_27c,local_9c,local_1c,0);
              goto LAB_100c0869;
            }
          }
          local_20 = 1;
          break;
        }
        uVar4 = 0;
        piVar2 = local_1dc + (uVar5 - 0x10) * 4;
        do {
          if (local_4c[uVar4] < local_28) {
            *piVar2 = *(int *)(uVar7 + (local_4c[uVar4] + local_c) * 4);
          }
          else {
            *piVar2 = -1;
          }
          uVar4 = uVar4 + 1;
          piVar2 = piVar2 + 1;
        } while (uVar4 < 4);
LAB_100c0869:
        if (local_20 == 1) break;
        local_8 = local_8 + 1;
        local_c = local_c + local_28;
      } while (local_8 < 2);
      local_8 = 0;
      local_30 = (undefined4 *)0x0;
      do {
        uVar5 = local_8;
        if (local_10 != 0) {
          uVar5 = 1 - local_8;
        }
        if ((0xf < *(uint *)(&DAT_10118a64 + uVar5 * 4)) && (local_14 = 0, local_2c != 0)) {
          do {
            uVar5 = 0;
            if (local_28 != 0) {
              iVar3 = local_8c[local_14];
              uVar7 = *(uint *)(iVar3 + 0xc);
              do {
                local_c = 0;
                if (uVar7 != 0) {
                  piVar2 = *(int **)(iVar3 + 0x10);
                  do {
                    if (*(int *)(local_24[2] + ((int)local_30 + uVar5) * 4) == *piVar2) {
                      local_20 = 1;
                      goto LAB_100c0904;
                    }
                    local_c = local_c + 1;
                    uVar7 = *(uint *)(iVar3 + 0xc);
                    piVar2 = piVar2 + 1;
                  } while (local_c < uVar7);
                }
                uVar5 = uVar5 + 1;
              } while (uVar5 < local_28);
            }
LAB_100c0904:
            local_14 = local_14 + 1;
          } while (local_14 < local_2c);
        }
        local_8 = local_8 + 1;
        local_30 = (undefined4 *)((int)local_30 + local_28);
      } while (local_8 < 2);
      if (local_20 == 0) {
        if (local_34 != 0) goto LAB_100c0aaf;
        local_14 = 0;
        if (local_2c != 0) {
          do {
            local_38 = *(uint *)(local_8c[local_14] + 0xc);
            local_c = 0;
            if (local_38 != 0) {
              do {
                if (*(int *)(in_ECX + 0xc) != 0) {
                  local_30 = *(undefined4 **)(in_ECX + 0x18);
                  local_18 = *(int *)(in_ECX + 0xc);
                  do {
                    puVar1 = (uint *)*local_30;
                    if ((puVar1 != (uint *)0x0) && (*puVar1 != 0)) {
                      local_8 = 0;
                      if (puVar1[1] != 0) {
                        iVar3 = *(int *)(*(int *)(local_8c[local_14] + 0x10) + local_c * 4);
                        piVar2 = (int *)puVar1[2];
                        local_4c[4] = puVar1[1];
                        do {
                          if ((*piVar2 == iVar3) ||
                             (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4) + 0x38) ==
                              iVar3)) {
                            local_8 = 1;
                          }
                          piVar2 = piVar2 + 1;
                          local_4c[4] = local_4c[4] - 1;
                        } while (local_4c[4] != 0);
                      }
                      if (puVar1 == local_24) {
                        local_8 = 0;
                      }
                      if (local_8 != 0) {
                        uVar5 = 0;
                        do {
                          if (puVar1 == (uint *)local_8c[uVar5]) {
                            local_8 = 0;
                          }
                          uVar5 = uVar5 + 1;
                        } while (uVar5 < local_2c);
                        if (local_8 != 0) {
                          local_20 = 1;
                        }
                      }
                    }
                    local_30 = local_30 + 1;
                    local_18 = local_18 + -1;
                  } while (local_18 != 0);
                }
                local_c = local_c + 1;
              } while (local_c < local_38);
            }
            local_14 = local_14 + 1;
          } while (local_14 < local_2c);
        }
        local_c = 0;
        do {
          iVar3 = local_1dc[local_c];
          if ((iVar3 != -1) && (uVar5 = 0, local_2c != 0)) {
            local_38 = *(uint *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
            do {
              local_18 = *(int *)(local_8c[uVar5] + 0xc);
              if (local_18 != 0) {
                piVar2 = *(int **)(local_8c[uVar5] + 0x10);
                do {
                  if ((iVar3 == *piVar2) || (*(int *)(local_38 + 0x38) == *piVar2)) {
                    local_20 = 1;
                  }
                  piVar2 = piVar2 + 1;
                  local_18 = local_18 + -1;
                } while (local_18 != 0);
              }
              uVar5 = uVar5 + 1;
            } while (uVar5 < local_2c);
          }
          local_c = local_c + 1;
        } while (local_c < 0x28);
        if (local_20 == 0) goto LAB_100c0aaf;
      }
      local_10 = local_10 + 1;
    } while (local_10 < 2);
    if (local_20 != 0) goto code_r0x100c0aa0;
LAB_100c0aaf:
    local_8c[local_2c] = (int)local_24;
    uVar5 = 0;
    do {
      iVar3 = *(int *)((int)local_1dc + uVar5);
      if ((iVar3 != -1) || (iVar3 = *(int *)((int)local_27c + uVar5), iVar3 != -1)) {
        *(int *)((int)local_13c + uVar5) = iVar3;
      }
      uVar5 = uVar5 + 4;
    } while (uVar5 < 0xa0);
    local_10 = 0;
LAB_100c0ae9:
    goto LAB_100c0aef;
  }
  local_10 = 1;
LAB_100c0aef:
  if (local_1c < 3) {
LAB_100c0bb5:
    local_10 = 1;
  }
  else {
    local_18 = 0;
    if (local_1c != 0) {
      piVar2 = *(int **)(*(int *)(in_ECX + 0x100) + 0x10);
      do {
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4);
        if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 4) & 0x20) !=
             0) || (*(uint *)(iVar3 + 0x10) != local_18)) goto LAB_100c0bb5;
        local_18 = local_18 + 1;
        piVar2 = piVar2 + 1;
      } while (local_18 < local_1c);
    }
    if (local_10 == 0) {
      uVar5 = 0;
      do {
        iVar3 = local_13c[uVar5];
        if (((iVar3 != local_13c[uVar5 + 4]) || (iVar3 != local_13c[uVar5 + 8])) ||
           ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x10) != uVar5 &&
            ((*(byte *)(in_ECX + 0x6c) & 2) != 0)))) goto LAB_100c0cea;
        uVar5 = uVar5 + 1;
      } while (uVar5 < 3);
      if ((local_13c[7] == -1) && (local_13c[0xb] == -1)) {
        iVar3 = FUN_10085814(0x74);
        if (iVar3 == 0) {
          local_24 = (uint *)0x0;
        }
        else {
          local_24 = (uint *)FUN_10085379();
        }
        if (local_24 == (uint *)0x0) {
          local_10 = -0x7ff8fff2;
        }
        else {
          iVar3 = FUN_1008585f(local_1c & 0xfffff | 0x70200000,local_1c,local_1c,0);
          if ((iVar3 < 0) || (iVar3 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100)), iVar3 < 0)) {
            FUN_1006c418(1);
            local_10 = iVar3;
          }
          else {
            puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
            puVar8 = *(undefined4 **)((int)local_24 + 0x10);
            for (uVar5 = local_1c & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
              *puVar8 = *puVar6;
              puVar6 = puVar6 + 1;
              puVar8 = puVar8 + 1;
            }
            for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
              *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
              puVar6 = (undefined4 *)((int)puVar6 + 1);
              puVar8 = (undefined4 *)((int)puVar8 + 1);
            }
            piVar2 = local_13c;
            piVar9 = *(int **)((int)local_24 + 8);
            for (uVar5 = local_1c & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar9 = *piVar2;
              piVar2 = piVar2 + 1;
              piVar9 = piVar9 + 1;
            }
            for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
              *(char *)piVar9 = (char)*piVar2;
              piVar2 = (int *)((int)piVar2 + 1);
              piVar9 = (int *)((int)piVar9 + 1);
            }
            uVar5 = 0;
            if (local_1c != 0) {
              do {
                if ((*(byte *)(in_ECX + 0x6c) & 2) != 0) {
                  puVar1 = *(uint **)(*(int *)(in_ECX + 0x14) +
                                     *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + uVar5 * 4) *
                                     4);
                  *puVar1 = *puVar1 | 0x80000000;
                  iVar3 = *(int *)(in_ECX + 0x14);
                  if (*(int *)(*(int *)(iVar3 + *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) +
                                                        uVar5 * 4) * 4) + 0x38) != -1) {
                    puVar1 = *(uint **)(iVar3 + *(int *)(*(int *)(iVar3 + *(int *)(*(int *)(*(int *)
                                                  (in_ECX + 0x100) + 8) + uVar5 * 4) * 4) + 0x38) *
                                                4);
                    *puVar1 = *puVar1 | 0x80000000;
                  }
                }
                puVar1 = *(uint **)(*(int *)(in_ECX + 0x14) +
                                   *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + uVar5 * 4) *
                                   4);
                *puVar1 = *puVar1 | 0x80000000;
                uVar5 = uVar5 + 1;
              } while (uVar5 < local_1c);
            }
            local_10 = FUN_10085abe(local_24);
            FUN_1006c418(1);
          }
        }
      }
      else {
LAB_100c0cea:
        local_10 = 1;
      }
    }
  }
  return local_10;
code_r0x100c0aa0:
  local_34 = local_34 + 1;
  local_10 = local_20;
  if (local_34 != 0) goto LAB_100c0ae9;
  goto LAB_100c075e;
}


