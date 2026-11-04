// 1003b0c0 size=580 FUN_1003b0c0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003b0c0(float param_1,float param_2,undefined4 param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float *pfVar7;
  int iVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 local_40 [16];
  
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1003aed0(param_1,param_2,param_3);
    return;
  }
  fVar4 = _DAT_1072de00 * *(float *)(DAT_101d1b9c + 0x1b8) +
          _DAT_1072de10 * *(float *)(DAT_101d1b9c + 0x1bc) +
          DAT_1072ddf0 * *(float *)(DAT_101d1b9c + 0x1b4);
  fVar5 = _DAT_1072de04 * *(float *)(DAT_101d1b9c + 0x1b8) +
          _DAT_1072de14 * *(float *)(DAT_101d1b9c + 0x1bc) +
          DAT_1072ddf4 * *(float *)(DAT_101d1b9c + 0x1b4);
  fVar6 = _DAT_1072de08 * *(float *)(DAT_101d1b9c + 0x1b8) +
          _DAT_1072de18 * *(float *)(DAT_101d1b9c + 0x1bc) +
          _DAT_1072ddf8 * *(float *)(DAT_101d1b9c + 0x1b4);
  fVar1 = *(float *)(DAT_101d1b9c + 0x1bc);
  fVar2 = *(float *)(DAT_101d1b9c + 0x1b8);
  fVar3 = *(float *)(DAT_101d1b9c + 0x1b4);
  puVar9 = &DAT_10191368;
  puVar10 = local_40;
  for (iVar8 = 0x10; iVar8 != 0; iVar8 = iVar8 + -1) {
    *puVar10 = *puVar9;
    puVar9 = puVar9 + 1;
    puVar10 = puVar10 + 1;
  }
  fVar1 = _DAT_1072ddfc * fVar3 + _DAT_1072de0c * fVar2 + _DAT_1072de1c * fVar1;
  puVar9 = local_40;
  puVar10 = (undefined4 *)(&DAT_1072e220 + DAT_10730550 * 0xcd0);
  for (iVar8 = 0x10; iVar8 != 0; iVar8 = iVar8 + -1) {
    *puVar10 = *puVar9;
    puVar9 = puVar9 + 1;
    puVar10 = puVar10 + 1;
  }
  FUN_1003e130();
  FUN_1003df90(local_40);
  pfVar7 = (float *)FUN_1003ad40(param_3);
  fVar2 = fVar1 * -0.001;
  *pfVar7 = fVar4;
  param_2 = fVar1 * param_2;
  pfVar7[1] = fVar5;
  pfVar7[2] = fVar6;
  pfVar7[3] = fVar1;
  pfVar7[0x10] = fVar4;
  pfVar7[0x11] = fVar5;
  param_1 = fVar1 * param_1;
  pfVar7[0x12] = fVar6;
  pfVar7[0x13] = fVar1;
  pfVar7[0x20] = fVar4;
  pfVar7[0x21] = fVar5;
  pfVar7[0x22] = fVar6;
  pfVar7[0x23] = fVar1;
  pfVar7[0x32] = fVar6;
  pfVar7[0x33] = fVar1;
  pfVar7[0x30] = fVar4;
  pfVar7[0x31] = fVar5;
  *pfVar7 = param_1 + *pfVar7;
  pfVar7[1] = param_2 + pfVar7[1];
  pfVar7[2] = fVar2 + pfVar7[2];
  pfVar7[0x10] = param_1 + pfVar7[0x10];
  pfVar7[0x11] = pfVar7[0x11] - param_2;
  pfVar7[0x12] = fVar2 + pfVar7[0x12];
  pfVar7[0x20] = pfVar7[0x20] - param_1;
  pfVar7[0x21] = pfVar7[0x21] - param_2;
  pfVar7[0x22] = fVar2 + pfVar7[0x22];
  pfVar7[0x30] = pfVar7[0x30] - param_1;
  pfVar7[0x31] = param_2 + pfVar7[0x31];
  pfVar7[0x32] = fVar2 + pfVar7[0x32];
  return;
}


