// 100151e0 size=125 FUN_100151e0

void FUN_100151e0(float param_1)

{
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  *in_ECX = (*in_EDX - *in_EAX) * param_1 + *in_EAX;
  in_ECX[1] = (in_EDX[1] - in_EAX[1]) * param_1 + in_EAX[1];
  in_ECX[2] = (in_EDX[2] - in_EAX[2]) * param_1 + in_EAX[2];
  in_ECX[3] = (in_EDX[3] - in_EAX[3]) * param_1 + in_EAX[3];
  in_ECX[4] = (in_EDX[4] - in_EAX[4]) * param_1 + in_EAX[4];
  in_ECX[5] = (in_EDX[5] - in_EAX[5]) * param_1 + in_EAX[5];
  in_ECX[6] = (in_EDX[6] - in_EAX[6]) * param_1 + in_EAX[6];
  in_ECX[7] = (in_EDX[7] - in_EAX[7]) * param_1 + in_EAX[7];
  return;
}


