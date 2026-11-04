
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_004891d0(float *param_1,float *param_2)

{
  float fVar1;
  float10 fVar2;
  float local_8;
  
  local_8 = *param_1;
  if (local_8 < param_1[1]) {
    local_8 = param_1[1];
  }
  if (local_8 < param_1[2]) {
    local_8 = param_1[2];
  }
  if (local_8 == _DAT_00556a70) {
    fVar2 = (float10)_DAT_00556a70;
    param_2[2] = 1.0;
    param_2[1] = 1.0;
    *param_2 = 1.0;
    return fVar2;
  }
  fVar1 = _DAT_00556a58 / local_8;
  *param_2 = fVar1 * *param_1;
  param_2[1] = fVar1 * param_1[1];
  param_2[2] = fVar1 * param_1[2];
  return (float10)local_8;
}

