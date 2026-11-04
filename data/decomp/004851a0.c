
void __fastcall FUN_004851a0(float *param_1,float *param_2)

{
  float *in_EAX;
  
  *param_2 = in_EAX[6] * param_1[2] + param_1[1] * in_EAX[3] + *param_1 * *in_EAX;
  param_2[1] = in_EAX[1] * *param_1 + in_EAX[7] * param_1[2] + param_1[1] * in_EAX[4];
  param_2[2] = in_EAX[2] * *param_1 + in_EAX[8] * param_1[2] + param_1[1] * in_EAX[5];
  param_2[3] = param_1[5] * in_EAX[6] + param_1[3] * *in_EAX + param_1[4] * in_EAX[3];
  param_2[4] = param_1[3] * in_EAX[1] + param_1[4] * in_EAX[4] + param_1[5] * in_EAX[7];
  param_2[5] = param_1[3] * in_EAX[2] + param_1[4] * in_EAX[5] + param_1[5] * in_EAX[8];
  param_2[6] = param_1[7] * in_EAX[3] + in_EAX[6] * param_1[8] + param_1[6] * *in_EAX;
  param_2[7] = in_EAX[1] * param_1[6] + in_EAX[4] * param_1[7] + in_EAX[7] * param_1[8];
  param_2[8] = in_EAX[2] * param_1[6] + in_EAX[5] * param_1[7] + in_EAX[8] * param_1[8];
  return;
}

