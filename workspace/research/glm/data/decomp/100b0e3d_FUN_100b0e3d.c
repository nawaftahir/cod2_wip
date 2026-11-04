// 100b0e3d size=2318 FUN_100b0e3d

int FUN_100b0e3d(void)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int in_ECX;
  uint uVar6;
  uint *puVar7;
  int iVar8;
  uint uVar9;
  int local_108 [32];
  int aiStack_88 [4];
  int aiStack_78 [4];
  int local_68 [9];
  int local_44;
  int local_40;
  int local_3c;
  int local_38;
  int local_34;
  uint local_30;
  int local_2c;
  uint local_28;
  int *local_24;
  uint *local_20;
  int local_1c;
  uint local_18;
  uint *local_14;
  uint local_10;
  int local_c;
  int local_8;
  
  uVar6 = 0;
  local_24 = (int *)0x0;
  local_1c = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
      *(undefined4 *)(iVar3 + 0x30) = 0;
      if (*(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88)) {
        *(undefined4 *)(iVar3 + 0xc) = 0xffffffff;
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < *(uint *)(in_ECX + 8));
  }
  for (uVar6 = *(uint *)(in_ECX + 0x4c); uVar9 = 0, uVar6 < *(uint *)(in_ECX + 0x224);
      uVar6 = uVar6 + 1) {
    piVar5 = *(int **)(*(int *)(in_ECX + 0x230) + uVar6 * 4);
    if (((piVar5 != (int *)0x0) && (*piVar5 != 0)) && (piVar5[3] != 0)) {
      do {
        iVar3 = uVar9 * 4;
        uVar9 = uVar9 + 1;
        *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(piVar5[4] + iVar3) * 4) + 0x48) =
             uVar6;
      } while (uVar9 < (uint)piVar5[3]);
    }
  }
  local_30 = *(uint *)(in_ECX + 0x224);
  local_28 = *(uint *)(in_ECX + 0x4c);
  if (local_28 < local_30) {
    do {
      local_14 = *(uint **)(*(int *)(in_ECX + 0x230) + local_28 * 4);
      if ((local_14 != (uint *)0x0) && (*local_14 != 0)) {
        iVar3 = FUN_10085814();
        if (iVar3 == 0) {
          local_1c = 0;
        }
        else {
          local_1c = FUN_10085379();
        }
        if (local_1c != 0) {
          local_18 = FUN_10085abe();
          puVar7 = local_14;
          if ((int)local_18 < 0) goto LAB_100b1735;
          if (*(uint *)(in_ECX + 0x224) < 0x200) {
            local_34 = 0;
            local_40 = 0;
            if (((*local_14 & 0xfff00000) == 0x50000000) && (local_14[3] == 1)) {
              local_20 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)local_14[4] * 4);
              if (local_20[4] != 3) goto LAB_100b10b7;
              FUN_100acb59(*(undefined4 *)(in_ECX + 0x230),local_28,local_30,(int *)local_14[4],1,
                           &local_2c,&local_3c,local_68 + 8);
              if (local_68[8] == 0) goto LAB_100b10fa;
              iVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,3,0);
              if (iVar3 == -1) goto LAB_100b170a;
              iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
              FUN_10085c65();
              uVar1 = *(undefined4 *)(in_ECX + 0x88);
              *(undefined4 *)(iVar4 + 0x3c) = 0;
              *(undefined4 *)(iVar4 + 4) = uVar1;
              *(undefined4 *)(iVar4 + 0x10) = 3;
              iVar4 = FUN_10085814();
              if (iVar4 == 0) {
                iVar4 = 0;
              }
              else {
                iVar4 = FUN_10085379();
              }
              if (iVar4 == 0) goto LAB_100b170a;
              local_18 = FUN_1008585f(0x10000001,1,1,0);
              if (((int)local_18 < 0) || (local_18 = FUN_100853b0(), (int)local_18 < 0))
              goto LAB_100b172e;
              **(undefined4 **)(iVar4 + 0x10) = *(undefined4 *)local_14[4];
              **(int **)(iVar4 + 8) = iVar3;
              **(int **)(local_1c + 0x10) = iVar3;
              *(int *)(*(int *)(in_ECX + 0x230) + *(int *)(in_ECX + 0x224) * 4) = local_1c;
              *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
              local_2c = local_1c;
              iVar3 = FUN_10086026();
              if ((iVar3 < 0) || (0x1ff < *(uint *)(in_ECX + 0x224))) goto LAB_100b170a;
              *(int *)(*(int *)(in_ECX + 0x230) + *(uint *)(in_ECX + 0x224) * 4) = iVar4;
              *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
              iVar3 = FUN_10086026();
              puVar7 = local_14;
              if (iVar3 < 0) goto LAB_100b170a;
            }
            else {
LAB_100b10b7:
              if (((*local_14 & 0xfff00000) == 0x10000000) && (iVar3 = FUN_100a7f23(), iVar3 != 0))
              {
                uVar6 = puVar7[3];
                local_34 = 1;
                if (uVar6 != 0) {
                  piVar5 = (int *)puVar7[4];
                  do {
                    if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4) + 0x3c) != 0) {
                      local_34 = 0;
                    }
                    piVar5 = piVar5 + 1;
                    uVar6 = uVar6 - 1;
                  } while (uVar6 != 0);
                  if (local_34 == 0) goto LAB_100b10fa;
                }
                FUN_1006c418();
                local_2c = 0;
              }
              else {
LAB_100b10fa:
                iVar3 = FUN_10086026();
                if (iVar3 < 0) goto LAB_100b170a;
                local_2c = local_1c;
                *(int *)(*(int *)(in_ECX + 0x230) + *(int *)(in_ECX + 0x224) * 4) = local_1c;
                *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
                puVar7 = local_14;
              }
            }
            local_1c = 0;
            iVar3 = FUN_100a7f23();
            if (iVar3 != 0) {
              local_20 = (uint *)0x0;
              local_10 = 0;
              local_68[4] = 0xffffffff;
              local_68[5] = 0xffffffff;
              local_68[6] = 0xffffffff;
              local_68[7] = 0xffffffff;
              uVar6 = 0;
              if (puVar7[3] != 0) {
                iVar3 = *(int *)(in_ECX + 0x14);
                do {
                  iVar8 = local_10 * 4;
                  iVar4 = *(int *)(iVar8 + puVar7[4]);
                  iVar2 = *(int *)(iVar3 + iVar4 * 4);
                  if (*(int *)(iVar2 + 0x30) != 0) {
                    iVar2 = *(int *)(iVar2 + 0x10);
                    local_68[iVar2 + 4] = iVar4;
                    aiStack_88[iVar2] = *(int *)(iVar8 + puVar7[2]);
                    local_20 = (uint *)0x1;
                  }
                  uVar6 = puVar7[3];
                  local_10 = local_10 + 1;
                } while (local_10 < uVar6);
              }
              uVar9 = 0;
              local_10 = 0;
              FUN_100ac9bb(*(undefined4 *)(in_ECX + 0x230),local_28,local_30,puVar7[4],uVar6,
                           local_108,&local_10);
              if (local_20 != (uint *)0x0) {
                local_68[0] = -1;
                local_68[1] = 0xffffffff;
                local_68[2] = 0xffffffff;
                local_68[3] = 0xffffffff;
                local_18 = 0;
                if (local_10 != 0) {
                  do {
                    iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_108[local_18] * 4);
                    local_c = local_108[local_18];
                    if (*(int *)(iVar3 + 0x38) != -1) {
                      local_c = *(int *)(iVar3 + 0x38);
                      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar3 + 0x38) * 4);
                    }
                    uVar6 = *(uint *)(iVar3 + 0x48);
                    if (((local_30 <= uVar6) || (uVar6 < local_28)) && (uVar6 != 0xffffffff)) {
                      local_8 = uVar6 * 4;
                      local_20 = *(uint **)(local_8 + *(int *)(in_ECX + 0x230));
                      iVar4 = FUN_100a7f23();
                      if (iVar4 != 0) {
                        if ((((*local_20 & 0xfff00000) == 0x10000000) &&
                            (*(int *)(iVar3 + 0x38) == -1)) && (uVar6 = 0, local_20[3] != 0)) {
                          piVar5 = (int *)local_20[4];
                          do {
                            if (local_c == *piVar5) {
                              aiStack_78[*(int *)(iVar3 + 0x10)] = *(int *)(local_20[2] + uVar6 * 4)
                              ;
                              local_40 = 1;
                              break;
                            }
                            piVar5 = piVar5 + 1;
                            local_24 = piVar5;
                            uVar6 = uVar6 + 1;
                          } while (uVar6 < *(uint *)(*(int *)(local_8 + *(int *)(in_ECX + 0x230)) +
                                                    0xc));
                        }
                        iVar4 = local_68[*(int *)(iVar3 + 0x10)];
                        if (iVar4 == -1) {
                          local_68[*(int *)(iVar3 + 0x10)] = local_c;
                        }
                        else if (iVar4 != local_c) goto LAB_100b16bb;
                      }
                    }
                    local_18 = local_18 + 1;
                  } while (local_18 < local_10);
                }
                uVar9 = 0;
                uVar6 = 0;
                local_10 = 0;
                do {
                  if (*(int *)((int)local_68 + uVar6) == -1) {
LAB_100b12f0:
                    if (*(int *)((int)local_68 + uVar6 + 0x10) != -1) goto LAB_100b12f6;
                  }
                  else {
                    if (*(int *)((int)local_68 + uVar6 + 0x10) != -1) {
LAB_100b16bb:
                      FUN_1008b0b5();
                      return -0x7fffbffb;
                    }
                    if (*(int *)((int)local_68 + uVar6) == -1) goto LAB_100b12f0;
LAB_100b12f6:
                    uVar9 = uVar9 + 1;
                    local_10 = uVar9;
                  }
                  uVar6 = uVar6 + 4;
                } while (uVar6 < 0x10);
                iVar3 = FUN_10085814();
                if (iVar3 == 0) {
                  local_24 = (int *)0x0;
                }
                else {
                  local_24 = (int *)FUN_10085379();
                }
                if (local_24 == (int *)0x0) {
                  return -0x7ff8fff2;
                }
                local_18 = FUN_1008585f(uVar9 & 0xfffff | 0x70100000,uVar9 * 3,uVar9,0);
                if (-1 < (int)local_18) {
                  local_18 = FUN_100853b0();
                  if (-1 < (int)local_18) {
                    local_8 = 0;
                    local_20 = (uint *)0x0;
                    local_c = local_10 << 2;
                    do {
                      iVar3 = *(int *)((int)(local_68 + 4) + (int)local_20);
                      if (iVar3 == -1) {
                        iVar3 = *(int *)((int)local_68 + (int)local_20);
                        if (iVar3 != -1) {
                          local_38 = local_8 * 4;
                          *(int *)(local_38 + local_24[4]) = iVar3;
                          if (local_40 == 0) {
                            iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
                            iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,
                                                 *(undefined4 *)(iVar2 + 0x10),0);
                            if (iVar4 == -1) goto LAB_100b170a;
                            *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c) =
                                 *(undefined4 *)(iVar2 + 0x3c);
                            iVar8 = *(int *)(iVar2 + 0x48);
                            *(undefined4 *)(iVar2 + 0x3c) = 0;
                            if ((iVar8 == -1) || (iVar8 == *(int *)(in_ECX + 0x224))) {
                              FUN_1008b0b5();
                              goto LAB_100b1727;
                            }
                            local_3c = *(int *)(*(int *)(in_ECX + 0x230) + iVar8 * 4);
                            uVar6 = 0;
                            iVar8 = local_3c;
                            if (*(int *)(local_3c + 0xc) != 0) {
                              do {
                                piVar5 = (int *)(*(int *)(iVar8 + 0x10) + uVar6 * 4);
                                if (*piVar5 == iVar3) {
                                  *piVar5 = iVar4;
                                }
                                uVar6 = uVar6 + 1;
                                iVar8 = local_3c;
                              } while (uVar6 < *(uint *)(local_3c + 0xc));
                            }
                            *(undefined4 *)(iVar2 + 0x48) = *(undefined4 *)(in_ECX + 0x224);
                          }
                          else {
                            iVar4 = *(int *)((int)aiStack_78 + (int)local_20);
                            *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x48) =
                                 *(undefined4 *)(in_ECX + 0x224);
                          }
                          *(undefined4 *)(local_38 + local_24[2]) = *(undefined4 *)(in_ECX + 0x440);
                          local_38 = iVar4;
                          *(int *)(local_24[2] + (local_8 + local_10 * 2) * 4) = iVar4;
                          goto LAB_100b150d;
                        }
                      }
                      else {
                        *(int *)(local_24[4] + local_8 * 4) = iVar3;
                        if (local_34 == 0) {
                          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
                          iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,
                                               *(undefined4 *)(iVar2 + 0x10),0);
                          if (iVar4 == -1) goto LAB_100b170a;
                          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c) =
                               *(undefined4 *)(iVar2 + 0x3c);
                          *(undefined4 *)(iVar2 + 0x3c) = 0;
                          *(undefined4 *)(iVar2 + 0x48) = *(undefined4 *)(in_ECX + 0x224);
                          uVar6 = 0;
                          if (*(int *)(local_2c + 0xc) != 0) {
                            do {
                              piVar5 = (int *)(*(int *)(local_2c + 0x10) + uVar6 * 4);
                              if (*piVar5 == iVar3) {
                                *piVar5 = iVar4;
                              }
                              uVar6 = uVar6 + 1;
                            } while (uVar6 < *(uint *)(local_2c + 0xc));
                          }
                        }
                        else {
                          iVar4 = *(int *)((int)aiStack_88 + (int)local_20);
                          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x48) =
                               *(undefined4 *)(in_ECX + 0x224);
                        }
                        *(int *)(local_c + local_24[2]) = iVar4;
                        local_44 = iVar4;
                        *(undefined4 *)(local_24[2] + local_8 * 4) = *(undefined4 *)(in_ECX + 0x444)
                        ;
