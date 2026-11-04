extern unsigned int DAT_101ce61c;
extern unsigned int DAT_101d61ac;
extern unsigned int DAT_101d61c8;
extern unsigned int DAT_101d620c;


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float R_GetFarPlaneDist(void)

{
  float fVar1;
  
  fVar1 = (float)*(float *)(DAT_101ce61c + 8);
  if ((((fVar1 == (float)0.0) && (DAT_101d620c != 0)) && (DAT_101d61c8 != '\0')) &&
     (DAT_101d61ac == 1)) {
    fVar1 = (float)_DAT_101d61c0;
  }
  if (fVar1 < (float)_DAT_101ce5f4) {
    fVar1 = (float)_DAT_101ce5f4;
  }
  return fVar1;
}


