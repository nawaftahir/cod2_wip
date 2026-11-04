// 100984ab size=1370 FUN_100984ab

/* WARNING: Type propagation algorithm not settling */

undefined4 FUN_100984ab(void)

{
  byte *pbVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  byte bVar5;
  int in_ECX;
  int *piVar6;
  uint uVar7;
  uint uVar8;
  uint *puVar9;
  int iVar10;
  uint uVar11;
  int *piVar12;
  undefined4 *puVar13;
  uint local_68 [3];
  uint auStack_5c [9];
  int *local_38;
  int local_34;
  int *local_30;
  int local_2c;
  uint local_28;
  int local_24;
  uint local_20;
  int *local_1c;
  uint *local_18;
  uint local_14;
  int local_10;
  uint local_c;
  undefined4 *local_8;
  
  uVar8 = 0;
  local_20 = 0;
  if (*(int *)(in_ECX + 4) != 0) {
    piVar6 = *(int **)(in_ECX + 0x10);
    iVar10 = *(int *)(in_ECX + 4);
    do {
      uVar11 = *(uint *)(*piVar6 + 4);
      if (((uVar11 & 0x100) != 0) && ((uVar11 & 0xc00) != 0)) {
        uVar8 = uVar8 + *(int *)(*piVar6 + 8);
      }
      piVar6 = piVar6 + 1;
      iVar10 = iVar10 + -1;
      local_20 = uVar8;
    } while (iVar10 != 0);
  }
  uVar8 = local_20 + *(int *)(in_ECX + 0xc) * 2;
  local_8 = operator_new(uVar8 * 0x10);
  if (local_8 == (undefined4 *)0x0) {
    uVar3 = 0x8007000e;
  }
  else {
    puVar13 = local_8;
    for (iVar10 = (uVar8 & 0xfffffff) << 2; iVar10 != 0; iVar10 = iVar10 + -1) {
      *puVar13 = 0xffffffff;
      puVar13 = puVar13 + 1;
    }
    for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
      *(undefined1 *)puVar13 = 0xff;
      puVar13 = (undefined4 *)((int)puVar13 + 1);
    }
    local_34 = 0;
    FUN_1008af0b();
    local_14 = 0;
    if (*(int *)(in_ECX + 4) != 0) {
      do {
        local_1c = *(int **)(*(int *)(*(int *)(in_ECX + 0x10) + local_14 * 4) + 4);
        if ((((uint)local_1c & 0x100) != 0) && (((uint)local_1c & 0xc00) != 0)) {
          local_c = 0;
          if (local_20 != 0) {
            uVar8 = *(uint *)(in_ECX + 8);
            do {
              uVar11 = 0;
              if (uVar8 != 0) {
                do {
                  iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar11 * 4);
                  if ((((*(uint *)(iVar10 + 4) == local_14) && (*(int *)(iVar10 + 8) == -1)) &&
                      (local_8[*(int *)(iVar10 + 0x10) + (*(int *)(iVar10 + 0xc) + local_c) * 4] !=
                       -1)) && ((((uint)local_1c & 0x800) != 0 ||
                                (*(double *)(iVar10 + 0x20) !=
                                 *(double *)
                                  (*(int *)(*(int *)(in_ECX + 0x14) +
                                           local_8[*(int *)(iVar10 + 0x10) +
                                                   (*(int *)(iVar10 + 0xc) + local_c) * 4] * 4) +
                                  0x20))))) break;
                  uVar11 = uVar11 + 1;
                } while (uVar11 < *(uint *)(in_ECX + 8));
              }
              uVar8 = *(uint *)(in_ECX + 8);
            } while ((uVar11 != uVar8) && (local_c = local_c + 1, local_c < local_20));
          }
          if (((uint)local_1c & 0x800) == 0) {
            uVar8 = 0;
            if (*(int *)(in_ECX + 8) != 0) {
              do {
                iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
                if (*(uint *)(iVar10 + 4) == local_14) {
                  *(int *)(iVar10 + 0xc) = *(int *)(iVar10 + 0xc) + local_c;
                  if (*(int *)(iVar10 + 8) == -1) {
                    puVar9 = local_8 + *(int *)(iVar10 + 0x10) + *(int *)(iVar10 + 0xc) * 4;
                    if (*puVar9 == 0xffffffff) {
                      *puVar9 = uVar8;
                    }
                    else {
                      *(undefined4 *)(iVar10 + 4) = *(undefined4 *)(in_ECX + 0x74);
                      *(uint *)(iVar10 + 0x30) = *puVar9;
                      local_34 = 1;
                    }
                  }
                }
                uVar8 = uVar8 + 1;
              } while (uVar8 < *(uint *)(in_ECX + 8));
            }
          }
          else {
            uVar8 = 0;
            if (*(int *)(in_ECX + 8) != 0) {
              do {
                iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
                if (*(uint *)(iVar10 + 4) == local_14) {
                  local_8[*(int *)(iVar10 + 0x10) + (*(int *)(iVar10 + 0xc) + local_c) * 4] = uVar8;
                }
                uVar8 = uVar8 + 1;
              } while (uVar8 < *(uint *)(in_ECX + 8));
            }
          }
        }
        local_14 = local_14 + 1;
      } while (local_14 < *(uint *)(in_ECX + 4));
      if (local_34 != 0) {
        FUN_1008af24();
      }
    }
    uVar8 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
        uVar11 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 4);
        if (((uVar11 & 0x100) != 0) && ((uVar11 & 0xc00) == 0)) {
          *(undefined4 *)(iVar10 + 0xc) = 0xffffffff;
          *(undefined4 *)(iVar10 + 4) = *(undefined4 *)(in_ECX + 0x78);
        }
        uVar8 = uVar8 + 1;
      } while (uVar8 < *(uint *)(in_ECX + 8));
    }
    local_20 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        local_10 = *(int *)(*(int *)(in_ECX + 0x18) + local_20 * 4);
        if ((*(ushort *)(local_10 + 2) & 0xfff0) != 0) {
          auStack_5c[5] = 0xffffffff;
          auStack_5c[6] = 0xffffffff;
          auStack_5c[7] = 0xffffffff;
          auStack_5c[8] = 0xffffffff;
          auStack_5c[1] = 0;
          auStack_5c[2] = 0;
          auStack_5c[3] = 0;
          auStack_5c[4] = 0;
          local_c = 0;
          local_2c = 0;
          local_24 = 0;
          uVar8 = FUN_100853cf(0,&local_1c);
          local_28 = uVar8;
          if (uVar8 == 0) {
LAB_100987ff:
            iVar10 = FUN_10089aa8(local_8,auStack_5c + 5,auStack_5c + 1);
            if (-1 < iVar10) {
              iVar10 = 0;
              iVar4 = FUN_100853cf(0,&local_38);
              while (iVar4 != 0) {
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *local_38 * 4);
                if ((*(int *)(in_ECX + 0x78) == *(int *)(iVar2 + 4)) && (*(int *)(iVar2 + 8) == -1))
                {
                  FUN_100899b7(auStack_5c + 5,local_38,iVar4);
                }
                iVar10 = iVar10 + 1;
                iVar4 = FUN_100853cf(iVar10,&local_38);
              }
              goto LAB_1009891a;
            }
          }
          else {
            puVar9 = local_68;
            local_18 = puVar9;
            do {
              iVar10 = *(int *)(in_ECX + 0x14);
              iVar4 = *(int *)(iVar10 + *local_1c * 4);
              local_28 = uVar8;
              if ((*(int *)(in_ECX + 0x78) == *(int *)(iVar4 + 4)) && (*(int *)(iVar4 + 8) == -1)) {
                *puVar9 = (~*(uint *)(in_ECX + 0x6c) & 4) >> 2;
                uVar11 = 1;
                if (1 < uVar8) {
                  do {
                    if (*puVar9 == 0) break;
                    if (*(double *)(iVar4 + 0x20) !=
                        *(double *)(*(int *)(iVar10 + local_1c[uVar11] * 4) + 0x20)) {
                      *puVar9 = 0;
                    }
                    uVar11 = uVar11 + 1;
                    uVar8 = local_28;
                  } while (uVar11 < local_28);
                }
                local_14 = 0;
                if (uVar8 != 0) {
                  do {
                    uVar8 = local_c;
                    uVar11 = 0;
                    if (local_c != 0) {
                      do {
                        if (*(double *)(*(int *)(iVar10 + auStack_5c[uVar11 + 5] * 4) + 0x20) ==
                            *(double *)(*(int *)(iVar10 + local_1c[local_14] * 4) + 0x20)) break;
                        uVar11 = uVar11 + 1;
                      } while (uVar11 < local_c);
                      if (uVar11 == 4) {
                        local_2c = 1;
                        puVar9 = local_18;
                        break;
                      }
                    }
                    if (uVar11 == local_c) {
                      local_c = local_c + 1;
                      auStack_5c[uVar8 + 5] = local_1c[local_14];
                    }
                    if (*local_18 == 0) {
                      auStack_5c[uVar11 + 1] = auStack_5c[uVar11 + 1] | 1 << ((byte)local_14 & 0x1f)
                      ;
                    }
                    local_14 = local_14 + 1;
                    puVar9 = local_18;
                  } while (local_14 < local_28);
                }
                if (local_2c != 0) goto LAB_10098869;
              }
              local_24 = local_24 + 1;
              puVar9 = puVar9 + 1;
              local_18 = puVar9;
              uVar8 = FUN_100853cf(local_24,&local_1c);
              local_28 = uVar8;
            } while (uVar8 != 0);
            if (local_2c == 0) goto LAB_100987ff;
          }
