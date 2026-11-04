// 10059250 size=144 FUN_10059250

void FUN_10059250(void)

{
  float fVar1;
  float *unaff_ESI;
  float *unaff_EDI;
  float10 fVar2;
  
  fVar2 = (float10)FUN_1010a920(unaff_EDI[2] * unaff_EDI[2] +
                                unaff_EDI[1] * unaff_EDI[1] + *unaff_EDI * *unaff_EDI);
  if ((float)fVar2 != 0.0) {
    fVar1 = 1.0 / (float)fVar2;
    *unaff_ESI = fVar1 * *unaff_EDI;
    unaff_ESI[1] = fVar1 * unaff_EDI[1];
    unaff_ESI[2] = fVar1 * unaff_EDI[2];
    return;
  }
  *unaff_ESI = 0.0;
  unaff_ESI[1] = 0.0;
  unaff_ESI[2] = 0.0;
  return;
}


