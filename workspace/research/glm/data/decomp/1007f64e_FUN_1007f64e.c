// 1007f64e size=1173 FUN_1007f64e

int FUN_1007f64e(int param_1,undefined4 param_2,uint *param_3,uint param_4,int param_5)

{
  short sVar1;
  ushort uVar2;
  short *psVar3;
  uint *puVar4;
  uint *puVar5;
  uint *puVar6;
  uint uVar7;
  uint *puVar8;
  int iVar9;
  uint *puVar10;
  uint *puVar11;
  uint uVar12;
  int iVar13;
  uint *puVar14;
  ushort uVar15;
  uint uVar16;
  uint uVar17;
  int local_18;
  undefined *local_10;
  uint *local_c;
  
  psVar3 = *(short **)(param_1 + 0x18);
  sVar1 = *psVar3;
  puVar4 = *(uint **)(param_1 + 0x20);
  local_c = param_3;
  puVar8 = local_c;
  if (sVar1 == 0) {
    param_4 = param_4 << 4;
    if ((ushort)psVar3[4] < param_4) {
      param_4 = (uint)(ushort)psVar3[4];
    }
  }
  else {
    puVar8 = puVar4;
    if (sVar1 == 1) {
      param_4 = param_4 << 2;
      if ((ushort)psVar3[4] < param_4) {
        param_4 = (uint)(ushort)psVar3[4];
      }
      puVar8 = local_c;
      if ((psVar3[3] != 4) && (uVar16 = 0, puVar8 = puVar4, param_4 != 0)) {
        uVar17 = (uint)(ushort)psVar3[3];
        puVar10 = puVar4;
        do {
          uVar12 = 0;
          if (uVar17 != 0) {
            do {
              if (uVar12 < 5) {
                uVar17 = param_3[uVar12 + ((uVar16 & 3) + (uVar16 & 0xfffffffc)) * 4];
              }
              else {
                uVar17 = 0;
              }
              *puVar10 = uVar17;
              uVar17 = (uint)(ushort)psVar3[3];
              puVar10 = puVar10 + 1;
              uVar12 = uVar12 + 1;
            } while (uVar12 < uVar17);
          }
          uVar16 = uVar16 + 1;
        } while (uVar16 < param_4);
      }
    }
    else if (sVar1 == 2) {
      if ((ushort)psVar3[4] < param_4) {
        param_4 = (uint)(ushort)psVar3[4];
      }
      uVar15 = psVar3[2];
      if (((uVar15 != 4) || (puVar8 = local_c, psVar3[3] != 4)) &&
         (local_c = (uint *)0x0, puVar10 = puVar4, puVar8 = puVar4, param_4 != 0)) {
        do {
          uVar16 = 0;
          if (uVar15 != 0) {
            uVar17 = (uint)(ushort)psVar3[3];
            do {
              uVar12 = 0;
              if (uVar17 != 0) {
                do {
                  if ((uVar16 < 5) && (uVar12 < 5)) {
                    uVar17 = param_3[uVar12 + (uVar16 + (int)local_c * 4) * 4];
                  }
                  else {
                    uVar17 = 0;
                  }
                  *puVar10 = uVar17;
                  uVar17 = (uint)(ushort)psVar3[3];
                  puVar10 = puVar10 + 1;
                  uVar12 = uVar12 + 1;
                } while (uVar12 < uVar17);
              }
              uVar15 = psVar3[2];
              uVar16 = uVar16 + 1;
            } while (uVar16 < uVar15);
          }
          local_c = (uint *)((int)local_c + 1);
        } while (local_c < param_4);
      }
    }
    else {
      if (sVar1 != 3) {
        if (sVar1 != 5) {
          return -0x7fffbfff;
        }
        param_4 = (param_4 << 4) / *(uint *)(param_1 + 0x34);
        if ((ushort)psVar3[4] < param_4) {
          param_4 = (uint)(ushort)psVar3[4];
        }
        param_3 = (uint *)0x0;
        if (param_4 == 0) {
          return 0;
        }
        do {
          uVar16 = 0;
          if (psVar3[5] != 0) {
            do {
              iVar13 = *(int *)(*(int *)(param_1 + 0x38) + uVar16 * 4);
              iVar9 = FUN_1007ef30(param_1,param_2,local_c,*(undefined4 *)(iVar13 + 0x30),param_5);
              if (iVar9 < 0) {
                return iVar9;
              }
              local_c = local_c + *(int *)(iVar13 + 0x30);
              param_5 = param_5 + *(int *)(iVar13 + 0x28);
              uVar16 = uVar16 + 1;
            } while (uVar16 < (ushort)psVar3[5]);
          }
          param_3 = (uint *)((int)param_3 + 1);
        } while (param_3 < param_4);
        return 0;
      }
      if ((ushort)psVar3[4] < param_4) {
        param_4 = (uint)(ushort)psVar3[4];
      }
      uVar15 = psVar3[2];
      if ((uVar15 == 4) && (psVar3[3] == 4)) {
        if (param_4 != 0) {
          puVar10 = puVar4 + 2;
          puVar11 = param_3 + 8;
          uVar16 = param_4;
          do {
            puVar10[-2] = puVar11[-8];
            puVar10[-1] = puVar11[-4];
            *puVar10 = *puVar11;
            puVar10[1] = puVar11[4];
            puVar10[2] = puVar11[-7];
            puVar10[3] = puVar11[-3];
            puVar10[4] = puVar11[1];
            puVar10[5] = puVar11[5];
            *(uint *)((int)puVar11 + ((int)puVar4 - (int)param_3)) = puVar11[-6];
            puVar10[7] = puVar11[-2];
            puVar10[8] = puVar11[2];
            puVar10[9] = puVar11[6];
            puVar10[10] = puVar11[-5];
            puVar10[0xb] = puVar11[-1];
            puVar10[0xc] = puVar11[3];
            puVar10[0xd] = puVar11[7];
            puVar11 = puVar11 + 0x10;
            puVar10 = puVar10 + 0x10;
            uVar16 = uVar16 - 1;
          } while (uVar16 != 0);
        }
      }
      else {
        uVar16 = 0;
        puVar10 = puVar4;
        if (param_4 != 0) {
          do {
            local_c = (uint *)0x0;
            if (psVar3[3] != 0) {
              uVar17 = (uint)uVar15;
              do {
                uVar12 = 0;
                if (uVar17 != 0) {
                  do {
                    if ((uVar12 < 5) && (local_c < 5)) {
                      uVar17 = param_3[(int)local_c + (uVar12 + uVar16 * 4) * 4];
                    }
                    else {
                      uVar17 = 0;
                    }
                    *puVar10 = uVar17;
                    uVar15 = psVar3[2];
                    puVar10 = puVar10 + 1;
                    uVar17 = (uint)uVar15;
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < uVar17);
                }
                local_c = (uint *)((int)local_c + 1);
              } while (local_c < (uint)(ushort)psVar3[3]);
            }
            uVar16 = uVar16 + 1;
          } while (uVar16 < param_4);
        }
      }
    }
  }
  local_c = puVar8;
  sVar1 = psVar3[1];
  puVar8 = local_c;
  if (sVar1 != 3) {
    iVar13 = *(int *)(param_1 + 0x34) * param_4;
    puVar8 = puVar4;
    if (sVar1 == 1) {
      if (iVar13 != 0) {
        puVar10 = puVar4;
        do {
          *puVar10 = (uint)(*(float *)((int)puVar10 + ((int)local_c - (int)puVar4)) != 0.0);
          puVar10 = puVar10 + 1;
          iVar13 = iVar13 + -1;
        } while (iVar13 != 0);
      }
    }
    else if ((sVar1 == 2) && (iVar13 != 0)) {
      puVar10 = puVar4;
      do {
        *puVar10 = (int)ROUND(*(float *)(((int)local_c - (int)puVar4) + (int)puVar10));
        puVar10 = puVar10 + 1;
        iVar13 = iVar13 + -1;
      } while (iVar13 != 0);
    }
  }
  local_c = puVar8;
  puVar8 = local_c;
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar3 == 3) {
      uVar15 = psVar3[2];
      uVar2 = psVar3[3];
    }
    else {
      uVar15 = psVar3[3];
      uVar2 = psVar3[2];
    }
    uVar16 = (uint)uVar15;
    if ((uVar15 & 3) != 0) {
      local_10 = &DAT_1010fe8c;
      if (*(short *)(param_1 + 8) != 1) {
        local_10 = &DAT_1010fe7c;
      }
      local_18 = uVar2 * param_4;
      uVar17 = uVar16 + 3 & 0xfffffffc;
      puVar8 = puVar4;
      if (local_18 != 0) {
        iVar13 = local_18 * 4 + 4;
        puVar11 = (uint *)(iVar13 * uVar16 + (int)local_c);
        local_c = (uint *)(iVar13 * uVar17 + (int)puVar4);
        puVar10 = puVar4 + local_18 * uVar17 + uVar16;
        do {
          local_c = local_c + -uVar17;
          puVar10 = puVar10 + -uVar17;
          puVar11 = puVar11 + -uVar16;
          uVar12 = uVar17;
          puVar14 = local_c;
          while (puVar5 = puVar10, puVar6 = puVar11, uVar7 = uVar16, uVar16 < uVar12) {
            uVar12 = uVar12 - 1;
            puVar14 = puVar14 + -1;
            *puVar14 = *(uint *)(local_10 + (uVar12 & 3) * 4);
          }
          for (; uVar7 != 0; uVar7 = uVar7 - 1) {
            puVar5[-1] = puVar6[-1];
            puVar5 = puVar5 + -1;
            puVar6 = puVar6 + -1;
          }
          local_18 = local_18 + -1;
        } while (local_18 != 0);
      }
    }
  }
  local_c = puVar8;
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar16 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar16 <= param_4 && param_4 - uVar16 != 0) {
    param_4 = uVar16;
  }
  iVar13 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,local_c,puVar4,param_4);
  if (-1 < iVar13) {
    return 0;
  }
  return iVar13;
}


