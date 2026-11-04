// 100aa38c size=1950 FUN_100aa38c

int FUN_100aa38c(int param_1,int *param_2,int param_3,uint param_4,uint param_5,int *param_6)

{
  uint *puVar1;
  int *piVar2;
  uint *puVar3;
  uint uVar4;
  int in_ECX;
  int iVar5;
  uint uVar6;
  int iVar7;
  int *piVar8;
  bool bVar9;
  uint local_4c [6];
  int aiStack_34 [4];
  int local_24 [4];
  undefined4 *local_14;
  int *local_10;
  undefined4 *local_c;
  uint local_8;
  
  local_8 = 0;
  puVar3 = local_4c;
  for (iVar5 = 6; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  if (param_4 + (int)param_6 != 0) {
    local_10 = (int *)(param_5 + param_4 * -4);
    do {
      if (local_8 < param_4) {
        puVar3 = *(uint **)(param_3 + local_8 * 4);
      }
      else {
        puVar3 = (uint *)*local_10;
      }
      if ((((puVar3 != (uint *)0x0) && (uVar6 = *puVar3 & 0xfff00000, uVar6 != 0)) &&
          (puVar3[9] != 1)) &&
         ((((((uVar6 != 0x60000000 && (uVar6 != 0x60500000)) &&
             ((uVar6 != 0x60a00000 && ((uVar6 != 0x60f00000 && (uVar6 != 0x11000000)))))) &&
            (uVar6 != 0x72c00000)) && (uVar6 != 0x72d00000)) || (param_4 <= local_8)))) {
        local_14 = (undefined4 *)puVar3[1];
        local_c = (undefined4 *)0x0;
        if (local_14 != (undefined4 *)0x0) {
          piVar8 = (int *)puVar3[2];
          do {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar8 * 4);
            if (*(int *)(iVar5 + 4) == *(int *)(in_ECX + 0x80)) {
              if (5 < *(byte *)(iVar5 + 0x6d)) break;
              if (*(char *)(iVar5 + 0x6c) == '\x03') {
                puVar3 = local_4c + *(byte *)(iVar5 + 0x6d);
                if (local_8 < param_4) {
                  uVar6 = *(int *)(iVar5 + 0x10) + 1;
                  if (*puVar3 < uVar6) {
                    *puVar3 = uVar6;
                  }
                }
                else {
                  uVar6 = *(int *)(iVar5 + 0x10) + 1;
                  if ((*puVar3 < uVar6) && (*(int *)(iVar5 + 0x3c) != 0)) {
                    *puVar3 = uVar6;
                  }
                }
              }
            }
            local_c = (undefined4 *)((int)local_c + 1);
            piVar8 = piVar8 + 1;
          } while (local_c < local_14);
        }
      }
      local_8 = local_8 + 1;
      local_10 = local_10 + 1;
    } while (local_8 < param_4 + (int)param_6);
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0x3c) != 0) {
    puVar3 = local_4c;
    local_14 = (undefined4 *)(param_1 - (int)puVar3);
    do {
      uVar6 = *puVar3;
      if (uVar6 != 0) {
        iVar5 = FUN_10085814();
        if (iVar5 == 0) {
          local_c = (undefined4 *)0x0;
        }
        else {
          local_c = (undefined4 *)FUN_10085379();
        }
        if (local_c == (undefined4 *)0x0) {
          return -0x7ff8fff2;
        }
        iVar5 = FUN_1008585f(uVar6 & 0xfffff | 0x72100000,uVar6,uVar6,0);
        if (iVar5 < 0) goto LAB_100aa687;
        uVar6 = 0;
        if (*puVar3 != 0) {
          do {
            iVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_8,uVar6,0);
            local_24[uVar6] = iVar5;
            if (iVar5 == -1) goto LAB_100aa65a;
            *(int *)(local_c[4] + uVar6 * 4) = iVar5;
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
            *(undefined4 *)(iVar5 + 0x3c) = 0;
            *(undefined4 *)(iVar5 + 0x38) = 0xffffffff;
            uVar6 = uVar6 + 1;
            uVar4 = *puVar3;
            *(uint *)(iVar5 + 0x6c) = local_8 << 8 | 3;
          } while (uVar6 < uVar4);
        }
        uVar6 = *puVar3;
        iVar5 = FUN_100a9f26(param_3,param_4,3,local_8,uVar6,local_24);
        if ((iVar5 < 0) ||
           (iVar5 = FUN_100aa07d(param_5,param_6,3,local_8,uVar6,local_24), iVar5 < 0))
        goto LAB_100aa687;
        uVar6 = 0;
        if (*puVar3 != 0) {
          do {
            iVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x80),local_8,uVar6,0);
            aiStack_34[uVar6] = iVar5;
            if (iVar5 == -1) goto LAB_100aa65a;
            iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
            *(undefined4 *)(iVar7 + 0x3c) = 0;
            *(uint *)(iVar7 + 0x6c) = local_8 << 8 | 3;
            *(int *)(local_c[2] + uVar6 * 4) = iVar5;
            uVar6 = uVar6 + 1;
          } while (uVar6 < *puVar3);
        }
        puVar1 = (uint *)((int)local_14 + (int)puVar3);
        if (*puVar1 != 0) {
          FUN_1008b0b5();
          iVar5 = -0x7fffbffb;
          goto LAB_100aa687;
        }
        iVar5 = FUN_10086026();
        if (iVar5 < 0) {
          return iVar5;
        }
        *puVar1 = (uint)local_c;
      }
      local_8 = local_8 + 1;
      puVar3 = puVar3 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0x3c));
  }
  param_5 = 1;
  do {
    local_8 = 0;
    if (param_4 != 0) {
      local_c = (undefined4 *)(param_3 + param_4 * -4);
      do {
        if (0x1ff < local_8) goto LAB_100aaa9c;
        if (local_8 < param_4) {
          puVar3 = *(uint **)(param_3 + local_8 * 4);
        }
        else {
          puVar3 = (uint *)*local_c;
        }
        if ((puVar3 != (uint *)0x0) && (puVar3[9] != 1)) {
          uVar6 = *puVar3 & 0xfff00000;
          if (((uVar6 == 0x60000000) ||
              (((uVar6 == 0x60500000 || (uVar6 == 0x60a00000)) || (uVar6 == 0x60f00000)))) ||
             (((uVar6 == 0x11000000 || (uVar6 == 0x72c00000)) || (uVar6 == 0x72d00000)))) {
            uVar4 = *puVar3 & 0xfffff;
            if (uVar6 == 0x11000000) {
              uVar4 = 0;
            }
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + ((int *)puVar3[2])[uVar4] * 4);
            iVar7 = 0;
            if (uVar4 != 0) {
              iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[2] * 4);
            }
            local_14 = *(undefined4 **)(iVar5 + 4);
            if (((local_14 == *(undefined4 **)(in_ECX + 0x80)) &&
                ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)) && (param_5 == 1)) {
              uVar6 = (uint)*(byte *)(iVar5 + 0x6d);
              if (5 < uVar6) break;
              if (iVar7 != 0) {
                if ((*(ushort *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4) &
                    0x840) == 0) {
                  *(uint *)(iVar7 + 0xc) = uVar6;
                }
                else if (uVar6 != *(uint *)(iVar7 + 0xc)) goto LAB_100aaa53;
              }
              piVar8 = (int *)(in_ECX + 0x424 + uVar6 * 4);
              if ((*piVar8 != -1) || (local_10 = (int *)(param_1 + uVar6 * 4), *local_10 != 0)) {
LAB_100aaa53:
                FUN_1008b0b5();
                return -0x7fffbffb;
              }
              if (iVar7 != 0) {
                *(undefined4 *)(in_ECX + 0x40c + uVar6 * 4) = *(undefined4 *)(iVar7 + 4);
                *piVar8 = *(int *)puVar3[2];
                iVar5 = FUN_10086139(*(undefined4 *)(iVar7 + 4),*(undefined4 *)(iVar7 + 0xc),
                                     *(undefined4 *)(iVar7 + 0x10),*(undefined8 *)(iVar7 + 0x20));
                uVar4 = 0;
                if ((*puVar3 & 0xfffff) != 0) {
                  do {
                    *(int *)(puVar3[2] + uVar4 * 4) = iVar5;
                    uVar4 = uVar4 + 1;
                  } while (uVar4 < (*puVar3 & 0xfffff));
                }
                local_14 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
                FUN_10085c65();
                local_14[3] = uVar6;
                *(undefined4 *)(iVar7 + 0x40) = 1;
                local_14[0x10] = 0;
              }
              *local_10 = (int)puVar3;
            }
            else {
              if (param_5 != 2) goto LAB_100aa9da;
              if (iVar7 == 0) {
LAB_100aa8eb:
                uVar6 = 0;
                bVar9 = *(int *)(in_ECX + 0x4c) == 0;
                if (*(int *)(in_ECX + 0x4c) != 0) {
                  param_6 = (int *)(in_ECX + 0x424);
                  do {
                    if ((*(int *)(param_1 + uVar6 * 4) == 0) &&
                       ((*param_6 == *(int *)puVar3[2] || (*param_6 == -1)))) break;
                    param_6 = param_6 + 1;
                    uVar6 = uVar6 + 1;
                  } while (uVar6 < *(uint *)(in_ECX + 0x4c));
                  bVar9 = uVar6 == *(uint *)(in_ECX + 0x4c);
                }
                if (bVar9) {
LAB_100aaa9c:
                  FUN_1008b0b5();
                  return -0x7fffbffb;
                }
                if (iVar7 != 0) {
                  if (((*(uint *)(in_ECX + 200) & 0xffff) == 0x104) ||
                     (local_14 == *(undefined4 **)(in_ECX + 0x80))) {
                    *(undefined4 *)(in_ECX + 0x40c + uVar6 * 4) = *(undefined4 *)(iVar7 + 4);
                    *(undefined4 *)(in_ECX + 0x424 + uVar6 * 4) = *(undefined4 *)puVar3[2];
                  }
                  iVar5 = FUN_10086139(*(undefined4 *)(iVar7 + 4),*(undefined4 *)(iVar7 + 0xc),
                                       *(undefined4 *)(iVar7 + 0x10),*(undefined8 *)(iVar7 + 0x20));
                  uVar4 = 0;
                  if ((*puVar3 & 0xfffff) != 0) {
                    do {
                      *(int *)(puVar3[2] + uVar4 * 4) = iVar5;
                      uVar4 = uVar4 + 1;
                    } while (uVar4 < (*puVar3 & 0xfffff));
                  }
                  local_14 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
                  FUN_10085c65();
                  local_14[3] = uVar6;
                  *(undefined4 *)(iVar7 + 0x40) = 1;
                  local_14[0x10] = 0;
                }
              }
              else {
                local_10 = *(int **)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4);
                uVar6 = *(uint *)(iVar7 + 0xc);
                if (5 < uVar6) break;
                if ((*(ushort *)(local_10 + 1) & 0x840) == 0) goto LAB_100aa8eb;
                piVar8 = (int *)(in_ECX + 0x424 + uVar6 * 4);
                iVar5 = *piVar8;
                if ((iVar5 == -1) && (*(int *)(param_1 + uVar6 * 4) == 0)) {
                  *(int *)(in_ECX + 0x40c + uVar6 * 4) = *(int *)(iVar7 + 4);
                  *piVar8 = *(int *)puVar3[2];
                }
                else {
                  if (iVar5 != *(int *)puVar3[2]) goto LAB_100aaa9c;
                  if (*(int *)(param_1 + uVar6 * 4) != 0) goto LAB_100aaa53;
                }
              }
              *(uint **)(param_1 + uVar6 * 4) = puVar3;
            }
            *(undefined4 *)(*(int *)(param_3 + local_8 * 4) + 0x24) = 1;
          }
        }
