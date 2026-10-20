
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * FUN_00482b10(float param_1,float param_2)

{
  float10 fVar1;
  float *unaff_ESI;
  float10 fVar2;
  float10 fVar3;
  
  fVar2 = (float10)FUN_004d98d4((double)param_1);
  fVar1 = (float10)fcos((float10)(param_2 * _DAT_00556b94));
  fVar3 = (float10)fsin((float10)(param_2 * _DAT_00556b94));
  *unaff_ESI = (float)fVar1 * (float)fVar2;
  unaff_ESI[1] = (float)fVar3 * (float)fVar2;
  return &param_1;
}

