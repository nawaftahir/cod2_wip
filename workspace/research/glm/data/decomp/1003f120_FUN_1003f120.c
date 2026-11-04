// 1003f120 size=752 FUN_1003f120

void FUN_1003f120(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

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
  uint uVar13;
  short sVar14;
  int iVar15;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((0x154a < (int)(DAT_1072d9d4 + 4)) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  uVar13 = DAT_1072d9d4;
  sVar14 = (short)DAT_1072d9d4;
  *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar14;
  *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar14 + 1;
  *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar14 + 3;
  *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = sVar14 + 3;
  *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = sVar14 + 1;
  *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = sVar14 + 2;
  fVar1 = *unaff_EBX;
  fVar2 = *unaff_EDI;
  fVar3 = unaff_EDI[1];
  iVar15 = (uVar13 & 0xffff) * 0x40;
  fVar4 = unaff_EBX[1];
  fVar5 = unaff_EBX[2];
  fVar6 = unaff_EDI[2];
  fVar7 = *unaff_EBX;
  fVar8 = *unaff_EDI;
  fVar9 = unaff_EBX[1];
  fVar10 = unaff_EDI[1];
  fVar11 = unaff_EBX[2];
  fVar12 = unaff_EDI[2];
  *(float *)(&DAT_106d3200 + iVar15) = fVar1 + fVar2 + *unaff_ESI;
  *(float *)(&DAT_106d3204 + iVar15) = fVar3 + fVar4 + unaff_ESI[1];
  *(float *)(&DAT_106d3208 + iVar15) = fVar5 + fVar6 + unaff_ESI[2];
  *(float *)(&DAT_106d3240 + iVar15) = *unaff_ESI - (fVar7 - fVar8);
  *(float *)(&DAT_106d3244 + iVar15) = unaff_ESI[1] - (fVar9 - fVar10);
  *(float *)(&DAT_106d3248 + iVar15) = unaff_ESI[2] - (fVar11 - fVar12);
  *(float *)(&DAT_106d3280 + iVar15) = *unaff_ESI - (fVar1 + fVar2);
  *(float *)(&DAT_106d3284 + iVar15) = unaff_ESI[1] - (fVar3 + fVar4);
  *(float *)(&DAT_106d3288 + iVar15) = unaff_ESI[2] - (fVar5 + fVar6);
  *(float *)(&DAT_106d32c0 + iVar15) = (fVar7 - fVar8) + *unaff_ESI;
  *(float *)(&DAT_106d32c4 + iVar15) = (fVar9 - fVar10) + unaff_ESI[1];
  *(float *)(&DAT_106d32c8 + iVar15) = (fVar11 - fVar12) + unaff_ESI[2];
  *(undefined4 *)(&DAT_106d320c + iVar15) = 0x3f800000;
  *(undefined4 *)(&DAT_106d324c + iVar15) = 0x3f800000;
  *(undefined4 *)(&DAT_106d328c + iVar15) = 0x3f800000;
  *(undefined4 *)(&DAT_106d32cc + iVar15) = 0x3f800000;
  fVar1 = -*(float *)(DAT_1072ddc8 + 0xc);
  fVar2 = -*(float *)(DAT_1072ddc8 + 0x10);
  fVar3 = -*(float *)(DAT_1072ddc8 + 0x14);
  *(float *)(&DAT_106d3210 + iVar15) = fVar1;
  *(float *)(&DAT_106d3214 + iVar15) = fVar2;
  *(float *)(&DAT_106d3218 + iVar15) = fVar3;
  *(float *)(&DAT_106d3250 + iVar15) = fVar1;
  *(float *)(&DAT_106d3254 + iVar15) = fVar2;
  *(float *)(&DAT_106d3258 + iVar15) = fVar3;
  *(float *)(&DAT_106d3290 + iVar15) = fVar1;
  *(float *)(&DAT_106d3294 + iVar15) = fVar2;
  *(float *)(&DAT_106d3298 + iVar15) = fVar3;
  *(float *)(&DAT_106d32d8 + iVar15) = fVar3;
  *(float *)(&DAT_106d32d0 + iVar15) = fVar1;
  *(float *)(&DAT_106d32d4 + iVar15) = fVar2;
  fVar1 = *unaff_EDI;
  fVar2 = unaff_EDI[1];
  fVar3 = unaff_EDI[2];
  *(float *)(&DAT_106d3228 + iVar15) = fVar1;
  *(float *)(&DAT_106d322c + iVar15) = fVar2;
  *(float *)(&DAT_106d3230 + iVar15) = fVar3;
  *(float *)(&DAT_106d3268 + iVar15) = fVar1;
  *(float *)(&DAT_106d326c + iVar15) = fVar2;
  *(float *)(&DAT_106d3270 + iVar15) = fVar3;
  *(float *)(&DAT_106d32a8 + iVar15) = fVar1;
  *(float *)(&DAT_106d32ac + iVar15) = fVar2;
  *(float *)(&DAT_106d32b0 + iVar15) = fVar3;
  *(float *)(&DAT_106d32f0 + iVar15) = fVar3;
  *(float *)(&DAT_106d32e8 + iVar15) = fVar1;
  *(float *)(&DAT_106d32ec + iVar15) = fVar2;
  fVar1 = -*unaff_EBX;
  fVar2 = -unaff_EBX[1];
  fVar3 = -unaff_EBX[2];
  *(float *)(&DAT_106d3234 + iVar15) = fVar1;
  *(float *)(&DAT_106d3238 + iVar15) = fVar2;
  *(float *)(&DAT_106d323c + iVar15) = fVar3;
  *(float *)(&DAT_106d3274 + iVar15) = fVar1;
  *(float *)(&DAT_106d3278 + iVar15) = fVar2;
  *(float *)(&DAT_106d327c + iVar15) = fVar3;
  *(float *)(&DAT_106d32b4 + iVar15) = fVar1;
  *(float *)(&DAT_106d32b8 + iVar15) = fVar2;
  *(float *)(&DAT_106d32bc + iVar15) = fVar3;
  *(float *)(&DAT_106d32f4 + iVar15) = fVar1;
  *(float *)(&DAT_106d32f8 + iVar15) = fVar2;
  *(float *)(&DAT_106d32fc + iVar15) = fVar3;
  *(undefined4 *)(&DAT_106d3224 + iVar15) = param_3;
  *(undefined4 *)(&DAT_106d3220 + iVar15) = param_2;
  *(undefined4 *)(&DAT_106d3264 + iVar15) = param_3;
  *(undefined4 *)(&DAT_106d3260 + iVar15) = param_4;
  *(undefined4 *)(&DAT_106d32a4 + iVar15) = param_5;
  *(undefined4 *)(&DAT_106d32a0 + iVar15) = param_4;
  *(undefined4 *)(&DAT_106d32e4 + iVar15) = param_5;
  *(undefined4 *)(&DAT_106d32e0 + iVar15) = param_2;
  *(undefined4 *)(&DAT_106d321c + iVar15) = param_1;
  *(undefined4 *)(&DAT_106d325c + iVar15) = param_1;
  *(undefined4 *)(&DAT_106d329c + iVar15) = param_1;
  *(undefined4 *)(&DAT_106d32dc + iVar15) = param_1;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  return;
}


