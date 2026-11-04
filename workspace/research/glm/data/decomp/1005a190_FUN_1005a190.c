// 1005a190 size=211 FUN_1005a190

float10 FUN_1005a190(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  fVar1 = *in_ECX - *in_EAX;
  fVar2 = in_ECX[1] - in_EAX[1];
  fVar3 = in_ECX[2] - in_EAX[2];
  fVar4 = -(((*in_EDX - *in_EAX) * fVar1 +
            (in_EDX[1] - in_EAX[1]) * fVar2 + (in_EDX[2] - in_EAX[2]) * fVar3) /
           (fVar1 * fVar1 + fVar2 * fVar2 + fVar3 * fVar3));
  fVar1 = fVar1 * fVar4 + (*in_EDX - *in_EAX);
  fVar2 = fVar2 * fVar4 + (in_EDX[1] - in_EAX[1]);
  fVar3 = fVar3 * fVar4 + (in_EDX[2] - in_EAX[2]);
  return (float10)fVar1 * (float10)fVar1 +
         (float10)fVar2 * (float10)fVar2 + (float10)fVar3 * (float10)fVar3;
}


