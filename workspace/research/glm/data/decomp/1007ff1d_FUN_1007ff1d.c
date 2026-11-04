// 1007ff1d size=1288 FUN_1007ff1d

int FUN_1007ff1d(int param_1,undefined4 param_2,uint *param_3,uint param_4,int param_5)

{
  short sVar1;
  ushort uVar2;
  uint *puVar3;
  short *psVar4;
  uint *puVar5;
  uint *puVar6;
  uint uVar7;
  int iVar8;
  uint *puVar9;
  uint *puVar10;
  uint uVar11;
  uint uVar12;
  int iVar13;
  uint *puVar14;
  ushort uVar15;
  uint *puVar16;
  uint uVar17;
  int local_18;
  undefined *local_10;
  uint *local_c;
  
  puVar3 = *(uint **)(param_1 + 0x20);
  psVar4 = *(short **)(param_1 + 0x18);
  sVar1 = *psVar4;
  local_c = param_3;
  puVar16 = puVar3;
  if (sVar1 == 0) {
    param_4 = param_4 << 4;
    if ((ushort)psVar4[4] < param_4) {
      param_4 = (uint)(ushort)psVar4[4];
    }
    uVar11 = 0;
    puVar9 = puVar3;
    if (param_4 != 0) {
      do {
        *puVar9 = param_3[(uVar11 >> 2 & 3) + ((uVar11 & 3) + (uVar11 >> 2 & 0xfffffffc)) * 4];
        puVar9 = puVar9 + 1;
        uVar11 = uVar11 + 1;
      } while (uVar11 < param_4);
    }
  }
  else if (sVar1 == 1) {
    param_4 = param_4 << 2;
    if ((ushort)psVar4[4] < param_4) {
      param_4 = (uint)(ushort)psVar4[4];
    }
    uVar11 = 0;
    if (param_4 != 0) {
      uVar17 = (uint)(ushort)psVar4[3];
      puVar9 = puVar3;
      do {
        uVar12 = 0;
        if (uVar17 != 0) {
          do {
            if (uVar12 < 5) {
              uVar17 = param_3[(uVar11 & 3) + (uVar12 + (uVar11 & 0xfffffffc)) * 4];
            }
            else {
              uVar17 = 0;
            }
            *puVar9 = uVar17;
            uVar17 = (uint)(ushort)psVar4[3];
            puVar9 = puVar9 + 1;
            uVar12 = uVar12 + 1;
          } while (uVar12 < uVar17);
        }
        uVar11 = uVar11 + 1;
      } while (uVar11 < param_4);
    }
  }
  else if (sVar1 == 2) {
    if ((ushort)psVar4[4] < param_4) {
      param_4 = (uint)(ushort)psVar4[4];
    }
    uVar15 = psVar4[2];
    if ((uVar15 == 4) && (psVar4[3] == 4)) {
      if (param_4 != 0) {
        puVar9 = puVar3 + 2;
        puVar10 = param_3 + 8;
        uVar11 = param_4;
        do {
          puVar9[-2] = puVar10[-8];
          puVar9[-1] = puVar10[-4];
          *puVar9 = *puVar10;
          puVar9[1] = puVar10[4];
          puVar9[2] = puVar10[-7];
          puVar9[3] = puVar10[-3];
          puVar9[4] = puVar10[1];
          puVar9[5] = puVar10[5];
          *(uint *)(((int)puVar3 - (int)param_3) + (int)puVar10) = puVar10[-6];
          puVar9[7] = puVar10[-2];
          puVar9[8] = puVar10[2];
          puVar9[9] = puVar10[6];
          puVar9[10] = puVar10[-5];
          puVar9[0xb] = puVar10[-1];
          puVar9[0xc] = puVar10[3];
          puVar9[0xd] = puVar10[7];
          puVar10 = puVar10 + 0x10;
          puVar9 = puVar9 + 0x10;
          uVar11 = uVar11 - 1;
        } while (uVar11 != 0);
      }
    }
    else {
      local_c = (uint *)0x0;
      puVar9 = puVar3;
      if (param_4 != 0) {
        do {
          uVar11 = 0;
          if (uVar15 != 0) {
            uVar17 = (uint)(ushort)psVar4[3];
            do {
              uVar12 = 0;
              if (uVar17 != 0) {
                do {
                  if ((uVar11 < 5) && (uVar12 < 5)) {
                    uVar17 = param_3[uVar11 + (uVar12 + (int)local_c * 4) * 4];
                  }
                  else {
                    uVar17 = 0;
                  }
                  *puVar9 = uVar17;
                  uVar17 = (uint)(ushort)psVar4[3];
                  puVar9 = puVar9 + 1;
                  uVar12 = uVar12 + 1;
                } while (uVar12 < uVar17);
              }
              uVar15 = psVar4[2];
              uVar11 = uVar11 + 1;
            } while (uVar11 < uVar15);
          }
          local_c = (uint *)((int)local_c + 1);
        } while (local_c < param_4);
      }
    }
  }
  else {
    if (sVar1 != 3) {
      if (sVar1 != 5) {
        return -0x7fffbfff;
      }
      param_4 = (param_4 << 4) / *(uint *)(param_1 + 0x34);
      if ((ushort)psVar4[4] < param_4) {
        param_4 = (uint)(ushort)psVar4[4];
      }
      uVar11 = *(uint *)(param_1 + 0x34) * param_4;
      uVar17 = 0;
      if (uVar11 != 0) {
        do {
          *puVar16 = param_3[(uVar17 >> 2 & 3) + ((uVar17 & 3) + (uVar17 >> 2 & 0xfffffffc)) * 4];
          puVar16 = puVar16 + 1;
          uVar17 = uVar17 + 1;
        } while (uVar17 < uVar11);
      }
      param_3 = (uint *)0x0;
      local_c = puVar3;
      if (param_4 == 0) {
        return 0;
      }
      do {
        uVar11 = 0;
        if (psVar4[5] != 0) {
          do {
            iVar13 = *(int *)(*(int *)(param_1 + 0x38) + uVar11 * 4);
            iVar8 = FUN_1007ef30(param_1,param_2,local_c,*(undefined4 *)(iVar13 + 0x30),param_5);
            if (iVar8 < 0) {
              return iVar8;
            }
            local_c = local_c + *(int *)(iVar13 + 0x30);
            param_5 = param_5 + *(int *)(iVar13 + 0x28);
            uVar11 = uVar11 + 1;
          } while (uVar11 < (ushort)psVar4[5]);
        }
        param_3 = (uint *)((int)param_3 + 1);
      } while (param_3 < param_4);
      return 0;
    }
    if ((ushort)psVar4[4] < param_4) {
      param_4 = (uint)(ushort)psVar4[4];
    }
    uVar15 = psVar4[2];
    if (((uVar15 != 4) || (puVar16 = local_c, psVar4[3] != 4)) &&
       (uVar11 = 0, puVar9 = puVar3, puVar16 = puVar3, param_4 != 0)) {
      do {
        local_c = (uint *)0x0;
        if (psVar4[3] != 0) {
          uVar17 = (uint)uVar15;
          do {
            uVar12 = 0;
            if (uVar17 != 0) {
              do {
                if ((uVar12 < 5) && (local_c < 5)) {
                  uVar17 = param_3[uVar12 + ((int)local_c + uVar11 * 4) * 4];
                }
                else {
                  uVar17 = 0;
                }
                *puVar9 = uVar17;
                uVar15 = psVar4[2];
                puVar9 = puVar9 + 1;
                uVar17 = (uint)uVar15;
                uVar12 = uVar12 + 1;
              } while (uVar12 < uVar17);
            }
            local_c = (uint *)((int)local_c + 1);
          } while (local_c < (uint)(ushort)psVar4[3]);
        }
        uVar11 = uVar11 + 1;
      } while (uVar11 < param_4);
    }
  }
  local_c = puVar16;
  sVar1 = psVar4[1];
  puVar16 = local_c;
  if (sVar1 != 3) {
    iVar13 = *(int *)(param_1 + 0x34) * param_4;
    puVar16 = puVar3;
    if (sVar1 == 1) {
      if (iVar13 != 0) {
        puVar9 = puVar3;
        do {
          *puVar9 = (uint)(*(float *)((int)puVar9 + ((int)local_c - (int)puVar3)) != 0.0);
          puVar9 = puVar9 + 1;
          iVar13 = iVar13 + -1;
        } while (iVar13 != 0);
      }
    }
    else if ((sVar1 == 2) && (iVar13 != 0)) {
      puVar9 = puVar3;
      do {
        *puVar9 = (int)ROUND(*(float *)(((int)local_c - (int)puVar3) + (int)puVar9));
        puVar9 = puVar9 + 1;
        iVar13 = iVar13 + -1;
      } while (iVar13 != 0);
    }
  }
  local_c = puVar16;
  puVar16 = local_c;
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar4 == 3) {
      uVar15 = psVar4[2];
      uVar2 = psVar4[3];
    }
    else {
      uVar15 = psVar4[3];
      uVar2 = psVar4[2];
    }
    uVar11 = (uint)uVar15;
    if ((uVar15 & 3) != 0) {
      local_10 = &DAT_1010fecc;
      if (*(short *)(param_1 + 8) != 1) {
        local_10 = &DAT_1010febc;
      }
      local_18 = uVar2 * param_4;
      uVar17 = uVar11 + 3 & 0xfffffffc;
      puVar16 = puVar3;
      if (local_18 != 0) {
        iVar13 = local_18 * 4 + 4;
        puVar10 = (uint *)(iVar13 * uVar11 + (int)local_c);
        local_c = (uint *)(iVar13 * uVar17 + (int)puVar3);
        puVar9 = puVar3 + local_18 * uVar17 + uVar11;
        do {
          local_c = local_c + -uVar17;
          puVar9 = puVar9 + -uVar17;
          puVar10 = puVar10 + -uVar11;
          uVar12 = uVar17;
          puVar14 = local_c;
          while (puVar5 = puVar9, puVar6 = puVar10, uVar7 = uVar11, uVar11 < uVar12) {
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
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar11 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar11 <= param_4 && param_4 - uVar11 != 0) {
    param_4 = uVar11;
  }
  iVar13 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,puVar16,puVar3,param_4);
  if (-1 < iVar13) {
    return 0;
  }
  return iVar13;
}


