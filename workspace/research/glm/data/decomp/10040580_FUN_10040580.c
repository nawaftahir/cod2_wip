// 10040580 size=916 FUN_10040580

void FUN_10040580(float param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5,undefined4 param_6)

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
  short sVar12;
  float *in_EAX;
  int iVar13;
  float *unaff_EBX;
  
  fVar1 = (in_EAX[2] - DAT_1072ddc8[2]) * (unaff_EBX[1] - DAT_1072ddc8[1]) -
          (in_EAX[1] - DAT_1072ddc8[1]) * (unaff_EBX[2] - DAT_1072ddc8[2]);
  fVar2 = (unaff_EBX[2] - DAT_1072ddc8[2]) * (*in_EAX - *DAT_1072ddc8) -
          (in_EAX[2] - DAT_1072ddc8[2]) * (*unaff_EBX - *DAT_1072ddc8);
  fVar3 = (in_EAX[1] - DAT_1072ddc8[1]) * (*unaff_EBX - *DAT_1072ddc8) -
          (unaff_EBX[1] - DAT_1072ddc8[1]) * (*in_EAX - *DAT_1072ddc8);
  FUN_100590b0();
  fVar4 = fVar1 * param_1;
  fVar5 = fVar2 * param_1;
  param_1 = fVar3 * param_1;
  fVar6 = *in_EAX - *unaff_EBX;
  fVar7 = in_EAX[1] - unaff_EBX[1];
  fVar8 = in_EAX[2] - unaff_EBX[2];
  FUN_100590b0();
  fVar9 = fVar8 * fVar2 - fVar7 * fVar3;
  fVar10 = fVar3 * fVar6 - fVar8 * fVar1;
  fVar11 = fVar7 * fVar1 - fVar2 * fVar6;
  if ((0x154a < DAT_1072d9d4 + 4) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  iVar13 = DAT_1072d9d4 * 0x40;
  *(float *)(&DAT_106d3200 + iVar13) = fVar4 + *unaff_EBX;
  *(float *)(&DAT_106d3204 + iVar13) = fVar5 + unaff_EBX[1];
  *(float *)(&DAT_106d3208 + iVar13) = param_1 + unaff_EBX[2];
  *(float *)(&DAT_106d3240 + iVar13) = *unaff_EBX - fVar4;
  *(float *)(&DAT_106d3244 + iVar13) = unaff_EBX[1] - fVar5;
  *(float *)(&DAT_106d3248 + iVar13) = unaff_EBX[2] - param_1;
  *(float *)(&DAT_106d3280 + iVar13) = fVar4 + *in_EAX;
  *(float *)(&DAT_106d3284 + iVar13) = fVar5 + in_EAX[1];
  *(float *)(&DAT_106d3288 + iVar13) = param_1 + in_EAX[2];
  *(float *)(&DAT_106d32c0 + iVar13) = *in_EAX - fVar4;
  *(float *)(&DAT_106d32c4 + iVar13) = in_EAX[1] - fVar5;
  *(float *)(&DAT_106d32c8 + iVar13) = in_EAX[2] - param_1;
  *(undefined4 *)(&DAT_106d320c + iVar13) = 0x3f800000;
  *(undefined4 *)(&DAT_106d324c + iVar13) = 0x3f800000;
  *(undefined4 *)(&DAT_106d328c + iVar13) = 0x3f800000;
  *(undefined4 *)(&DAT_106d32cc + iVar13) = 0x3f800000;
  *(float *)(&DAT_106d3210 + iVar13) = fVar9;
  *(float *)(&DAT_106d3214 + iVar13) = fVar10;
  *(float *)(&DAT_106d3218 + iVar13) = fVar11;
  *(float *)(&DAT_106d3250 + iVar13) = fVar9;
  *(float *)(&DAT_106d3254 + iVar13) = fVar10;
  *(float *)(&DAT_106d3258 + iVar13) = fVar11;
  *(float *)(&DAT_106d3290 + iVar13) = fVar9;
  *(float *)(&DAT_106d3294 + iVar13) = fVar10;
  *(float *)(&DAT_106d3298 + iVar13) = fVar11;
  *(float *)(&DAT_106d32d0 + iVar13) = fVar9;
  *(float *)(&DAT_106d32d4 + iVar13) = fVar10;
  *(float *)(&DAT_106d32d8 + iVar13) = fVar11;
  *(float *)(&DAT_106d3228 + iVar13) = fVar6;
  *(float *)(&DAT_106d322c + iVar13) = fVar7;
  *(float *)(&DAT_106d3230 + iVar13) = fVar8;
  *(float *)(&DAT_106d3268 + iVar13) = fVar6;
  *(float *)(&DAT_106d326c + iVar13) = fVar7;
  *(float *)(&DAT_106d3270 + iVar13) = fVar8;
  *(float *)(&DAT_106d32a8 + iVar13) = fVar6;
  *(float *)(&DAT_106d32ac + iVar13) = fVar7;
  *(float *)(&DAT_106d32b0 + iVar13) = fVar8;
  *(float *)(&DAT_106d32e8 + iVar13) = fVar6;
  *(float *)(&DAT_106d32ec + iVar13) = fVar7;
  *(float *)(&DAT_106d32f0 + iVar13) = fVar8;
  *(float *)(&DAT_106d3234 + iVar13) = fVar1;
  *(float *)(&DAT_106d3238 + iVar13) = fVar2;
  *(float *)(&DAT_106d323c + iVar13) = fVar3;
  *(float *)(&DAT_106d3274 + iVar13) = fVar1;
  *(float *)(&DAT_106d3278 + iVar13) = fVar2;
  *(float *)(&DAT_106d327c + iVar13) = fVar3;
  *(float *)(&DAT_106d32b4 + iVar13) = fVar1;
  *(float *)(&DAT_106d32b8 + iVar13) = fVar2;
  *(float *)(&DAT_106d32bc + iVar13) = fVar3;
  *(float *)(&DAT_106d32f4 + iVar13) = fVar1;
  *(float *)(&DAT_106d32f8 + iVar13) = fVar2;
  *(float *)(&DAT_106d32fc + iVar13) = fVar3;
  *(undefined4 *)(&DAT_106d3220 + iVar13) = param_3;
  *(undefined4 *)(&DAT_106d3224 + iVar13) = param_4;
  *(undefined4 *)(&DAT_106d3260 + iVar13) = param_5;
  *(undefined4 *)(&DAT_106d3264 + iVar13) = param_4;
  *(undefined4 *)(&DAT_106d32a0 + iVar13) = param_3;
  *(undefined4 *)(&DAT_106d32a4 + iVar13) = param_6;
  *(undefined4 *)(&DAT_106d32e4 + iVar13) = param_6;
  *(undefined4 *)(&DAT_106d32e0 + iVar13) = param_5;
  *(undefined4 *)(&DAT_106d321c + iVar13) = param_2;
  *(undefined4 *)(&DAT_106d325c + iVar13) = param_2;
  *(undefined4 *)(&DAT_106d329c + iVar13) = param_2;
  *(undefined4 *)(&DAT_106d32dc + iVar13) = param_2;
  sVar12 = (short)DAT_1072d9d4;
  *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar12;
  *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar12 + 1;
  *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar12 + 2;
  *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = sVar12 + 2;
  *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = sVar12 + 1;
  *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = sVar12 + 3;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  return;
}


