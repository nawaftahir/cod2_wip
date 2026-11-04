// 1000aa60 size=82 R_GetFarPlaneDist

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 R_GetFarPlaneDist(void)

{
  float10 fVar1;
  
  fVar1 = (float10)*(float *)(DAT_101ce61c + 8);
  if ((((fVar1 == (float10)0.0) && (DAT_101d620c != 0)) && (DAT_101d61c8 != '\0')) &&
     (DAT_101d61ac == 1)) {
    fVar1 = (float10)_DAT_101d61c0;
  }
  if (fVar1 < (float10)_DAT_101ce5f4) {
    fVar1 = (float10)_DAT_101ce5f4;
  }
  return fVar1;
}


