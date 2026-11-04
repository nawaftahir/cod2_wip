
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00499550(void)

{
  float *unaff_ESI;
  float10 fVar1;
  float local_8;
  
  if ((*unaff_ESI == _DAT_00556a70) && (unaff_ESI[1] == _DAT_00556a70)) {
    if (_DAT_00556a70 < unaff_ESI[2]) {
      return (float10)90.0;
    }
    return (float10)270.0;
  }
  fVar1 = (float10)FUN_004d98d4((double)(*unaff_ESI * *unaff_ESI + unaff_ESI[1] * unaff_ESI[1]));
  fVar1 = (float10)FUN_004d8070((double)unaff_ESI[2],(double)(float)fVar1);
  local_8 = ((float)fVar1 * _DAT_00556a90) / _DAT_00556b74;
  if (local_8 < _DAT_00556a70) {
    local_8 = local_8 + _DAT_00556a94;
  }
  return (float10)local_8;
}

