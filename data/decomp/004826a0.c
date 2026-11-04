
float10 FUN_004826a0(void)

{
  float *in_EAX;
  
  return (float10)in_EAX[3] * (float10)in_EAX[3] +
         (float10)in_EAX[2] * (float10)in_EAX[2] +
         (float10)in_EAX[1] * (float10)in_EAX[1] + (float10)*in_EAX * (float10)*in_EAX;
}

