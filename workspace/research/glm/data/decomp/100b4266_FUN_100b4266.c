// 100b4266 size=3113 FUN_100b4266

int FUN_100b4266(void)

{
  int iVar1;
  int iVar2;
  uint *puVar3;
  int iVar4;
  int *piVar5;
  int *in_ECX;
  int iVar6;
  uint uVar7;
  int *piVar8;
  int *piVar9;
  undefined4 *puVar10;
  uint uVar11;
  undefined4 *puVar12;
  int *piVar13;
  bool bVar14;
  undefined4 uVar16;
  undefined8 uVar15;
  int local_d4 [16];
  int local_94 [4];
  uint local_84 [9];
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  uint local_54 [9];
  int local_30;
  int *local_2c;
  int local_28;
  int *local_24;
  int *local_20;
  int *local_1c;
  int *local_18;
  int *local_14;
  int *local_10;
  int *local_c;
  int *local_8;
  
  local_30 = 0;
  local_28 = 0;
  local_14 = (int *)(*(uint *)in_ECX[0x40] & 0xfff00000);
  if (local_14 == (int *)0x0) {
    return 0;
  }
  uVar7 = *(uint *)in_ECX[0x40];
  uVar11 = ((uint *)in_ECX[0x40])[1];
  piVar9 = (int *)(uVar7 & 0xfffff);
  local_10 = (int *)(uVar11 / (uint)piVar9);
  local_24 = piVar9;
  local_54[8] = uVar11 % (uint)piVar9;
  if ((((uVar7 & 0xfff00000) == 0x50000000) || (local_14 == (int *)0x50200000)) ||
     (local_14 == (int *)0x70800000)) {
    bVar14 = true;
  }
  else {
    bVar14 = false;
  }
  local_8 = (int *)0x0;
  if (((local_14 == (int *)0x60500000) || (local_14 == (int *)0x60a00000)) ||
     ((local_14 == (int *)0x60f00000 || (local_14 == (int *)0x11000000)))) {
    iVar4 = FUN_10086292();
    if (iVar4 < 0) {
      return iVar4;
    }
    *(undefined4 *)in_ECX[0x40] = 0;
    goto LAB_100b4e6a;
  }
  if (bVar14) {
    if ((local_14 == (int *)0x50200000) || (local_14 == (int *)0x70800000)) {
      iVar4 = FUN_10086292();
      if (iVar4 < 0) {
        return iVar4;
      }
      *(undefined4 *)in_ECX[0x40] = 0;
      return iVar4;
    }
    if (*(int *)(*(int *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4) + 4) == in_ECX[0x21]) {
      FUN_1008b0b5();
      return -0x7fffbffb;
    }
    local_c = (int *)0x0;
    if (local_10 != (int *)0x0) {
      local_2c = (int *)0x0;
      local_8 = local_d4;
      local_14 = (int *)((int)piVar9 << 2);
      do {
        piVar8 = local_8;
        piVar5 = local_8 + 1;
        *local_8 = -1;
        *piVar5 = -1;
        piVar8[2] = -1;
        piVar8[3] = -1;
        if (piVar9 != (int *)0x0) {
          piVar5 = (int *)(*(int *)(in_ECX[0x40] + 8) + (int)local_2c);
          local_20 = piVar9;
          do {
            *piVar8 = *(int *)(*(int *)(in_ECX[5] + *piVar5 * 4) + 0x10);
            piVar5 = piVar5 + 1;
            piVar8 = piVar8 + 1;
            local_20 = (int *)((int)local_20 - 1);
          } while (local_20 != (int *)0x0);
        }
        local_18 = (int *)0x0;
        puVar10 = &DAT_101a4218;
        while (iVar4 = FUN_100b3f18(local_8,puVar10), iVar4 == 0) {
          local_18 = local_18 + 4;
          puVar10 = puVar10 + 4;
          if ((int *)0x7f < local_18) {
            if ((*(byte *)(in_ECX + 0x1b) & 2) == 0) goto LAB_100b4c22;
            iVar4 = FUN_100b3f9f(&local_28,piVar9,local_10);
            if (iVar4 < 0) goto LAB_100b4e7a;
            if (local_28 != 0) {
              iVar4 = FUN_10086026();
              if (iVar4 < 0) goto LAB_100b4e7a;
              local_28 = 0;
            }
            iVar4 = FUN_10085814();
            if (iVar4 == 0) {
              iVar6 = 0;
            }
            else {
              iVar6 = FUN_10085379();
            }
            if (iVar6 != 0) {
              local_8 = (int *)0x0;
              if ((int *)in_ECX[2] != (int *)0x0) {
                piVar9 = (int *)in_ECX[5];
                local_20 = (int *)in_ECX[2];
                do {
                  uVar7 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(*piVar9 + 4) * 4) + 4);
                  if ((((uVar7 & 1) != 0) && ((uVar7 & 2) != 0)) &&
                     (piVar5 = (int *)(*(int *)(*piVar9 + 0xc) + 1), local_8 < piVar5)) {
                    local_8 = piVar5;
                  }
                  piVar9 = piVar9 + 1;
                  local_20 = (int *)((int)local_20 - 1);
                } while (local_20 != (int *)0x0);
              }
              iVar4 = FUN_1008585f(0x20500001,2,1,0);
              if ((iVar4 < 0) || (iVar4 = FUN_100853b0(), iVar4 < 0)) goto LAB_100b4e7a;
              local_20 = (int *)FUN_10086139(in_ECX[0x22],local_8,0,0);
              local_8 = (int *)((int)local_8 + 1);
              if (local_20 != (int *)0xffffffff) {
                **(uint **)(iVar6 + 0x10) = (uint)local_20;
                **(undefined4 **)(iVar6 + 8) = **(undefined4 **)(in_ECX[0x40] + 8);
                *(undefined4 *)(*(int *)(iVar6 + 8) + 4) =
                     *(undefined4 *)((int)local_14 + *(int *)(in_ECX[0x40] + 8));
                iVar4 = FUN_10086026();
                if (iVar4 < 0) goto LAB_100b4e7a;
                local_1c = (int *)0x1;
                if ((int *)0x1 < local_24) {
                  local_14 = local_14 + 1;
                  do {
                    iVar4 = FUN_10085814();
                    if (iVar4 == 0) {
                      iVar6 = 0;
                    }
                    else {
                      iVar6 = FUN_10085379();
                    }
                    if (iVar6 == 0) goto LAB_100b4df0;
                    iVar4 = FUN_1008585f(0x70300001,3,1,0);
                    if ((iVar4 < 0) || (iVar4 = FUN_100853b0(), iVar4 < 0)) goto LAB_100b4e7a;
                    **(undefined4 **)(iVar6 + 8) =
                         *(undefined4 *)(*(int *)(in_ECX[0x40] + 8) + (int)local_1c * 4);
                    *(undefined4 *)(*(int *)(iVar6 + 8) + 4) =
                         *(undefined4 *)((int)local_14 + *(int *)(in_ECX[0x40] + 8));
                    *(int **)(*(int *)(iVar6 + 8) + 8) = local_20;
                    if (local_1c == (int *)((int)local_24 - 1U)) {
                      piVar9 = (int *)**(uint **)(in_ECX[0x40] + 0x10);
                    }
                    else {
                      piVar9 = (int *)FUN_10086139(in_ECX[0x22],local_8,0,0);
                      local_8 = (int *)((int)local_8 + 1);
                      local_20 = piVar9;
                      if (piVar9 == (int *)0xffffffff) goto LAB_100b4df0;
                    }
                    **(uint **)(iVar6 + 0x10) = (uint)piVar9;
                    iVar4 = FUN_10086026();
                    if (iVar4 < 0) goto LAB_100b4e7a;
                    local_1c = (int *)((int)local_1c + 1);
                    local_14 = local_14 + 1;
                  } while (local_1c < local_24);
                }
                goto LAB_100b4c39;
              }
            }
LAB_100b4df0:
            iVar4 = -0x7ff8fff2;
            goto LAB_100b4e7a;
          }
        }
        local_c = (int *)((int)local_c + 1);
        local_2c = (int *)((int)local_2c + (int)local_14);
        local_8 = local_8 + 4;
      } while (local_c < local_10);
    }
