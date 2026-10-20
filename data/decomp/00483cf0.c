
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00483cf0(void)

{
  float fVar1;
  float *unaff_ESI;
  float *unaff_EDI;
  float10 fVar2;
  
  fVar2 = (float10)FUN_004d98d4((double)(unaff_EDI[2] * unaff_EDI[2] +
                                        unaff_EDI[1] * unaff_EDI[1] + *unaff_EDI * *unaff_EDI));
  if ((float)fVar2 != _DAT_00556a70) {
    fVar1 = _DAT_00556a58 / (float)fVar2;
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

