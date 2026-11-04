// 1000fd70 size=279 FUN_1000fd70

void FUN_1000fd70(void)

{
  float *in_ECX;
  float *unaff_ESI;
  float10 fVar1;
  
  fVar1 = (float10)fpatan((float10)in_ECX[1],(float10)*in_ECX);
  fVar1 = fVar1 * (float10)0.47746482 - (float10)0.75;
  if ((float10)0.0 <= fVar1) {
    if ((float10)3.0 < fVar1) {
      fVar1 = fVar1 - (float10)3.0;
    }
  }
  else {
    fVar1 = fVar1 + (float10)3.0;
  }
  if ((float10)1.0 <= fVar1) {
    if ((float10)2.0 <= fVar1) {
      unaff_ESI[2] = 0.0;
      unaff_ESI[1] = (float)(fVar1 - (float10)2.0);
      unaff_ESI[3] = (float)((float10)1.0 - (fVar1 - (float10)2.0));
    }
    else {
      unaff_ESI[1] = 0.0;
      unaff_ESI[2] = (float)((float10)1.0 - (fVar1 - (float10)1.0));
      unaff_ESI[3] = (float)(fVar1 - (float10)1.0);
    }
  }
  else {
    unaff_ESI[3] = 0.0;
    unaff_ESI[1] = (float)((float10)1.0 - fVar1);
    unaff_ESI[2] = (float)fVar1;
  }
  fVar1 = (float10)FUN_100f8e10();
  fVar1 = (float10)1.0 - fVar1 * (float10)1.0467734;
  *unaff_ESI = (float)fVar1;
  if ((float10)0.0 <= fVar1) {
    if (fVar1 <= (float10)1.0) {
      *unaff_ESI = (float)fVar1;
    }
    else {
      *unaff_ESI = 1.0;
    }
  }
  else {
    *unaff_ESI = 0.0;
  }
  unaff_ESI[1] = (1.0 - *unaff_ESI) * unaff_ESI[1];
  unaff_ESI[2] = (1.0 - *unaff_ESI) * unaff_ESI[2];
  unaff_ESI[3] = (1.0 - *unaff_ESI) * unaff_ESI[3];
  return;
}


