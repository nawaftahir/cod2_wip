// 10058ea0 size=57 FUN_10058ea0

float10 FUN_10058ea0(void)

{
  float *in_EAX;
  float *in_ECX;
  float10 fVar1;
  
  fVar1 = (float10)FUN_1010a920((in_EAX[1] - in_ECX[1]) * (in_EAX[1] - in_ECX[1]) +
                                (*in_EAX - *in_ECX) * (*in_EAX - *in_ECX));
  return (float10)(float)fVar1;
}