LAB_100b150d:
                        local_8 = local_8 + 1;
                        local_c = local_c + 4;
                      }
                      piVar5 = local_24;
                      local_20 = local_20 + 1;
                    } while (local_20 < (uint *)0x10);
                    local_8 = 0;
                    local_14 = (uint *)0x0;
                    local_c = local_10 << 2;
                    do {
                      if (*(int *)((int)(local_68 + 4) + (int)local_14) == -1) {
                        if (*(int *)((int)local_68 + (int)local_14) != -1) {
                          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)((int)local_68 + (int)local_14) * 4);
                          iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,
                                               *(undefined4 *)(iVar3 + 0x10),0);
                          if (iVar4 != -1) {
                            iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                            *(int *)(iVar2 + 0x38) = local_44;
                            *(undefined4 *)(iVar2 + 0x3c) = *(undefined4 *)(iVar3 + 0x3c);
                            if (local_44 != -1) {
                              *(undefined4 *)(iVar2 + 4) =
                                   *(undefined4 *)
                                    (*(int *)(*(int *)(in_ECX + 0x14) + local_44 * 4) + 4);
                            }
                            *(int *)(local_c + piVar5[2]) = iVar4;
                            goto LAB_100b1602;
                          }
                          goto LAB_100b170a;
                        }
                      }
                      else {
                        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                                        *(int *)((int)(local_68 + 4) + (int)local_14) * 4);
                        iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,
                                             *(undefined4 *)(iVar3 + 0x10),0);
                        if (iVar4 == -1) goto LAB_100b170a;
                        iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                        *(int *)(iVar2 + 0x38) = local_38;
                        *(undefined4 *)(iVar2 + 0x3c) = *(undefined4 *)(iVar3 + 0x3c);
                        if (local_38 != -1) {
                          *(undefined4 *)(iVar2 + 4) =
                               *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + local_38 * 4) + 4)
                          ;
                        }
                        *(int *)(piVar5[2] + (local_8 + local_10 * 2) * 4) = iVar4;
