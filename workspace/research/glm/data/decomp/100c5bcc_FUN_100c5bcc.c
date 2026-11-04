// 100c5bcc size=1367 FUN_100c5bcc

undefined4
FUN_100c5bcc(int *param_1,int *param_2,int *param_3,uint param_4,uint param_5,uint param_6)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 uVar3;
  uint *puVar4;
  uint *puVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  uint uVar9;
  int in_ECX;
  uint uVar10;
  uint uVar11;
  bool bVar12;
  undefined4 auStack_a8 [4];
  undefined4 auStack_98 [4];
  undefined4 auStack_88 [4];
  uint auStack_78 [4];
  undefined4 auStack_68 [4];
  int local_58 [4];
  int local_48 [4];
  int local_38 [4];
  int local_28;
  int local_24;
  uint local_20;
  int *local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  int *local_c;
  int *local_8;
  
  if (param_5 == 0) {
    param_5 = *(int *)(in_ECX + 0x100);
  }
  iVar6 = param_5;
  piVar8 = *(int **)(param_5 + 0x10);
  iVar7 = *(int *)(in_ECX + 0x14);
  if (*(int *)(in_ECX + 0x88) == *(int *)(*(int *)(iVar7 + *piVar8 * 4) + 4)) {
    uVar10 = **(uint **)(in_ECX + 0x100);
    uVar9 = (*(uint **)(in_ECX + 0x100))[3];
    local_10 = 0;
    if ((uVar10 & 0xfffff) == uVar9) {
      local_8 = (int *)0x0;
      if (uVar9 != 0) {
        local_14 = (int)param_3 - (int)piVar8;
        local_c = piVar8;
        do {
          iVar7 = *(int *)(iVar7 + *(int *)(((int)param_3 - (int)piVar8) + (int)local_c) * 4);
          local_24 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4);
          if (((*(int *)(in_ECX + 0x6c) << 0xe < 0) && ((*(byte *)(iVar7 + 0x3d) & 2) != 0)) &&
             (param_1 == (int *)0x80000)) {
            local_10 = 1;
          }
          if (((*(uint *)(iVar7 + 0x3c) & 0x1f0000) != 0) &&
             ((~(uint)param_2 & *(uint *)(iVar7 + 0x3c) & 0x1f0000) != 0)) {
            if (param_1 != (int *)0x80000) {
              return 1;
            }
            local_10 = 1;
          }
          iVar7 = *(int *)(in_ECX + 0x14);
          if ((*(byte *)(*(int *)(iVar7 + *local_c * 4) + 0x3d) & 0xfe) != 0) {
            return 1;
          }
          if (((*(byte *)(in_ECX + 0x6c) & 0x10) != 0) && ((*(byte *)(local_24 + 5) & 2) != 0)) {
            if ((uVar10 & 0xfff00000) != 0x10100000) {
              return 1;
            }
            local_10 = 1;
          }
          local_8 = (int *)((int)local_8 + 1);
          local_c = local_c + 1;
        } while (local_8 < *(uint *)(*(int *)(in_ECX + 0x100) + 0xc));
      }
      param_1 = (int *)0x0;
      if (*(int *)(param_5 + 0xc) != 0) {
        local_18 = (int)param_3 - (int)local_38;
        do {
          bVar12 = local_10 == 0;
          iVar7 = *(int *)(*(int *)(in_ECX + 0x14) +
                          *(int *)((int)param_1 * 4 + *(int *)(param_5 + 0x10)) * 4);
          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) +
                          *(int *)((int)(local_38 + (int)param_1) + local_18) * 4);
          local_38[(int)param_1] = *(int *)(iVar7 + 8);
          uVar3 = *(undefined4 *)(iVar7 + 0x48);
          local_58[(int)param_1] = *(int *)(iVar7 + 0xc);
          local_48[(int)param_1] = *(int *)(iVar7 + 0x10);
          auStack_98[(int)param_1] = *(undefined4 *)(iVar7 + 0x14);
          auStack_68[(int)param_1] = *(undefined4 *)(iVar7 + 0x18);
          uVar10 = *(uint *)(iVar7 + 0x3c);
          auStack_88[(int)param_1] = uVar3;
          uVar3 = *(undefined4 *)(iVar7 + 0x68);
          auStack_78[(int)param_1] = uVar10;
          auStack_a8[(int)param_1] = uVar3;
          if (bVar12) {
            *(undefined4 *)(iVar7 + 4) = *(undefined4 *)(iVar2 + 4);
            *(undefined4 *)(iVar7 + 8) = *(undefined4 *)(iVar2 + 8);
            *(undefined4 *)(iVar7 + 0xc) = *(undefined4 *)(iVar2 + 0xc);
            *(undefined4 *)(iVar7 + 0x10) = *(undefined4 *)(iVar2 + 0x10);
            *(undefined4 *)(iVar7 + 0x14) = *(undefined4 *)(iVar2 + 0x14);
            *(undefined4 *)(iVar7 + 0x18) = *(undefined4 *)(iVar2 + 0x18);
            *(undefined4 *)(iVar7 + 0x48) = *(undefined4 *)(iVar2 + 0x48);
            *(undefined4 *)(iVar7 + 0x68) = *(undefined4 *)(iVar2 + 0x68);
            uVar10 = *(uint *)(iVar2 + 0x3c) ^ param_4 | *(uint *)(iVar2 + 0x3c) & ~param_4 | uVar10
            ;
          }
          else {
            uVar10 = uVar10 ^ param_4 | ~param_4 & uVar10;
          }
          param_1 = (int *)((int)param_1 + 1);
          *(uint *)(iVar7 + 0x3c) = uVar10;
        } while (param_1 < *(uint *)(param_5 + 0xc));
      }
      uVar10 = *(uint *)(param_5 + 0xc);
      param_2 = (int *)0x0;
      local_18 = uVar10;
      if (uVar10 != 0) {
        param_1 = *(int **)(param_5 + 0x10);
        do {
          iVar7 = FUN_100c1978(*param_1);
          if (iVar7 == 1) goto LAB_100c6023;
          param_2 = (int *)((int)param_2 + 1);
          param_1 = param_1 + 1;
        } while (param_2 < uVar10);
      }
      local_8 = (int *)0xffffffff;
      param_2 = (int *)0x0;
      param_1 = (int *)0xffffffff;
      if (uVar10 != 0) {
        local_28 = (int)local_38 - (int)param_3;
        local_20 = (int)local_58 - (int)param_3;
        local_24 = *(int *)(param_5 + 0x10) - (int)param_3;
        local_1c = (int *)((int)local_48 - (int)param_3);
        local_14 = local_18;
        piVar8 = param_3;
        do {
          local_c = *(int **)(*(int *)(in_ECX + 0x14) + *(int *)(local_24 + (int)piVar8) * 4);
          iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar8 * 4);
          if (*(int **)((int)local_c + 0x54) < local_8) {
            local_8 = *(int **)((int)local_c + 0x54);
          }
          if (param_2 < *(int **)((int)local_c + 0x58)) {
            param_2 = *(int **)((int)local_c + 0x58);
          }
          if ((((*(int *)(in_ECX + 0x88) == *(int *)(iVar7 + 4)) &&
               (*(int *)(((int)local_38 - (int)param_3) + (int)piVar8) == *(int *)(iVar7 + 8))) &&
              (*(int *)(((int)local_58 - (int)param_3) + (int)piVar8) == *(int *)(iVar7 + 0xc))) &&
             (*(int *)(((int)local_48 - (int)param_3) + (int)piVar8) == *(int *)(iVar7 + 0x10))) {
            iVar7 = (int)local_c;
          }
          if (*(int **)(iVar7 + 0x50) < param_1) {
            param_1 = *(int **)(iVar7 + 0x50);
          }
          piVar8 = piVar8 + 1;
          local_14 = local_14 - 1;
        } while (local_14 != 0);
      }
      if (((param_6 != 0) || (param_2 <= param_1)) || ((*(uint *)(in_ECX + 0x6c) & 0x10000000) != 0)
         ) {
        if (local_10 != 0) {
          **(uint **)(in_ECX + 0x100) = **(uint **)(in_ECX + 0x100) & 0xfffff | 0x10000000;
          return 0;
        }
        local_c = local_8;
        if (local_8 <= param_2) {
          local_8 = (int *)(*(int *)(in_ECX + 0x18) + (int)local_8 * 4);
          do {
            puVar4 = (uint *)*local_8;
            local_10 = *puVar4;
            if (local_10 != 0) {
              uVar10 = puVar4[2];
              local_14 = 0;
              local_20 = uVar10 + puVar4[1] * 4;
              uVar9 = local_10 & 0xfffff;
              if (uVar10 < local_20) {
                do {
                  param_1 = (int *)0x0;
                  param_5 = 0;
                  if (uVar9 != 0) {
                    do {
                      param_6 = 0;
                      if (*(int *)(iVar6 + 0xc) != 0) {
                        piVar8 = *(int **)(iVar6 + 0x10);
                        do {
                          if (*piVar8 == *(int *)(uVar10 + param_5 * 4)) {
                            param_1 = (int *)((int)param_1 + 1);
                            break;
                          }
                          param_6 = param_6 + 1;
                          piVar8 = piVar8 + 1;
                          local_1c = piVar8;
                        } while (param_6 < *(uint *)(iVar6 + 0xc));
                      }
                      param_5 = param_5 + 1;
                    } while (param_5 < uVar9);
                    if (param_1 != (int *)0x0) {
                      if (((param_1 != (int *)uVar9) ||
                          (uVar11 = local_10 & 0xfff00000, uVar11 == 0x70500000)) ||
                         ((uVar11 == 0x70600000 || (uVar11 == 0x70700000)))) goto LAB_100c6023;
                      local_14 = 1;
                    }
                  }
                  uVar10 = uVar10 + uVar9 * 4;
                } while (uVar10 < local_20);
                if (((local_14 != 0) &&
                    (((((local_10 & 0xf0000000) == 0x60000000 ||
                       (uVar10 = local_10 & 0xfff00000, uVar10 == 0x10d00000)) ||
                      (uVar10 == 0x10e00000)) || (uVar10 == 0x11000000)))) &&
                   ((*(byte *)(in_ECX + 0x6e) & 0x80) == 0)) goto LAB_100c6023;
              }
            }
            local_c = (int *)((int)local_c + 1);
            local_8 = local_8 + 1;
          } while (local_c <= param_2);
        }
        if (*(int *)(in_ECX + 0x15c) == 0) {
          param_5 = 0;
          if (*(int *)(iVar6 + 0xc) != 0) {
            do {
              puVar4 = *(uint **)(*(int *)(in_ECX + 0x14) +
                                 *(int *)(param_5 * 4 + *(int *)(iVar6 + 0x10)) * 4);
              puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) + param_3[param_5] * 4);
              if (puVar5[0xe] == 0xffffffff) {
                puVar4[0xe] = param_3[param_5];
              }
              else {
                puVar4[0xe] = puVar5[0xe];
              }
              uVar10 = *puVar5;
              *puVar4 = uVar10;
              if (param_4 == 0x80000) {
                if ((uVar10 & 4) != 0) {
                  *puVar4 = uVar10 & 0xfffffffb | 8;
                  goto LAB_100c60e0;
                }
              }
              else {
LAB_100c60e0:
                if (param_4 == 0x100000) {
                  *puVar4 = *puVar4 | 4;
                }
              }
              FUN_10085d21(puVar5);
              param_5 = param_5 + 1;
            } while (param_5 < *(uint *)(iVar6 + 0xc));
          }
          **(undefined4 **)(in_ECX + 0x100) = 0;
          return 0;
        }
        *(int *)(in_ECX + 0x15c) = 2;
      }
