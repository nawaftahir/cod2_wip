// 100368a0 size=2834 FUN_100368a0

uint FUN_100368a0(int param_1)

{
  undefined4 *puVar1;
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
  int in_EAX;
  int iVar19;
  float *unaff_EDI;
  ushort uVar20;
  float local_14;
  float local_10;
  
  fVar3 = unaff_EDI[1] * 0.587 + *unaff_EDI * 0.299 + unaff_EDI[2] * 0.114;
  fVar4 = ABS(fVar3) * 0.0;
  fVar18 = unaff_EDI[3] * 0.299 + unaff_EDI[4] * 0.587 + unaff_EDI[5] * 0.114;
  fVar17 = ABS(fVar18);
  fVar16 = unaff_EDI[6] * 0.299 + unaff_EDI[7] * 0.587 + unaff_EDI[8] * 0.114;
  fVar5 = ABS(fVar16);
  fVar15 = unaff_EDI[9] * 0.299 + unaff_EDI[10] * 0.587 + unaff_EDI[0xb] * 0.114;
  fVar14 = ABS(fVar15);
  fVar13 = unaff_EDI[0xc] * 0.299 + unaff_EDI[0xd] * 0.587 + unaff_EDI[0xe] * 0.114;
  fVar12 = ABS(fVar13);
  fVar11 = unaff_EDI[0xf] * 0.299 + unaff_EDI[0x10] * 0.587 + unaff_EDI[0x11] * 0.114;
  fVar10 = ABS(fVar11);
  fVar9 = unaff_EDI[0x12] * 0.299 + unaff_EDI[0x13] * 0.587 + unaff_EDI[0x14] * 0.114;
  fVar2 = ABS(fVar9);
  fVar8 = unaff_EDI[0x15] * 0.299 + unaff_EDI[0x16] * 0.587 + unaff_EDI[0x17] * 0.114;
  fVar6 = ABS(fVar8) * 0.0;
  fVar7 = ((fVar10 * 0.47140452 +
           ((fVar14 * 0.47140452 + ((fVar17 * 0.94280905 + fVar4) - fVar5 * 0.47140452)) -
           fVar12 * 0.47140452)) - fVar2 * 0.94280905) + fVar6;
  fVar6 = fVar6 + fVar2 * 0.0 +
                  (((fVar14 * 0.81649655 + fVar5 * 0.81649655 + fVar17 * 0.0 + fVar4) -
                   fVar12 * 0.81649655) - fVar10 * 0.81649655);
  fVar4 = ABS(fVar8) +
          ((((fVar14 * 0.33333334 + fVar5 * 0.33333334 + fVar17 * 0.33333334 + ABS(fVar3) * -1.0) -
            fVar12 * 0.33333334) - fVar10 * 0.33333334) - fVar2 * 0.33333334);
  fVar3 = fVar8 * fVar8 +
          fVar9 * fVar9 +
          fVar11 * fVar11 +
          fVar13 * fVar13 + fVar15 * fVar15 + fVar16 * fVar16 + fVar18 * fVar18 + fVar3 * fVar3;
  uVar20 = (ushort)(fVar3 < 0.0008) << 8 | (ushort)NAN(fVar3) << 10 |
           (ushort)(fVar3 == 0.0008) << 0xe;
  if (fVar3 >= 0.0008) {
    FUN_100590b0();
    local_14 = 0.0;
    local_10 = 0.0;
    fVar8 = fVar6 * 0.0;
    fVar5 = (fVar7 * 0.0 - fVar4 * 1.0) + fVar8;
    if (fVar5 < 0.01 == (fVar5 == 0.01)) {
      fVar9 = fVar5 * *unaff_EDI;
      local_14 = fVar5 * unaff_EDI[1];
      local_10 = fVar5 * unaff_EDI[2];
      fVar2 = fVar5;
    }
    else {
      fVar9 = 0.0;
      fVar2 = 0.0;
    }
    fVar10 = fVar7 * 0.94280905 + fVar4 * 0.33333334 + fVar8;
    if (fVar10 < 0.01 == (fVar10 == 0.01)) {
      fVar9 = fVar10 * unaff_EDI[3] + fVar9;
      local_14 = fVar10 * unaff_EDI[4] + local_14;
      local_10 = fVar10 * unaff_EDI[5] + local_10;
      fVar2 = fVar10 + fVar2;
    }
    fVar11 = fVar6 * 0.81649655 + fVar4 * 0.33333334;
    fVar12 = fVar7 * -0.47140452 + fVar11;
    if (fVar12 < 0.01 == (fVar12 == 0.01)) {
      fVar9 = fVar12 * unaff_EDI[6] + fVar9;
      local_14 = fVar12 * unaff_EDI[7] + local_14;
      local_10 = fVar12 * unaff_EDI[8] + local_10;
      fVar2 = fVar12 + fVar2;
    }
    fVar11 = fVar7 * 0.47140452 + fVar11;
    if (fVar11 < 0.01 == (fVar11 == 0.01)) {
      fVar9 = fVar11 * unaff_EDI[9] + fVar9;
      local_14 = fVar11 * unaff_EDI[10] + local_14;
      local_10 = fVar11 * unaff_EDI[0xb] + local_10;
      fVar2 = fVar11 + fVar2;
    }
    fVar13 = fVar4 * -0.33333334 - fVar6 * 0.81649655;
    fVar14 = fVar7 * -0.47140452 + fVar13;
    if (fVar14 < 0.01 == (fVar14 == 0.01)) {
      fVar9 = fVar14 * unaff_EDI[0xc] + fVar9;
      local_14 = fVar14 * unaff_EDI[0xd] + local_14;
      local_10 = fVar14 * unaff_EDI[0xe] + local_10;
      fVar2 = fVar14 + fVar2;
    }
    fVar13 = fVar13 + fVar7 * 0.47140452;
    if (fVar13 < 0.01 == (fVar13 == 0.01)) {
      fVar9 = fVar13 * unaff_EDI[0xf] + fVar9;
      local_14 = fVar13 * unaff_EDI[0x10] + local_14;
      local_10 = fVar13 * unaff_EDI[0x11] + local_10;
      fVar2 = fVar13 + fVar2;
    }
    fVar15 = (fVar4 * -0.33333334 - fVar7 * 0.94280905) + fVar8;
    if (fVar15 < 0.01 == (fVar15 == 0.01)) {
      fVar9 = fVar15 * unaff_EDI[0x12] + fVar9;
      local_14 = fVar15 * unaff_EDI[0x13] + local_14;
      local_10 = fVar15 * unaff_EDI[0x14] + local_10;
      fVar2 = fVar15 + fVar2;
    }
    fVar8 = fVar7 * 0.0 + fVar8 + fVar4;
    if (fVar8 < 0.01 == (fVar8 == 0.01)) {
      fVar9 = fVar8 * unaff_EDI[0x15] + fVar9;
      local_14 = fVar8 * unaff_EDI[0x16] + local_14;
      local_10 = fVar8 * unaff_EDI[0x17] + local_10;
      fVar2 = fVar8 + fVar2;
    }
    if (fVar2 != 0.0) {
      fVar2 = 1.0 / fVar2;
      fVar9 = fVar2 * fVar9;
      local_14 = local_14 * fVar2;
      local_10 = fVar2 * local_10;
    }
    if (0.0 < fVar5) {
      fVar5 = -fVar5;
      *unaff_EDI = fVar5 * fVar9 + *unaff_EDI;
      unaff_EDI[1] = local_14 * fVar5 + unaff_EDI[1];
      unaff_EDI[2] = fVar5 * local_10 + unaff_EDI[2];
    }
    if (0.0 < fVar10) {
      fVar10 = -fVar10;
      unaff_EDI[3] = fVar10 * fVar9 + unaff_EDI[3];
      unaff_EDI[4] = local_14 * fVar10 + unaff_EDI[4];
      unaff_EDI[5] = fVar10 * local_10 + unaff_EDI[5];
    }
    if (0.0 < fVar12) {
      fVar12 = -fVar12;
      unaff_EDI[6] = fVar12 * fVar9 + unaff_EDI[6];
      unaff_EDI[7] = local_14 * fVar12 + unaff_EDI[7];
      unaff_EDI[8] = fVar12 * local_10 + unaff_EDI[8];
    }
    if (0.0 < fVar11) {
      fVar11 = -fVar11;
      unaff_EDI[9] = fVar11 * fVar9 + unaff_EDI[9];
      unaff_EDI[10] = local_14 * fVar11 + unaff_EDI[10];
      unaff_EDI[0xb] = fVar11 * local_10 + unaff_EDI[0xb];
    }
    if (0.0 < fVar14) {
      fVar14 = -fVar14;
      unaff_EDI[0xc] = fVar14 * fVar9 + unaff_EDI[0xc];
      unaff_EDI[0xd] = local_14 * fVar14 + unaff_EDI[0xd];
      unaff_EDI[0xe] = fVar14 * local_10 + unaff_EDI[0xe];
    }
    if (0.0 < fVar13) {
      fVar13 = -fVar13;
      unaff_EDI[0xf] = fVar13 * fVar9 + unaff_EDI[0xf];
      unaff_EDI[0x10] = local_14 * fVar13 + unaff_EDI[0x10];
      unaff_EDI[0x11] = fVar13 * local_10 + unaff_EDI[0x11];
    }
    if (0.0 < fVar15) {
      fVar15 = -fVar15;
      unaff_EDI[0x12] = fVar15 * fVar9 + unaff_EDI[0x12];
      unaff_EDI[0x13] = local_14 * fVar15 + unaff_EDI[0x13];
      unaff_EDI[0x14] = fVar15 * local_10 + unaff_EDI[0x14];
    }
    if (0.0 < fVar8) {
      fVar8 = -fVar8;
      unaff_EDI[0x15] = fVar8 * fVar9 + unaff_EDI[0x15];
      unaff_EDI[0x16] = local_14 * fVar8 + unaff_EDI[0x16];
      unaff_EDI[0x17] = fVar8 * local_10 + unaff_EDI[0x17];
    }
    fVar5 = (*unaff_EDI + unaff_EDI[3] + unaff_EDI[6] + unaff_EDI[9] + unaff_EDI[0xc] +
             unaff_EDI[0xf] + unaff_EDI[0x12] + unaff_EDI[0x15]) * 0.125;
    fVar8 = (unaff_EDI[1] + unaff_EDI[4] + unaff_EDI[7] + unaff_EDI[10] + unaff_EDI[0xd] +
             unaff_EDI[0x10] + unaff_EDI[0x13] + unaff_EDI[0x16]) * 0.125;
    fVar2 = (unaff_EDI[2] + unaff_EDI[5] + unaff_EDI[8] + unaff_EDI[0xb] + unaff_EDI[0xe] +
             unaff_EDI[0x11] + unaff_EDI[0x14] + unaff_EDI[0x17]) * 0.125;
    *unaff_EDI = *unaff_EDI - fVar5;
    unaff_EDI[1] = unaff_EDI[1] - fVar8;
    unaff_EDI[2] = unaff_EDI[2] - fVar2;
    fVar10 = unaff_EDI[1] * 0.587 + *unaff_EDI * 0.299 + unaff_EDI[2] * 0.114;
    unaff_EDI[3] = unaff_EDI[3] - fVar5;
    unaff_EDI[4] = unaff_EDI[4] - fVar8;
    unaff_EDI[5] = unaff_EDI[5] - fVar2;
    fVar17 = unaff_EDI[3] * 0.299 + unaff_EDI[4] * 0.587 + unaff_EDI[5] * 0.114;
    unaff_EDI[6] = unaff_EDI[6] - fVar5;
    unaff_EDI[7] = unaff_EDI[7] - fVar8;
    unaff_EDI[8] = unaff_EDI[8] - fVar2;
    fVar16 = unaff_EDI[6] * 0.299 + unaff_EDI[7] * 0.587 + unaff_EDI[8] * 0.114;
    unaff_EDI[9] = unaff_EDI[9] - fVar5;
    unaff_EDI[10] = unaff_EDI[10] - fVar8;
    unaff_EDI[0xb] = unaff_EDI[0xb] - fVar2;
    fVar15 = unaff_EDI[9] * 0.299 + unaff_EDI[10] * 0.587 + unaff_EDI[0xb] * 0.114;
    unaff_EDI[0xc] = unaff_EDI[0xc] - fVar5;
    unaff_EDI[0xd] = unaff_EDI[0xd] - fVar8;
    unaff_EDI[0xe] = unaff_EDI[0xe] - fVar2;
    fVar14 = unaff_EDI[0xc] * 0.299 + unaff_EDI[0xd] * 0.587 + unaff_EDI[0xe] * 0.114;
    unaff_EDI[0xf] = unaff_EDI[0xf] - fVar5;
    unaff_EDI[0x10] = unaff_EDI[0x10] - fVar8;
    unaff_EDI[0x11] = unaff_EDI[0x11] - fVar2;
    fVar13 = unaff_EDI[0xf] * 0.299 + unaff_EDI[0x10] * 0.587 + unaff_EDI[0x11] * 0.114;
    unaff_EDI[0x12] = unaff_EDI[0x12] - fVar5;
    unaff_EDI[0x13] = unaff_EDI[0x13] - fVar8;
    unaff_EDI[0x14] = unaff_EDI[0x14] - fVar2;
    fVar12 = unaff_EDI[0x12] * 0.299 + unaff_EDI[0x13] * 0.587 + unaff_EDI[0x14] * 0.114;
    unaff_EDI[0x15] = unaff_EDI[0x15] - fVar5;
    unaff_EDI[0x16] = unaff_EDI[0x16] - fVar8;
    unaff_EDI[0x17] = unaff_EDI[0x17] - fVar2;
    fVar11 = unaff_EDI[0x15] * 0.299 + unaff_EDI[0x16] * 0.587 + unaff_EDI[0x17] * 0.114;
    fVar3 = fVar3 - (fVar11 * fVar11 +
                    fVar12 * fVar12 +
                    fVar13 * fVar13 +
                    fVar14 * fVar14 +
                    fVar15 * fVar15 + fVar16 * fVar16 + fVar17 * fVar17 + fVar10 * fVar10);
    uVar20 = (ushort)(fVar3 < 0.020000001) << 8 | (ushort)NAN(fVar3) << 10 |
             (ushort)(fVar3 == 0.020000001) << 0xe;
    if (fVar3 >= 0.020000001) {
      iVar19 = in_EAX * 0x68;
      *(float *)(iVar19 + 0x24 + param_1) = fVar5 * 0.5;
      *(float *)(iVar19 + 0x28 + param_1) = fVar8 * 0.5;
      puVar1 = (undefined4 *)(iVar19 + param_1);
      *puVar1 = 3;
      puVar1[0xb] = fVar2 * 0.5;
      puVar1[1] = fVar9 * 0.5;
      puVar1[2] = local_14 * 0.5;
      puVar1[3] = local_10 * 0.5;
      fVar3 = fVar7 * fVar7 + fVar6 * fVar6 + fVar4 * fVar4;
      if (fVar3 >= 1.0000001e-06) {
        puVar1[0x10] = -fVar7;
        puVar1[0x11] = -fVar6;
        puVar1[0x12] = -fVar4;
        return CONCAT31((uint3)(byte)(fVar3 < 1.0000001e-06 |
                                      (byte)((ushort)((ushort)NAN(fVar3) << 10) >> 8) |
                                     (byte)((ushort)((ushort)(fVar3 == 1.0000001e-06) << 0xe) >> 8))
                        ,1);
      }
      puVar1[0x10] = 0;
      puVar1[0x11] = 0;
      puVar1[0x12] = 0x3f800000;
      return 1;
    }
  }
  return (uint)uVar20;
}