LAB_100aa9da:
        local_8 = local_8 + 1;
        local_c = local_c + 1;
      } while (local_8 < param_4);
    }
    param_5 = param_5 + 1;
    if (2 < param_5) {
      local_8 = 0;
      if (*(int *)(in_ECX + 0x3c) != 0) {
        do {
          piVar8 = (int *)(param_1 + local_8 * 4);
          if (*piVar8 == 0) {
            iVar5 = FUN_10085814();
            if (iVar5 == 0) {
              iVar5 = 0;
            }
            else {
              iVar5 = FUN_10085379();
            }
            *piVar8 = iVar5;
            if (iVar5 == 0) {
              return -0x7ff8fff2;
            }
            FUN_1008585f(0,0,0,0);
            FUN_10086026();
          }
          local_8 = local_8 + 1;
        } while (local_8 < *(uint *)(in_ECX + 0x3c));
      }
      uVar6 = 0;
      *param_2 = *(int *)(in_ECX + 0x3c);
      if (param_4 != 0) {
        do {
          piVar8 = (int *)(param_3 + uVar6 * 4);
          piVar2 = (int *)*piVar8;
          if (((piVar2 != (int *)0x0) && (piVar2[9] != 1)) && (*piVar2 != 0)) {
            *(int *)(param_1 + *param_2 * 4) = *piVar8;
            *param_2 = *param_2 + 1;
            *(undefined4 *)(*piVar8 + 0x24) = 1;
          }
          uVar6 = uVar6 + 1;
        } while (uVar6 < param_4);
      }
      return 0;
    }
  } while( true );
LAB_100aa65a:
  iVar5 = -0x7ff8fff2;
LAB_100aa687:
  FUN_1006c418();
  return iVar5;
}


