
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00486820(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_EAX;
  
  fVar1 = *in_EAX * *in_EAX;
  fVar2 = in_EAX[1] * in_EAX[1];
  fVar3 = in_EAX[2] * in_EAX[2];
  fVar4 = in_EAX[3] * in_EAX[3] + fVar3 + fVar2 + fVar1;
  if (fVar4 != _DAT_00556a70) {
    fVar4 = _DAT_00556a58 / fVar4;
    return (float10)(fVar4 * fVar3) + (float10)(fVar4 * fVar2) + (float10)(fVar4 * fVar1);
  }
  return (float10)_DAT_00556a70;
}

