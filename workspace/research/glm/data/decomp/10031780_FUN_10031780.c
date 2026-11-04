// 10031780 size=1332 FUN_10031780

void FUN_10031780(int param_1,int param_2,int param_3,char param_4)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  int iVar13;
  int iVar14;
  uint *puVar15;
  int iVar16;
  uint uVar17;
  float *pfVar18;
  float *pfVar19;
  undefined4 *puVar20;
  undefined4 *puVar21;
  float10 fVar22;
  float local_88;
  float local_84;
  int local_80;
  undefined4 local_44 [17];
  
  if ((DAT_1072d9bc != DAT_101d1b44) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if (param_4 == '\0') {
    puVar15 = (uint *)(DAT_101d1b44 + 0x30);
    uVar17 = *(uint *)(DAT_101d1b44 + 0x30) & 0xfffffff1;
    *puVar15 = uVar17;
    *puVar15 = uVar17 | 2;
  }
  puVar20 = &DAT_10191368;
  puVar21 = local_44;
  for (iVar16 = 0x10; iVar16 != 0; iVar16 = iVar16 + -1) {
    *puVar21 = *puVar20;
    puVar20 = puVar20 + 1;
    puVar21 = puVar21 + 1;
  }
  puVar20 = local_44;
  puVar21 = (undefined4 *)(&DAT_1072e220 + DAT_10730550 * 0xcd0);
  for (iVar16 = 0x10; iVar16 != 0; iVar16 = iVar16 + -1) {
    *puVar21 = *puVar20;
    puVar20 = puVar20 + 1;
    puVar21 = puVar21 + 1;
  }
  FUN_1003e130();
  FUN_1003df90(local_44);
  iVar16 = DAT_1072ddc8;
  pfVar18 = (float *)(DAT_1072ddc8 + 200);
  fVar11 = (float)DAT_1076671c;
  fVar12 = (float)DAT_10766720;
  if (0 < param_1) {
    pfVar19 = (float *)(param_3 + 4);
    local_80 = param_1;
    do {
      fVar1 = *(float *)(iVar16 + 0xe8) * pfVar19[1] +
              *pfVar19 * *(float *)(iVar16 + 0xd8) + *pfVar18 * pfVar19[-1] +
              *(float *)(iVar16 + 0xf8);
      fVar2 = *(float *)(iVar16 + 0xcc) * pfVar19[-1] +
              *(float *)(iVar16 + 0xec) * pfVar19[1] + *(float *)(iVar16 + 0xdc) * *pfVar19 +
              *(float *)(iVar16 + 0xfc);
      fVar3 = *pfVar19 * *(float *)(iVar16 + 0xe0) +
              *(float *)(iVar16 + 0xd0) * pfVar19[-1] + pfVar19[1] * *(float *)(iVar16 + 0xf0) +
              *(float *)(iVar16 + 0x100);
      fVar4 = *(float *)(iVar16 + 0xd4) * pfVar19[-1] +
              *(float *)(iVar16 + 0xf4) * pfVar19[1] + *(float *)(iVar16 + 0xe4) * *pfVar19 +
              *(float *)(iVar16 + 0x104);
      fVar5 = *pfVar18 * pfVar19[3] +
              pfVar19[4] * *(float *)(iVar16 + 0xd8) + *(float *)(iVar16 + 0xe8) * pfVar19[5] +
              *(float *)(iVar16 + 0xf8);
      fVar6 = pfVar19[3] * *(float *)(iVar16 + 0xcc) +
              *(float *)(iVar16 + 0xdc) * pfVar19[4] + *(float *)(iVar16 + 0xec) * pfVar19[5] +
              *(float *)(iVar16 + 0xfc);
      fVar7 = pfVar19[4] * *(float *)(iVar16 + 0xe0) +
              pfVar19[5] * *(float *)(iVar16 + 0xf0) + *(float *)(iVar16 + 0xd0) * pfVar19[3] +
              *(float *)(iVar16 + 0x100);
      fVar8 = pfVar19[3] * *(float *)(iVar16 + 0xd4) +
              *(float *)(iVar16 + 0xe4) * pfVar19[4] + *(float *)(iVar16 + 0xf4) * pfVar19[5] +
              *(float *)(iVar16 + 0x104);
      local_88 = fVar6 * fVar4 - fVar8 * fVar2;
      local_84 = fVar8 * fVar1 - fVar5 * fVar4;
      fVar22 = (float10)FUN_1010a920();
      iVar13 = DAT_1072d9cc;
      if ((float)fVar22 != 0.0) {
        fVar9 = 1.0 / (float)fVar22;
        local_88 = fVar9 * local_88;
        local_84 = fVar9 * local_84;
      }
      local_88 = local_88 * ((float)param_2 / fVar11);
      local_84 = local_84 * ((float)param_2 / fVar12);
      fVar9 = local_88 * fVar4;
      fVar10 = local_84 * fVar4;
      local_88 = local_88 * fVar8;
      local_84 = local_84 * fVar8;
      if ((0x154a < DAT_1072d9d4 + 4) || (iVar14 = iVar13, 0x100000 < DAT_1072d9d0 + 6)) {
        FUN_1003a8d0();
        FUN_1003a5f0(DAT_1072d9c4);
        iVar14 = DAT_1072d9cc;
        if ((DAT_1072d9cc != iVar13) &&
           ((DAT_1072d9d0 != 0 || (iVar14 = iVar13, DAT_1072d9e0 != 0)))) {
          FUN_1003a8d0();
          iVar14 = iVar13;
        }
      }
      DAT_1072d9cc = iVar14;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 3;
      *(undefined2 *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(undefined2 *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 1;
      DAT_1072d9d0 = DAT_1072d9d0 + 6;
      FUN_1002e640(fVar1 - fVar9,fVar2 - fVar10,fVar3,fVar4,0,0);
      FUN_1002e640(fVar5 - local_88,fVar6 - local_84,fVar7,fVar8,0,0x3f800000);
      FUN_1002e640(local_88 + fVar5,local_84 + fVar6,fVar7,fVar8,0x3f800000,0x3f800000);
      FUN_1002e640(fVar9 + fVar1,fVar10 + fVar2,fVar3,fVar4,0x3f800000,0);
      DAT_1072d9d4 = DAT_1072d9d4 + 4;
      pfVar19 = pfVar19 + 8;
      local_80 = local_80 + -1;
    } while (local_80 != 0);
  }
  FUN_1003a8d0();
  FUN_1003e300();
  if (param_4 == '\0') {
    puVar15 = (uint *)(DAT_101d1b44 + 0x30);
    uVar17 = *(uint *)(DAT_101d1b44 + 0x30) & 0xfffffff1;
    *puVar15 = uVar17;
    *puVar15 = uVar17 | 4;
  }
  return;
}


