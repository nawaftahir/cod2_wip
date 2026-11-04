
void __thiscall FUN_00487ff0(float *param_1,float param_2,float param_3,float param_4)

{
  float *in_EAX;
  
  *param_1 = param_2 * *in_EAX + param_4 * in_EAX[6] + param_3 * in_EAX[3];
  param_1[1] = param_4 * in_EAX[7] + param_3 * in_EAX[4] + param_2 * in_EAX[1];
  param_1[2] = param_4 * in_EAX[8] + param_3 * in_EAX[5] + param_2 * in_EAX[2];
  return;
}

