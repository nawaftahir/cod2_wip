
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_004994b0(float *param_1)

{
  float10 fVar1;
  float local_8;
  
  if ((param_1[1] == _DAT_00556a70) && (*param_1 == _DAT_00556a70)) {
    return (float10)0.0;
  }
  fVar1 = (float10)FUN_004d8070((double)param_1[1],(double)*param_1);
  local_8 = ((float)fVar1 * _DAT_00556a90) / _DAT_00556b74;
  if (local_8 < _DAT_00556a70) {
    local_8 = local_8 + _DAT_00556a94;
  }
  return (float10)local_8;
}