LAB_100c6023:
      uVar10 = 0;
      if (*(int *)(iVar6 + 0xc) != 0) {
        do {
          iVar7 = *(int *)(*(int *)(in_ECX + 0x14) +
                          *(int *)(uVar10 * 4 + *(int *)(iVar6 + 0x10)) * 4);
          *(undefined4 *)(iVar7 + 4) = *(undefined4 *)(in_ECX + 0x88);
          *(int *)(iVar7 + 8) = local_38[uVar10];
          *(int *)(iVar7 + 0xc) = local_58[uVar10];
          *(int *)(iVar7 + 0x10) = local_48[uVar10];
          *(undefined4 *)(iVar7 + 0x14) = auStack_98[uVar10];
          *(undefined4 *)(iVar7 + 0x18) = auStack_68[uVar10];
          *(uint *)(iVar7 + 0x3c) = auStack_78[uVar10];
          puVar1 = auStack_88 + uVar10;
          uVar3 = auStack_a8[uVar10];
          uVar10 = uVar10 + 1;
          *(undefined4 *)(iVar7 + 0x48) = *puVar1;
          *(undefined4 *)(iVar7 + 0x68) = uVar3;
        } while (uVar10 < *(uint *)(iVar6 + 0xc));
      }
    }
  }
  return 1;
}


