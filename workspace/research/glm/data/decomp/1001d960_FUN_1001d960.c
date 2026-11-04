// 1001d960 size=143 FUN_1001d960

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_1001d960(float param_1)

{
  float *in_EAX;
  float10 fVar1;
  float fVar2;
  
  fVar1 = (float10)FUN_1010a920((_DAT_101d7e80 - in_EAX[1]) * (_DAT_101d7e80 - in_EAX[1]) +
                                (_DAT_101d7e84 - in_EAX[2]) * (_DAT_101d7e84 - in_EAX[2]) +
                                (_DAT_101d7e7c - *in_EAX) * (_DAT_101d7e7c - *in_EAX));
  fVar2 = _DAT_101d7e88 * (float)fVar1 + _DAT_101d7e8c;
  if (param_1 != 0.0) {
    fVar2 = fVar2 / param_1;
  }
  return (float10)fVar2;
}


