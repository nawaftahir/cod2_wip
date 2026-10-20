
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00483610(float param_1)

{
  float fVar1;
  float10 fVar2;
  
  fVar2 = (float10)FUN_004db9f4((double)param_1);
  fVar1 = (float)fVar2;
  if ((fVar1 <= _DAT_00556b74) && (_DAT_00556c5c <= fVar1)) {
    return (float10)fVar1;
  }
  return (float10)_DAT_00556b74;
}

