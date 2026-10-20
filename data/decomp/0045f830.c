
void __fastcall FUN_0045f830(float *param_1,float *param_2,float param_3)

{
  float *in_EAX;
  
  *param_1 = (*param_2 - *in_EAX) * param_3 + *in_EAX;
  param_1[1] = (param_2[1] - in_EAX[1]) * param_3 + in_EAX[1];
  param_1[2] = (param_2[2] - in_EAX[2]) * param_3 + in_EAX[2];
  return;
}

