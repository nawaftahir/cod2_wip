// 1007ec3a size=758 FUN_1007ec3a

int FUN_1007ec3a(uint param_1,undefined4 param_2,float *param_3,uint param_4,int param_5)

{
  uint uVar1;
  short sVar2;
  ushort uVar3;
  ushort uVar4;
  short *psVar5;
  float *pfVar6;
  int iVar7;
  float *pfVar8;
  float *pfVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  int iVar13;
  float *pfVar14;
  uint uVar15;
  float *pfVar16;
  float *pfVar17;
  bool bVar18;
  bool bVar19;
  int local_18;
  undefined *local_14;
  float *local_10;
  float *local_8;
  
  iVar13 = param_1;
  psVar5 = *(short **)(param_1 + 0x18);
  pfVar6 = *(float **)(param_1 + 0x20);
  local_8 = param_3;
  sVar2 = *psVar5;
  if (sVar2 == 0) {
    uVar15 = (uint)(ushort)psVar5[4];
    bVar18 = param_4 < uVar15;
    bVar19 = param_4 == uVar15;
  }
  else {
    if (sVar2 == 1) {
      uVar15 = (uint)(ushort)psVar5[3];
    }
    else {
      if (sVar2 != 2) {
        if (sVar2 != 3) {
          if (sVar2 != 5) {
            return -0x7fffbfff;
          }
          param_4 = param_4 / *(uint *)(param_1 + 0x34);
          if ((ushort)psVar5[4] < param_4) {
            param_4 = (uint)(ushort)psVar5[4];
          }
          param_1 = 0;
          if (param_4 == 0) {
            return 0;
          }
          do {
            param_3 = (float *)0x0;
            if (psVar5[5] != 0) {
              do {
                iVar7 = *(int *)(*(int *)(iVar13 + 0x38) + (int)param_3 * 4);
                iVar11 = FUN_1007ec3a(iVar13,param_2,local_8,*(undefined4 *)(iVar7 + 0x30),param_5);
                if (iVar11 < 0) {
                  return iVar11;
                }
                local_8 = local_8 + *(int *)(iVar7 + 0x30);
                param_5 = param_5 + *(int *)(iVar7 + 0x28);
                param_3 = (float *)((int)param_3 + 1);
              } while (param_3 < (uint)(ushort)psVar5[5]);
            }
            param_1 = param_1 + 1;
          } while (param_1 < param_4);
          return 0;
        }
        uVar15 = (uint)(ushort)psVar5[2];
        param_4 = param_4 / (uVar15 * (ushort)psVar5[3]);
        if ((ushort)psVar5[4] < param_4) {
          param_4 = (uint)(ushort)psVar5[4];
        }
        local_10 = (float *)0x0;
        pfVar16 = pfVar6;
        local_8 = pfVar6;
        if (param_4 != 0) {
          do {
            local_8 = (float *)0x0;
            if (psVar5[3] != 0) {
              do {
                uVar12 = 0;
                if (uVar15 != 0) {
                  do {
                    *pfVar16 = param_3[(uVar15 * (int)local_10 + uVar12) * (uint)(ushort)psVar5[3] +
                                       (int)local_8];
                    uVar15 = (uint)(ushort)psVar5[2];
                    pfVar16 = pfVar16 + 1;
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < uVar15);
                }
                local_8 = (float *)((int)local_8 + 1);
              } while (local_8 < (uint)(ushort)psVar5[3]);
            }
            local_10 = (float *)((int)local_10 + 1);
            local_8 = pfVar6;
          } while (local_10 < param_4);
        }
        goto LAB_1007edc1;
      }
      uVar15 = (uint)(ushort)psVar5[3] * (uint)(ushort)psVar5[2];
    }
    param_4 = param_4 / uVar15;
    uVar15 = (uint)(ushort)psVar5[4];
    bVar18 = param_4 < uVar15;
    bVar19 = param_4 == uVar15;
  }
  if (!bVar18 && !bVar19) {
    param_4 = uVar15;
  }
LAB_1007edc1:
  sVar2 = psVar5[1];
  pfVar16 = local_8;
  if (sVar2 != 2) {
    iVar13 = *(int *)(param_1 + 0x34) * param_4;
    pfVar16 = pfVar6;
    if (sVar2 == 1) {
      if (iVar13 != 0) {
        pfVar14 = pfVar6;
        do {
          *pfVar14 = (float)(uint)(*(int *)((int)pfVar14 + ((int)local_8 - (int)pfVar6)) != 0);
          pfVar14 = pfVar14 + 1;
          iVar13 = iVar13 + -1;
        } while (iVar13 != 0);
      }
    }
    else if (((sVar2 != 2) && (sVar2 == 3)) && (iVar13 != 0)) {
      pfVar14 = pfVar6;
      do {
        *pfVar14 = (float)*(int *)(((int)local_8 - (int)pfVar6) + (int)pfVar14);
        pfVar14 = pfVar14 + 1;
        iVar13 = iVar13 + -1;
      } while (iVar13 != 0);
    }
  }
  local_8 = pfVar16;
  pfVar16 = local_8;
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar5 == 3) {
      uVar3 = psVar5[2];
      uVar4 = psVar5[3];
    }
    else {
      uVar3 = psVar5[3];
      uVar4 = psVar5[2];
    }
    uVar15 = (uint)uVar3;
    if ((uVar3 & 3) != 0) {
      local_14 = &DAT_1010fe2c;
      if (*(short *)(param_1 + 8) != 1) {
        local_14 = &DAT_1010fe1c;
      }
      local_18 = uVar4 * param_4;
      uVar12 = uVar15 + 3 & 0xfffffffc;
      pfVar16 = pfVar6;
      if (local_18 != 0) {
        iVar13 = local_18 * 4 + 4;
        local_8 = (float *)(iVar13 * uVar15 + (int)local_8);
        local_10 = (float *)(iVar13 * uVar12 + (int)pfVar6);
        pfVar14 = pfVar6 + local_18 * uVar12 + uVar15;
        do {
          local_10 = local_10 + -uVar12;
          pfVar14 = pfVar14 + -uVar12;
          local_8 = local_8 + -uVar15;
          uVar1 = uVar12;
          pfVar17 = local_10;
          while (pfVar8 = pfVar14, pfVar9 = local_8, uVar10 = uVar15, uVar15 < uVar1) {
            uVar1 = uVar1 - 1;
            pfVar17 = pfVar17 + -1;
            *pfVar17 = *(float *)(local_14 + (uVar1 & 3) * 4);
          }
          for (; uVar10 != 0; uVar10 = uVar10 - 1) {
            pfVar8[-1] = pfVar9[-1];
            pfVar8 = pfVar8 + -1;
            pfVar9 = pfVar9 + -1;
          }
          local_18 = local_18 + -1;
        } while (local_18 != 0);
      }
    }
  }
  local_8 = pfVar16;
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar15 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar15 <= param_4 && param_4 - uVar15 != 0) {
    param_4 = uVar15;
  }
  iVar13 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,local_8,pfVar6,param_4);
  if (-1 < iVar13) {
    return 0;
  }
  return iVar13;
}


