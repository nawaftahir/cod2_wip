// 1005a0b0 size=211 FUN_1005a0b0

void FUN_1005a0b0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  
  fVar1 = *in_EAX - *in_ECX;
  fVar2 = in_EAX[1] - in_ECX[1];
  fVar3 = in_EAX[2] - in_ECX[2];
  fVar4 = fVar2 * fVar2 + fVar1 * fVar1 + fVar3 * fVar3;
  if (fVar4 == 0.0) {
    *in_EDX = *in_ECX;
    in_EDX[1] = in_ECX[1];
    in_EDX[2] = in_ECX[2];
    return;
  }
  fVar4 = ((unaff_ESI[1] - in_ECX[1]) * fVar2 +
          (*unaff_ESI - *in_ECX) * fVar1 + (unaff_ESI[2] - in_ECX[2]) * fVar3) / fVar4;
  *in_EDX = fVar1 * fVar4 + *in_ECX;
  in_EDX[1] = fVar4 * fVar2 + in_ECX[1];
  in_EDX[2] = fVar3 * fVar4 + in_ECX[2];
  return;
}


