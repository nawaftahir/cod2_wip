// 100401a0 size=986 FUN_100401a0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100401a0(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  float fVar3;
  float fVar4;
  short sVar5;
  int iVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  int iVar10;
  float *pfVar11;
  int iVar12;
  float10 fVar13;
  float10 fVar14;
  float local_44;
  undefined4 local_40;
  float local_30;
  float local_18;
  float local_14;
  float local_10;
  
  fVar7 = (*(float *)(param_1 + 0x3c) + *(float *)(param_1 + 0x48)) * 0.5 - _DAT_1072ddcc;
  fVar8 = (*(float *)(param_1 + 0x40) + *(float *)(param_1 + 0x4c)) * 0.5 - _DAT_1072ddd0;
  fVar9 = (*(float *)(param_1 + 0x44) + *(float *)(param_1 + 0x50)) * 0.5 - _DAT_1072ddd4;
  fVar13 = (float10)FUN_100590b0();
  iVar10 = (int)ROUND((float)(((float10)1.0 -
                              (fVar13 * (float10)_DAT_1072ddd8 + (float10)_DAT_1072dddc) *
                              (float10)0.0009765625) * (float10)32.0) + 9.313226e-10);
  if (iVar10 < 8) {
    iVar10 = 8;
  }
  else if (0x20 < iVar10) {
    iVar10 = 0x20;
  }
  iVar6 = iVar10 * 2;
  if ((0x154a < iVar6 + 2 + DAT_1072d9d4) || (0x100000 < DAT_1072d9d0 + iVar10 * 6)) {
    FUN_1002df40();
  }
  FUN_100590b0();
  FUN_100597d0();
  iVar1 = DAT_1072d9d4 * 0x24;
  puVar2 = (undefined4 *)(&DAT_106d3200 + iVar1);
  local_40 = (float)CONCAT13(*(undefined1 *)(param_1 + 0x5b),
                             CONCAT21(CONCAT11(*(undefined1 *)(param_1 + 0x58),
                                               *(undefined1 *)(param_1 + 0x59)),
                                      *(undefined1 *)(param_1 + 0x5a)));
  local_30 = 0.0;
  fVar14 = (float10)((1.0 / (float)iVar10) * 6.2831855);
  fVar13 = (float10)fcos(fVar14);
  fVar14 = (float10)fsin(fVar14);
  iVar12 = 0;
  local_44 = 0.0;
  if (0 < iVar6) {
    fVar3 = 1.0;
    pfVar11 = (float *)(&DAT_106d322c + iVar1);
    do {
      fVar4 = local_44 * *(float *)(param_1 + 0x68);
      pfVar11[-0xb] = local_18 * fVar4 + *(float *)(param_1 + 0x3c);
      pfVar11[-10] = local_14 * fVar4 + *(float *)(param_1 + 0x40);
      pfVar11[-9] = local_10 * fVar4 + *(float *)(param_1 + 0x44);
      fVar4 = fVar3 * *(float *)(param_1 + 0x68);
      pfVar11[-0xb] = fVar7 * fVar4 + pfVar11[-0xb];
      pfVar11[-10] = fVar8 * fVar4 + pfVar11[-10];
      pfVar11[-9] = fVar9 * fVar4 + pfVar11[-9];
      pfVar11[-3] = 1.0;
      pfVar11[-5] = local_40;
      pfVar11[-4] = local_30;
      fVar4 = local_44 * *(float *)(param_1 + 100);
      pfVar11[-2] = local_18 * fVar4 + *(float *)(param_1 + 0x48);
      pfVar11[-1] = local_14 * fVar4 + *(float *)(param_1 + 0x4c);
      *pfVar11 = local_10 * fVar4 + *(float *)(param_1 + 0x50);
      fVar4 = fVar3 * *(float *)(param_1 + 100);
      pfVar11[-2] = fVar7 * fVar4 + pfVar11[-2];
      pfVar11[-1] = fVar8 * fVar4 + pfVar11[-1];
      *pfVar11 = fVar9 * fVar4 + *pfVar11;
      pfVar11[6] = 0.0;
      pfVar11[4] = local_40;
      pfVar11[5] = local_30;
      local_30 = local_30 + 1.0 / (float)iVar10;
      sVar5 = (short)iVar12;
      fVar4 = fVar3 * (float)fVar14;
      fVar3 = fVar3 * (float)fVar13 - local_44 * (float)fVar14;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + sVar5;
      *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar5 + 1 + (short)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar5 + 3 + (short)DAT_1072d9d4;
      DAT_1072d9d0 = DAT_1072d9d0 + 3;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar5 + 3 + (short)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar5 + 2 + (short)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + sVar5;
      DAT_1072d9d0 = DAT_1072d9d0 + 3;
      iVar12 = iVar12 + 2;
      pfVar11 = pfVar11 + 0x12;
      local_44 = local_44 * (float)fVar13 + fVar4;
    } while (iVar12 < iVar6);
  }
  puVar2[iVar12 * 9] = *puVar2;
  puVar2[iVar12 * 9 + 1] = *(undefined4 *)(&DAT_106d3204 + iVar1);
  puVar2[iVar12 * 9 + 2] = *(undefined4 *)(&DAT_106d3208 + iVar1);
  puVar2[iVar12 * 9 + 7] = 0x3f800000;
  puVar2[iVar12 * 9 + 8] = 0x3f800000;
  puVar2[iVar12 * 9 + 6] = local_40;
  puVar2[iVar12 * 9 + 9] = *(undefined4 *)(&DAT_106d3224 + iVar1);
  puVar2[iVar12 * 9 + 10] = *(undefined4 *)(&DAT_106d3228 + iVar1);
  puVar2[iVar12 * 9 + 0xb] = *(undefined4 *)(&DAT_106d322c + iVar1);
  puVar2[iVar12 * 9 + 0x10] = 0x3f800000;
  puVar2[iVar12 * 9 + 0x11] = 0;
  puVar2[iVar12 * 9 + 0xf] = local_40;
  DAT_1072d9d4 = DAT_1072d9d4 + 2 + iVar6;
  return;
}


