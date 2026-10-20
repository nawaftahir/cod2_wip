
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0042b790(undefined4 param_1,int param_2,float param_3,float param_4,float param_5)

{
  param_5 = param_4 * param_5;
  if ((_DAT_00556a58 < param_5) || (_DAT_00556a70 <= param_5)) {
    param_4 = 1.0;
    if (param_5 <= _DAT_00556a58) {
      param_4 = param_5;
    }
  }
  else {
    param_4 = 0.0;
  }
  return ((float10)_DAT_00556a58 - (float10)param_4) * (float10)param_3 +
         (float10)param_4 * (float10)*(float *)(&DAT_0109c514 + param_2 * 4);
}