LAB_100b1602:
                        local_8 = local_8 + 1;
                        local_c = local_c + 4;
                      }
                      local_14 = local_14 + 1;
                    } while (local_14 < (uint *)0x10);
                    if (*(uint *)(in_ECX + 0x224) < 0x200) {
                      *(int **)(*(int *)(in_ECX + 0x230) + *(uint *)(in_ECX + 0x224) * 4) = piVar5;
                      *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
                      iVar3 = FUN_10086026();
                      if (-1 < iVar3) {
                        local_24 = (int *)0x0;
                        goto LAB_100b1677;
                      }
                    }
                    goto LAB_100b170a;
                  }
                }
                goto LAB_100b1727;
              }
              if (local_10 != 0) {
                do {
                  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_108[uVar9] * 4);
                  if (*(int *)(iVar3 + 0x38) != -1) {
                    iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar3 + 0x38) * 4);
                  }
                  uVar9 = uVar9 + 1;
                  *(undefined4 *)(iVar3 + 0x30) = 1;
                } while (uVar9 < local_10);
              }
            }
LAB_100b1677:
            uVar6 = 0;
            if ((local_2c != 0) && (*(int *)(local_2c + 0xc) != 0)) {
              do {
                iVar3 = uVar6 * 4;
                uVar6 = uVar6 + 1;
                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                 *(int *)(*(int *)(local_2c + 0x10) + iVar3) * 4) + 0x48) =
                     *(int *)(in_ECX + 0x224) + -1;
              } while (uVar6 < *(uint *)(local_2c + 0xc));
            }
            goto LAB_100b16a1;
          }
        }
LAB_100b170a:
        local_18 = -0x7ff8fff2;
        goto LAB_100b1727;
      }
LAB_100b16a1:
      local_28 = local_28 + 1;
    } while (local_28 < local_30);
  }
  for (uVar6 = *(uint *)(in_ECX + 0x4c); uVar6 < local_30; uVar6 = uVar6 + 1) {
    **(undefined4 **)(*(int *)(in_ECX + 0x230) + uVar6 * 4) = 0;
  }
  local_18 = 0;
LAB_100b1727:
  if (local_24 != (int *)0x0) {
LAB_100b172e:
    FUN_1006c418();
  }
LAB_100b1735:
  if (local_1c != 0) {
    FUN_1006c418();
  }
  return local_18;
}


