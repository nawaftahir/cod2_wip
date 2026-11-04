// 1005c800 size=107 FUN_1005c800

void FUN_1005c800(void)

{
  float *in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  if (*in_EDX < *in_ECX) {
    *in_ECX = *in_EDX;
  }
  if (*unaff_ESI < *unaff_EDI) {
    *unaff_ESI = *unaff_EDI;
  }
  if (in_EDX[1] < in_ECX[1]) {
    in_ECX[1] = in_EDX[1];
  }
  if (unaff_ESI[1] < unaff_EDI[1]) {
    unaff_ESI[1] = unaff_EDI[1];
  }
  if (in_EDX[2] < in_ECX[2]) {
    in_ECX[2] = in_EDX[2];
  }
  if (unaff_ESI[2] < unaff_EDI[2]) {
    unaff_ESI[2] = unaff_EDI[2];
  }
  return;
}


