// 1007ef30 size=817 FUN_1007ef30

int FUN_1007ef30(uint param_1,undefined4 param_2,uint *param_3,uint param_4,int param_5)

{
  uint uVar1;
  short sVar2;
  ushort uVar3;
  ushort uVar4;
  uint *puVar5;
  short *psVar6;
  int iVar7;
  uint *puVar8;
  uint *puVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  uint *puVar13;
  uint uVar14;
  int iVar15;
  uint *puVar16;
  uint *puVar17;
  bool bVar18;
  bool bVar19;
  int local_18;
  undefined *local_14;
  uint *local_10;
  uint *local_8;
  
  iVar15 = param_1;
  puVar5 = *(uint **)(param_1 + 0x20);
  psVar6 = *(short **)(param_1 + 0x18);
  local_8 = param_3;
  sVar2 = *psVar6;
  if (sVar2 == 0) {
    uVar14 = (uint)(ushort)psVar6[4];
    bVar18 = param_4 < uVar14;
    bVar19 = param_4 == uVar14;
  }
  else {
    if (sVar2 == 1) {
      uVar14 = (uint)(ushort)psVar6[3];
    }
    else {
      if (sVar2 != 2) {
        if (sVar2 != 3) {
          if (sVar2 != 5) {
            return -0x7fffbfff;
          }
          param_4 = param_4 / *(uint *)(param_1 + 0x34);
          if ((ushort)psVar6[4] < param_4) {
            param_4 = (uint)(ushort)psVar6[4];
          }
          param_1 = 0;
          if (param_4 == 0) {
            return 0;
          }
          do {
            param_3 = (uint *)0x0;
            if (psVar6[5] != 0) {
              do {
                iVar7 = *(int *)(*(int *)(iVar15 + 0x38) + (int)param_3 * 4);
                iVar11 = FUN_1007ef30(iVar15,param_2,local_8,*(undefined4 *)(iVar7 + 0x30),param_5);
                if (iVar11 < 0) {
                  return iVar11;
                }
                local_8 = local_8 + *(int *)(iVar7 + 0x30);
                param_5 = param_5 + *(int *)(iVar7 + 0x28);
                param_3 = (uint *)((int)param_3 + 1);
              } while (param_3 < (uint)(ushort)psVar6[5]);
            }
            param_1 = param_1 + 1;
          } while (param_1 < param_4);
          return 0;
        }
        uVar14 = (uint)(ushort)psVar6[2];
        param_4 = param_4 / (uVar14 * (ushort)psVar6[3]);
        if ((ushort)psVar6[4] < param_4) {
          param_4 = (uint)(ushort)psVar6[4];
        }
        local_10 = (uint *)0x0;
        puVar17 = puVar5;
        local_8 = puVar5;
        if (param_4 != 0) {
          do {
            local_8 = (uint *)0x0;
            if (psVar6[3] != 0) {
              do {
                uVar12 = 0;
                if (uVar14 != 0) {
                  do {
                    *puVar17 = param_3[(uVar14 * (int)local_10 + uVar12) * (uint)(ushort)psVar6[3] +
                                       (int)local_8];
                    uVar14 = (uint)(ushort)psVar6[2];
                    puVar17 = puVar17 + 1;
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < uVar14);
                }
                local_8 = (uint *)((int)local_8 + 1);
              } while (local_8 < (uint)(ushort)psVar6[3]);
            }
            local_10 = (uint *)((int)local_10 + 1);
            local_8 = puVar5;
          } while (local_10 < param_4);
        }
        goto LAB_1007f0b8;
      }
      uVar14 = (uint)(ushort)psVar6[3] * (uint)(ushort)psVar6[2];
    }
    param_4 = param_4 / uVar14;
    uVar14 = (uint)(ushort)psVar6[4];
    bVar18 = param_4 < uVar14;
    bVar19 = param_4 == uVar14;
  }
  if (!bVar18 && !bVar19) {
    param_4 = uVar14;
  }
LAB_1007f0b8:
  sVar2 = psVar6[1];
  puVar17 = local_8;
  if (sVar2 != 3) {
    iVar15 = *(int *)(param_1 + 0x34) * param_4;
    puVar17 = puVar5;
    if (sVar2 == 1) {
      if (iVar15 != 0) {
        puVar13 = puVar5;
        do {
          *puVar13 = (uint)(*(float *)((int)puVar13 + ((int)local_8 - (int)puVar5)) != 0.0);
          puVar13 = puVar13 + 1;
          iVar15 = iVar15 + -1;
        } while (iVar15 != 0);
      }
    }
    else if ((sVar2 == 2) && (iVar15 != 0)) {
      puVar13 = puVar5;
      do {
        *puVar13 = (int)ROUND(*(float *)(((int)local_8 - (int)puVar5) + (int)puVar13));
        puVar13 = puVar13 + 1;
        iVar15 = iVar15 + -1;
      } while (iVar15 != 0);
    }
  }
  local_8 = puVar17;
  puVar17 = local_8;
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar6 == 3) {
      uVar3 = psVar6[2];
      uVar4 = psVar6[3];
    }
    else {
      uVar3 = psVar6[3];
      uVar4 = psVar6[2];
    }
    uVar14 = (uint)uVar3;
    if ((uVar3 & 3) != 0) {
      local_14 = &DAT_1010fe4c;
      if (*(short *)(param_1 + 8) != 1) {
        local_14 = &DAT_1010fe3c;
      }
      local_18 = uVar4 * param_4;
      uVar12 = uVar14 + 3 & 0xfffffffc;
      puVar17 = puVar5;
      if (local_18 != 0) {
        iVar15 = local_18 * 4 + 4;
        local_8 = (uint *)(iVar15 * uVar14 + (int)local_8);
        local_10 = (uint *)(iVar15 * uVar12 + (int)puVar5);
        puVar13 = puVar5 + local_18 * uVar12 + uVar14;
        do {
          local_10 = local_10 + -uVar12;
          puVar13 = puVar13 + -uVar12;
          local_8 = local_8 + -uVar14;
          uVar1 = uVar12;
          puVar16 = local_10;
          while (puVar8 = puVar13, puVar9 = local_8, uVar10 = uVar14, uVar14 < uVar1) {
            uVar1 = uVar1 - 1;
            puVar16 = puVar16 + -1;
            *puVar16 = *(uint *)(local_14 + (uVar1 & 3) * 4);
          }
          for (; uVar10 != 0; uVar10 = uVar10 - 1) {
            puVar8[-1] = puVar9[-1];
            puVar8 = puVar8 + -1;
            puVar9 = puVar9 + -1;
          }
          local_18 = local_18 + -1;
        } while (local_18 != 0);
      }
    }
  }
  local_8 = puVar17;
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar14 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar14 <= param_4 && param_4 - uVar14 != 0) {
    param_4 = uVar14;
  }
  iVar15 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,local_8,puVar5,param_4);
  if (-1 < iVar15) {
    return 0;
  }
  return iVar15;
}


