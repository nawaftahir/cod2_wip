// 1003f410 size=515 FUN_1003f410

void FUN_1003f410(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

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
  uint uVar14;
  int iVar15;
  short sVar16;
  float *unaff_EBX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((0x154a < (int)(DAT_1072d9d4 + 4)) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  uVar14 = DAT_1072d9d4;
  sVar16 = (short)DAT_1072d9d4;
  *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar16;
  *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar16 + 1;
  *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar16 + 3;
  *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = sVar16 + 3;
  *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = sVar16 + 1;
  *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = sVar16 + 2;
  iVar15 = DAT_1072ddc8;
  fVar2 = *unaff_EBX;
  fVar3 = *unaff_EDI;
  fVar4 = unaff_EDI[1];
  fVar5 = unaff_EBX[1];
  iVar1 = (uVar14 & 0xffff) * 0x24;
  fVar6 = unaff_EBX[2];
  fVar7 = unaff_EDI[2];
  fVar8 = *unaff_EBX;
  fVar9 = *unaff_EDI;
  fVar10 = unaff_EBX[1];
  fVar11 = unaff_EDI[1];
  fVar12 = unaff_EBX[2];
  fVar13 = unaff_EDI[2];
  *(float *)(&DAT_106d3200 + iVar1) = fVar2 + fVar3 + *unaff_ESI;
  *(float *)(&DAT_106d3204 + iVar1) = fVar4 + fVar5 + unaff_ESI[1];
  *(float *)(&DAT_106d3208 + iVar1) = fVar6 + fVar7 + unaff_ESI[2];
  *(float *)(&DAT_106d3224 + iVar1) = *unaff_ESI - (fVar8 - fVar9);
  *(float *)(&DAT_106d3228 + iVar1) = unaff_ESI[1] - (fVar10 - fVar11);
  *(float *)(&DAT_106d322c + iVar1) = unaff_ESI[2] - (fVar12 - fVar13);
  *(float *)(&DAT_106d3248 + iVar1) = *unaff_ESI - (fVar2 + fVar3);
  *(float *)(&DAT_106d324c + iVar1) = unaff_ESI[1] - (fVar4 + fVar5);
  *(float *)(&DAT_106d3250 + iVar1) = unaff_ESI[2] - (fVar6 + fVar7);
  *(float *)(&DAT_106d326c + iVar1) = (fVar8 - fVar9) + *unaff_ESI;
  *(float *)(&DAT_106d3270 + iVar1) = (fVar10 - fVar11) + unaff_ESI[1];
  *(float *)(&DAT_106d3274 + iVar1) = (fVar12 - fVar13) + unaff_ESI[2];
  fVar2 = -*(float *)(iVar15 + 0xc);
  fVar3 = -*(float *)(iVar15 + 0x10);
  fVar4 = -*(float *)(iVar15 + 0x14);
  *(float *)(&DAT_106d320c + iVar1) = fVar2;
  *(float *)(&DAT_106d3210 + iVar1) = fVar3;
  *(float *)(&DAT_106d3214 + iVar1) = fVar4;
  *(float *)(&DAT_106d3230 + iVar1) = fVar2;
  *(float *)(&DAT_106d3234 + iVar1) = fVar3;
  *(float *)(&DAT_106d3238 + iVar1) = fVar4;
  *(float *)(&DAT_106d3254 + iVar1) = fVar2;
  *(float *)(&DAT_106d3258 + iVar1) = fVar3;
  *(float *)(&DAT_106d325c + iVar1) = fVar4;
  *(float *)(&DAT_106d3280 + iVar1) = fVar4;
  *(float *)(&DAT_106d3278 + iVar1) = fVar2;
  *(float *)(&DAT_106d327c + iVar1) = fVar3;
  *(undefined4 *)(&DAT_106d3220 + iVar1) = param_3;
  *(undefined4 *)(&DAT_106d321c + iVar1) = param_2;
  *(undefined4 *)(&DAT_106d3244 + iVar1) = param_3;
  *(undefined4 *)(&DAT_106d3240 + iVar1) = param_4;
  *(undefined4 *)(&DAT_106d3268 + iVar1) = param_5;
  *(undefined4 *)(&DAT_106d3264 + iVar1) = param_4;
  *(undefined4 *)(&DAT_106d328c + iVar1) = param_5;
  *(undefined4 *)(&DAT_106d3288 + iVar1) = param_2;
  *(undefined4 *)(&DAT_106d3218 + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d323c + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d3260 + iVar1) = param_1;
  *(undefined4 *)(&DAT_106d3284 + iVar1) = param_1;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  return;
}


