// 1005c470 size=131 FUN_1005c470

void FUN_1005c470(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_ECX;
  float *in_EDX;
  
  fVar1 = in_ECX[1];
  fVar2 = in_EDX[1];
  fVar3 = in_ECX[2] - in_EDX[2];
  if (fVar3 < *in_ECX - *in_EDX) {
    fVar4 = ((*in_ECX - *in_EDX) - fVar3) * 0.5;
    *in_EDX = fVar4 + *in_EDX;
    *in_ECX = *in_ECX - fVar4;
  }
  if (fVar3 < fVar1 - fVar2) {
    fVar1 = ((fVar1 - fVar2) - fVar3) * 0.5;
    in_EDX[1] = fVar1 + in_EDX[1];
    in_ECX[1] = in_ECX[1] - fVar1;
  }
  return;
}


