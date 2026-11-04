
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00483b50(void)

{
  float fVar1;
  float *unaff_ESI;
  float10 fVar2;
  
  fVar2 = (float10)FUN_004d98d4((double)(unaff_ESI[2] * unaff_ESI[2] +
                                        unaff_ESI[1] * unaff_ESI[1] + *unaff_ESI * *unaff_ESI));
  if ((float)fVar2 != _DAT_00556a70) {
    fVar1 = _DAT_00556a58 / (float)fVar2;
    *unaff_ESI = fVar1 * *unaff_ESI;
    unaff_ESI[1] = fVar1 * unaff_ESI[1];
    unaff_ESI[2] = fVar1 * unaff_ESI[2];
  }
  return;
}

