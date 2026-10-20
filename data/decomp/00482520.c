
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00482520(float param_1,float param_2,float param_3)

{
  if (param_1 - param_3 < _DAT_00556a70) {
    param_3 = param_1;
  }
  if (_DAT_00556a70 <= param_2 - param_1) {
    return (float10)param_2;
  }
  return (float10)param_3;
}

