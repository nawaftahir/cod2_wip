// 100b89c5 size=3228 FUN_100b89c5

int FUN_100b89c5(undefined4 *param_1)

{
  int *piVar1;
  int iVar2;
  uint *puVar3;
  int *piVar4;
  undefined4 *puVar5;
  int in_ECX;
  uint uVar6;
  uint uVar7;
  int iVar8;
  int *piVar9;
  undefined4 *puVar10;
  bool bVar11;
  undefined4 uVar12;
  undefined4 auStack_98 [4];
  int *local_88;
  uint local_84 [5];
  int local_70 [3];
  void *local_64 [3];
  uint local_58 [7];
  int *local_3c;
  int local_38;
  uint local_34;
  undefined4 *local_30;
  int *local_2c;
  uint local_28;
  int local_24;
  int *local_20;
  int *local_1c;
  int *local_18;
  int *local_14;
  int *local_10;
  int local_c;
  int *local_8;
  
  local_30 = (undefined4 *)0x0;
  local_58[4] = 0;
  local_58[5] = 0;
  local_58[6] = 0;
  local_64[0] = (void *)0x0;
  local_64[1] = (void *)0x0;
  local_64[2] = (void *)0x0;
  if (*(int *)(in_ECX + 0xc) == 0) {
    return 1;
  }
  local_c = FUN_1009935c(param_1);
  if (-1 < local_c) {
    local_c = FUN_100ba1bc(*(undefined4 *)(in_ECX + 0x7c),*(undefined4 *)(in_ECX + 0x38),0x200,
                           0x42080,99);
    if (-1 < local_c) {
      local_28 = 0;
      local_1c = (int *)0x0;
      local_58[0] = 0xffffffff;
      local_58[1] = 0xffffffff;
      local_58[2] = 0xffffffff;
      local_58[3] = 0xffffffff;
      local_84[0] = 0;
      local_84[1] = 0;
      local_84[2] = 0;
      local_84[3] = 0;
      if (*(int **)(in_ECX + 8) != (int *)0x0) {
        piVar9 = *(int **)(in_ECX + 0x14);
        local_14 = *(int **)(in_ECX + 8);
        do {
          iVar8 = *piVar9;
          iVar2 = *(int *)(iVar8 + 4);
          if ((*(int *)(in_ECX + 0x78) == iVar2) &&
             (uVar6 = *(int *)(iVar8 + 0xc) + 1, local_28 < uVar6)) {
            local_28 = uVar6;
          }
          else if ((*(int *)(in_ECX + 0x88) == iVar2) &&
                  (piVar4 = (int *)(*(int *)(iVar8 + 0xc) + 1), local_1c < piVar4)) {
            local_1c = piVar4;
          }
          if (*(int *)(in_ECX + 0x84) == iVar2) {
            if (local_84[0] < *(uint *)(iVar8 + 0xc)) {
              local_84[0] = *(uint *)(iVar8 + 0xc);
            }
            if ((*(int *)(in_ECX + 0x84) == iVar2) && (*(uint *)(iVar8 + 0xc) < local_58[0])) {
              local_58[0] = *(uint *)(iVar8 + 0xc);
            }
          }
          if (*(int *)(in_ECX + 0xb4) == iVar2) {
            if (local_84[1] < *(uint *)(iVar8 + 0xc)) {
              local_84[1] = *(uint *)(iVar8 + 0xc);
            }
            if ((*(int *)(in_ECX + 0xb4) == iVar2) && (*(uint *)(iVar8 + 0xc) < local_58[1])) {
              local_58[1] = *(uint *)(iVar8 + 0xc);
            }
          }
          if (*(int *)(in_ECX + 0xb8) == iVar2) {
            if (local_84[2] < *(uint *)(iVar8 + 0xc)) {
              local_84[2] = *(uint *)(iVar8 + 0xc);
            }
            if ((*(int *)(in_ECX + 0xb8) == iVar2) && (*(uint *)(iVar8 + 0xc) < local_58[2])) {
              local_58[2] = *(uint *)(iVar8 + 0xc);
            }
          }
          piVar9 = piVar9 + 1;
          local_14 = (int *)((int)local_14 + -1);
        } while (local_14 != (int *)0x0);
      }
      local_20 = (int *)0x0;
      local_70[0] = *(int *)(in_ECX + 0x84);
      local_70[1] = *(int *)(in_ECX + 0xb4);
      local_70[2] = *(undefined4 *)(in_ECX + 0xb8);
      do {
        if (*(int *)((int)local_58 + (int)local_20) != -1) {
          uVar6 = (*(int *)((int)local_84 + (int)local_20) - *(int *)((int)local_58 + (int)local_20)
                  ) + 1;
          local_8 = operator_new(uVar6);
          if (local_8 == (int *)0x0) goto LAB_100b8ce8;
          piVar9 = local_8;
          for (uVar7 = uVar6 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
            *piVar9 = 0;
            piVar9 = piVar9 + 1;
          }
          for (uVar7 = uVar6 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
            *(undefined1 *)piVar9 = 0;
            piVar9 = (int *)((int)piVar9 + 1);
          }
          uVar7 = 0;
          if (*(int *)(in_ECX + 8) != 0) {
            iVar8 = *(int *)((int)local_70 + (int)local_20);
            do {
              iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4);
              if (iVar8 == *(int *)(iVar2 + 4)) {
                *(undefined1 *)
                 ((*(int *)(iVar2 + 0xc) - *(int *)((int)local_58 + (int)local_20)) + (int)local_8)
                     = 1;
              }
              uVar7 = uVar7 + 1;
            } while (uVar7 < *(uint *)(in_ECX + 8));
          }
          uVar7 = 0;
          local_10 = (int *)0x0;
          if (uVar6 != 0) {
            do {
              if (uVar7 < uVar6) goto LAB_100b8ba3;
              do {
                local_10 = (int *)((int)local_10 + 1);
                for (; (uVar7 < uVar6 && (*(char *)(uVar7 + (int)local_8) != '\0'));
                    uVar7 = uVar7 + 1) {
                }
                uVar7 = uVar7 + 1;
                if (uVar6 <= uVar7) goto LAB_100b8bc3;
LAB_100b8ba3:
              } while (*(char *)(uVar7 + (int)local_8) != '\0');
              uVar7 = uVar7 + 1;
            } while( true );
          }
LAB_100b8bc3:
          piVar4 = operator_new((int)local_10 << 3);
          piVar9 = local_20;
          *(int **)((int)local_64 + (int)local_20) = piVar4;
          if (piVar4 == (int *)0x0) {
            _free(local_8);
            goto LAB_100b8ce8;
          }
          uVar7 = 0;
          if (uVar6 != 0) {
            do {
              if (uVar7 < uVar6) goto LAB_100b8be7;
              do {
                *piVar4 = *(int *)((int)local_58 + (int)piVar9) + uVar7;
                for (; (uVar7 < uVar6 && (*(char *)(uVar7 + (int)local_8) != '\0'));
                    uVar7 = uVar7 + 1) {
                }
                piVar4[1] = (*(int *)((int)local_58 + (int)piVar9) - *piVar4) + uVar7;
                piVar4 = piVar4 + 2;
                uVar7 = uVar7 + 1;
                if (uVar6 <= uVar7) goto LAB_100b8c23;
LAB_100b8be7:
              } while (*(char *)(uVar7 + (int)local_8) != '\0');
              uVar7 = uVar7 + 1;
            } while( true );
          }
LAB_100b8c23:
          _free(local_8);
          *(int **)((int)(local_58 + 4) + (int)piVar9) = local_10;
        }
        uVar6 = local_28;
        local_20 = local_20 + 1;
      } while (local_20 < (int *)0xc);
      local_30 = operator_new(local_28 << 5);
      if (local_30 == (undefined4 *)0x0) {
LAB_100b8ce8:
        local_c = -0x7ff8fff2;
      }
      else if (local_1c < (int *)0x41) {
        puVar10 = local_30;
        for (iVar8 = (uVar6 & 0x7ffffff) << 3; iVar8 != 0; iVar8 = iVar8 + -1) {
          *puVar10 = 0;
          puVar10 = puVar10 + 1;
        }
        for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
          *(undefined1 *)puVar10 = 0;
          puVar10 = (undefined4 *)((int)puVar10 + 1);
        }
        uVar6 = 0;
        if (*(int *)(in_ECX + 8) != 0) {
          do {
            iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
            if ((*(int *)(in_ECX + 0x78) == *(int *)(iVar8 + 4)) && (*(int *)(iVar8 + 8) == -1)) {
              *(undefined8 *)(local_30 + (*(int *)(iVar8 + 0x10) + *(int *)(iVar8 + 0xc) * 4) * 2) =
                   *(undefined8 *)(iVar8 + 0x20);
            }
            if (*(int *)(in_ECX + 200) == 0x54580100) {
              if (*(int *)(in_ECX + 0x80) == *(int *)(iVar8 + 4)) {
                if (*(uint *)(iVar8 + 0xc) < 2) {
                  uVar7 = *(uint *)(iVar8 + 0x6c) & 0xff;
                  if (uVar7 == 2) {
                    *(undefined4 *)(iVar8 + 0xc) = 0;
                  }
                  else if (uVar7 == 3) {
                    *(undefined4 *)(iVar8 + 0xc) = 1;
                  }
                  goto LAB_100b8d00;
                }
              }
              else {
LAB_100b8d00:
                if ((*(int *)(in_ECX + 0x84) != *(int *)(iVar8 + 4)) || (*(int *)(iVar8 + 0xc) == 0)
                   ) goto LAB_100b8d11;
              }
              FUN_1008b0b5();
              goto LAB_100b9635;
            }
LAB_100b8d11:
            uVar6 = uVar6 + 1;
          } while (uVar6 < *(uint *)(in_ECX + 8));
        }
        local_3c = *(int **)(in_ECX + 0xc);
        local_1c = (int *)0x0;
        if (*(int **)(in_ECX + 0xc) != (int *)0x0) {
          do {
            puVar3 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4);
            local_24 = 0;
            puVar3[10] = 0;
            local_34 = *puVar3 & 0xfff00000;
            piVar9 = (int *)(*puVar3 & 0xfffff);
            if (piVar9 == (int *)0x0) {
LAB_100b8fe5:
              FUN_10086292();
            }
            else {
              local_10 = (int *)0x0;
              local_20 = (int *)(puVar3[1] / (uint)piVar9);
              piVar4 = (int *)puVar3[4];
              local_84[4] = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x10);
              if ((int *)(puVar3[1] / (uint)piVar9) != (int *)0x0) {
                local_8 = (int *)puVar3[2];
                do {
                  piVar1 = local_70 + (int)local_10;
                  local_10 = (int *)((int)local_10 + 1);
                  *piVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_8 * 4) + 0x10);
                  local_8 = local_8 + (int)piVar9;
                } while (local_10 < local_20);
              }
              if ((piVar9 == (int *)puVar3[3]) && ((int *)0x1 < piVar9)) {
                local_10 = (int *)(local_84[4] + 1);
                local_14 = (int *)((int)piVar9 + -1);
                do {
                  piVar4 = piVar4 + 1;
                  if (*(int **)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x10) == local_10)
                  {
                    local_84[4] = local_84[4] + 1;
                    local_10 = (int *)((int)local_10 + 1);
                  }
                  else {
                    local_24 = 1;
                  }
                  local_14 = (int *)((int)local_14 + -1);
                } while (local_14 != (int *)0x0);
              }
              if ((local_20 == (int *)0x2) && (local_24 == 0)) {
                local_8 = (int *)(local_70[1] + 1);
                local_c = 1;
                if ((int *)0x1 < piVar9) {
                  piVar4 = (int *)puVar3[2];
                  local_38 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x10);
                  local_88 = piVar4 + 1;
                  local_2c = piVar4 + (int)piVar9 + 1;
                  local_18 = (int *)((int)piVar9 + -1);
                  local_14 = local_2c;
                  local_10 = local_88;
                  do {
                    if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_10 * 4) + 0x10) !=
                        local_38) {
                      local_c = 0;
                    }
                    if (*(int **)(*(int *)(*(int *)(in_ECX + 0x14) + *local_14 * 4) + 0x10) ==
                        local_8) {
                      local_8 = (int *)((int)local_8 + 1);
                    }
                    else {
                      local_c = 0;
                    }
                    local_10 = local_10 + 1;
                    local_14 = local_14 + 1;
                    local_18 = (int *)((int)local_18 + -1);
                  } while (local_18 != (int *)0x0);
                  local_18 = (int *)0x0;
                  if (local_c == 0) {
                    local_8 = (int *)(local_70[0] + 1);
                    local_38 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + piVar4[(int)piVar9] * 4)
                                       + 0x10);
                    local_18 = (int *)((int)piVar9 + -1);
                    local_c = 1;
                    local_14 = local_2c;
                    local_10 = local_88;
                    do {
                      if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_14 * 4) + 0x10) !=
                          local_38) {
                        local_c = 0;
                      }
                      if (*(int **)(*(int *)(*(int *)(in_ECX + 0x14) + *local_10 * 4) + 0x10) ==
                          local_8) {
                        local_8 = (int *)((int)local_8 + 1);
                      }
                      else {
                        local_c = 0;
                      }
                      local_14 = local_14 + 1;
                      local_10 = local_10 + 1;
                      local_18 = (int *)((int)local_18 + -1);
                    } while (local_18 != (int *)0x0);
                    if (local_c == 0) goto LAB_100b8f69;
                    local_10 = (int *)0x0;
                    if (piVar9 != (int *)0x0) {
                      local_18 = (int *)((int)piVar9 << 2);
                      do {
                        piVar4 = (int *)((int)local_10 + 1);
                        puVar10 = (undefined4 *)(puVar3[2] + (int)local_10 * 4);
                        local_2c = (int *)*puVar10;
                        *puVar10 = *(undefined4 *)((int)local_18 + puVar3[2]);
                        *(int **)((int)local_18 + puVar3[2]) = local_2c;
                        local_18 = local_18 + 1;
                        local_10 = piVar4;
                      } while (piVar4 < piVar9);
                    }
                  }
                }
                puVar3[10] = 1;
                goto LAB_100b8fe5;
              }
