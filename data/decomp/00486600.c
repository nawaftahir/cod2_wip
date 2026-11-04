
void __fastcall FUN_00486600(float *param_1,float *param_2)

{
  float *in_EAX;
  
  *param_2 = (param_1[3] * *in_EAX + in_EAX[1] * param_1[2] + in_EAX[3] * *param_1) -
             in_EAX[2] * param_1[1];
  param_2[1] = param_1[3] * in_EAX[1] +
               in_EAX[2] * *param_1 + (in_EAX[3] * param_1[1] - *in_EAX * param_1[2]);
  param_2[2] = param_1[3] * in_EAX[2] +
               ((in_EAX[3] * param_1[2] + param_1[1] * *in_EAX) - *param_1 * in_EAX[1]);
  param_2[3] = ((in_EAX[3] * param_1[3] - *param_1 * *in_EAX) - param_1[1] * in_EAX[1]) -
               in_EAX[2] * param_1[2];
  return;
}

