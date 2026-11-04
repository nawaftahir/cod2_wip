// 10040d40 size=161 FUN_10040d40

void FUN_10040d40(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float *in_ECX;
  float *in_EDX;
  int unaff_ESI;
  
  if ((*in_EDX < 0.001) && (in_EDX[1] < 0.001)) {
    *in_ECX = *(float *)(unaff_ESI + 100);
    in_ECX[1] = 0.0;
    fVar1 = *(float *)(unaff_ESI + 0x68);
    in_ECX[2] = 0.0;
    in_ECX[3] = fVar1;
    return;
  }
  fVar1 = *in_EDX;
  *in_ECX = in_EDX[1];
  in_ECX[1] = fVar1 * -1.0;
  fVar1 = *in_EDX;
  in_ECX[3] = in_EDX[1];
  in_ECX[2] = fVar1;
  fVar1 = SQRT(in_ECX[1] * in_ECX[1] + *in_ECX * *in_ECX);
  fVar2 = 1.0 / fVar1;
  fVar3 = fVar2 * *(float *)(unaff_ESI + 100);
  *in_ECX = fVar3 * *in_ECX;
  in_ECX[1] = fVar3 * in_ECX[1];
  if (fVar1 < *(float *)(unaff_ESI + 100)) {
    fVar2 = fVar2 * *(float *)(unaff_ESI + 100);
    in_ECX[2] = fVar2 * in_ECX[2];
    in_ECX[3] = fVar2 * in_ECX[3];
  }
  return;
}


