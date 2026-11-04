// 10031070 size=931 FUN_10031070

void FUN_10031070(int param_1)

{
  short sVar1;
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
  int iVar12;
  int iVar13;
  float *pfVar14;
  int iVar15;
  float *pfVar16;
  undefined4 *puVar17;
  undefined4 *puVar18;
  int local_68;
  undefined4 local_40 [16];
  
  if ((DAT_1072d9bc != DAT_101d1b40) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  puVar17 = &DAT_10191368;
  puVar18 = local_40;
  for (iVar15 = 0x10; iVar15 != 0; iVar15 = iVar15 + -1) {
    *puVar18 = *puVar17;
    puVar17 = puVar17 + 1;
    puVar18 = puVar18 + 1;
  }
  puVar17 = local_40;
  puVar18 = (undefined4 *)(&DAT_1072e220 + DAT_10730550 * 0xcd0);
  for (iVar15 = 0x10; iVar15 != 0; iVar15 = iVar15 + -1) {
    *puVar18 = *puVar17;
    puVar17 = puVar17 + 1;
    puVar18 = puVar18 + 1;
  }
  FUN_1003e130();
  FUN_1003df90(local_40);
  iVar15 = DAT_1072ddc8;
  sVar1 = *(short *)(param_1 + 6);
  pfVar14 = (float *)(DAT_1072ddc8 + 200);
  pfVar16 = (float *)(param_1 + 8);
  fVar10 = (float)DAT_1076671c;
  fVar11 = (float)DAT_10766720;
  local_68 = 0;
  if (0 < *(short *)(param_1 + 4)) {
    do {
      iVar12 = DAT_1072d9cc;
      fVar2 = *pfVar16 * *pfVar14 +
              *(float *)(iVar15 + 0xd8) * pfVar16[1] + pfVar16[2] * *(float *)(iVar15 + 0xe8) +
              *(float *)(iVar15 + 0xf8);
      fVar3 = *pfVar16 * *(float *)(iVar15 + 0xcc) +
              pfVar16[1] * *(float *)(iVar15 + 0xdc) + pfVar16[2] * *(float *)(iVar15 + 0xec) +
              *(float *)(iVar15 + 0xfc);
      fVar4 = *pfVar16 * *(float *)(iVar15 + 0xd4) +
              pfVar16[1] * *(float *)(iVar15 + 0xe4) + pfVar16[2] * *(float *)(iVar15 + 0xf4) +
              *(float *)(iVar15 + 0x104);
      fVar5 = fVar4 * ((float)(int)sVar1 / fVar10);
      fVar6 = fVar4 * ((float)(int)sVar1 / fVar11);
      fVar7 = (*pfVar16 * *(float *)(iVar15 + 0xd0) +
               pfVar16[1] * *(float *)(iVar15 + 0xe0) + pfVar16[2] * *(float *)(iVar15 + 0xf0) +
              *(float *)(iVar15 + 0x100)) - fVar4 * 0.001;
      if ((0x154a < DAT_1072d9d4 + 4) || (iVar13 = iVar12, 0x100000 < DAT_1072d9d0 + 6)) {
        FUN_1003a8d0();
        FUN_1003a5f0(DAT_1072d9c4);
        iVar13 = DAT_1072d9cc;
        if ((DAT_1072d9cc != iVar12) &&
           ((DAT_1072d9d0 != 0 || (iVar13 = iVar12, DAT_1072d9e0 != 0)))) {
          FUN_1003a8d0();
          iVar13 = iVar12;
        }
      }
      DAT_1072d9cc = iVar13;
      fVar8 = fVar3 - fVar6;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 3;
      fVar9 = fVar2 - fVar5;
      *(undefined2 *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(undefined2 *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 1;
      DAT_1072d9d0 = DAT_1072d9d0 + 6;
      FUN_1002e640(fVar9,fVar8,fVar7,fVar4,0,0);
      fVar6 = fVar6 + fVar3;
      FUN_1002e640(fVar9,fVar6,fVar7,fVar4,0,0x3f800000);
      fVar5 = fVar5 + fVar2;
      FUN_1002e640(fVar5,fVar6,fVar7,fVar4,0x3f800000,0x3f800000);
      FUN_1002e640(fVar5,fVar8,fVar7,fVar4,0x3f800000,0);
      DAT_1072d9d4 = DAT_1072d9d4 + 4;
      local_68 = local_68 + 1;
      pfVar16 = pfVar16 + 4;
    } while (local_68 < *(short *)(param_1 + 4));
  }
  FUN_1003a8d0();
  FUN_1003e300();
  return;
}


