// 1007e699 size=671 FUN_1007e699

int FUN_1007e699(uint param_1,undefined4 param_2,undefined4 *param_3,uint param_4,int param_5)

{
  uint uVar1;
  short sVar2;
  ushort uVar3;
  ushort uVar4;
  undefined4 *puVar5;
  short *psVar6;
  int iVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  undefined4 *puVar13;
  int iVar14;
  uint uVar15;
  undefined4 *puVar16;
  undefined4 *puVar17;
  bool bVar18;
  bool bVar19;
  int local_18;
  undefined *local_14;
  undefined4 *local_10;
  undefined4 *local_8;
  
  iVar14 = param_1;
  puVar5 = *(undefined4 **)(param_1 + 0x20);
  psVar6 = *(short **)(param_1 + 0x18);
  local_8 = param_3;
  sVar2 = *psVar6;
  if (sVar2 == 0) {
    uVar15 = (uint)(ushort)psVar6[4];
    bVar18 = param_4 < uVar15;
    bVar19 = param_4 == uVar15;
  }
  else {
    if (sVar2 == 1) {
      uVar15 = (uint)(ushort)psVar6[3];
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
            param_3 = (undefined4 *)0x0;
            if (psVar6[5] != 0) {
              do {
                iVar7 = *(int *)(*(int *)(iVar14 + 0x38) + (int)param_3 * 4);
                iVar11 = FUN_1007e699(iVar14,param_2,local_8,*(undefined4 *)(iVar7 + 0x30),param_5);
                if (iVar11 < 0) {
                  return iVar11;
                }
                local_8 = local_8 + *(int *)(iVar7 + 0x30);
                param_5 = param_5 + *(int *)(iVar7 + 0x28);
                param_3 = (undefined4 *)((int)param_3 + 1);
              } while (param_3 < (uint)(ushort)psVar6[5]);
            }
            param_1 = param_1 + 1;
          } while (param_1 < param_4);
          return 0;
        }
        uVar15 = (uint)(ushort)psVar6[2];
        param_4 = param_4 / (uVar15 * (ushort)psVar6[3]);
        if ((ushort)psVar6[4] < param_4) {
          param_4 = (uint)(ushort)psVar6[4];
        }
        local_10 = (undefined4 *)0x0;
        puVar16 = puVar5;
        local_8 = puVar5;
        if (param_4 != 0) {
          do {
            local_8 = (undefined4 *)0x0;
            if (psVar6[3] != 0) {
              do {
                uVar12 = 0;
                if (uVar15 != 0) {
                  do {
                    *puVar16 = param_3[(uVar15 * (int)local_10 + uVar12) * (uint)(ushort)psVar6[3] +
                                       (int)local_8];
                    uVar15 = (uint)(ushort)psVar6[2];
                    puVar16 = puVar16 + 1;
                    uVar12 = uVar12 + 1;
                  } while (uVar12 < uVar15);
                }
                local_8 = (undefined4 *)((int)local_8 + 1);
              } while (local_8 < (uint)(ushort)psVar6[3]);
            }
            local_10 = (undefined4 *)((int)local_10 + 1);
            local_8 = puVar5;
          } while (local_10 < param_4);
        }
        goto LAB_1007e81f;
      }
      uVar15 = (uint)(ushort)psVar6[3] * (uint)(ushort)psVar6[2];
    }
    param_4 = param_4 / uVar15;
    uVar15 = (uint)(ushort)psVar6[4];
    bVar18 = param_4 < uVar15;
    bVar19 = param_4 == uVar15;
  }
  if (!bVar18 && !bVar19) {
    param_4 = uVar15;
  }
LAB_1007e81f:
  puVar16 = local_8;
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar6 == 3) {
      uVar3 = psVar6[2];
      uVar4 = psVar6[3];
    }
    else {
      uVar3 = psVar6[3];
      uVar4 = psVar6[2];
    }
    uVar15 = (uint)uVar3;
    if ((uVar3 & 3) != 0) {
      local_14 = &DAT_1010fdec;
      if (*(short *)(param_1 + 8) != 1) {
        local_14 = &DAT_1010fddc;
      }
      local_18 = uVar4 * param_4;
      uVar12 = uVar15 + 3 & 0xfffffffc;
      puVar16 = puVar5;
      if (local_18 != 0) {
        iVar14 = local_18 * 4 + 4;
        local_8 = (undefined4 *)(iVar14 * uVar15 + (int)local_8);
        local_10 = (undefined4 *)(iVar14 * uVar12 + (int)puVar5);
        puVar13 = puVar5 + local_18 * uVar12 + uVar15;
        do {
          local_10 = local_10 + -uVar12;
          puVar13 = puVar13 + -uVar12;
          local_8 = local_8 + -uVar15;
          uVar1 = uVar12;
          puVar17 = local_10;
          while (puVar8 = puVar13, puVar9 = local_8, uVar10 = uVar15, uVar15 < uVar1) {
            uVar1 = uVar1 - 1;
            puVar17 = puVar17 + -1;
            *puVar17 = *(undefined4 *)(local_14 + (uVar1 & 3) * 4);
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
  local_8 = puVar16;
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar15 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar15 <= param_4 && param_4 - uVar15 != 0) {
    param_4 = uVar15;
  }
  iVar14 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,local_8,puVar5,param_4);
  if (-1 < iVar14) {
    return 0;
  }
  return iVar14;
}


