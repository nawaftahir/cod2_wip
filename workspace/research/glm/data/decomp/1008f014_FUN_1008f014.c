// 1008f014 size=1619 FUN_1008f014

int FUN_1008f014(uint *param_1,int param_2,uint param_3,int param_4,int param_5)

{
  int *piVar1;
  int *piVar2;
  uint *puVar3;
  uint *puVar4;
  int iVar5;
  uint *puVar6;
  int *piVar7;
  uint *puVar8;
  int iVar9;
  int in_ECX;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  int *piVar13;
  int *piVar14;
  undefined1 local_a4 [8];
  uint *local_9c;
  int *local_94;
  int local_30;
  int *local_2c;
  int local_28;
  int local_24;
  byte *local_20;
  int *local_1c;
  int local_18;
  int local_14;
  uint *local_10;
  int *local_c;
  uint *local_8;
  
  iVar9 = *(int *)(in_ECX + 0x14);
  piVar14 = *(int **)(*(int *)(iVar9 + param_3 * 4) + 0x30);
  piVar1 = *(int **)(*(int *)(iVar9 + param_4 * 4) + 0x30);
  local_20 = *(byte **)(iVar9 + (int)piVar14 * 4);
  local_10 = *(uint **)(iVar9 + (int)piVar1 * 4);
  piVar2 = *(int **)(*(int *)(iVar9 + param_5 * 4) + 0x30);
  puVar3 = *(uint **)(iVar9 + param_2 * 4);
  puVar8 = *(uint **)(iVar9 + (int)piVar2 * 4);
  uVar12 = *puVar3;
  uVar10 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar3[1] * 4) + 4);
  if ((uVar10 & 1) == 0) {
    return 0;
  }
  if ((uVar10 & 0x1000) != 0) {
    return 0;
  }
  if (((uVar12 & 0xe000000) != 0) || ((*param_1 & 0xfff00000) != 0x30000000)) goto LAB_1008f0ea;
  uVar10 = *puVar8 | *local_10;
  if ((uVar10 & 0x8000000) == 0) {
    if ((uVar10 & 0x4000000) != 0) {
      uVar10 = uVar12 | 0x4000000;
      goto LAB_1008f0da;
    }
    if ((uVar10 & 0x2000000) != 0) {
      uVar10 = uVar12 | 0x2000000;
      goto LAB_1008f0da;
    }
  }
  else {
    uVar10 = uVar12 | 0x8000000;
LAB_1008f0da:
    *puVar3 = uVar10;
  }
  *puVar3 = *puVar3 | *puVar8 & *local_10 & 0x1f;
