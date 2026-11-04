// 10058db0 size=235 FUN_10058db0

float10 FUN_10058db0(float param_1)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float *in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  float local_1c;
  
  fVar1 = (*unaff_ESI - *in_EDX) * *in_ECX +
          (unaff_ESI[1] - in_EDX[1]) * in_ECX[1] + (unaff_ESI[2] - in_EDX[2]) * in_ECX[2];
  if (fVar1 - param_1 < 0.0) {
    param_1 = fVar1;
  }
  local_1c = 0.0;
  if (0.0 - fVar1 < 0.0) {
    local_1c = param_1;
  }
  fVar1 = (local_1c * *in_ECX + *in_EDX) - *unaff_ESI;
  fVar2 = (local_1c * in_ECX[1] + in_EDX[1]) - unaff_ESI[1];
  fVar3 = (local_1c * in_ECX[2] + in_EDX[2]) - unaff_ESI[2];
  return (float10)(fVar1 * fVar1 + fVar2 * fVar2 + fVar3 * fVar3);
}


