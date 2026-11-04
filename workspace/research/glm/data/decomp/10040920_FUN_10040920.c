// 10040920 size=721 FUN_10040920

void FUN_10040920(float param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5,undefined4 param_6)

{
  int iVar1;
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
  short sVar14;
  float *in_EAX;
  float *unaff_EBX;
  
  fVar8 = (in_EAX[2] - DAT_1072ddc8[2]) * (unaff_EBX[1] - DAT_1072ddc8[1]) -
          (in_EAX[1] - DAT_1072ddc8[1]) * (unaff_EBX[2] - DAT_1072ddc8[2]);
  fVar9 = (unaff_EBX[2] - DAT_1072ddc8[2]) * (*in_EAX - *DAT_1072ddc8) -
          (in_EAX[2] - DAT_1072ddc8[2]) * (*unaff_EBX - *DAT_1072ddc8);
  fVar10 = (in_EAX[1] - DAT_1072ddc8[1]) * (*unaff_EBX - *DAT_1072ddc8) -
           (unaff_EBX[1] - DAT_1072ddc8[1]) * (*in_EAX - *DAT_1072ddc8);
  FUN_100590b0();
  fVar11 = fVar8 * param_1;
  fVar12 = fVar9 * param_1;
  param_1 = fVar10 * param_1;
  fVar2 = *in_EAX;
  fVar3 = *unaff_EBX;
  fVar4 = in_EAX[1];
  fVar5 = unaff_EBX[1];
  fVar6 = in_EAX[2];
  fVar7 = unaff_EBX[2];
  FUN_100590b0();
  fVar13 = (fVar6 - fVar7) * fVar9 - (fVar4 - fVar5) * fVar10;
  fVar6 = fVar10 * (fVar2 - fVar3) - (fVar6 - fVar7) * fVar8;
  fVar2 = (fVar4 - fVar5) * fVar8 - fVar9 * (fVar2 - fVar3);
  if ((0x154a < DAT_1072d9d4 + 4) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  iVar1 = DAT_1072d9d4 * 0x24;
  *(float *)(&DAT_106d3200 + iVar1) = fVar11 + *unaff_EBX;
  *(float *)(&DAT_106d3204 + iVar1) = fVar12 + unaff_EBX[1];
  *(float *)(&DAT_106d3208 + iVar1) = param_1 + unaff_EBX[2];
  *(float *)(&DAT_106d3224 + iVar1) = *unaff_EBX - fVar11;
  *(float *)(&DAT_106d3228 + iVar1) = unaff_EBX[1] - fVar12;
  *(float *)(&DAT_106d322c + iVar1) = unaff_EBX[2] - param_1;
  *(float *)(&DAT_106d3248 + iVar1) = fVar11 + *in_EAX;
  *(float *)(&DAT_106d324c + iVar1) = fVar12 + in_EAX[1];
  *(float *)(&DAT_106d3250 + iVar1) = param_1 + in_EAX[2];
  *(float *)(&DAT_106d326c + iVar1) = *in_EAX - fVar11;
  *(float *)(&DAT_106d3270 + iVar1) = in_EAX[1] - fVar12;
  *(float *)(&DAT_106d3274 + iVar1) = in_EAX[2] - param_1;
  *(float *)(&DAT_106d320c + iVar1) = fVar13;
  *(float *)(&DAT_106d3210 + iVar1) = fVar6;
  *(float *)(&DAT_106d3214 + iVar1) = fVar2;
  *(float *)(&DAT_106d3230 + iVar1) = fVar13;
  *(float *)(&DAT_106d3234 + iVar1) = fVar6;
  *(float *)(&DAT_106d3238 + iVar1) = fVar2;
  *(float *)(&DAT_106d3254 + iVar1) = fVar13;
  *(float *)(&DAT_106d3258 + iVar1) = fVar6;
  *(float *)(&DAT_106d325c + iVar1) = fVar2;
  *(float *)(&DAT_106d3278 + iVar1) = fVar13;
  *(float *)(&DAT_106d327c + iVar1) = fVar6;
  *(float *)(&DAT_106d3280 + iVar1) = fVar2;
  *(undefined4 *)(&DAT_106d321c + iVar1) = param_3;
  *(undefined4 *)(&DAT_106d3220 + iVar1) = param_4;
  *(undefined4 *)(&DAT_106d3244 + iVar1) = param_4;
  *(undefined4 *)(&DAT_106d3240 + iVar1) = param_5;
  *(undefined4 *)(&DAT_106d3264 + iVar1) = param_3;
  *(undefined4 *)(&DAT_106d3268 + iVar1) = param_6;
  *(undefined4 *)(&DAT_106d328c + iVar1) = param_6;
  *(undefined4 *)(&DAT_106d3288 + iVar1) = param_5;
  *(undefined4 *)(&DAT_106d3218 + iVar1) = param_2;
  *(undefined4 *)(&DAT_106d323c + iVar1) = param_2;
  *(undefined4 *)(&DAT_106d3260 + iVar1) = param_2;
  *(undefined4 *)(&DAT_106d3284 + iVar1) = param_2;
  sVar14 = (short)DAT_1072d9d4;
  *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar14;
  *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar14 + 1;
  *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar14 + 2;
  *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = sVar14 + 2;
  *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = sVar14 + 1;
  *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = sVar14 + 3;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  return;
}


