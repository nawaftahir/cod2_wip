// 1007fae3 size=1082 FUN_1007fae3

int FUN_1007fae3(int param_1,undefined4 param_2,undefined4 *param_3,uint param_4,int param_5)

{
  float *pfVar1;
  short sVar2;
  ushort uVar3;
  ushort uVar4;
  undefined4 *puVar5;
  short *psVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  int iVar9;
  undefined4 uVar10;
  undefined4 *puVar11;
  int iVar12;
  uint uVar13;
  undefined4 *puVar14;
  undefined4 *puVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  int local_18;
  undefined *local_10;
  undefined4 *local_c;
  
  puVar5 = *(undefined4 **)(param_1 + 0x20);
  psVar6 = *(short **)(param_1 + 0x18);
  sVar2 = *psVar6;
  uVar16 = 0;
  if (sVar2 == 0) {
    param_4 = param_4 << 4;
    if ((ushort)psVar6[4] < param_4) {
      param_4 = (uint)(ushort)psVar6[4];
    }
    puVar14 = puVar5;
    if (param_4 != 0) {
      do {
        *puVar14 = *(undefined4 *)
                    (*(int *)((int)param_3 + (uVar16 >> 2 & 0xfffffffc)) +
                    ((uVar16 & 3) + (uVar16 >> 2 & 3) * 4) * 4);
        puVar14 = puVar14 + 1;
        uVar16 = uVar16 + 1;
      } while (uVar16 < param_4);
    }
  }
  else if (sVar2 == 1) {
    param_4 = param_4 << 2;
    if ((ushort)psVar6[4] < param_4) {
      param_4 = (uint)(ushort)psVar6[4];
    }
    local_c = (undefined4 *)0x0;
    if (param_4 != 0) {
      uVar16 = (uint)(ushort)psVar6[3];
      puVar14 = puVar5;
      do {
        uVar18 = 0;
        if (uVar16 != 0) {
          do {
            if (uVar18 < 5) {
              uVar10 = *(undefined4 *)
                        (*(int *)((int)param_3 + ((uint)local_c & 0xfffffffc)) +
                        (uVar18 + ((uint)local_c & 3) * 4) * 4);
            }
            else {
              uVar10 = 0;
            }
            *puVar14 = uVar10;
            uVar16 = (uint)(ushort)psVar6[3];
            puVar14 = puVar14 + 1;
            uVar18 = uVar18 + 1;
          } while (uVar18 < uVar16);
        }
        local_c = (undefined4 *)((int)local_c + 1);
      } while (local_c < param_4);
    }
  }
  else if (sVar2 == 2) {
    if ((ushort)psVar6[4] < param_4) {
      param_4 = (uint)(ushort)psVar6[4];
    }
    uVar16 = 0;
    local_c = puVar5;
    if (param_4 != 0) {
      do {
        uVar18 = 0;
        if (psVar6[2] != 0) {
          uVar17 = (uint)(ushort)psVar6[3];
          do {
            uVar13 = 0;
            if (uVar17 != 0) {
              do {
                if ((uVar18 < 5) && (uVar13 < 5)) {
                  uVar10 = *(undefined4 *)
                            (*(int *)((int)param_3 + uVar16 * 4) + (uVar13 + uVar18 * 4) * 4);
                }
                else {
                  uVar10 = 0;
                }
                puVar14 = local_c + 1;
                *local_c = uVar10;
                uVar17 = (uint)(ushort)psVar6[3];
                uVar13 = uVar13 + 1;
                local_c = puVar14;
              } while (uVar13 < uVar17);
            }
            uVar18 = uVar18 + 1;
          } while (uVar18 < (ushort)psVar6[2]);
        }
        uVar16 = uVar16 + 1;
      } while (uVar16 < param_4);
    }
  }
  else {
    if (sVar2 != 3) {
      if (sVar2 != 5) {
        return -0x7fffbfff;
      }
      param_4 = (param_4 << 4) / *(uint *)(param_1 + 0x34);
      if ((ushort)psVar6[4] < param_4) {
        param_4 = (uint)(ushort)psVar6[4];
      }
      uVar16 = *(uint *)(param_1 + 0x34) * param_4;
      uVar18 = 0;
      puVar14 = puVar5;
      if (uVar16 != 0) {
        do {
          *puVar14 = *(undefined4 *)
                      (*(int *)((int)param_3 + (uVar18 >> 2 & 0xfffffffc)) +
                      ((uVar18 & 3) + (uVar18 >> 2 & 3) * 4) * 4);
          puVar14 = puVar14 + 1;
          uVar18 = uVar18 + 1;
        } while (uVar18 < uVar16);
      }
      local_c = (undefined4 *)0x0;
      param_3 = puVar5;
      if (param_4 == 0) {
        return 0;
      }
      do {
        uVar16 = 0;
        if (psVar6[5] != 0) {
          do {
            iVar12 = *(int *)(*(int *)(param_1 + 0x38) + uVar16 * 4);
            iVar9 = FUN_1007ef30(param_1,param_2,param_3,*(undefined4 *)(iVar12 + 0x30),param_5);
            if (iVar9 < 0) {
              return iVar9;
            }
            param_3 = param_3 + *(int *)(iVar12 + 0x30);
            param_5 = param_5 + *(int *)(iVar12 + 0x28);
            uVar16 = uVar16 + 1;
          } while (uVar16 < (ushort)psVar6[5]);
        }
        local_c = (undefined4 *)((int)local_c + 1);
      } while (local_c < param_4);
      return 0;
    }
    if ((ushort)psVar6[4] < param_4) {
      param_4 = (uint)(ushort)psVar6[4];
    }
    uVar16 = 0;
    puVar14 = puVar5;
    if (param_4 != 0) {
      do {
        local_c = (undefined4 *)0x0;
        if (psVar6[3] != 0) {
          uVar18 = (uint)(ushort)psVar6[2];
          do {
            uVar17 = 0;
            if (uVar18 != 0) {
              iVar12 = (int)local_c << 2;
              do {
                if ((uVar17 < 5) && (local_c < 5)) {
                  uVar10 = *(undefined4 *)(iVar12 + *(int *)((int)param_3 + uVar16 * 4));
                }
                else {
                  uVar10 = 0;
                }
                *puVar14 = uVar10;
                uVar18 = (uint)(ushort)psVar6[2];
                puVar14 = puVar14 + 1;
                uVar17 = uVar17 + 1;
                iVar12 = iVar12 + 0x10;
              } while (uVar17 < uVar18);
            }
            local_c = (undefined4 *)((int)local_c + 1);
          } while (local_c < (uint)(ushort)psVar6[3]);
        }
        uVar16 = uVar16 + 1;
      } while (uVar16 < param_4);
    }
  }
  sVar2 = psVar6[1];
  if (sVar2 != 3) {
    uVar16 = *(int *)(param_1 + 0x34) * param_4;
    if (sVar2 == 1) {
      uVar18 = 0;
      if (uVar16 != 0) {
        do {
          pfVar1 = (float *)(puVar5 + uVar18);
          uVar18 = uVar18 + 1;
          *pfVar1 = (float)(uint)(*pfVar1 != 0.0);
        } while (uVar18 < uVar16);
      }
    }
    else if ((sVar2 == 2) && (uVar18 = 0, uVar16 != 0)) {
      do {
        pfVar1 = (float *)(puVar5 + uVar18);
        uVar18 = uVar18 + 1;
        *pfVar1 = (float)(int)ROUND(*pfVar1);
      } while (uVar18 < uVar16);
    }
  }
  if (*(short *)(param_1 + 8) != 0) {
    if (*psVar6 == 3) {
      uVar3 = psVar6[2];
      uVar4 = psVar6[3];
    }
    else {
      uVar3 = psVar6[3];
      uVar4 = psVar6[2];
    }
    uVar16 = (uint)uVar3;
    if ((uVar3 & 3) != 0) {
      local_10 = &DAT_1010feac;
      if (*(short *)(param_1 + 8) != 1) {
        local_10 = &DAT_1010fe9c;
      }
      local_18 = uVar4 * param_4;
      uVar18 = uVar16 + 3 & 0xfffffffc;
      if (local_18 != 0) {
        iVar12 = local_18 * 4 + 4;
        puVar11 = (undefined4 *)(iVar12 * uVar16 + (int)puVar5);
        local_c = (undefined4 *)(iVar12 * uVar18 + (int)puVar5);
        puVar14 = puVar5 + local_18 * uVar18 + uVar16;
        do {
          local_c = local_c + -uVar18;
          puVar14 = puVar14 + -uVar18;
          puVar11 = puVar11 + -uVar16;
          uVar17 = uVar18;
          puVar15 = local_c;
          while (puVar7 = puVar14, puVar8 = puVar11, uVar13 = uVar16, uVar16 < uVar17) {
            uVar17 = uVar17 - 1;
            puVar15 = puVar15 + -1;
            *puVar15 = *(undefined4 *)(local_10 + (uVar17 & 3) * 4);
          }
          for (; uVar13 != 0; uVar13 = uVar13 - 1) {
            puVar7[-1] = puVar8[-1];
            puVar7 = puVar7 + -1;
            puVar8 = puVar8 + -1;
          }
          local_18 = local_18 + -1;
        } while (local_18 != 0);
      }
    }
  }
  param_4 = *(int *)(param_1 + 0x2c) * param_4;
  uVar16 = (uint)*(ushort *)(param_1 + 0xc);
  if (uVar16 <= param_4 && param_4 - uVar16 != 0) {
    param_4 = uVar16;
  }
  iVar12 = (**(code **)(param_1 + 0x1c))
                     (param_2,(uint)*(ushort *)(param_1 + 10) + param_5,puVar5,puVar5,param_4);
  if (-1 < iVar12) {
    return 0;
  }
  return iVar12;
}


