// 10093058 size=1715 FUN_10093058

int FUN_10093058(int *param_1,uint param_2)

{
  uint *puVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  int *piVar5;
  int *piVar6;
  int iVar7;
  uint uVar8;
  int in_ECX;
  uint uVar9;
  int iVar10;
  int iVar11;
  undefined4 *puVar12;
  uint local_18;
  uint local_10;
  int local_c;
  uint local_8;
  
  piVar5 = param_1;
  *(int **)(in_ECX + 0xbc) = param_1;
  param_1[0x18] = param_1[0x18] ^ (param_2 * 2 ^ param_1[0x18]) & 2;
  FUN_1008a979();
  uVar9 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
      if (((*param_1 == *(int *)(iVar10 + 4)) && (*(int *)(iVar10 + 0x38) == -1)) &&
         (*(uint *)(iVar10 + 0x58) <= *(uint *)(iVar10 + 0x48))) {
        *(uint *)(iVar10 + 0x58) = *(uint *)(iVar10 + 0x48) + 1;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 8));
  }
  puVar12 = (undefined4 *)param_1[4];
  for (uVar9 = param_1[10] & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
    *puVar12 = 0xffffffff;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0xff;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  puVar12 = (undefined4 *)param_1[5];
  for (iVar10 = (param_1[10] & 0xfffffffU) << 2; iVar10 != 0; iVar10 = iVar10 + -1) {
    *puVar12 = 0xffffffff;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0xff;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  puVar12 = (undefined4 *)param_1[6];
  for (iVar10 = (param_1[10] & 0xfffffffU) << 2; iVar10 != 0; iVar10 = iVar10 + -1) {
    *puVar12 = 0xffffffff;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0xff;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
      *(undefined4 *)(iVar10 + 0x30) = 0xffffffff;
      if ((*param_1 == *(int *)(iVar10 + 4)) && (*(int *)(iVar10 + 0x38) == -1)) {
        *(uint *)(param_1[6] + (*(int *)(iVar10 + 0x10) + *(int *)(iVar10 + 0xc) * 4) * 4) = uVar9;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 8));
  }
  puVar12 = (undefined4 *)param_1[2];
  for (uVar9 = param_1[10] & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
    *puVar12 = 0;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  uVar9 = 0;
  if (param_1[10] != 0) {
    param_1 = (int *)0x0;
    do {
      iVar11 = 0;
      piVar6 = (int *)(piVar5[6] + (int)param_1);
      iVar10 = 4;
      do {
        if (*piVar6 != -1) {
          iVar11 = iVar11 + 1;
        }
        piVar6 = piVar6 + 1;
        iVar10 = iVar10 + -1;
      } while (iVar10 != 0);
      param_1 = (int *)((int)param_1 + 0x10);
      *(int *)(piVar5[2] + uVar9 * 4) = iVar11;
      uVar9 = uVar9 + 1;
    } while (uVar9 < (uint)piVar5[10]);
  }
  param_1 = (int *)0x0;
  puVar12 = (undefined4 *)piVar5[3];
  for (uVar9 = piVar5[10] & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
    *puVar12 = 0;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar10 = *(int *)(*(int *)(in_ECX + 0x18) + (int)param_1 * 4);
      iVar11 = FUN_1008549a();
      if ((iVar11 != 0) &&
         (iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar10 + 0x10) * 4),
         *piVar5 == *(int *)(iVar11 + 4))) {
        local_10 = 2;
        do {
          local_8 = 0;
          if (*(int *)(iVar10 + 4) != 0) {
            do {
              iVar7 = *(int *)(*(int *)(iVar10 + 8) + local_8 * 4);
              if ((iVar7 != -1) &&
                 (iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4) + 0x38),
                 iVar2 != -1)) {
                iVar7 = iVar2;
              }
              iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4);
              if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 6) & 2)
                  != 0) {
                iVar7 = *(int *)(*(int *)(in_ECX + 0x14) +
                                **(int **)(*(int *)(*(int *)(in_ECX + 0x18) +
                                                   *(int *)(iVar7 + 0x48) * 4) + 8) * 4);
              }
              if (*piVar5 == *(int *)(iVar7 + 4)) {
                puVar1 = (uint *)(piVar5[3] + *(int *)(iVar7 + 0xc) * 4);
                uVar9 = *(uint *)(piVar5[2] + *(int *)(iVar11 + 0xc) * 4);
                if (*puVar1 < uVar9) {
                  *puVar1 = uVar9;
                }
                puVar1 = (uint *)(piVar5[3] + *(int *)(iVar11 + 0xc) * 4);
                uVar9 = *(uint *)(piVar5[2] + *(int *)(iVar7 + 0xc) * 4);
                if (*puVar1 < uVar9) {
                  *puVar1 = uVar9;
                }
              }
              local_8 = local_8 + *(int *)(iVar10 + 0xc);
            } while (local_8 < *(uint *)(iVar10 + 4));
          }
          local_10 = local_10 + -1;
        } while (local_10 != 0);
      }
      param_1 = (int *)((int)param_1 + 1);
    } while (param_1 < *(uint *)(in_ECX + 0xc));
  }
  param_1 = (int *)0x0;
  puVar12 = (undefined4 *)piVar5[0x13];
  for (uVar9 = piVar5[0x12] & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
    *puVar12 = 0;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar10 = *(int *)(*(int *)(in_ECX + 0x18) + (int)param_1 * 4);
      if ((*(ushort *)(iVar10 + 2) & 0xfff0) != 0) {
        param_2 = 0;
        if (*(int *)(iVar10 + 0xc) != 0) {
          do {
            FUN_1008a646(piVar5,*(undefined4 *)(*(int *)(iVar10 + 0x10) + param_2 * 4),param_1);
            param_2 = param_2 + 1;
          } while (param_2 < *(uint *)(iVar10 + 0xc));
        }
        param_2 = 0;
        if (*(int *)(iVar10 + 4) != 0) {
          do {
            FUN_1008a4c3(piVar5,*(undefined4 *)(*(int *)(iVar10 + 8) + param_2 * 4),param_1);
            param_2 = param_2 + 1;
          } while (param_2 < *(uint *)(iVar10 + 4));
        }
        iVar11 = FUN_1008540c();
        if ((iVar11 != 0) && (param_2 = 0, *(int *)(iVar10 + 0xc) != 0)) {
          do {
            FUN_1008a4c3(piVar5,*(undefined4 *)(*(int *)(iVar10 + 0x10) + param_2 * 4),param_1);
            param_2 = param_2 + 1;
          } while (param_2 < *(uint *)(iVar10 + 0xc));
        }
      }
      param_1 = (int *)((int)param_1 + 1);
    } while (param_1 < *(uint *)(in_ECX + 0xc));
  }
  local_8 = 0;
  if (piVar5[0x12] != 0) {
    do {
      iVar10 = piVar5[0x15] + *(int *)(piVar5[0x14] + local_8 * 4) * 4;
      uVar9 = *(uint *)(piVar5[0x13] + local_8 * 4);
      if (1 < uVar9) {
        FUN_10086920(FUN_100868d1,iVar10,uVar9,in_ECX);
        param_1 = (int *)0x1;
        local_10 = 1;
        if (1 < uVar9) {
          do {
            uVar3 = *(undefined4 *)(iVar10 + local_10 * 4);
            iVar11 = FUN_10086858();
            if (iVar11 != 0) {
              *(undefined4 *)(iVar10 + (int)param_1 * 4) = uVar3;
              param_1 = (int *)((int)param_1 + 1);
            }
            local_10 = local_10 + 1;
          } while (local_10 < uVar9);
        }
        *(int **)(piVar5[0x13] + local_8 * 4) = param_1;
        FUN_10086920(FUN_10086899,iVar10,param_1,in_ECX);
      }
      local_8 = local_8 + 1;
    } while (local_8 < (uint)piVar5[0x12]);
  }
  puVar12 = (undefined4 *)piVar5[7];
  for (iVar10 = (piVar5[0xb] & 0xfffffffU) << 2; iVar10 != 0; iVar10 = iVar10 + -1) {
    *puVar12 = 0xffffffff;
    puVar12 = puVar12 + 1;
  }
  for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
    *(undefined1 *)puVar12 = 0xff;
    puVar12 = (undefined4 *)((int)puVar12 + 1);
  }
  uVar9 = 0;
  if (piVar5[0xb] != 0) {
    do {
      *(uint *)(piVar5[8] + uVar9 * 4) = uVar9;
      uVar9 = uVar9 + 1;
    } while (uVar9 < (uint)piVar5[0xb]);
  }
  piVar5[1] = 0;
  piVar5[9] = (uint)piVar5[0xb] >> 1;
  iVar10 = *(int *)(in_ECX + 0xc);
  do {
    do {
      if (iVar10 == 0) {
        local_c = 4;
        do {
          piVar5[1] = local_c;
          iVar10 = *(int *)(in_ECX + 0xc);
          while (iVar10 != 0) {
            iVar10 = iVar10 + -1;
            puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar10 * 4);
            piVar5[0x17] = (int)puVar1;
            if ((*puVar1 & 0xfff00000) != 0) {
              param_1 = (int *)0x0;
              if (puVar1[3] != 0) {
                do {
                  iVar11 = FUN_1009295e(piVar5,*(undefined4 *)(puVar1[4] + (int)param_1 * 4));
                  if (iVar11 < 0) {
                    return iVar11;
                  }
                  param_1 = (int *)((int)param_1 + 1);
                } while (param_1 < puVar1[3]);
              }
              uVar9 = *puVar1;
              uVar8 = puVar1[1] / (uVar9 & 0xfffff);
              param_2 = 0;
              if (puVar1[1] != 0) {
                do {
                  param_1 = (int *)0x0;
                  if (((*(byte *)(in_ECX + 0x70) & 1) != 0) && (uVar8 != 0)) {
                    piVar6 = (int *)puVar1[2];
                    local_18 = uVar8;
                    do {
                      iVar11 = *piVar6;
                      if ((iVar11 != -1) &&
                         (iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4) + 0x38),
                         iVar7 != -1)) {
                        iVar11 = iVar7;
                      }
                      iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4);
                      if ((*piVar5 == *(int *)(iVar11 + 4)) &&
                         (uVar4 = *(uint *)(piVar5[4] + *(int *)(iVar11 + 0xc) * 4),
                         uVar4 != 0xffffffff)) {
                        if ((uVar4 & 1) == 0) {
                          param_1 = (int *)((int)param_1 + 1);
                        }
                        else {
                          param_1 = (int *)((int)param_1 + -1);
                        }
                      }
                      piVar6 = piVar6 + (uVar9 & 0xfffff);
                      local_18 = local_18 - 1;
                    } while (local_18 != 0);
                  }
                  iVar11 = *(int *)(puVar1[2] + param_2 * 4);
                  if ((iVar11 != -1) &&
                     (iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4) + 0x38),
                     iVar7 != -1)) {
                    iVar11 = iVar7;
                  }
                  iVar11 = FUN_10092696(piVar5,iVar11,param_1,0xffffffff,0xffffffff);
                  if (iVar11 < 0) {
                    return iVar11;
                  }
                  param_2 = param_2 + 1;
                } while (param_2 < puVar1[1]);
              }
            }
          }
          local_c = local_c + -1;
          if (local_c == 0) {
            if (((*(byte *)(piVar5 + 0x18) & 2) != 0) &&
               (param_1 = (int *)0x0, *(int *)(in_ECX + 8) != 0)) {
              do {
                iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + (int)param_1 * 4);
                if (*piVar5 == *(int *)(iVar10 + 4)) {
                  iVar11 = *(int *)(iVar10 + 0xc) * 4;
                  *(undefined4 *)(iVar10 + 0x10) =
                       *(undefined4 *)(piVar5[5] + (*(int *)(iVar10 + 0x10) + iVar11) * 4);
                  *(undefined4 *)(iVar10 + 0xc) = *(undefined4 *)(iVar11 + piVar5[4]);
                }
                param_1 = (int *)((int)param_1 + 1);
              } while (param_1 < *(uint *)(in_ECX + 8));
            }
            *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + *piVar5 * 4) + 8) = 0xffffffff;
            return 0;
          }
        } while( true );
      }
      iVar10 = iVar10 + -1;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar10 * 4);
    } while (((*puVar1 & 0xfff00000) != 0x20900000) || (param_1 = (int *)0x0, puVar1[3] == 0));
    do {
      piVar5[0x17] = (int)puVar1;
      iVar11 = *(int *)(puVar1[2] + (int)param_1 * 4);
      if ((iVar11 != -1) &&
         (iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4) + 0x38), iVar7 != -1)) {
        iVar11 = iVar7;
      }
      iVar11 = FUN_10092696(piVar5,iVar11,0,0xffffffff,0xffffffff);
      if (iVar11 < 0) {
        return iVar11;
      }
      iVar11 = *(int *)(puVar1[2] + (puVar1[3] + (int)param_1) * 4);
      iVar7 = *(int *)(*(int *)(in_ECX + 0x18) +
                      *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4) + 0x48) * 4);
      param_2 = 0;
      if (*(uint *)(iVar7 + 0xc) != 0) {
        piVar6 = *(int **)(iVar7 + 0x10);
        do {
          if (*piVar6 == iVar11) break;
          param_2 = param_2 + 1;
          piVar6 = piVar6 + 1;
        } while (param_2 < *(uint *)(iVar7 + 0xc));
      }
      piVar5[0x17] = iVar7;
      iVar11 = FUN_10092696(piVar5,*(undefined4 *)(puVar1[4] + (int)param_1 * 4),0,
                            *(undefined4 *)(param_2 * 4 + *(int *)(iVar7 + 8)),0xffffffff);
      if (iVar11 < 0) {
        return iVar11;
      }
      iVar11 = FUN_10092696(piVar5,*(undefined4 *)(param_2 * 4 + *(int *)(iVar7 + 8)),0,
                            *(undefined4 *)(puVar1[4] + (int)param_1 * 4),0xffffffff);
      if (iVar11 < 0) {
        return iVar11;
      }
      param_1 = (int *)((int)param_1 + 1);
    } while (param_1 < puVar1[3]);
  } while( true );
}


