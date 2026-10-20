
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_004a1140(float param_1)

{
  float fVar1;
  
  fVar1 = param_1;
  param_1 = 1.0;
  if (fVar1 < _DAT_00556a70) {
    param_1 = -1.0;
  }
  return (float10)param_1;
}

