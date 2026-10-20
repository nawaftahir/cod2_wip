
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_00499b90(float *param_1,int param_2)

{
  float10 fVar1;
  float local_8;
  
  if (param_1[5] == _DAT_00556a70) {
    fVar1 = (float10)*param_1;
  }
  else {
    local_8 = (float)(param_2 - (int)param_1[3]) / param_1[5];
    if ((float)_DAT_00556a68 <= local_8) {
      if ((float)_DAT_00556a60 < local_8) {
        local_8 = 1.0;
      }
    }
    else {
      local_8 = 0.0;
    }
    *param_1 = (param_1[2] - param_1[1]) * local_8 + param_1[1];
    fVar1 = (float10)*param_1;
    if ((float)_DAT_00556a60 == local_8) {
      param_1[5] = 0.0;
      return fVar1;
    }
  }
  return fVar1;
}

