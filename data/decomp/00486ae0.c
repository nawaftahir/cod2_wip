
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float * __fastcall FUN_00486ae0(undefined4 param_1,float *param_2,float param_3)

{
  float fVar1;
  float10 fVar2;
  float *unaff_ESI;
  float10 fVar3;
  
  fVar2 = (float10)fcos((float10)(param_3 * _DAT_00556b8c));
  fVar3 = (float10)fsin((float10)(param_3 * _DAT_00556b8c));
  param_2[3] = (float)fVar2;
  fVar1 = (float)fVar3;
  *param_2 = fVar1 * *unaff_ESI;
  param_2[1] = fVar1 * unaff_ESI[1];
  param_2[2] = fVar1 * unaff_ESI[2];
  return param_2 + 3;
}

