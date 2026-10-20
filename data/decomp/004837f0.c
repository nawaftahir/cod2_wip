
float10 __fastcall FUN_004837f0(float *param_1)

{
  float *in_EAX;
  
  return (float10)(*in_EAX - *param_1) * (float10)(*in_EAX - *param_1) +
         (float10)(in_EAX[1] - param_1[1]) * (float10)(in_EAX[1] - param_1[1]) +
         (float10)(in_EAX[2] - param_1[2]) * (float10)(in_EAX[2] - param_1[2]);
}

