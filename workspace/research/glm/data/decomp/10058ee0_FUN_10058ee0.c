// 10058ee0 size=40 FUN_10058ee0

float10 FUN_10058ee0(void)

{
  float *in_EAX;
  float *in_ECX;
  
  return (float10)(*in_EAX - *in_ECX) * (float10)(*in_EAX - *in_ECX) +
         (float10)(in_EAX[1] - in_ECX[1]) * (float10)(in_EAX[1] - in_ECX[1]);
}


