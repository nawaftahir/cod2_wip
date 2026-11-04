// 1005b8e0 size=101 FUN_1005b8e0

float10 FUN_1005b8e0(void)

{
  float fVar1;
  float fVar2;
  float *in_EAX;
  float10 fVar3;
  
  fVar1 = *in_EAX * *in_EAX;
  fVar2 = 2.0 / (in_EAX[1] * in_EAX[1] + fVar1);
  fVar3 = (float10)FUN_1010aaaa(fVar2,fVar1,in_EAX[1] * *in_EAX * fVar2);
  return (float10)(float)fVar3 * (float10)57.295776;
}


