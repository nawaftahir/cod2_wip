// 10058d20 size=80 FUN_10058d20

float10 FUN_10058d20(void)

{
  float *in_EAX;
  float *in_ECX;
  float10 fVar1;
  
  fVar1 = (float10)FUN_1010a920((in_EAX[1] - in_ECX[1]) * (in_EAX[1] - in_ECX[1]) +
                                (*in_EAX - *in_ECX) * (*in_EAX - *in_ECX) +
                                (in_EAX[2] - in_ECX[2]) * (in_EAX[2] - in_ECX[2]));
  return (float10)(float)fVar1;
}


