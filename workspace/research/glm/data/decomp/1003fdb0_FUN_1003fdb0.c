// 1003fdb0 size=1005 FUN_1003fdb0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003fdb0(int param_1)

{
  undefined4 *puVar1;
  float fVar2;
  float fVar3;
  short sVar4;
  int iVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  int iVar9;
  float *pfVar10;
  int iVar11;
  int iVar12;
  float10 fVar13;
  float10 fVar14;
  float local_44;
  undefined4 local_40;
  float local_30;
  float local_18;
  float local_14;
  float local_10;
  
  fVar6 = (*(float *)(param_1 + 0x3c) + *(float *)(param_1 + 0x48)) * 0.5 - _DAT_1072ddcc;
  fVar7 = (*(float *)(param_1 + 0x40) + *(float *)(param_1 + 0x4c)) * 0.5 - _DAT_1072ddd0;
  fVar8 = (*(float *)(param_1 + 0x44) + *(float *)(param_1 + 0x50)) * 0.5 - _DAT_1072ddd4;
  fVar13 = (float10)FUN_100590b0();
  iVar9 = (int)ROUND((float)(((float10)1.0 -
                             (fVar13 * (float10)_DAT_1072ddd8 + (float10)_DAT_1072dddc) *
                             (float10)0.0009765625) * (float10)32.0) + 9.313226e-10);
  if (iVar9 < 8) {
    iVar9 = 8;
  }
  else if (0x20 < iVar9) {
    iVar9 = 0x20;
  }
  iVar5 = iVar9 * 2;
  if ((0x154a < iVar5 + 2 + DAT_1072d9d4) || (0x100000 < DAT_1072d9d0 + iVar9 * 6)) {
    FUN_1002df40();
  }
  FUN_100590b0();
  FUN_100597d0();
  iVar12 = DAT_1072d9d4 * 0x40;
  local_40 = (float)CONCAT13(*(undefined1 *)(param_1 + 0x5b),
                             CONCAT21(CONCAT11(*(undefined1 *)(param_1 + 0x58),
                                               *(undefined1 *)(param_1 + 0x59)),
                                      *(undefined1 *)(param_1 + 0x5a)));
  local_30 = 0.0;
  fVar14 = (float10)((1.0 / (float)iVar9) * 6.2831855);
  fVar13 = (float10)fcos(fVar14);
  fVar14 = (float10)fsin(fVar14);
  iVar11 = 0;
  local_44 = 0.0;
  if (0 < iVar5) {
    fVar2 = 1.0;
    pfVar10 = (float *)(&DAT_106d3248 + iVar12);
    do {
      fVar3 = local_44 * *(float *)(param_1 + 0x68);
      pfVar10[-0x12] = local_18 * fVar3 + *(float *)(param_1 + 0x3c);
      pfVar10[-0x11] = local_14 * fVar3 + *(float *)(param_1 + 0x40);
      pfVar10[-0x10] = local_10 * fVar3 + *(float *)(param_1 + 0x44);
      fVar3 = fVar2 * *(float *)(param_1 + 0x68);
      pfVar10[-0x12] = fVar6 * fVar3 + pfVar10[-0x12];
      pfVar10[-0x11] = fVar7 * fVar3 + pfVar10[-0x11];
      pfVar10[-0x10] = fVar8 * fVar3 + pfVar10[-0x10];
      pfVar10[-0xf] = 1.0;
      pfVar10[-9] = 1.0;
      pfVar10[-0xb] = local_40;
      pfVar10[-10] = local_30;
      fVar3 = local_44 * *(float *)(param_1 + 100);
      pfVar10[-2] = local_18 * fVar3 + *(float *)(param_1 + 0x48);
      pfVar10[-1] = local_14 * fVar3 + *(float *)(param_1 + 0x4c);
      *pfVar10 = local_10 * fVar3 + *(float *)(param_1 + 0x50);
      fVar3 = fVar2 * *(float *)(param_1 + 100);
      pfVar10[-2] = fVar6 * fVar3 + pfVar10[-2];
      pfVar10[-1] = fVar7 * fVar3 + pfVar10[-1];
      *pfVar10 = fVar8 * fVar3 + *pfVar10;
      pfVar10[1] = 1.0;
      pfVar10[7] = 0.0;
      pfVar10[5] = local_40;
      pfVar10[6] = local_30;
      local_30 = local_30 + 1.0 / (float)iVar9;
      fVar3 = fVar2 * (float)fVar14;
      fVar2 = fVar2 * (float)fVar13 - local_44 * (float)fVar14;
      sVar4 = (short)iVar11;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + sVar4;
      *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar4 + 1 + (short)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar4 + 3 + (short)DAT_1072d9d4;
      DAT_1072d9d0 = DAT_1072d9d0 + 3;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar4 + 3 + (short)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar4 + 2 + (short)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + sVar4;
      DAT_1072d9d0 = DAT_1072d9d0 + 3;
      iVar11 = iVar11 + 2;
      pfVar10 = pfVar10 + 0x20;
      local_44 = local_44 * (float)fVar13 + fVar3;
    } while (iVar11 < iVar5);
  }
  puVar1 = (undefined4 *)((int)(&DAT_106d3200 + iVar12) + iVar11 * 0x10 * 4);
  *puVar1 = *(undefined4 *)(&DAT_106d3200 + iVar12);
  puVar1[1] = *(undefined4 *)(&DAT_106d3204 + iVar12);
  puVar1[2] = *(undefined4 *)(&DAT_106d3208 + iVar12);
  puVar1[3] = *(undefined4 *)(&DAT_106d320c + iVar12);
  puVar1[8] = 0x3f800000;
  puVar1[9] = 0x3f800000;
  puVar1[7] = local_40;
  puVar1[0x10] = *(undefined4 *)(&DAT_106d3240 + iVar12);
  puVar1[0x11] = *(undefined4 *)(&DAT_106d3244 + iVar12);
  puVar1[0x12] = *(undefined4 *)(&DAT_106d3248 + iVar12);
  puVar1[0x13] = *(undefined4 *)(&DAT_106d324c + iVar12);
  puVar1[0x18] = 0x3f800000;
  puVar1[0x19] = 0;
  puVar1[0x17] = local_40;
  DAT_1072d9d4 = DAT_1072d9d4 + 2 + iVar5;
  return;
}


