// 10059530 size=525 FUN_10059530

void FUN_10059530(float *param_1,float param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float10 fVar4;
  float *in_ECX;
  int iVar5;
  float *unaff_EBX;
  float *pfVar6;
  float *pfVar7;
  float10 fVar8;
  float local_b4;
  float local_b0;
  float local_ac;
  float local_9c;
  float local_98 [3];
  float local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  float local_78 [4];
  float local_68;
  float local_64;
  float local_60;
  float local_5c;
  float local_58;
  float *local_54;
  float local_50;
  float *local_4c;
  float local_48 [5];
  float local_34;
  float local_30;
  float local_2c;
  
  fVar1 = in_ECX[2];
  fVar2 = *in_ECX;
  fVar3 = in_ECX[1];
  FUN_10059f50();
  local_78[0] = local_b4;
  local_78[3] = local_b0;
  local_78[1] = local_b0 * fVar1 - local_ac * fVar3;
  local_60 = local_ac;
  local_78[2] = fVar2;
  local_64 = fVar3;
  local_68 = local_ac * fVar2 - local_b4 * fVar1;
  local_5c = local_b4 * fVar3 - local_b0 * fVar2;
  local_50 = param_2 * 0.017453292;
  local_58 = fVar1;
  pfVar6 = local_78;
  pfVar7 = local_48;
  for (iVar5 = 9; iVar5 != 0; iVar5 = iVar5 + -1) {
    *pfVar7 = *pfVar6;
    pfVar6 = pfVar6 + 1;
    pfVar7 = pfVar7 + 1;
  }
  local_98[1] = 0.0;
  local_88 = 0;
  local_84 = 0;
  local_80 = 0;
  local_54 = &local_9c;
  local_7c = 0x3f800000;
  local_4c = local_98;
  fVar4 = (float10)fcos((float10)local_50);
  fVar8 = (float10)fsin((float10)local_50);
  local_9c = (float)fVar4;
  local_98[0] = (float)fVar8;
  local_98[2] = -local_98[0];
  local_8c = local_9c;
  local_48[3] = local_78[1];
  local_34 = local_5c;
  local_30 = fVar2;
  local_2c = fVar3;
  FUN_1005a430();
  FUN_1005a430();
  *param_1 = local_78[1] * unaff_EBX[1] + local_78[2] * unaff_EBX[2] + local_78[0] * *unaff_EBX;
  param_1[1] = local_68 * unaff_EBX[1] + local_64 * unaff_EBX[2] + local_78[3] * *unaff_EBX;
  param_1[2] = local_5c * unaff_EBX[1] + local_58 * unaff_EBX[2] + local_60 * *unaff_EBX;
  return;
}


