// 1005c3f0 size=115 FUN_1005c3f0

void FUN_1005c3f0(void)

{
  float fVar1;
  float *in_ECX;
  float *in_EDX;
  
  fVar1 = *in_ECX - *in_EDX;
  if ((*in_ECX - *in_EDX) - (in_ECX[1] - in_EDX[1]) < 0.0) {
    fVar1 = in_ECX[1] - in_EDX[1];
  }
  if (in_ECX[2] - in_EDX[2] < fVar1) {
    fVar1 = (fVar1 - (in_ECX[2] - in_EDX[2])) * 0.5;
    in_EDX[2] = in_EDX[2] - fVar1;
    in_ECX[2] = fVar1 + in_ECX[2];
  }
  return;
}


