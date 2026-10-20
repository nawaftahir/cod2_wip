
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00486c00(undefined4 param_1,float *param_2,float param_3)

{
  float10 fVar1;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)(param_3 * _DAT_00556b88));
  fVar2 = (float10)fsin((float10)(param_3 * _DAT_00556b88));
  param_2[1] = -(float)fVar2;
  param_2[3] = (float)fVar2;
  *param_2 = (float)fVar1;
  param_2[2] = 0.0;
  param_2[4] = (float)fVar1;
  param_2[5] = 0.0;
  param_2[6] = 0.0;
  param_2[7] = 0.0;
  param_2[8] = 1.0;
  return;
}

