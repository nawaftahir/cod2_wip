// 1002a9c0 size=242 FUN_1002a9c0

void FUN_1002a9c0(int param_1,float param_2,float *param_3,undefined4 param_4,float param_5,
                 float *param_6)

{
  float *pfVar1;
  float *pfVar2;
  float10 fVar3;
  float local_c;
  float local_8;
  float local_4;
  
  param_6[4] = param_2;
  param_6[1] = *param_3;
  param_6[2] = param_3[1];
  param_6[3] = param_3[2];
  FUN_10059d80();
  pfVar1 = param_6 + 8;
  param_6[0xe] = 0.0 - local_c;
  pfVar2 = param_6 + 5;
  param_6[0xf] = 0.0 - local_8;
  param_6[0x10] = 0.0 - local_4;
  param_6[0x14] = param_5;
  FUN_1002a360(pfVar1);
  *pfVar2 = param_5 * *pfVar2 + *param_3;
  param_6[6] = param_5 * param_6[6] + param_3[1];
  param_6[7] = param_5 * param_6[7] + param_3[2];
  *pfVar1 = param_5 * *pfVar1 + *param_3;
  param_6[9] = param_5 * param_6[9] + param_3[1];
  param_6[10] = param_5 * param_6[10] + param_3[2];
  fVar3 = (float10)(*(code *)RI_XModelGetLodForDist)(param_2);
  *param_6 = (float)(fVar3 * (float10)param_5);
  FUN_1002a250(param_1,*(undefined4 *)(param_1 + 0xc),param_6,pfVar2,pfVar1);
  return;
}


