
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00487350(float param_1)

{
  if (param_1 < _DAT_00556a70) {
    do {
      param_1 = param_1 + _DAT_00556a94;
    } while (param_1 < _DAT_00556a70);
    return (float10)param_1;
  }
  for (; _DAT_00556a94 <= param_1; param_1 = param_1 - _DAT_00556a94) {
  }
  return (float10)param_1;
}

