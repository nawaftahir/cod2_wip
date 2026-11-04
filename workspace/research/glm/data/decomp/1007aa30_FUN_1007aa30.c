// 1007aa30 size=2741 FUN_1007aa30

int FUN_1007aa30(undefined4 param_1,uint *param_2,int *param_3,undefined4 *param_4,int param_5,
                int param_6)

{
  int *piVar1;
  char *pcVar2;
  char cVar3;
  uint uVar4;
  undefined4 uVar5;
  bool bVar6;
  void *pvVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  char *pcVar12;
  char *_Dest;
  int in_ECX;
  int iVar13;
  int *piVar14;
  undefined4 *puVar15;
  undefined4 *puVar16;
  int local_38;
  undefined4 *local_34;
  void *local_30;
  undefined4 *local_2c;
  int *local_28;
  undefined4 *local_24;
  void *local_20;
  uint local_1c;
  uint local_18;
  int *local_14;
  uint local_c;
  uint local_8;
  
  local_2c = (undefined4 *)0x0;
  local_20 = (void *)0x0;
  local_30 = (void *)0x0;
  local_24 = (undefined4 *)0x0;
  local_14 = (int *)0x0;
  local_c = 0;
  if ((param_2 == (uint *)0x0) || (*(int *)((int)param_2 + 4) != 10)) {
    return -0x7fffbffb;
  }
  if (*(int *)((int)param_2 + 0x38) != 0) {
    FUN_1006dca1();
    return -0x7fffbfff;
  }
  if ((param_5 != 0) && (local_8 = FUN_10086b14(), (int)local_8 < 0)) goto LAB_1007b212;
  if (param_3 == (int *)0x0) {
    local_28 = (int *)0x0;
    local_38 = 0;
  }
  else {
    local_28 = *(int **)((int)param_3 + 8);
    local_38 = *(int *)((int)param_3 + 0xc);
  }
  iVar10 = *(int *)((int)param_2 + 0x24);
  iVar13 = 0;
  while (iVar10 != 0) {
    piVar14 = (int *)(iVar10 + 8);
    iVar10 = *(int *)(iVar10 + 0xc);
    if (((iVar10 != 0) && (*(int *)(iVar10 + 8) != 0)) &&
       (*(int *)(*(int *)(iVar10 + 8) + 4) == 0xc)) {
      iVar10 = *(int *)(iVar10 + 0xc);
    }
    iVar13 = iVar13 + *(int *)(*(int *)(*piVar14 + 0x18) + 0x14);
  }
  local_20 = operator_new(iVar13 << 2);
  if ((local_20 == (void *)0x0) ||
     ((param_5 != 0 && (local_14 = operator_new(iVar13 << 2), local_14 == (int *)0x0)))) {
LAB_1007b4cd:
    local_8 = -0x7ff8fff2;
  }
  else {
    iVar10 = *(int *)((int)param_2 + 0x24);
    param_3 = local_28;
    pvVar7 = local_20;
    piVar14 = local_28;
    while (iVar10 != 0) {
      piVar1 = (int *)(iVar10 + 8);
      iVar10 = *(int *)(iVar10 + 0xc);
      if (((iVar10 != 0) && (*(int *)(iVar10 + 8) != 0)) &&
         (*(int *)(*(int *)(iVar10 + 8) + 4) == 0xc)) {
        iVar10 = *(int *)(iVar10 + 0xc);
      }
      iVar13 = *(int *)(*piVar1 + 0x18);
      if (((param_5 == 0) || ((param_6 != 0 && ((*(byte *)(iVar13 + 0x1c) & 0x40) != 0)))) &&
         (piVar14 != (int *)0x0)) {
        if ((*(int *)((int)piVar14 + 8) != 0) &&
           (local_8 = FUN_1007b5eb(*(int *)((int)piVar14 + 8),pvVar7,0), piVar14 = param_3,
           (int)local_8 < 0)) goto LAB_1007b212;
        piVar14 = *(int **)((int)piVar14 + 0xc);
        param_3 = piVar14;
      }
      pvVar7 = (void *)((int)pvVar7 + *(int *)(iVar13 + 0x14) * 4);
    }
    local_1c = *(int *)((int)param_2 + 0x24);
    pvVar7 = local_20;
    param_3 = local_28;
    while (local_1c != 0) {
      iVar10 = *(int *)(local_1c + 8);
      local_1c = *(int *)(local_1c + 0xc);
      local_34 = (undefined4 *)0x0;
      if (((local_1c != 0) && (iVar13 = *(int *)(local_1c + 8), iVar13 != 0)) &&
         (*(int *)(iVar13 + 4) == 0xc)) {
        local_1c = *(int *)(local_1c + 0xc);
        local_34 = (undefined4 *)iVar13;
      }
      iVar13 = *(int *)(iVar10 + 0x18);
      if ((param_5 == 0) || ((param_6 != 0 && ((*(byte *)(iVar13 + 0x1c) & 0x40) != 0)))) {
        local_8 = FUN_1007a632(iVar10,0);
        if ((int)local_8 < 0) goto LAB_1007b212;
        if (param_3 == (int *)0x0) {
          local_8 = FUN_1007a632(local_34,0);
          goto LAB_1007ae1a;
        }
        if (((*(byte *)(iVar13 + 0x1c) & 0x10) != 0) &&
           (local_8 = FUN_1006e308(*(undefined4 *)((int)param_3 + 8),
                                   *(uint *)(iVar13 + 0x14) & 0xfffff | 0x10000000,
                                   *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,pvVar7,0,0)
           , (int)local_8 < 0)) goto LAB_1007b212;
        param_3 = *(int **)((int)param_3 + 0xc);
      }
      else {
        iVar8 = *(int *)(in_ECX + 8);
        local_18 = *(int *)(iVar8 + 0x74);
        if ((*(uint *)(iVar13 + 0x1c) & 0x40) == 0) {
          if ((*(uint *)(iVar13 + 0x1c) & 0x10) != 0) {
            local_18 = *(int *)(iVar8 + 0x80);
          }
        }
        else {
          local_18 = *(int *)(iVar8 + 0x7c);
        }
        local_8 = 0;
        if (*(int *)(iVar13 + 0x14) != 0) {
          do {
            iVar8 = *(int *)(iVar13 + 0x10) + local_8;
            uVar9 = FUN_10086139(local_18,0,0,0);
            if (uVar9 < *(uint *)(*(int *)(in_ECX + 8) + 8)) {
              iVar11 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + uVar9 * 4);
            }
            else {
              iVar11 = 0;
            }
            if (iVar11 != 0) {
              *(int *)(iVar11 + 0x30) = iVar8;
              *(int *)(iVar11 + 0x60) = iVar10;
              *(uint *)(iVar11 + 100) = local_8;
            }
            local_8 = local_8 + 1;
            *(uint *)(*(int *)(in_ECX + 0x18) + iVar8 * 4) = uVar9;
          } while (local_8 < *(uint *)(iVar13 + 0x14));
        }
        if ((*(int *)(*(int *)(in_ECX + 8) + 0x74) != local_18) &&
           (local_8 = FUN_1006eb1e(*(undefined4 *)(iVar13 + 0x20),
                                   *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,
                                   *(undefined4 *)(iVar13 + 0x14)), (int)local_8 < 0))
        goto LAB_1007b212;
        if (*(int *)(*(int *)(in_ECX + 8) + 0x7c) == local_18) {
          local_8 = FUN_10070fa6(*(undefined4 *)(iVar13 + 0x20),
                                 *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,local_18,1,0,
                                 0,*(undefined4 *)(iVar13 + 0x30));
          if ((int)local_8 < 0) goto LAB_1007b212;
          local_8 = FUN_1006c6e4();
LAB_1007ae1a:
          if ((int)local_8 < 0) goto LAB_1007b212;
        }
        else if (*(int *)(*(int *)(in_ECX + 8) + 0x80) == local_18) {
          local_8 = FUN_10070fa6(*(undefined4 *)(iVar13 + 0x20),
                                 *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,local_18,0,0,
                                 *(undefined4 *)(iVar13 + 0x2c),*(undefined4 *)(iVar13 + 0x30));
          if ((int)local_8 < 0) goto LAB_1007b212;
          iVar10 = FUN_1006d594(*(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,
                                *(undefined4 *)(iVar13 + 0x14));
          if (iVar10 == 0) {
            FUN_1006dca1();
          }
          else {
            local_18 = 0;
            if (*(int *)(iVar13 + 0x14) != 0) {
              do {
                iVar10 = *(int *)(iVar13 + 0x10) + local_18;
                uVar9 = local_c + 1;
                local_18 = local_18 + 1;
                local_14[local_c] = iVar10;
                local_c = uVar9;
              } while (local_18 < *(uint *)(iVar13 + 0x14));
            }
          }
        }
      }
      pvVar7 = (void *)((int)pvVar7 + *(int *)(iVar13 + 0x14) * 4);
    }
    if (param_5 != 0) {
      uVar9 = 0;
      if (local_c != 0) {
        do {
          iVar10 = (**(code **)(**(int **)(in_ECX + 8) + 4))
                             (*(undefined4 *)
                               ((*(int **)(in_ECX + 8))[5] +
                               *(int *)(*(int *)(in_ECX + 0x18) + local_14[uVar9] * 4) * 4));
          if (iVar10 < 0) goto LAB_1007b08e;
          uVar9 = uVar9 + 1;
        } while (uVar9 < local_c);
      }
      FUN_10086920(FUN_1006dd5c,local_14,local_c,in_ECX);
      param_3 = (int *)0x0;
      if (local_c != 0) {
        iVar10 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
        local_28 = *(int **)(iVar10 + *(int *)(*(int *)(in_ECX + 0x18) + *local_14 * 4) * 4);
        local_1c = 1;
        if (1 < local_c) {
          do {
            piVar14 = *(int **)(iVar10 + *(int *)(*(int *)(in_ECX + 0x18) + local_14[local_1c] * 4)
                                         * 4);
            if (((local_28[0x1b] == piVar14[0x1b]) && (local_28[4] == piVar14[4])) &&
               (*local_28 == *piVar14)) {
              param_3 = (int *)((int)param_3 + 1);
              piVar14 = local_28;
            }
            local_28 = piVar14;
            local_1c = local_1c + 1;
          } while (local_1c < local_c);
          if (param_3 != (int *)0x0) {
            local_30 = operator_new((int)param_3 << 2);
            if ((local_30 == (void *)0x0) ||
               (local_24 = operator_new((int)param_3 << 2), local_24 == (undefined4 *)0x0))
            goto LAB_1007b4cd;
            local_1c = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                               *(int *)(*(int *)(in_ECX + 0x18) + *local_14 * 4) * 4);
            uVar9 = 0;
            param_3 = (int *)0x0;
            local_28 = (int *)0x1;
            iVar10 = *local_14;
            local_34 = local_24;
            do {
              iVar13 = local_14[(int)local_28];
              iVar8 = *(int *)(*(int *)(in_ECX + 0x18) + iVar13 * 4);
              uVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar8 * 4);
              if ((*(int *)(local_1c + 0x6c) == *(int *)(uVar4 + 0x6c)) &&
                 (*(int *)(local_1c + 0x10) == *(int *)(uVar4 + 0x10))) {
                *(int *)(((int)local_30 - (int)local_24) + (int)local_34) = iVar8;
                *local_34 = *(undefined4 *)(*(int *)(in_ECX + 0x18) + iVar10 * 4);
                uVar9 = (int)param_3 + 1;
                local_34 = local_34 + 1;
                iVar13 = iVar10;
                param_3 = (int *)uVar9;
                uVar4 = local_1c;
              }
              local_1c = uVar4;
              local_28 = (int *)((int)local_28 + 1);
              iVar10 = iVar13;
            } while (local_28 < local_c);
            local_8 = FUN_1006e308(param_2,uVar9 & 0xfffff | 0x10000000,local_30,local_24,0,0);
            if ((int)local_8 < 0) goto LAB_1007b212;
          }
        }
      }
    }
    uVar9 = *(uint *)(*(int *)(in_ECX + 4) + 0x18);
    if (param_5 != 0) {
      local_2c = operator_new(uVar9 << 2);
      if (local_2c == (undefined4 *)0x0) goto LAB_1007b4cd;
      puVar15 = *(undefined4 **)(in_ECX + 0x18);
      puVar16 = local_2c;
      for (uVar9 = uVar9 & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
        *puVar16 = *puVar15;
        puVar15 = puVar15 + 1;
        puVar16 = puVar16 + 1;
      }
      for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
        *(undefined1 *)puVar16 = *(undefined1 *)puVar15;
        puVar15 = (undefined4 *)((int)puVar15 + 1);
        puVar16 = (undefined4 *)((int)puVar16 + 1);
      }
    }
    uVar5 = *(undefined4 *)(in_ECX + 0x50);
    *(undefined4 *)(in_ECX + 0x50) = 0;
    *(undefined4 *)((int)param_2 + 0x38) = 1;
    local_8 = FUN_1007a632(*(undefined4 *)((int)param_2 + 0x28),local_2c);
    uVar9 = 0;
    if ((*(int *)(in_ECX + 0x50) == 0) && (*(int *)(in_ECX + 0x54) == 0)) {
      bVar6 = false;
    }
    else {
      bVar6 = true;
    }
    *(undefined4 *)(in_ECX + 0x50) = uVar5;
    *(undefined4 *)((int)param_2 + 0x38) = 0;
    if (-1 < (int)local_8) {
      if ((bVar6) || (*(int *)((int)param_2 + 0x14) == 0)) {
        if (param_5 == 0) {
          if (param_4 != (undefined4 *)0x0) {
            if (*(int *)(in_ECX + 0x54) == 0) {
              puVar15 = (undefined4 *)(*(int *)(in_ECX + 0x18) + *(int *)((int)param_2 + 0x10) * 4);
              for (uVar9 = *(uint *)((int)param_2 + 0x14) & 0x3fffffff; uVar9 != 0;
                  uVar9 = uVar9 - 1) {
                *param_4 = *puVar15;
                puVar15 = puVar15 + 1;
                param_4 = param_4 + 1;
              }
              for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
                *(undefined1 *)param_4 = *(undefined1 *)puVar15;
                puVar15 = (undefined4 *)((int)puVar15 + 1);
                param_4 = (undefined4 *)((int)param_4 + 1);
              }
            }
            else if (*(int *)((int)param_2 + 0x14) != 0) {
              do {
                param_4[uVar9] = *(undefined4 *)(in_ECX + 0x24);
                uVar9 = uVar9 + 1;
              } while (uVar9 < *(uint *)((int)param_2 + 0x14));
            }
          }
        }
        else if (*(int *)((int)param_2 + 0x14) != 0) {
          if ((*(int *)(in_ECX + 0x54) != 0) && (*(int *)((int)param_2 + 0x14) != 0)) {
            do {
              iVar10 = *(int *)((int)param_2 + 0x10) + uVar9;
              uVar9 = uVar9 + 1;
              *(undefined4 *)(*(int *)(in_ECX + 0x18) + iVar10 * 4) = *(undefined4 *)(in_ECX + 0x24)
              ;
            } while (uVar9 < *(uint *)((int)param_2 + 0x14));
          }
          iVar10 = *(int *)(in_ECX + 0x18) + *(int *)((int)param_2 + 0x10) * 4;
          uVar9 = 0;
          local_8 = FUN_1006e308(param_2,*(uint *)((int)param_2 + 0x14) & 0xfffff | 0x10000000,
                                 iVar10,iVar10,0,0);
          if ((((int)local_8 < 0) ||
              (local_8 = FUN_1006eb1e(*(undefined4 *)((int)param_2 + 0x20),
                                      *(int *)(in_ECX + 0x18) + *(int *)((int)param_2 + 0x10) * 4,
                                      *(undefined4 *)((int)param_2 + 0x14)), (int)local_8 < 0)) ||
             (local_8 = FUN_10070fa6(*(undefined4 *)((int)param_2 + 0x20),
                                     *(int *)(in_ECX + 0x18) + *(int *)((int)param_2 + 0x10) * 4,
                                     *(undefined4 *)(*(int *)(in_ECX + 8) + 0x84),0,1,
                                     *(undefined4 *)((int)param_2 + 0x30),0), (int)local_8 < 0))
          goto LAB_1007b212;
          iVar10 = FUN_1006d594(*(int *)(in_ECX + 0x18) + *(int *)((int)param_2 + 0x10) * 4,
                                *(undefined4 *)((int)param_2 + 0x14));
          if (iVar10 == 0) {
            FUN_1006dca1();
          }
          else if (*(int *)((int)param_2 + 0x14) != 0) {
            do {
              iVar10 = (**(code **)(**(int **)(in_ECX + 8) + 4))
                                 (*(undefined4 *)
                                   ((*(int **)(in_ECX + 8))[5] +
                                   *(int *)(*(int *)(in_ECX + 0x18) +
                                           (*(int *)((int)param_2 + 0x10) + uVar9) * 4) * 4));
              if (iVar10 < 0) {
                *(undefined4 *)(in_ECX + 0x4c) = 1;
                break;
              }
              uVar9 = uVar9 + 1;
            } while (uVar9 < *(uint *)((int)param_2 + 0x14));
          }
        }
        local_1c = *(int *)((int)param_2 + 0x24);
joined_r0x1007b20c:
        if (local_1c == 0) {
          local_8 = 0;
        }
        else {
          iVar10 = *(int *)(local_1c + 8);
          local_1c = *(int *)(local_1c + 0xc);
          if (((local_1c != 0) && (*(int *)(local_1c + 8) != 0)) &&
             (*(int *)(*(int *)(local_1c + 8) + 4) == 0xc)) {
            local_1c = *(int *)(local_1c + 0xc);
          }
          iVar13 = *(int *)(iVar10 + 0x18);
          if ((*(byte *)(iVar13 + 0x1c) & 0x20) == 0) goto LAB_1007b41b;
          if (*(int *)(in_ECX + 0x54) == 0) {
            param_4 = (undefined4 *)0x0;
            if (*(int *)(iVar13 + 0x14) != 0) {
              iVar8 = *(int *)(in_ECX + 8);
              param_2 = (uint *)(*(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4);
              do {
                if (*param_2 < *(uint *)(iVar8 + 8)) {
                  iVar11 = *(int *)(*(int *)(iVar8 + 0x14) + *param_2 * 4);
                }
                else {
                  iVar11 = 0;
                }
                if ((iVar11 != 0) && (*(int *)(iVar8 + 0x74) == *(int *)(iVar11 + 4))) {
                  FUN_1006dca1();
                  goto LAB_1007b212;
                }
                param_4 = (undefined4 *)((int)param_4 + 1);
                param_2 = param_2 + 1;
              } while (param_4 < *(uint *)(iVar13 + 0x14));
            }
          }
          else {
            param_2 = (uint *)0x0;
            if (*(int *)(iVar13 + 0x14) != 0) {
              do {
                iVar8 = *(int *)(iVar13 + 0x10) + (int)param_2;
                param_2 = (uint *)((int)param_2 + 1);
                *(undefined4 *)(*(int *)(in_ECX + 0x18) + iVar8 * 4) =
                     *(undefined4 *)(in_ECX + 0x24);
              } while (param_2 < *(uint *)(iVar13 + 0x14));
            }
          }
          if (param_5 == 0) goto LAB_1007b3ec;
          iVar8 = *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4;
          local_8 = FUN_1006e308(iVar13,*(uint *)(iVar13 + 0x14) & 0xfffff | 0x10000000,iVar8,iVar8,
                                 0,0);
          if (((-1 < (int)local_8) &&
              (local_8 = FUN_1006eb1e(*(undefined4 *)(iVar13 + 0x20),
                                      *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,
                                      *(undefined4 *)(iVar13 + 0x14)), -1 < (int)local_8)) &&
             (local_8 = FUN_10070fa6(*(undefined4 *)(iVar13 + 0x20),
                                     *(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,
                                     *(undefined4 *)(*(int *)(in_ECX + 8) + 0x84),0,1,
                                     *(undefined4 *)(iVar13 + 0x2c),0), -1 < (int)local_8)) {
            iVar8 = FUN_1006d594(*(int *)(in_ECX + 0x18) + *(int *)(iVar13 + 0x10) * 4,
                                 *(undefined4 *)(iVar13 + 0x14));
            if (iVar8 == 0) {
              FUN_1006dca1();
            }
            else {
              uVar9 = 0;
              if (*(int *)(iVar13 + 0x14) != 0) {
                do {
                  iVar8 = (**(code **)(**(int **)(in_ECX + 8) + 4))();
                  if (iVar8 < 0) {
                    *(undefined4 *)(in_ECX + 0x4c) = 1;
                    break;
                  }
                  uVar9 = uVar9 + 1;
                } while (uVar9 < *(uint *)(iVar13 + 0x14));
              }
            }
            goto LAB_1007b41b;
          }
        }
        goto LAB_1007b212;
      }
      FUN_1006dca1();
LAB_1007b08e:
      local_8 = -0x7fffbffb;
    }
  }
