
void FUN_00454ab0(void)

{
  int iVar1;
  float *unaff_EDI;
  
  unaff_EDI[0x20] =
       (unaff_EDI[8] - unaff_EDI[5]) * (unaff_EDI[1] - unaff_EDI[4]) -
       (unaff_EDI[7] - unaff_EDI[4]) * (unaff_EDI[2] - unaff_EDI[5]);
  unaff_EDI[0x21] =
       (unaff_EDI[2] - unaff_EDI[5]) * (unaff_EDI[6] - unaff_EDI[3]) -
       (unaff_EDI[8] - unaff_EDI[5]) * (*unaff_EDI - unaff_EDI[3]);
  unaff_EDI[0x22] =
       (unaff_EDI[7] - unaff_EDI[4]) * (*unaff_EDI - unaff_EDI[3]) -
       (unaff_EDI[1] - unaff_EDI[4]) * (unaff_EDI[6] - unaff_EDI[3]);
  iVar1 = FUN_00439620();
  if (iVar1 != 0) {
    _printf("WARNING: brush plane with no normal\n");
  }
  FUN_00483b50();
  *(double *)(unaff_EDI + 0x24) =
       (double)(unaff_EDI[0x20] * unaff_EDI[3] +
               unaff_EDI[0x21] * unaff_EDI[4] + unaff_EDI[0x22] * unaff_EDI[5]);
  return;
}

