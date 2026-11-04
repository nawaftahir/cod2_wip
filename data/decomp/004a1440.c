
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_004a1440(float *param_1)

{
  float fVar1;
  
  fVar1 = param_1[3] * param_1[3] +
          param_1[2] * param_1[2] + param_1[1] * param_1[1] + *param_1 * *param_1;
  if (fVar1 != _DAT_00556a70) {
    param_1[7] = _DAT_00556ab0 / fVar1;
    return;
  }
  param_1[3] = 1.0;
  param_1[7] = 2.0;
  return;
}