LAB_100b8f69:
              local_8 = (int *)0x1;
              if ((int *)0x1 < piVar9) {
                do {
                  local_10 = (int *)0x0;
                  if (local_20 != (int *)0x0) {
                    local_14 = (int *)(puVar3[2] + (int)local_8 * 4);
                    do {
                      local_2c = (int *)(local_70[(int)local_10] + 1);
                      if (*(int **)(*(int *)(*(int *)(in_ECX + 0x14) + *local_14 * 4) + 0x10) ==
                          local_2c) {
                        local_70[(int)local_10] = (int)local_2c;
                      }
                      else {
                        local_24 = 1;
                      }
                      local_10 = (int *)((int)local_10 + 1);
                      local_14 = local_14 + (int)piVar9;
                    } while (local_10 < local_20);
                  }
                  local_8 = (int *)((int)local_8 + 1);
                } while (local_8 < piVar9);
              }
              if (local_24 == 0) goto LAB_100b8fe5;
              if (local_34 == 0x50000000) {
                *puVar3 = 0x70e00001;
                goto LAB_100b8fe5;
              }
              if (local_34 == 0x50300000) {
                local_8 = (int *)0x0;
                if (piVar9 != (int *)0x0) {
                  do {
                    if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(puVar3[4] + (int)local_8 * 4) * 4) + 0x5c) != 0) {
                      if (local_8 == (int *)0x0) {
                        uVar12 = 0x10900001;
                      }
                      else {
                        uVar12 = 0x10800001;
                      }
                      iVar8 = FUN_10086199(uVar12,1,1);
                      if (iVar8 == -1) goto LAB_100b8ce8;
                      local_18 = *(int **)(*(int *)(in_ECX + 0x18) + iVar8 * 4);
                      local_c = FUN_100853b0();
                      if (local_c < 0) goto LAB_100b9635;
                      *(undefined4 *)local_18[4] = *(undefined4 *)(puVar3[4] + (int)local_8 * 4);
                      *(undefined4 *)local_18[2] = *(undefined4 *)(puVar3[2] + (int)local_8 * 4);
                    }
                    local_8 = (int *)((int)local_8 + 1);
                  } while (local_8 < piVar9);
                }
              }
              else {
                local_10 = (int *)0x0;
                if (piVar9 != (int *)0x0) {
                  do {
                    iVar8 = FUN_10085814();
                    if (iVar8 == 0) {
                      local_8 = (int *)0x0;
                    }
                    else {
                      local_8 = (int *)FUN_10085379();
                    }
                    bVar11 = local_8 == (int *)0x0;
                    auStack_98[(int)local_10] = local_8;
                    if (bVar11) goto LAB_100b8ce8;
                    local_c = FUN_1008585f(local_34 | 1,local_20,1,0);
                    if ((local_c < 0) || (local_c = FUN_100853b0(), local_c < 0)) goto LAB_100b9635;
                    local_18 = (int *)0x0;
                    *(undefined4 *)local_8[4] = *(undefined4 *)((int)local_10 * 4 + puVar3[4]);
                    piVar4 = (int *)((int)local_10 * 4);
                    if (local_20 != (int *)0x0) {
                      do {
                        local_14 = piVar4;
                        *(undefined4 *)(local_8[2] + (int)local_18 * 4) =
                             *(undefined4 *)((int)local_14 + puVar3[2]);
                        local_14 = local_14 + (int)piVar9;
                        local_18 = (int *)((int)local_18 + 1);
                        piVar4 = local_14;
                      } while (local_18 < local_20);
                    }
                    FUN_10086292();
                    FUN_1006c418();
                    local_10 = (int *)((int)local_10 + 1);
                  } while (local_10 < piVar9);
                }
              }
            }
            *puVar3 = 0;
            local_1c = (int *)((int)local_1c + 1);
          } while (local_1c < local_3c);
        }
        FUN_10086eae();
        local_c = FUN_100c7b3a();
        uVar6 = local_58[4];
        if (-1 < local_c) {
          if (*(int *)(in_ECX + 200) == 0x46580201) {
            FUN_100c7b3a();
            local_c = FUN_100c7b3a();
            if (local_c < 0) goto LAB_100b9635;
            uVar7 = 0;
            do {
              FUN_100c7b3a();
              uVar7 = uVar7 + 1;
            } while (uVar7 < 3);
            uVar7 = 0;
            do {
              FUN_100c7b3a();
              uVar7 = uVar7 + 4;
            } while (uVar7 < 0xc);
            FUN_100c7b3a();
            uVar7 = 0;
            if (uVar6 != 0) {
              do {
                FUN_100c7b3a();
                FUN_100c7b3a();
                uVar7 = uVar7 + 1;
              } while (uVar7 < uVar6);
            }
            FUN_100c7b3a();
            uVar6 = 0;
            if (local_58[5] != 0) {
              do {
                FUN_100c7b3a();
                FUN_100c7b3a();
                uVar6 = uVar6 + 1;
              } while (uVar6 < local_58[5]);
            }
            FUN_100c7b3a();
            uVar6 = 0;
            if (local_58[6] != 0) {
              do {
                FUN_100c7b3a();
                FUN_100c7b3a();
                uVar6 = uVar6 + 1;
              } while (uVar6 < local_58[6]);
            }
          }
          local_c = FUN_100c7c92();
          if (((-1 < local_c) && (local_c = FUN_100c7b3a(), -1 < local_c)) &&
             (local_c = FUN_100c7b3a(), -1 < local_c)) {
            uVar6 = local_28 << 2;
            local_c = FUN_100c7b3a();
            if (-1 < local_c) {
              uVar7 = 0;
              if (uVar6 != 0) {
                do {
                  local_c = FUN_100b872e(*(undefined8 *)(local_30 + uVar7 * 2));
                  if (local_c < 0) goto LAB_100b9635;
                  uVar7 = uVar7 + 1;
                } while (uVar7 < uVar6);
              }
              local_24 = *(int *)(in_ECX + 0x110);
              local_c = FUN_100c7b3a();
              if (((-1 < local_c) && (local_c = FUN_100c7b3a(), -1 < local_c)) &&
                 (local_c = FUN_100c7b3a(), -1 < local_c)) {
                local_28 = 0;
                if (*(int *)(in_ECX + 0xc) != 0) {
                  local_8 = (int *)0x0;
                  do {
                    local_c = FUN_100c7b3a();
                    if (local_c < 0) goto LAB_100b9635;
                    puVar3 = *(uint **)((int)local_8 + *(int *)(in_ECX + 0x18));
                    uVar6 = *puVar3 & 0xfffff;
                    local_18 = (int *)(puVar3[1] / uVar6);
                    local_c = FUN_100c7b3a();
                    if (local_c < 0) goto LAB_100b9635;
                    local_1c = (int *)0x0;
                    piVar9 = (int *)(*(int *)(in_ECX + 0x10c) + local_24 * 4);
                    *piVar9 = *piVar9 + 2;
                    if (local_18 != (int *)0x0) {
                      local_14 = (int *)0x0;
                      local_3c = (int *)(uVar6 << 2);
                      do {
                        iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                                        *(int *)((int)local_14 +
                                                *(int *)(*(int *)(*(int *)(in_ECX + 0x18) +
                                                                 (int)local_8) + 8)) * 4);
                        iVar2 = *(int *)(in_ECX + 0x110);
                        local_c = FUN_100c7b3a();
                        if ((((local_c < 0) ||
                             ((iVar8 = *(int *)(iVar8 + 8), iVar8 != -1 &&
                              (local_c = FUN_100b895e(iVar8,iVar2), local_c < 0)))) ||
                            (local_c = FUN_100b866d(), local_c < 0)) ||
                           (local_c = FUN_100c7b3a(), local_c < 0)) goto LAB_100b9635;
                        piVar9 = (int *)(*(int *)(in_ECX + 0x10c) + local_24 * 4);
                        *piVar9 = *piVar9 + *(int *)(*(int *)(in_ECX + 0x10c) + iVar2 * 4) * 2 + 3;
                        local_1c = (int *)((int)local_1c + 1);
                        local_14 = (int *)((int)local_14 + (int)local_3c);
                      } while (local_1c < local_18);
                    }
                    local_1c = (int *)0x0;
                    do {
                      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                                      *(int *)((int)local_1c +
                                              *(int *)(*(int *)(*(int *)(in_ECX + 0x18) +
                                                               (int)local_8) + 0x10)) * 4);
                      iVar2 = *(int *)(in_ECX + 0x110);
                      local_c = FUN_100c7b3a();
                      if ((local_c < 0) ||
                         ((((iVar8 = *(int *)(iVar8 + 8), iVar8 != -1 &&
                            (local_c = FUN_100b895e(iVar8,iVar2), local_c < 0)) ||
                           (local_c = FUN_100b866d(), local_c < 0)) ||
                          (local_c = FUN_100c7b3a(), local_c < 0)))) goto LAB_100b9635;
                      local_1c = local_1c + 1;
                      piVar9 = (int *)(*(int *)(in_ECX + 0x10c) + local_24 * 4);
                      *piVar9 = *piVar9 + *(int *)(*(int *)(in_ECX + 0x10c) + iVar2 * 4) * 2 + 3;
                    } while (local_1c < (int *)0x4);
                    local_28 = local_28 + 1;
                    local_8 = local_8 + 1;
                  } while (local_28 < *(uint *)(in_ECX + 0xc));
                }
                local_c = FUN_100c7b3a();
                if ((-1 < local_c) && (local_c = FUN_100c7b3a(), -1 < local_c)) {
                  puVar3 = (uint *)(*(int *)(in_ECX + 0x10c) + local_24 * 4);
                  *puVar3 = (*puVar3 + 4 & 0x7fff) << 0x10 | 0xfffe;
                  local_c = FUN_100c7b3a();
                  if (-1 < local_c) {
                    if (param_1 != (undefined4 *)0x0) {
                      local_c = FUN_10081d1e(*(int *)(in_ECX + 0x110) << 2,&local_18);
                      if (local_c < 0) goto LAB_100b9635;
                      uVar6 = *(uint *)(in_ECX + 0x110);
                      puVar10 = *(undefined4 **)(in_ECX + 0x10c);
                      puVar5 = (undefined4 *)(**(code **)(*local_18 + 0xc))();
                      for (uVar6 = uVar6 & 0x3fffffff; uVar6 != 0; uVar6 = uVar6 - 1) {
                        *puVar5 = *puVar10;
                        puVar10 = puVar10 + 1;
                        puVar5 = puVar5 + 1;
                      }
                      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
                        *(undefined1 *)puVar5 = *(undefined1 *)puVar10;
                        puVar10 = (undefined4 *)((int)puVar10 + 1);
                        puVar5 = (undefined4 *)((int)puVar5 + 1);
                      }
                      *param_1 = local_18;
                    }
                    local_c = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LAB_100b9635:
  _free(local_30);
  _free(local_64[0]);
  _free(local_64[1]);
  _free(local_64[2]);
  return local_c;
}


