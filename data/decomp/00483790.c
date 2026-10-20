
float10 __fastcall FUN_00483790(float *param_1)

{
  float *in_EAX;
  float10 fVar1;
  
  fVar1 = (float10)FUN_004d98d4((double)((in_EAX[1] - param_1[1]) * (in_EAX[1] - param_1[1]) +
                                        (*in_EAX - *param_1) * (*in_EAX - *param_1) +
                                        (in_EAX[2] - param_1[2]) * (in_EAX[2] - param_1[2])));
  return (float10)(float)fVar1;
}

