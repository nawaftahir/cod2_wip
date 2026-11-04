// 10059970 size=211 FUN_10059970

float10 FUN_10059970(void)

{
  float *unaff_ESI;
  float10 fVar1;
  float fVar2;
  
  if ((unaff_ESI[1] == 0.0) && (*unaff_ESI == 0.0)) {
    if (0.0 < unaff_ESI[2]) {
      return (float10)270.0;
    }
    return (float10)90.0;
  }
  fVar2 = unaff_ESI[1];
  fVar1 = (float10)FUN_1010a920(fVar2,*unaff_ESI * *unaff_ESI + fVar2 * fVar2);
  fVar1 = (float10)FUN_1010aaaa((float)fVar1,unaff_ESI[2]);
  fVar2 = ((float)fVar1 * -180.0) / 3.1415927;
  if (fVar2 < 0.0) {
    fVar2 = fVar2 + 360.0;
  }
  return (float10)fVar2;
}


