
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_004871b0(float param_1,float param_2,float param_3)

{
  undefined4 local_8;
  
  local_8 = param_2;
  if (_DAT_00556a90 < param_2 - param_1) {
    local_8 = param_2 - _DAT_00556a94;
  }
  if (local_8 - param_1 < _DAT_00556a98) {
    local_8 = local_8 + _DAT_00556a94;
  }
  return (float10)((local_8 - param_1) * param_3 + param_1);
}