LAB_1008f0ea:
  if ((((*puVar8 | *local_10) & 0x40) != 0) && ((*param_1 & 0xfff00000) == 0x30000000)) {
    *puVar3 = *puVar3 | 0x40;
  }
  if ((*param_1 & 0xfff00000) == 0x30000000) {
    *puVar3 = *puVar3 | *puVar8 & *local_10 & 0x1f;
    if ((piVar14 == piVar1) && ((*puVar8 & 4) != 0)) {
      *puVar3 = *puVar3 | 4;
    }
    if ((piVar14 == piVar2) && ((*local_10 & 8) != 0)) {
      *puVar3 = *puVar3 | 8;
    }
  }
  if ((*param_1 & 0xfff00000) != 0x30000000) {
    return 0;
  }
  piVar7 = piVar1;
  if (((uVar12 & 0x40) != 0) || ((*local_20 & 4) == 0)) {
    uVar10 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_20 + 4) * 4) + 4);
    if (((uVar10 & 0x100) == 0) || (*(int *)(local_20 + 8) != -1)) {
      if (piVar1 != piVar2) {
        uVar11 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + local_10[1] * 4) + 4) & 0x100;
        if ((((uVar11 == 0) || (local_10[2] != 0xffffffff)) ||
            ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar8[1] * 4) + 5) & 1) == 0)) ||
           ((puVar8[2] != 0xffffffff || (*(double *)(local_10 + 8) != *(double *)(puVar8 + 8))))) {
          if ((uVar12 & 0x40) != 0) {
            return 0;
          }
          if (((((*(int *)(local_20 + 8) == -1) && ((uVar10 & 2) != 0)) &&
               ((puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(local_20 + 0x48) * 4),
                (*puVar4 & 0xfff00000) == 0x10100000 &&
                (((uVar11 != 0 && (local_10[2] == 0xffffffff)) && (*(double *)(local_10 + 8) == 0.0)
                 ))))) &&
              (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar8[1] * 4) + 5) & 1) != 0 &&
               (puVar8[2] == 0xffffffff)))) && (*(double *)(puVar8 + 8) == 1.0)) {
            uVar12 = 0;
            if (puVar4[3] != 0) {
              local_8 = (uint *)puVar4[4];
              do {
                if ((int *)*local_8 == piVar14) break;
                local_8 = local_8 + 1;
                uVar12 = uVar12 + 1;
              } while (uVar12 < puVar4[3]);
            }
            uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                       *(int *)(puVar4[2] + uVar12 * 4) * 4) + 0x30);
            if ((**(byte **)(*(int *)(in_ECX + 0x14) + uVar12 * 4) & 1) != 0) {
              puVar3[0xc] = uVar12;
              return 0;
            }
          }
          if (*(int *)(local_20 + 8) != -1) {
            return 0;
          }
          local_24 = in_ECX;
          if (((((uVar10 & 2) != 0) &&
               (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(local_20 + 0x48) * 4),
               (*puVar4 & 0xfff00000) == 0x20500000)) &&
              ((uVar11 != 0 &&
               (((local_10[2] == 0xffffffff && (*(double *)(local_10 + 8) == 0.0)) &&
                ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar8[1] * 4) + 5) & 1) != 0))))))
             && ((puVar8[2] == 0xffffffff && (*(double *)(puVar8 + 8) == 1.0)))) {
            local_8 = (uint *)0x0;
            if (puVar4[3] != 0) {
              puVar6 = (uint *)puVar4[4];
              do {
                if ((int *)*puVar6 == piVar14) break;
                local_8 = (uint *)((int)local_8 + 1);
                puVar6 = puVar6 + 1;
              } while (local_8 < puVar4[3]);
            }
            uVar12 = puVar4[3];
            iVar9 = *(int *)(in_ECX + 0x14);
            local_c = (int *)0x0;
            local_30 = uVar12 * 4;
            local_1c = (int *)(puVar4[2] + (int)local_8 * 4);
            piVar13 = (int *)(puVar4[2] + (uVar12 + (int)local_8) * 4);
            do {
              local_2c = *(int **)(*(int *)(iVar9 + *local_1c * 4) + 0x30);
              local_24 = *(int *)(iVar9 + *(int *)(*(int *)(iVar9 + *piVar13 * 4) + 0x30) * 4);
              if ((((**(byte **)(iVar9 + (int)local_2c * 4) & 1) != 0) &&
                  ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_24 + 4) * 4) + 5) &
                   1) != 0)) &&
                 ((*(int *)(local_24 + 8) == -1 &&
                  (piVar7 = local_2c, *(double *)(local_24 + 0x20) < 0.0)))) goto LAB_1008f4ad;
              local_c = (int *)((int)local_c + 1);
              local_1c = local_1c + uVar12;
              piVar13 = piVar13 + -uVar12;
            } while (local_c < 2);
          }
          if (*(int *)(local_20 + 8) != -1) {
            return 0;
          }
          if ((uVar10 & 2) == 0) {
            return 0;
          }
          puVar3 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(local_20 + 0x48) * 4);
          if ((*puVar3 & 0xfff00000) != 0x20400000) {
            return 0;
          }
          local_14 = -1;
          if ((((uVar11 != 0) && (local_10[2] == 0xffffffff)) &&
              ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar8[1] * 4) + 5) & 1) != 0)) &&
             (puVar8[2] == 0xffffffff)) {
            if ((*(double *)(local_10 + 8) == 0.0) && (*(double *)(puVar8 + 8) == 1.0)) {
              local_14 = 0x20200001;
            }
            else if ((*(double *)(local_10 + 8) == 1.0) && (*(double *)(puVar8 + 8) == 0.0)) {
              local_14 = 0x20300001;
            }
          }
          uVar12 = 0;
          if (puVar3[3] != 0) {
            puVar8 = (uint *)puVar3[4];
            do {
              if ((int *)*puVar8 == piVar14) break;
              uVar12 = uVar12 + 1;
              puVar8 = puVar8 + 1;
            } while (uVar12 < puVar3[3]);
          }
          uVar10 = puVar3[3];
          param_3 = 0;
          local_28 = uVar10 * 4;
          local_1c = (int *)(puVar3[2] + uVar12 * 4);
          local_8 = (uint *)(puVar3[2] + (uVar10 + uVar12) * 4);
          do {
            iVar9 = *(int *)(in_ECX + 0x14);
            local_c = *(int **)(*(int *)(iVar9 + *local_1c * 4) + 0x30);
            iVar5 = *(int *)(*(int *)(iVar9 + *local_8 * 4) + 0x30);
            iVar9 = *(int *)(iVar9 + iVar5 * 4);
            if (((*(int *)(iVar9 + 8) == -1) &&
                ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar9 + 4) * 4) + 4) & 2) !=
                 0)) && (puVar3 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4),
                        (*puVar3 & 0xfff00000) == 0x10100000)) {
              uVar12 = 0;
              if (puVar3[3] != 0) {
                piVar14 = (int *)puVar3[4];
                do {
                  if (*piVar14 == iVar5) break;
                  uVar12 = uVar12 + 1;
                  piVar14 = piVar14 + 1;
                  local_2c = piVar14;
                } while (uVar12 < puVar3[3]);
              }
              piVar14 = *(int **)(*(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)(puVar3[2] + uVar12 * 4) * 4) + 0x30);
              local_18 = local_14;
              if (local_14 != -1) {
LAB_1008f5ee:
                FUN_10085379();
                iVar9 = FUN_1008585f(local_18,2,1,0);
                if ((-1 < iVar9) && (iVar9 = FUN_100853b0(param_1), -1 < iVar9)) {
                  *local_94 = param_2;
                  *local_9c = (uint)local_c;
                  local_9c[1] = (uint)piVar14;
                  iVar9 = FUN_1008e097(local_a4,param_2,local_c,piVar14);
                }
                FUN_100853af();
                return iVar9;
              }
              if ((piVar1 == piVar14) && (piVar2 == local_c)) {
                local_18 = 0x20000001;
                goto LAB_1008f5ee;
              }
              if ((piVar1 == local_c) && (piVar2 == piVar14)) {
                local_18 = 0x20100001;
                goto LAB_1008f5ee;
              }
            }
            local_1c = local_1c + uVar10;
            param_3 = param_3 + 1;
            local_8 = local_8 + -uVar10;
            if (1 < param_3) {
              return 0;
            }
          } while( true );
        }
      }
    }
    else if (*(double *)(local_20 + 0x20) < 0.0) {
      piVar7 = piVar2;
    }
  }
LAB_1008f4ad:
  puVar3[0xc] = (uint)piVar7;
  return 0;
}


