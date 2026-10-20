
float10 FUN_00420e90(void)

{
  float *in_EAX;
  float10 fVar1;
  
  fVar1 = (float10)FUN_004d98d4((double)(in_EAX[2] * in_EAX[2] +
                                        in_EAX[1] * in_EAX[1] + *in_EAX * *in_EAX));
  return (float10)(float)fVar1;
}

