
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_004865a0(undefined4 param_1,float *param_2,float param_3)

{
  float fVar1;
  float10 fVar2;
  float10 fVar3;
  
  fVar2 = (float10)fcos((float10)(param_3 * _DAT_00556b88));
  fVar3 = (float10)fsin((float10)(param_3 * _DAT_00556b88));
  fVar1 = *param_2;
  *param_2 = (float)fVar2 * *param_2 - (float)fVar3 * param_2[1];
  param_2[1] = (float)fVar2 * param_2[1] + (float)fVar3 * fVar1;
  return;
}

