// 100363a0 size=784 FUN_100363a0

float10 FUN_100363a0(undefined4 param_1,float *param_2,undefined4 *param_3)

{
  float fVar1;
  float fVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  undefined4 *puVar8;
  float local_3c;
  float local_18 [4];
  float local_8;
  float local_4;
  
  iVar4 = (int)ROUND((*param_2 - -131072.0) - 0.5) >> 5;
  local_18[1] = (*param_2 - -131072.0) * 0.03125 - (float)iVar4;
  local_18[0] = 1.0 - local_18[1];
  local_18[3] = (param_2[1] - -131072.0) * 0.03125 -
                (float)((int)ROUND((param_2[1] - -131072.0) - 0.5) >> 5);
  local_18[2] = 1.0 - local_18[3];
  iVar6 = (int)ROUND((param_2[2] - -131072.0) - 0.5) >> 6;
  local_4 = (param_2[2] - -131072.0) * 0.015625 - (float)iVar6;
  local_8 = 1.0 - local_4;
  if (*(char *)(DAT_101ce818 + 8) != '\0') {
    FUN_100359c0();
    FUN_10035940();
  }
  puVar8 = param_3;
  for (iVar5 = 0x18; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar8 = 0;
    puVar8 = puVar8 + 1;
  }
  fVar2 = 0.0;
  local_3c = 0.0;
  uVar7 = 0;
  do {
    iVar5 = FUN_10036040(param_1,uVar7,param_2);
    if (iVar5 != 0) {
      fVar1 = local_18[((int)uVar7 >> 1 & 1U) + 2] * local_18[((int)uVar7 >> 2 & 1U) + 4] *
              local_18[uVar7 & 1];
      fVar2 = fVar1 + fVar2;
      FUN_10036100(fVar1);
      if ((*(byte *)(iVar5 + 4) & 1) != 0) {
        local_3c = fVar1 + local_3c;
      }
    }
    uVar7 = uVar7 + 1;
  } while ((int)uVar7 < 8);
  if (fVar2 < 0.98) {
    if (fVar2 == 0.0) {
      cVar3 = FUN_10036320(iVar4 + (uint)(0.5 < local_18[1]),(uint)(0.5 < local_4) + iVar6,param_3);
      if (cVar3 != '\0') {
        return (float10)local_3c;
      }
      *param_3 = 0;
      param_3[2] = 0;
      param_3[1] = 0x3f800000;
      param_3[3] = 0x3f800000;
      param_3[4] = 0;
      param_3[5] = 0x3f800000;
      param_3[6] = 0;
      param_3[7] = 0x3f800000;
      param_3[8] = 0;
      param_3[9] = 0;
      param_3[10] = 0x3f800000;
      param_3[0xb] = 0x3f800000;
      param_3[0xc] = 0;
      param_3[0xd] = 0;
      param_3[0xe] = 0x3f800000;
      param_3[0xf] = 0x3f800000;
      param_3[0x10] = 0;
      param_3[0x11] = 0;
      param_3[0x12] = 0;
      param_3[0x13] = 0;
      param_3[0x14] = 0x3f800000;
      param_3[0x15] = 0x3f800000;
      param_3[0x16] = 0x3f800000;
      param_3[0x17] = 0x3f800000;
      return (float10)local_3c;
    }
    local_3c = (1.0 / fVar2) * local_3c;
    FUN_100361e0(1.0 / fVar2);
  }
  return (float10)local_3c;
}


