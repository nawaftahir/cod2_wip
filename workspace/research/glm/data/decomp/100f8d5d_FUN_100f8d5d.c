// 100f8d5d size=174 FUN_100f8d5d

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_100f8d5d(int param_1,uint param_2)

{
  uint in_EAX;
  bool in_ZF;
  short in_FPUControlWord;
  float10 in_ST0;
  float10 extraout_ST0;
  float10 fVar1;
  
  if (in_ZF) {
    if (((in_EAX & 0xfffff) != 0) || (fVar1 = _DAT_101a5230, param_1 != 0)) {
      fVar1 = (float10)FUN_10102f5c();
    }
LAB_100f8dec:
    if (DAT_101add90 == 0) {
      fVar1 = (float10)__startOneArgErrorHandling();
      return fVar1;
    }
  }
  else {
    if (in_FPUControlWord != 0x27f) {
      in_EAX = FUN_10102f45();
      in_ST0 = extraout_ST0;
    }
    if (in_EAX < 0x3ff00000) {
      fVar1 = (float10)fpatan(in_ST0,SQRT(((float10)1 - in_ST0) * ((float10)1 + in_ST0)));
    }
    else {
      fVar1 = _DAT_101a5230;
      if ((0x3ff00000 < in_EAX) || ((param_2 & 0xfffff) != 0 || param_1 != 0)) goto LAB_100f8dec;
      fVar1 = _DAT_101a523a;
      if ((param_2 & 0x80000000) != 0) {
        fVar1 = -_DAT_101a523a;
      }
    }
    if (DAT_101add90 == 0) {
      fVar1 = (float10)__math_exit();
      return fVar1;
    }
  }
  return fVar1;
}


