// 1003aed0 size=494 FUN_1003aed0

void FUN_1003aed0(float param_1,float param_2,undefined4 param_3)

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
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float *pfVar25;
  int iVar26;
  undefined4 *puVar27;
  undefined4 *puVar28;
  undefined4 local_40 [16];
  
  fVar1 = *(float *)(DAT_1072ddc8 + 0xe8);
  fVar2 = *(float *)(DAT_101d1b9c + 0x1bc);
  fVar3 = *(float *)(DAT_1072ddc8 + 0xd8);
  fVar4 = *(float *)(DAT_101d1b9c + 0x1b8);
  fVar5 = *(float *)(DAT_101d1b9c + 0x1b4);
  fVar6 = *(float *)(DAT_1072ddc8 + 200);
  fVar7 = *(float *)(DAT_1072ddc8 + 0xec);
  fVar8 = *(float *)(DAT_101d1b9c + 0x1bc);
  fVar9 = *(float *)(DAT_1072ddc8 + 0xdc);
  fVar10 = *(float *)(DAT_101d1b9c + 0x1b8);
  fVar11 = *(float *)(DAT_1072ddc8 + 0xcc);
  fVar12 = *(float *)(DAT_101d1b9c + 0x1b4);
  fVar13 = *(float *)(DAT_1072ddc8 + 0xf0);
  fVar14 = *(float *)(DAT_101d1b9c + 0x1bc);
  fVar15 = *(float *)(DAT_1072ddc8 + 0xe0);
  fVar16 = *(float *)(DAT_101d1b9c + 0x1b8);
  fVar17 = *(float *)(DAT_1072ddc8 + 0xd0);
  fVar18 = *(float *)(DAT_101d1b9c + 0x1b4);
  fVar19 = *(float *)(DAT_1072ddc8 + 0xf4);
  fVar20 = *(float *)(DAT_101d1b9c + 0x1bc);
  fVar21 = *(float *)(DAT_1072ddc8 + 0xe4);
  fVar22 = *(float *)(DAT_101d1b9c + 0x1b8);
  fVar23 = *(float *)(DAT_1072ddc8 + 0xd4);
  fVar24 = *(float *)(DAT_101d1b9c + 0x1b4);
  puVar27 = &DAT_10191368;
  puVar28 = local_40;
  for (iVar26 = 0x10; iVar26 != 0; iVar26 = iVar26 + -1) {
    *puVar28 = *puVar27;
    puVar27 = puVar27 + 1;
    puVar28 = puVar28 + 1;
  }
  fVar19 = 1.0 / (fVar23 * fVar24 + fVar21 * fVar22 + fVar19 * fVar20);
  fVar1 = fVar19 * (fVar5 * fVar6 + fVar3 * fVar4 + fVar1 * fVar2);
  fVar2 = fVar19 * (fVar11 * fVar12 + fVar9 * fVar10 + fVar7 * fVar8);
  puVar27 = local_40;
  puVar28 = (undefined4 *)(&DAT_1072e220 + DAT_10730550 * 0xcd0);
  for (iVar26 = 0x10; iVar26 != 0; iVar26 = iVar26 + -1) {
    *puVar28 = *puVar27;
    puVar27 = puVar27 + 1;
    puVar28 = puVar28 + 1;
  }
  fVar19 = fVar19 * (fVar17 * fVar18 + fVar15 * fVar16 + fVar13 * fVar14);
  FUN_1003e130();
  FUN_1003df90(local_40);
  pfVar25 = (float *)FUN_1003ac40(param_3);
  *pfVar25 = fVar1;
  pfVar25[1] = fVar2;
  pfVar25[2] = fVar19;
  pfVar25[9] = fVar1;
  pfVar25[10] = fVar2;
  pfVar25[0xb] = fVar19;
  pfVar25[0x12] = fVar1;
  pfVar25[0x13] = fVar2;
  pfVar25[0x14] = fVar19;
  pfVar25[0x1d] = fVar19;
  pfVar25[0x1b] = fVar1;
  pfVar25[0x1c] = fVar2;
  *pfVar25 = param_1 + *pfVar25;
  pfVar25[1] = param_2 + pfVar25[1];
  pfVar25[2] = pfVar25[2] - 0.001;
  pfVar25[9] = param_1 + pfVar25[9];
  pfVar25[10] = pfVar25[10] - param_2;
  pfVar25[0xb] = pfVar25[0xb] - 0.001;
  pfVar25[0x12] = pfVar25[0x12] - param_1;
  pfVar25[0x13] = pfVar25[0x13] - param_2;
  pfVar25[0x14] = pfVar25[0x14] - 0.001;
  pfVar25[0x1b] = pfVar25[0x1b] - param_1;
  pfVar25[0x1c] = param_2 + pfVar25[0x1c];
  pfVar25[0x1d] = pfVar25[0x1d] - 0.001;
  return;
}


