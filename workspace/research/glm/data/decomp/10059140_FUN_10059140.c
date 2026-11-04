// 10059140 size=107 FUN_10059140

void FUN_10059140(void)

{
  float fVar1;
  float *unaff_ESI;
  float10 fVar2;
  
  fVar2 = (float10)FUN_1010a920(unaff_ESI[1] * unaff_ESI[1] + *unaff_ESI * *unaff_ESI);
  if ((float)fVar2 != 0.0) {
    fVar1 = 1.0 / (float)fVar2;
    *unaff_ESI = fVar1 * *unaff_ESI;
    unaff_ESI[1] = fVar1 * unaff_ESI[1];
  }
  return;
}


