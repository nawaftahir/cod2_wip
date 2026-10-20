
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * FUN_00482b70(float param_1,float param_2)

{
  float10 fVar1;
  float fVar2;
  float *unaff_ESI;
  float10 fVar3;
  float10 fVar4;
  
  fVar2 = (param_1 + param_1) - _DAT_00556a58;
  fVar3 = (float10)FUN_004d98d4((double)(_DAT_00556a58 - fVar2 * fVar2));
  fVar1 = (float10)fcos((float10)(param_2 * _DAT_00556b94));
  fVar4 = (float10)fsin((float10)(param_2 * _DAT_00556b94));
  unaff_ESI[2] = fVar2;
  *unaff_ESI = (float)fVar1 * (float)fVar3;
  unaff_ESI[1] = (float)fVar4 * (float)fVar3;
  return &param_1;
}

