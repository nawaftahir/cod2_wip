// 10058fb0 size=253 FUN_10058fb0

void FUN_10058fb0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float *in_ECX;
  undefined4 *in_EDX;
  undefined4 *unaff_ESI;
  
  fVar1 = *in_ECX * *in_ECX;
  fVar2 = in_ECX[1] * in_ECX[1];
  fVar3 = in_ECX[2] * in_ECX[2];
  if ((fVar1 <= fVar3) && (fVar2 <= fVar3)) {
    if (0.0 < in_ECX[2]) {
      *unaff_ESI = 0;
      *in_EDX = 1;
      return;
    }
    *unaff_ESI = 1;
    *in_EDX = 0;
    return;
  }
  if ((fVar1 <= fVar2) && (fVar3 <= fVar2)) {
    if (0.0 < in_ECX[1]) {
      *unaff_ESI = 2;
      *in_EDX = 0;
      return;
    }
    *unaff_ESI = 0;
    *in_EDX = 2;
    return;
  }
  if (0.0 < *in_ECX) {
    *unaff_ESI = 1;
    *in_EDX = 2;
    return;
  }
  *unaff_ESI = 2;
  *in_EDX = 1;
  return;
}