LAB_1007b212:
  _free(local_2c);
  _free(local_20);
  _free(local_14);
  _free(local_30);
  _free(local_24);
  return local_8;
LAB_1007b3ec:
  if (local_38 != 0) {
    if (*(int *)(local_38 + 8) != 0) {
      local_8 = FUN_1007b5eb(*(int *)(local_38 + 8),0,0);
      if ((int)local_8 < 0) goto LAB_1007b212;
LAB_1007b41b:
      if ((param_5 != 0) && ((param_6 == 0 || ((*(byte *)(iVar13 + 0x1c) & 0x40) == 0)))) {
        if (((*(byte *)(iVar13 + 0x1c) & 0x40) != 0) &&
           (pcVar12 = *(char **)(*(int *)(iVar10 + 0x14) + 0x18), *pcVar12 != '$')) {
          pcVar2 = pcVar12 + 1;
          do {
            cVar3 = *pcVar12;
            pcVar12 = pcVar12 + 1;
          } while (cVar3 != '\0');
          _Dest = (char *)FUN_100826bd(pcVar12 + (2 - (int)pcVar2),1);
          if (_Dest == (char *)0x0) goto LAB_1007b4cd;
          __snprintf(_Dest,(size_t)(pcVar12 + (2 - (int)pcVar2)),"$%s");
          *(char **)(*(int *)(iVar10 + 0x14) + 0x18) = _Dest;
        }
        goto joined_r0x1007b20c;
      }
    }
    if (local_38 != 0) {
      local_38 = *(int *)(local_38 + 0xc);
    }
  }
  goto joined_r0x1007b20c;
}


