// 1007f261 size=1005 FUN_1007f261

int FUN_1007f261(int param_1,undefined4 param_2,uint *param_3,uint param_4,int param_5)

{
  uint *puVar1;
  short sVar2;
  ushort uVar3;
  uint *puVar4;
  short *psVar5;
  uint *puVar6;
  uint *puVar7;
  uint uVar8;
  uint *puVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  uint *puVar13;
  ushort uVar14;
  uint uVar15;
  uint uVar16;
  int local_18;
  undefined *local_14;
  uint *local_10;
  uint *local_8;
  
  puVar4 = *(uint **)(param_1 + 0x20);
  psVar5 = *(short **)(param_1 + 0x18);
  local_8 = param_3;
  sVar2 = *psVar5;
  puVar9 = local_8;
  if (sVar2 == 0) {
    param_4 = param_4 << 2;
    if ((ushort)psVar5[4] < param_4) {
      param_4 = (uint)(ushort)psVar5[4];
    }
  }
  else {
    puVar9 = puVar4;
    if (sVar2 == 1) {
      if ((ushort)psVar5[4] < param_4) {
        param_4 = (uint)(ushort)psVar5[4];
      }
      puVar9 = local_8;
      if ((psVar5[3] != 4) && (uVar16 = 0, puVar9 = puVar4, param_4 != 0)) {
        uVar15 = (uint)(ushort)psVar5[3];
        puVar13 = puVar4;
        do {
          uVar11 = 0;
          if (uVar15 != 0) {
            do {
              if (uVar11 < 5) {
                uVar15 = param_3[uVar11 + uVar16 * 4];
              }
              else {
                uVar15 = 0;
              }
              *puVar13 = uVar15;
              uVar15 = (uint)(ushort)psVar5[3];
              puVar13 = puVar13 + 1;
              uVar11 = uVar11 + 1;
            } while (uVar11 < uVar15);
          }
          uVar16 = uVar16 + 1;
        } while (uVar16 < param_4);
      }
    }
    else if (sVar2 == 2) {
      uVar16 = (uint)(ushort)psVar5[2];
      param_4 = param_4 / uVar16;
      if ((ushort)psVar5[4] < param_4) {
        param_4 = (uint)(ushort)psVar5[4];
      }
      uVar14 = psVar5[3];
      puVar9 = local_8;
      if ((uVar14 != 4) && (local_8 = (uint *)0x0, puVar13 = puVar4, puVar9 = puVar4, param_4 != 0))
      {
        do {
          uVar15 = 0;
          if (uVar16 != 0) {
            uVar11 = (uint)uVar14;
            do {
              uVar16 = 0;
              if (uVar11 != 0) {
                do {
                  if (uVar16 < 5) {
                    uVar11 = param_3[uVar16 + ((uint)(ushort)psVar5[2] * (int)local_8 + uVar15) * 4]
                    ;
                  }
                  else {
                    uVar11 = 0;
                  }
                  *puVar13 = uVar11;
                  uVar14 = psVar5[3];
                  puVar13 = puVar13 + 1;
                  uVar11 = (uint)uVar14;
                  uVar16 = uVar16 + 1;
                } while (uVar16 < uVar11);
              }
              uVar16 = (uint)(ushort)psVar5[2];
              uVar15 = uVar15 + 1;
            } while (uVar15 < uVar16);
          }
          local_8 = (uint *)((int)local_8 + 1);
        } while (local_8 < param_4);
      }
    }
    else {
      if (sVar2 != 3) {
        if (sVar2 != 5) {
          return -0x7fffbfff;
        }
        param_4 = (param_4 << 2) / *(uint *)(param_1 + 0x34);
        if ((ushort)psVar5[4] < param_4) {
          param_4 = (uint)(ushort)psVar5[4];
        }
        param_3 = (uint *)0x0;
        if (param_4 == 0) {
          return 0;
        }
        do {
          uVar16 = 0;
          if (psVar5[5] != 0) {
            do {
              iVar12 = *(int *)(*(int *)(param_1 + 0x38) + uVar16 * 4);
              iVar10 = FUN_1007ef30(param_1,param_2,local_8,*(undefined4 *)(iVar12 + 0x30),param_5);
              if (iVar10 < 0) {
                return iVar10;
              }
              local_8 = local_8 + *(int *)(iVar12 + 0x30);
              param_5 = param_5 + *(int *)(iVar12 + 0x28);
              uVar16 = uVar16 + 1;
            } while (uVar16 < (ushort)psVar5[5]);
          }
          param_3 = (uint *)((int)param_3 + 1);
        } while (param_3 < param_4);
        return 0;
      }
      uVar16 = (uint)(ushort)psVar5[3];
      param_4 = param_4 / uVar16;
      if ((ushort)psVar5[4] < param_4) {
        param_4 = (uint)(ushort)psVar5[4];
      }
      local_8 = (uint *)0x0;
      puVar13 = puVar4;
      if (param_4 != 0) {
        do {
          uVar15 = 0;
          if (uVar16 != 0) {
            uVar11 = (uint)(ushort)psVar5[2];
            do {
              uVar16 = 0;
              if (uVar11 != 0) {
                do {
                  if (uVar15 < 5) {
                    uVar11 = param_3[uVar15 + (uVar11 * (int)local_8 + uVar16) * 4];
                  }
                  else {
                    uVar11 = 0;
                  }
                  *puVar13 = uVar11;
                  uVar11 = (uint)(ushort)psVar5[2];
                  puVar13 = puVar13 + 1;
                  uVar16 = uVar16 + 1;
                } while (uVar16 < uVar11);
              }
              uVar16 = (uint)(ushort)psVar5[3];
              uVar15 = uVar15 + 1;
            } while (uVar15 < uVar16);
          }
          local_8 = (uint *)((int)local_8 + 1);
        } while (local_8 < param_4);
      }
    }
  }
  local_8 = puVar9;
  sVar2 = psVar5[1];
  puVar9 = local_8;
  if (sVar2 != 3) {
    iVar12 = *(int *)(param_1 + 0x34) * param_4;
    puVar9 = puVar4;
    if (sVar2 == 1) {
      if (iVar12 != 0) {
        puVar13 = puVar4;
        do {
          *puVar13 = (uint)(*(float *)((int)puVar13 + ((int)local_8 - (int)puVar4)) != 0.0);
          puVar13 = puVar13 + 1;
          iVar12 = iVar12 + -1;
        } while (iVar12 != 0);
      }
    }
    else if ((sVar2 == 2) && (iVar12 != 0)) {
      puVar13 = puVar4;
      do {
        *puVar13 = (int)ROUND(*(float *)(((int)local_8 - (int)puVar4) + (int)puVar13));
        puVar13 = puVar13 + 1;
        iVar12 = iVar12 + -1;
      } while (iVar12 != 0);
    }
  }
  local_8 = puVar9;
  puVar9 = local_8;
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar5 == 3) {
      uVar14 = psVar5[2];
      uVar3 = psVar5[3];
    }
    else {
      uVar14 = psVar5[3];
      uVar3 = psVar5[2];
    }
    uVar16 = (uint)uVar14;
    if ((uVar14 & 3) != 0) {
      local_14 = &DAT_1010fe6c;
      if (*(short *)(param_1 + 8) != 1) {
        local_14 = &DAT_1010fe5c;
      }
      local_18 = uVar3 * param_4;
      uVar15 = uVar16 + 3 & 0xfffffffc;
      puVar9 = puVar4;
      if (local_18 != 0) {
        local_8 = (uint *)(uVar16 * (local_18 * 4 + 4) + (int)local_8);
        local_10 = puVar4 + local_18 * uVar15 + uVar16;
        puVar13 = (uint *)(uVar15 * (local_18 * 4 + 4) + (int)puVar4);
        do {
          local_10 = local_10 + -uVar15;
          puVar13 = puVar13 + -uVar15;
          local_8 = local_8 + -uVar16;
          uVar11 = uVar15;
          puVar1 = puVar13;
          while (puVar6 = local_10, puVar7 = local_8, uVar8 = uVar16, uVar16 < uVar11) {
            uVar11 = uVar11 - 1;
            puVar1 = puVar1 + -1;
            *puVar1 = *(uint *)(local_14 + (uVar11 & 3) * 4);
          }
          for (; uVar8 != 0; uVar8 = uVar8 - 1) {
            puVar6[-1] = puVar7[-1];
            puVar6 = puVar6 + -1;
            puVar7 = puVar7 + -1;
          }
          local_18 = local_18 + -1;
        } while (local_18 != 0);
      }
    }
  }
  local_8 = puVar9;
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar16 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar16 <= param_4 && param_4 - uVar16 != 0) {
    param_4 = uVar16;
  }
  iVar12 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,local_8,puVar4,param_4);
  if (-1 < iVar12) {
    return 0;
  }
  return iVar12;
}


