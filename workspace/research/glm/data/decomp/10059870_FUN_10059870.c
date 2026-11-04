// 10059870 size=134 FUN_10059870

float10 FUN_10059870(void)

{
  float *in_ECX;
  float10 fVar1;
  float fVar2;
  
  if ((in_ECX[1] == 0.0) && (*in_ECX == 0.0)) {
    return (float10)0.0;
  }
  fVar1 = (float10)FUN_1010aaaa(in_ECX[1],*in_ECX);
  fVar2 = ((float)fVar1 * 180.0) / 3.1415927;
  if (fVar2 < 0.0) {
    fVar2 = fVar2 + 360.0;
  }
  return (float10)fVar2;
}


