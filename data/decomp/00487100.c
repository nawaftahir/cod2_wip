
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_00487100(float *param_1,float *param_2)

{
  float local_8;
  
  local_8 = *param_1;
  if (local_8 < param_1[1]) {
    local_8 = param_1[1];
  }
  if (local_8 < param_1[2]) {
    local_8 = param_1[2];
  }
  if (local_8 == _DAT_00556a70) {
    *param_2 = 0.0;
    param_2[1] = 0.0;
    param_2[2] = 0.0;
    return (float10)local_8;
  }
  *param_2 = *param_1 / local_8;
  param_2[1] = param_1[1] / local_8;
  param_2[2] = param_1[2] / local_8;
  return (float10)local_8;
}

