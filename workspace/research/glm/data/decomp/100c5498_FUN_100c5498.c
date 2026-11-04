// 100c5498 size=1178 FUN_100c5498

int FUN_100c5498(void)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  int *in_ECX;
  int *piVar7;
  uint *puVar8;
  uint uVar9;
  uint local_68 [8];
  uint local_48;
  uint *local_44;
  int local_40;
  int local_3c;
  uint *local_38;
  int local_34;
  int local_30;
  uint local_2c;
  int local_28;
  int local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  int *local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  iVar3 = FUN_100ba843();
  if (-1 < iVar3) {
    iVar3 = in_ECX[2];
    local_10 = 0;
    if (iVar3 != 0) {
      piVar7 = (int *)in_ECX[5];
      do {
        if ((in_ECX[0x22] == *(int *)(*piVar7 + 4)) &&
           (uVar9 = *(uint *)(*piVar7 + 0xc), local_10 <= uVar9)) {
          local_10 = uVar9 + 1;
        }
        piVar7 = piVar7 + 1;
        iVar3 = iVar3 + -1;
      } while (iVar3 != 0);
    }
    local_48 = in_ECX[3];
    local_20 = 0;
    if (local_48 != 0) {
      do {
        puVar8 = *(uint **)(in_ECX[6] + local_20 * 4);
        if ((*puVar8 & 0xfff00000) != 0) {
          local_c = *puVar8 & 0xfffff;
          local_2c = puVar8[1] / local_c;
          iVar3 = *(int *)(in_ECX[5] + *(int *)puVar8[4] * 4);
          local_24 = *(int *)(iVar3 + 0x14);
          local_28 = *(int *)(iVar3 + 0x18);
          local_44 = puVar8;
          while ((iVar3 = (**(code **)(*in_ECX + 0x20))(puVar8,&local_1c), iVar3 != 0 &&
                 ((*puVar8 & 0xfff00000) != 0x74100000))) {
            local_34 = *(int *)(in_ECX[4] +
                               *(int *)(*(int *)(in_ECX[5] +
                                                *(int *)(puVar8[2] + local_1c * local_c * 4) * 4) +
                                       4) * 4);
            if ((*(byte *)(local_34 + 4) & 2) != 0) {
LAB_100c5918:
              FUN_1008b0b5();
              return -0x7fffbffb;
            }
            local_18 = 0;
            local_8 = 0;
            if (local_2c != 0) {
              local_14 = (int *)0x0;
              do {
                iVar3 = *(int *)(in_ECX[4] +
                                *(int *)(*(int *)(in_ECX[5] +
                                                 *(int *)((int)local_14 + puVar8[2]) * 4) + 4) * 4);
                iVar4 = (**(code **)(*in_ECX + 0x9c))(puVar8);
                if ((((iVar4 != 1) && (uVar9 = *(uint *)(iVar3 + 4), (uVar9 & 0x40) != 0)) &&
                    (((*(uint *)(local_34 + 4) ^ uVar9) & 0x12bf) == 0)) && (local_c != 0)) {
                  piVar7 = local_14;
                  uVar9 = local_c;
                  do {
                    uVar1 = *(uint *)(*(int *)(in_ECX[5] + *(int *)((int)piVar7 + puVar8[2]) * 4) +
                                     0x5c);
                    if (local_18 < uVar1) {
                      local_1c = local_8;
                      local_18 = uVar1;
                    }
                    piVar7 = (int *)((int)piVar7 + 4);
                    uVar9 = uVar9 - 1;
                  } while (uVar9 != 0);
                }
                local_8 = local_8 + 1;
                local_14 = (int *)((int)local_14 + local_c * 4);
              } while (local_8 < local_2c);
            }
            iVar3 = *(int *)(in_ECX[5] + *(int *)(puVar8[2] + local_1c * local_c * 4) * 4);
            iVar4 = *(int *)(iVar3 + 4);
            local_34 = *(int *)(iVar3 + 8);
            local_3c = iVar4;
            local_30 = *(int *)(iVar3 + 0xc);
            if ((*(byte *)(*(int *)(in_ECX[4] + iVar4 * 4) + 4) & 0x40) == 0) goto LAB_100c5918;
            local_68[0] = 0xffffffff;
            local_68[1] = 0xffffffff;
            local_18 = 0;
            local_68[2] = 0xffffffff;
            uVar9 = 0;
            local_68[3] = 0xffffffff;
            if (in_ECX[2] != 0) {
              local_14 = (int *)in_ECX[5];
              do {
                uVar1 = local_18;
                iVar3 = *local_14;
                if ((((*(int *)(iVar3 + 4) == iVar4) && (*(int *)(iVar3 + 0xc) == local_30)) &&
                    ((*(int *)(iVar3 + 8) == local_34 &&
                     ((*(int *)(iVar3 + 0x38) == -1 &&
                      (uVar2 = *(uint *)(iVar3 + 0x58), local_20 <= uVar2)))))) &&
                   (local_68[*(int *)(iVar3 + 0x10)] = uVar9, uVar1 <= uVar2)) {
                  local_18 = uVar2 + 1;
                }
                local_14 = local_14 + 1;
                uVar9 = uVar9 + 1;
              } while (uVar9 < (uint)in_ECX[2]);
            }
            uVar9 = 0;
            local_14 = (int *)0x0;
            local_8 = 0;
            do {
              uVar1 = local_8;
              local_38 = (uint *)local_68[local_8];
              if ((uint *)local_68[local_8] != (uint *)0xffffffff) {
                uVar9 = FUN_10086139(in_ECX[0x22],local_10,local_8,0);
                local_68[uVar1 + 4] = uVar9;
                if (uVar9 == 0xffffffff) {
                  return -0x7ff8fff2;
                }
                iVar3 = *(int *)(in_ECX[5] + uVar9 * 4);
                iVar4 = FUN_10085d21();
                if (iVar4 < 0) {
                  return iVar4;
                }
                *(undefined4 *)(iVar3 + 0x68) = 0;
                *(undefined4 *)(iVar3 + 0x6c) = 0xffffffff;
                *(undefined4 *)(iVar3 + 0x70) = 0;
                uVar9 = (int)local_14 + 1;
                local_14 = (int *)uVar9;
                *(int *)(iVar3 + 0x14) = local_24;
                *(int *)(iVar3 + 0x18) = local_28;
              }
              local_8 = local_8 + 1;
            } while (local_8 < 4);
            iVar3 = FUN_10086199(uVar9 & 0xfffff | 0x10000000,uVar9,uVar9);
            if (iVar3 == -1) {
              return -0x7ff8fff2;
            }
            iVar3 = *(int *)(in_ECX[6] + iVar3 * 4);
            iVar4 = FUN_100853b0();
            if (iVar4 < 0) {
              return iVar4;
            }
            iVar4 = 0;
            local_8 = 0;
            do {
              if (*(int *)((int)local_68 + local_8) != -1) {
                *(int *)(iVar4 + *(int *)(iVar3 + 8)) = *(int *)((int)local_68 + local_8);
                *(undefined4 *)(iVar4 + *(int *)(iVar3 + 0x10)) =
                     *(undefined4 *)((int)local_68 + local_8 + 0x10);
                iVar4 = iVar4 + 4;
              }
              local_8 = local_8 + 4;
            } while (local_8 < 0x10);
            local_10 = local_10 + 1;
            for (local_8 = local_20; local_8 < local_18; local_8 = local_8 + 1) {
              iVar3 = *(int *)(in_ECX[6] + local_8 * 4);
              if ((*(ushort *)(iVar3 + 2) & 0xfff0) != 0) {
                iVar4 = *(int *)(in_ECX[5] + **(int **)(iVar3 + 0x10) * 4);
                iVar6 = *(int *)(iVar4 + 0x14);
                for (iVar4 = *(int *)(iVar4 + 0x18);
                    (iVar6 != -1 && ((iVar6 != local_24 || (iVar4 != local_28))));
                    iVar4 = *(int *)(iVar4 + 0x18)) {
                  iVar4 = *(int *)(in_ECX[5] + iVar6 * 4);
                  iVar6 = *(int *)(iVar4 + 0x14);
                }
                if ((((iVar6 == local_24) && (iVar4 == local_28)) &&
                    (iVar4 = (**(code **)(*in_ECX + 0x20))(), iVar4 != 0)) &&
                   (local_14 = (int *)0x0, *(int *)(iVar3 + 4) != 0)) {
                  do {
                    iVar4 = (int)local_14 * 4;
                    local_38 = (uint *)(*(int *)(iVar3 + 8) + iVar4);
                    local_40 = *(int *)(in_ECX[5] + *local_38 * 4);
                    if (((*(int *)(local_40 + 4) == local_3c) &&
                        (*(int *)(local_40 + 0xc) == local_30)) &&
                       (*(int *)(local_40 + 8) == local_34)) {
                      if (*(int *)(local_40 + 0x38) == -1) {
                        *local_38 = local_68[*(int *)(local_40 + 0x10) + 4];
                      }
                      else {
                        local_38 = *(uint **)(in_ECX[5] +
                                             local_68[*(int *)(local_40 + 0x10) + 4] * 4);
                        uVar5 = FUN_10086139(in_ECX[0x22],local_38[3],local_38[4],0);
                        *(undefined4 *)(iVar4 + *(int *)(iVar3 + 8)) = uVar5;
                        if (*(int *)(iVar4 + *(int *)(iVar3 + 8)) == -1) {
                          return -0x7ff8fff2;
                        }
                        iVar4 = *(int *)(in_ECX[5] + *(int *)(iVar4 + *(int *)(iVar3 + 8)) * 4);
                        iVar6 = FUN_10085d21();
                        if (iVar6 < 0) {
                          return iVar6;
                        }
                        *(uint *)(iVar4 + 0x38) = local_68[*(int *)(local_40 + 0x10) + 4];
                        *(undefined4 *)(iVar4 + 0x3c) = *(undefined4 *)(local_40 + 0x3c);
                      }
                    }
                    local_14 = (int *)((int)local_14 + 1);
                    puVar8 = local_44;
                  } while (local_14 < *(uint *)(iVar3 + 4));
                }
              }
            }
          }
          iVar3 = FUN_10086292();
          if (iVar3 < 0) {
            return iVar3;
          }
          *puVar8 = 0;
        }
        local_20 = local_20 + 1;
      } while (local_20 < local_48);
    }
    iVar3 = 0;
  }
  return iVar3;
}