LAB_10098869:
          local_2c = 0;
          while (uVar8 = FUN_100853cf(local_2c,&local_30), local_14 = uVar8, uVar8 != 0) {
            iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + *local_30 * 4);
            if ((*(int *)(in_ECX + 0x78) == *(int *)(iVar10 + 4)) && (*(int *)(iVar10 + 8) == -1)) {
              uVar11 = 0;
              if (uVar8 != 0) {
                piVar6 = local_30;
                piVar12 = (int *)(auStack_5c + 5);
                for (uVar7 = uVar8; uVar7 != 0; uVar7 = uVar7 - 1) {
                  *piVar12 = *piVar6;
                  piVar6 = piVar6 + 1;
                  piVar12 = piVar12 + 1;
                }
                do {
                  bVar5 = (byte)uVar11;
                  uVar11 = uVar11 + 1;
                  auStack_5c[uVar11] = 1 << (bVar5 & 0x1f);
                } while (uVar11 < uVar8);
              }
              if (uVar8 < 4) {
                puVar13 = auStack_5c + uVar8 + 1;
                for (uVar11 = 4 - uVar8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
                  *puVar13 = 0;
                  puVar13 = puVar13 + 1;
                }
                puVar13 = auStack_5c + uVar8 + 5;
                for (uVar11 = 4 - uVar8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
                  *puVar13 = 0xffffffff;
                  puVar13 = puVar13 + 1;
                }
              }
              FUN_10089aa8(local_8,auStack_5c + 5,auStack_5c + 1);
              FUN_100899b7(auStack_5c + 5,local_30,local_14);
            }
            local_2c = local_2c + 1;
          }
        }
