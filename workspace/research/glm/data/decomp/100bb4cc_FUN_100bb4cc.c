// 100bb4cc size=1161 FUN_100bb4cc

int FUN_100bb4cc(void)

{
  uint uVar1;
  undefined4 uVar2;
  uint *puVar3;
  int in_ECX;
  int iVar4;
  int *piVar5;
  int iVar6;
  undefined4 *puVar7;
  uint uVar8;
  uint uVar9;
  undefined4 *puVar10;
  int local_278 [40];
  int local_1d8 [40];
  int local_138 [40];
  undefined1 local_98 [16];
  int local_88 [16];
  uint local_48 [5];
  int local_34;
  undefined4 *local_30;
  int local_2c;
  int local_28;
  uint *local_24;
  int local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  int local_10;
  int local_c;
  uint local_8;
  
  local_48[0] = 0;
  local_24 = *(uint **)(in_ECX + 0x100);
  local_48[1] = 1;
  local_48[2] = 2;
  local_48[3] = 3;
  if (((*local_24 & 0xfffff) == 1) &&
     ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                         *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_24[4] * 4) + 4) *
                         4) + 4) & 0x20) == 0)) {
    local_18 = *local_24 & 0xfffff;
    if ((local_18 < 2) && ((undefined *)(*local_24 & 0xfff00000) == &DAT_10500000)) {
      local_28 = 0;
      local_10 = in_ECX;
      do {
        local_20 = 0;
        do {
          piVar5 = local_1d8;
          for (iVar4 = 0x28; iVar4 != 0; iVar4 = iVar4 + -1) {
            *piVar5 = -1;
            piVar5 = piVar5 + 1;
          }
          iVar6 = 0;
          piVar5 = local_278;
          for (iVar4 = 0x28; iVar4 != 0; iVar4 = iVar4 + -1) {
            *piVar5 = -1;
            piVar5 = piVar5 + 1;
          }
          local_14 = 0;
          local_c = 0;
          local_8 = 0;
          do {
            uVar9 = local_8;
            if (local_20 != 0) {
              uVar9 = 1 - local_8;
            }
            uVar1 = local_24[2];
            uVar9 = *(uint *)(&DAT_10119444 + uVar9 * 4);
            piVar5 = (int *)(uVar1 + iVar6 * 4);
            if (uVar9 < 0x10) {
              iVar4 = *(int *)(*(int *)(*(int *)(local_10 + 0x14) + *piVar5 * 4) + 0x48);
              if (iVar4 != -1) {
                uVar2 = *(undefined4 *)(*(int *)(local_10 + 0x18) + iVar4 * 4);
                iVar4 = FUN_100b97c4(uVar2,piVar5,local_18,local_48,local_98,
                                     *(undefined4 *)(&DAT_10119450 + uVar9 * 0x20),0);
                if (iVar4 == 0) {
                  local_c = FUN_100b99af(uVar2,&DAT_10119438 + uVar9 * 0x20,local_88,&local_14,
                                         local_278,local_98,1,0);
                  goto LAB_100bb655;
                }
              }
              local_c = 1;
              break;
            }
            uVar8 = 0;
            piVar5 = local_1d8 + (uVar9 - 0x10) * 4;
            do {
              if (local_48[uVar8] < local_18) {
                *piVar5 = *(int *)(uVar1 + (local_48[uVar8] + iVar6) * 4);
              }
              else {
                *piVar5 = -1;
              }
              uVar8 = uVar8 + 1;
              piVar5 = piVar5 + 1;
            } while (uVar8 < 4);
LAB_100bb655:
            if (local_c == 1) break;
            local_8 = local_8 + 1;
            iVar6 = iVar6 + local_18;
          } while (local_8 == 0);
          if ((0xf < *(uint *)(&DAT_10119444 + (uint)(local_20 != 0) * 4)) &&
             (local_8 = 0, local_14 != 0)) {
            do {
              uVar9 = 0;
              if (local_18 != 0) {
                uVar1 = *(uint *)(local_88[local_8] + 0xc);
                do {
                  local_1c = 0;
                  if (uVar1 != 0) {
                    piVar5 = *(int **)(local_88[local_8] + 0x10);
                    do {
                      if (*(int *)(local_24[2] + uVar9 * 4) == *piVar5) {
                        local_c = 1;
                        goto LAB_100bb6d6;
                      }
                      local_1c = local_1c + 1;
                      piVar5 = piVar5 + 1;
                    } while (local_1c < uVar1);
                  }
                  uVar9 = uVar9 + 1;
                } while (uVar9 < local_18);
              }
LAB_100bb6d6:
              local_8 = local_8 + 1;
            } while (local_8 < local_14);
          }
          if (local_c == 0) {
            if (local_28 != 0) goto LAB_100bb862;
            local_1c = 0;
            if (local_14 != 0) {
              do {
                local_48[4] = *(uint *)(local_88[local_1c] + 0xc);
                local_8 = 0;
                if (local_48[4] != 0) {
                  do {
                    if (*(int *)(local_10 + 0xc) != 0) {
                      local_30 = *(undefined4 **)(local_10 + 0x18);
                      local_34 = *(int *)(local_10 + 0xc);
                      do {
                        puVar3 = (uint *)*local_30;
                        if ((puVar3 != (uint *)0x0) && (*puVar3 != 0)) {
                          uVar9 = puVar3[1];
                          local_2c = 0;
                          if (uVar9 != 0) {
                            iVar4 = *(int *)(*(int *)(local_88[local_1c] + 0x10) + local_8 * 4);
                            piVar5 = (int *)puVar3[2];
                            do {
                              if ((*piVar5 == iVar4) ||
                                 (*(int *)(*(int *)(*(int *)(local_10 + 0x14) + *piVar5 * 4) + 0x38)
                                  == iVar4)) {
                                local_2c = 1;
                              }
                              piVar5 = piVar5 + 1;
                              uVar9 = uVar9 - 1;
                            } while (uVar9 != 0);
                          }
                          iVar4 = local_2c;
                          if (puVar3 == local_24) {
                            iVar4 = 0;
                          }
                          if (iVar4 != 0) {
                            uVar9 = 0;
                            do {
                              if (puVar3 == (uint *)local_88[uVar9]) {
                                iVar4 = 0;
                              }
                              uVar9 = uVar9 + 1;
                            } while (uVar9 < local_14);
                            if (iVar4 != 0) {
                              local_c = 1;
                            }
                          }
                        }
                        local_30 = local_30 + 1;
                        local_34 = local_34 + -1;
                      } while (local_34 != 0);
                    }
                    local_8 = local_8 + 1;
                  } while (local_8 < local_48[4]);
                }
                local_1c = local_1c + 1;
              } while (local_1c < local_14);
            }
            local_8 = 0;
            do {
              iVar4 = local_1d8[local_8];
              if ((iVar4 != -1) && (uVar9 = 0, local_14 != 0)) {
                do {
                  iVar6 = *(int *)(local_88[uVar9] + 0xc);
                  if (iVar6 != 0) {
                    piVar5 = *(int **)(local_88[uVar9] + 0x10);
                    do {
                      if ((iVar4 == *piVar5) ||
                         (*(int *)(*(int *)(*(int *)(local_10 + 0x14) + iVar4 * 4) + 0x38) ==
                          *piVar5)) {
                        local_c = 1;
                      }
                      piVar5 = piVar5 + 1;
                      iVar6 = iVar6 + -1;
                    } while (iVar6 != 0);
                  }
                  uVar9 = uVar9 + 1;
                } while (uVar9 < local_14);
              }
              local_8 = local_8 + 1;
            } while (local_8 < 0x28);
            if (local_c == 0) goto LAB_100bb862;
          }
          local_20 = local_20 + 1;
        } while (local_20 == 0);
        if (local_c == 0) {
LAB_100bb862:
          local_88[local_14] = (int)local_24;
          uVar9 = 0;
          do {
            iVar4 = *(int *)((int)local_1d8 + uVar9);
            if ((iVar4 != -1) || (iVar4 = *(int *)((int)local_278 + uVar9), iVar4 != -1)) {
              *(int *)((int)local_138 + uVar9) = iVar4;
            }
            uVar9 = uVar9 + 4;
          } while (uVar9 < 0xa0);
          local_c = 0;
LAB_100bb89e:
          if (local_c != 0) {
            return local_c;
          }
          iVar4 = FUN_10085814(0x74);
          if (iVar4 == 0) {
            iVar4 = 0;
          }
          else {
            iVar4 = FUN_10085379();
          }
          if (iVar4 == 0) {
            return -0x7ff8fff2;
          }
          iVar6 = FUN_1008585f(0x70d00001,2,1,0);
          if ((-1 < iVar6) && (iVar6 = FUN_100853b0(*(undefined4 *)(local_10 + 0x100)), -1 < iVar6))
          {
            puVar7 = *(undefined4 **)(*(int *)(local_10 + 0x100) + 0x10);
            puVar10 = *(undefined4 **)(iVar4 + 0x10);
            for (uVar9 = *(uint *)(*(int *)(local_10 + 0x100) + 0xc) & 0x3fffffff; uVar9 != 0;
                uVar9 = uVar9 - 1) {
              *puVar10 = *puVar7;
              puVar7 = puVar7 + 1;
              puVar10 = puVar10 + 1;
            }
            for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
              *(undefined1 *)puVar10 = *(undefined1 *)puVar7;
              puVar7 = (undefined4 *)((int)puVar7 + 1);
              puVar10 = (undefined4 *)((int)puVar10 + 1);
            }
            **(undefined4 **)(iVar4 + 8) = local_138[4];
            *(int *)(*(int *)(iVar4 + 8) + 4) = local_138[0];
            iVar6 = FUN_10085abe(iVar4);
          }
          FUN_1006c418(1);
          return iVar6;
        }
        local_28 = local_28 + 1;
        if (local_28 != 0) goto LAB_100bb89e;
      } while( true );
    }
  }
  return 1;
}


