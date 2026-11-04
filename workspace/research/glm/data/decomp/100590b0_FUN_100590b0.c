// 100590b0 size=130 FUN_100590b0

void FUN_100590b0(void)

{
  float fVar1;
  float *unaff_ESI;
  float10 fVar2;
  
  fVar2 = (float10)FUN_1010a920(unaff_ESI[2] * unaff_ESI[2] +
                                unaff_ESI[1] * unaff_ESI[1] + *unaff_ESI * *unaff_ESI);
  if ((float)fVar2 != 0.0) {
    fVar1 = 1.0 / (float)fVar2;
    *unaff_ESI = fVar1 * *unaff_ESI;
    unaff_ESI[1] = fVar1 * unaff_ESI[1];
    unaff_ESI[2] = fVar1 * unaff_ESI[2];
  }
  return;
}