LAB_1009891a:
        local_20 = local_20 + 1;
      } while (local_20 < *(uint *)(in_ECX + 0xc));
    }
    uVar8 = 0;
    local_38 = (int *)0x0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
        if ((*(int *)(in_ECX + 0x78) == *(int *)(iVar10 + 4)) && (*(int *)(iVar10 + 0xc) == -1)) {
          *(undefined4 *)(iVar10 + 4) = *(undefined4 *)(in_ECX + 0x74);
        }
        else {
          uVar11 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 4);
          if (((uVar11 & 0x100) != 0) &&
             ((((uVar11 & 0x40) != 0 && ((uVar11 & 0x800) == 0)) &&
              (*(int *)(iVar10 + 4) = *(int *)(in_ECX + 0x78), *(int *)(iVar10 + 8) != -1)))) {
            local_38 = (int *)0x1;
          }
        }
        uVar8 = uVar8 + 1;
      } while (uVar8 < *(uint *)(in_ECX + 8));
    }
    puVar9 = (uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0x78) * 4) + 4);
    *puVar9 = *puVar9 | 0x40;
    if (local_38 != (int *)0x0) {
      pbVar1 = (byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0x78) * 4) + 5);
      *pbVar1 = *pbVar1 | 4;
    }
    *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0x78) * 4) + 8) = 0;
    uVar8 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
        if ((*(int *)(in_ECX + 0x78) == *(int *)(iVar10 + 4)) && (*(int *)(iVar10 + 8) == -1)) {
          iVar4 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0x78) * 4);
          if (*(uint *)(iVar4 + 8) <= *(uint *)(iVar10 + 0xc)) {
            *(uint *)(iVar4 + 8) = *(uint *)(iVar10 + 0xc) + 1;
          }
        }
        uVar8 = uVar8 + 1;
      } while (uVar8 < *(uint *)(in_ECX + 8));
    }
    if (local_34 != 0) {
      FUN_10094810();
    }
    *(undefined4 *)(in_ECX + 0xdc) = 1;
    _free(local_8);
    uVar3 = 0;
  }
  return uVar3;
}