LAB_100b4c22:
    iVar4 = FUN_10086292();
    if (iVar4 < 0) {
      return iVar4;
    }
  }
  else {
    local_c = (int *)0x0;
    if (local_10 != (int *)0x0) {
      local_18 = (int *)0x0;
      local_2c = local_d4;
      do {
        piVar5 = local_2c;
        bVar14 = local_24 != (int *)0x0;
        piVar9 = local_2c + 1;
        *local_2c = -1;
        *piVar9 = -1;
        piVar5[2] = -1;
        piVar5[3] = -1;
        if (bVar14) {
          local_1c = *(int **)(in_ECX[0x40] + 0x10);
          iVar4 = in_ECX[5];
          iVar6 = (int)local_c * 4;
          piVar9 = (int *)(*(int *)(in_ECX[0x40] + 8) + (int)local_18);
          local_14 = local_24;
          do {
            iVar1 = *local_1c;
            iVar2 = *piVar9;
            local_1c = local_1c + 1;
            piVar9 = piVar9 + 1;
            piVar5 = (int *)((int)local_14 + -1);
            local_14 = piVar5;
            local_d4[*(int *)(*(int *)(iVar4 + iVar1 * 4) + 0x10) + iVar6] =
                 *(int *)(*(int *)(iVar4 + iVar2 * 4) + 0x10);
          } while (piVar5 != (int *)0x0);
        }
        local_c = (int *)((int)local_c + 1);
        local_2c = local_2c + 4;
        local_18 = local_18 + (int)local_24;
      } while (local_c < local_10);
    }
    if ((*(byte *)(*(int *)(in_ECX[4] +
                           *(int *)(*(int *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4) + 4) *
                           4) + 4) & 0x20) == 0) {
      local_c = (int *)0x0;
      if (local_10 != (int *)0x0) {
        local_18 = local_d4;
        do {
          puVar10 = &DAT_101a4218;
          uVar7 = 0;
          while (iVar4 = FUN_100b3f18(local_18,puVar10), iVar4 == 0) {
            uVar7 = uVar7 + 0x10;
            puVar10 = puVar10 + 4;
            if (0x7f < uVar7) {
              local_8 = (int *)0x1;
              goto LAB_100b4538;
            }
          }
          local_c = (int *)((int)local_c + 1);
          local_18 = local_18 + 4;
        } while (local_c < local_10);
      }
    }
    else {
      local_20 = *(int **)(in_ECX[5] + **(int **)(in_ECX[0x40] + 8) * 4);
      local_18 = (int *)(**(code **)(*in_ECX + 0x54))();
      if (local_18 != (int *)0xffff) {
        if (local_18 == (int *)0xb) {
          piVar9 = (int *)FUN_100b3f18(local_d4,&DAT_101a4258);
LAB_100b4457:
          local_8 = (int *)(uint)(piVar9 == (int *)0x0);
          if (local_8 == (int *)0x0) goto LAB_100b445b;
LAB_100b4464:
          iVar4 = FUN_100b4147(&local_30,local_24);
          if (iVar4 < 0) goto LAB_100b4e6a;
        }
        else {
          if (local_18 == (int *)0xd) {
            uVar7 = 0;
            local_14 = (int *)0x0;
            puVar10 = &DAT_101a4218;
            do {
              iVar4 = FUN_100b3f18(local_d4,puVar10);
              if (iVar4 != 0) {
                local_14 = (int *)0x1;
                piVar9 = local_14;
                break;
              }
              uVar7 = uVar7 + 0x10;
              puVar10 = puVar10 + 4;
              piVar9 = local_14;
            } while (uVar7 < 0x40);
            goto LAB_100b4457;
          }
LAB_100b445b:
          if ((*(byte *)((int)local_20 + 0x3e) & 0x1f) != 0) goto LAB_100b4464;
        }
        local_84[0] = 0;
        local_84[1] = 0;
        local_84[2] = 0;
        local_84[3] = 0;
        iVar4 = FUN_100b3f49(local_d4,local_84);
        if ((iVar4 != 0) || ((local_18 == (int *)0xd && (local_d4[0] == 0)))) {
          iVar4 = FUN_100c3c29(local_84,local_10,local_24);
          if (-1 < iVar4) {
            *(undefined4 *)in_ECX[0x40] = 0;
            if (local_30 == 0) {
              return iVar4;
            }
            iVar4 = FUN_10086026();
            if (-1 < iVar4) {
              return iVar4;
            }
          }
          goto LAB_100b4e6a;
        }
      }
    }
LAB_100b4538:
    puVar3 = (uint *)in_ECX[0x40];
    if (((*puVar3 & 0xfff00000) == 0x10d00000) || ((*puVar3 & 0xfff00000) == 0x10e00000)) {
      uVar7 = puVar3[1];
      bVar14 = false;
      if (uVar7 != 0) {
        piVar9 = (int *)in_ECX[5];
        piVar5 = (int *)puVar3[2];
        do {
          if ((*(byte *)(piVar9[*piVar5] + 0x3e) & 0x1f) != 0) {
            bVar14 = true;
          }
          piVar5 = piVar5 + 1;
          uVar7 = uVar7 - 1;
        } while (uVar7 != 0);
        if (bVar14) {
          iVar4 = in_ECX[2];
          uVar7 = 0;
          if (iVar4 != 0) {
            do {
              if ((in_ECX[0x22] == *(int *)(*piVar9 + 4)) &&
                 (uVar11 = *(uint *)(*piVar9 + 0xc), uVar7 <= uVar11)) {
                uVar7 = uVar11 + 1;
              }
              piVar9 = piVar9 + 1;
              iVar4 = iVar4 + -1;
            } while (iVar4 != 0);
          }
          uVar11 = 0;
          do {
            iVar4 = FUN_10086139(in_ECX[0x22],uVar7,uVar11,0);
            local_94[uVar11] = iVar4;
            if (iVar4 == -1) goto LAB_100b460c;
            uVar11 = uVar11 + 1;
          } while (uVar11 < 4);
          iVar4 = FUN_10085814();
          if (iVar4 == 0) {
            local_28 = 0;
          }
          else {
            local_28 = FUN_10085379();
          }
          if (local_28 == 0) {
LAB_100b460c:
            iVar4 = -0x7ff8fff2;
            goto LAB_100b4e6a;
          }
          uVar7 = *(uint *)(in_ECX[0x40] + 4);
          iVar4 = FUN_1008585f(uVar7 & 0xfffff | 0x10000000,uVar7,
                               *(undefined4 *)(in_ECX[0x40] + 0xc),0);
          if ((iVar4 < 0) || (iVar4 = FUN_100853b0(), iVar4 < 0)) goto LAB_100b4e6a;
          piVar9 = local_94;
          piVar5 = *(int **)(local_28 + 0x10);
          for (uVar7 = *(uint *)(in_ECX[0x40] + 0xc) & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
            *piVar5 = *piVar9;
            piVar9 = piVar9 + 1;
            piVar5 = piVar5 + 1;
          }
          for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
            *(char *)piVar5 = (char)*piVar9;
            piVar9 = (int *)((int)piVar9 + 1);
            piVar5 = (int *)((int)piVar5 + 1);
          }
          puVar10 = *(undefined4 **)(in_ECX[0x40] + 8);
          puVar12 = *(undefined4 **)(local_28 + 8);
          for (uVar7 = *(uint *)(in_ECX[0x40] + 4) & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
            *puVar12 = *puVar10;
            puVar10 = puVar10 + 1;
            puVar12 = puVar12 + 1;
          }
          for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
            *(undefined1 *)puVar12 = *(undefined1 *)puVar10;
            puVar10 = (undefined4 *)((int)puVar10 + 1);
            puVar12 = (undefined4 *)((int)puVar12 + 1);
          }
          piVar9 = local_94;
          piVar5 = *(int **)(in_ECX[0x40] + 8);
          for (uVar7 = *(uint *)(in_ECX[0x40] + 4) & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
            *piVar5 = *piVar9;
            piVar9 = piVar9 + 1;
            piVar5 = piVar5 + 1;
          }
          for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
            *(char *)piVar5 = (char)*piVar9;
            piVar9 = (int *)((int)piVar9 + 1);
            piVar5 = (int *)((int)piVar5 + 1);
          }
          iVar4 = FUN_10086026();
          if (iVar4 < 0) goto LAB_100b4e6a;
          local_28 = 0;
        }
      }
    }
    if ((local_8 == (int *)0x0) || ((*(byte *)(in_ECX + 0x1b) & 2) == 0)) {
      iVar4 = FUN_10086292();
      if (iVar4 < 0) goto LAB_100b4e6a;
    }
    else {
      local_8 = (int *)0x0;
      local_20 = (int *)0x0;
      if (local_24 == (int *)0x4) {
        local_c = (int *)0x1;
        uVar7 = 0;
        do {
          if (local_c == (int *)0x0) break;
          local_84[0] = 0;
          local_84[1] = 0;
          local_84[2] = 0;
          local_84[3] = 0;
          local_84[4] = 0xffffffff;
          local_84[5] = 0xffffffff;
          local_84[6] = 0xffffffff;
          local_84[7] = 0xffffffff;
          local_84[uVar7] = 0xffffffff;
          local_84[uVar7 + 4] = 0;
          local_c = (int *)0x0;
          if (local_10 == (int *)0x0) {
LAB_100b4799:
            iVar4 = FUN_100c3c29(local_84,local_10,4);
            if ((iVar4 < 0) || (iVar4 = FUN_100c3c29(local_84 + 4,local_10,4), iVar4 < 0))
            goto LAB_100b4e6a;
            goto LAB_100b4aa0;
          }
          piVar9 = local_d4;
          local_14 = local_10;
          do {
            iVar4 = FUN_100b3f49(piVar9,local_84);
            if ((iVar4 == 0) || (iVar4 = FUN_100b3f49(piVar9,local_84), iVar4 == 0)) {
              local_c = (int *)0x1;
            }
            piVar9 = piVar9 + 4;
            local_14 = (int *)((int)local_14 + -1);
          } while (local_14 != (int *)0x0);
          local_14 = (int *)0x0;
          if (local_c == (int *)0x0) goto LAB_100b4799;
          uVar7 = uVar7 + 1;
        } while (uVar7 < 4);
        local_1c = (int *)0x0;
        local_c = (int *)0x1;
        do {
          if (local_c == (int *)0x0) break;
          local_18 = (int *)0x0;
          do {
            piVar5 = local_18;
            piVar9 = local_1c;
            if (local_18 != local_1c) {
              local_84[0] = 0;
              local_84[1] = 0;
              local_84[2] = 0;
              local_84[3] = 0;
              local_84[4] = 0xffffffff;
              local_84[5] = 0xffffffff;
              local_84[6] = 0xffffffff;
              local_84[7] = 0xffffffff;
              local_84[(int)local_1c] = 0xffffffff;
              piVar8 = local_10;
              local_84[(int)piVar5] = 0xffffffff;
              local_84[(int)(piVar9 + 1)] = 0;
              local_84[(int)(piVar5 + 1)] = 0;
              local_c = (int *)0x0;
              local_2c = (int *)0x0;
              if (piVar8 != (int *)0x0) {
                piVar9 = local_d4;
                local_14 = local_10;
                do {
                  local_54[8] = FUN_100b3f49(piVar9,local_84);
                  iVar4 = FUN_100b3f49(piVar9,local_84 + 4);
                  if (local_54[8] == 0) {
                    local_2c = (int *)0x1;
LAB_100b484a:
                    local_c = (int *)0x1;
                  }
                  else if (iVar4 == 0) goto LAB_100b484a;
                  piVar9 = piVar9 + 4;
                  local_14 = (int *)((int)local_14 + -1);
                } while (local_14 != (int *)0x0);
                if (local_c != (int *)0x0) {
                  if (local_2c == (int *)0x0) {
                    local_84[8] = local_84[0];
                    uStack_60 = local_84[1];
                    uStack_5c = local_84[2];
                    uStack_58 = local_84[3];
                    local_54[0] = 0xffffffff;
                    local_54[1] = 0xffffffff;
                    local_54[2] = 0xffffffff;
                    local_54[3] = 0xffffffff;
                    local_54[4] = 0xffffffff;
                    local_54[5] = 0xffffffff;
                    local_54[6] = 0xffffffff;
                    local_54[7] = 0xffffffff;
                    local_54[(int)local_1c] = 0;
                    local_54[(int)(local_18 + 1)] = 0;
                    local_20 = (int *)0x1;
                    piVar5 = local_18;
                  }
                  goto LAB_100b489c;
                }
              }
              local_8 = (int *)0x1;
              break;
            }
LAB_100b489c:
            local_18 = (int *)((int)piVar5 + 1);
          } while (local_18 < (int *)0x4);
          local_1c = (int *)((int)local_1c + 1);
        } while (local_1c < (int *)0x4);
        if (local_8 == (int *)0x0) {
          if (local_20 == (int *)0x0) goto LAB_100b4a54;
          local_8 = (int *)0x1;
          iVar4 = FUN_100c3c29(local_84 + 8,local_10,4);
          if ((iVar4 < 0) || (iVar4 = FUN_100c3c29(local_54,local_10,4), iVar4 < 0))
          goto LAB_100b4e6a;
          uVar16 = 4;
          puVar3 = local_54;
        }
        else {
          iVar4 = FUN_100c3c29(local_84,local_10,4);
          if (iVar4 < 0) goto LAB_100b4e6a;
          uVar16 = 4;
LAB_100b4a36:
          puVar3 = local_84;
        }
        iVar4 = FUN_100c3c29(puVar3 + 4,local_10,uVar16);
        if (iVar4 < 0) goto LAB_100b4e6a;
        if (local_8 == (int *)0x0) goto LAB_100b4a54;
      }
      else {
        if (local_24 == (int *)0x3) {
          local_20 = (int *)0xffffffff;
          piVar9 = (int *)0x0;
          do {
            if (local_d4[(int)piVar9] == -1) {
              local_20 = piVar9;
            }
            piVar9 = (int *)((int)piVar9 + 1);
          } while (piVar9 < (int *)0x4);
          local_1c = (int *)0x0;
          do {
            if (local_8 != (int *)0x0) goto LAB_100b4a1a;
            piVar9 = (int *)0x0;
            do {
              piVar8 = local_1c;
              piVar5 = local_20;
              if (local_8 != (int *)0x0) break;
              if (((piVar9 != local_1c) && (piVar9 != local_20)) && (local_1c != local_20)) {
                local_84[0] = 0xffffffff;
                local_84[1] = 0xffffffff;
                local_84[2] = 0xffffffff;
                local_84[3] = 0xffffffff;
                local_84[4] = 0;
                local_84[5] = 0;
                local_84[6] = 0;
                local_84[7] = 0;
                piVar13 = (int *)0x0;
                local_84[(int)local_1c] = 0;
                local_84[(int)piVar9] = 0;
                local_84[(int)(piVar8 + 1)] = 0xffffffff;
                local_84[(int)(piVar9 + 1)] = 0xffffffff;
                local_84[(int)(piVar5 + 1)] = 0xffffffff;
                local_c = (int *)0x0;
                if (local_10 != (int *)0x0) {
                  local_18 = local_d4;
                  do {
                    if (local_c != (int *)0x0) goto LAB_100b49fd;
                    iVar4 = FUN_100b3f49(local_18,local_84);
                    if (iVar4 == 0) {
                      local_c = (int *)0x1;
                    }
                    local_18 = local_18 + 4;
                    piVar13 = (int *)((int)piVar13 + 1);
                  } while (piVar13 < local_10);
                  if (local_c != (int *)0x0) goto LAB_100b49fd;
                }
                local_8 = (int *)0x1;
              }
LAB_100b49fd:
              piVar9 = (int *)((int)piVar9 + 1);
            } while (piVar9 < (int *)0x4);
            local_1c = (int *)((int)local_1c + 1);
          } while (local_1c < (int *)0x4);
          if (local_8 != (int *)0x0) {
LAB_100b4a1a:
            iVar4 = FUN_100c3c29(local_84,local_10,3);
            if (iVar4 < 0) goto LAB_100b4e6a;
            uVar16 = 3;
            goto LAB_100b4a36;
          }
        }
LAB_100b4a54:
        piVar9 = (int *)0x0;
        if (local_24 != (int *)0x0) {
          do {
            uVar15 = CONCAT44(local_24,local_10);
            local_84[0] = 0xffffffff;
            local_84[1] = 0xffffffff;
            local_84[2] = 0xffffffff;
            local_84[3] = 0xffffffff;
            local_84[*(int *)(*(int *)(in_ECX[5] +
                                      *(int *)(*(int *)(in_ECX[0x40] + 0x10) + (int)piVar9 * 4) * 4)
                             + 0x10)] = 0;
            iVar4 = FUN_100c3c29(local_84,uVar15);
            if (iVar4 < 0) goto LAB_100b4e6a;
            piVar9 = (int *)((int)piVar9 + 1);
          } while (piVar9 < local_24);
        }
      }
LAB_100b4aa0:
      if (local_30 != 0) {
        iVar4 = FUN_10086026();
        if (iVar4 < 0) goto LAB_100b4e6a;
        local_30 = 0;
      }
    }
  }
LAB_100b4c39:
  *(undefined4 *)in_ECX[0x40] = 0;
  iVar4 = 0;
LAB_100b4e6a:
  if (local_30 != 0) {
    FUN_1006c418();
  }
LAB_100b4e7a:
  if (local_28 != 0) {
    FUN_1006c418();
  }
  return iVar4;
}


