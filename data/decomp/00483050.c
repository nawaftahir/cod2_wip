
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00483050(float param_1,float param_2,float param_3,float param_4)

{
  float fVar1;
  double dVar2;
  double dVar3;
  
  fVar1 = param_1 - param_2;
  param_3 = param_3 * param_4;
  if (fVar1 <= _DAT_00556a70) {
    param_3 = -param_3;
  }
  dVar2 = _fabs((double)fVar1);
  if (_DAT_00556b34 < (float)dVar2) {
    dVar2 = _fabs((double)param_3);
    dVar3 = _fabs((double)fVar1);
    if ((float)dVar2 <= (float)dVar3) {
      return (float10)param_3 + (float10)param_2;
    }
  }
  return (float10)param_1;
}

