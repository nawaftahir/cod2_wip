// 1005a3a0 size=134 FUN_1005a3a0

void FUN_1005a3a0(float param_1)

{
  float fVar1;
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  *in_EAX = param_1 * *in_ECX;
  in_EAX[1] = param_1 * in_ECX[1];
  fVar1 = in_ECX[2];
  in_EAX[3] = 0.0;
  in_EAX[2] = param_1 * fVar1;
  in_EAX[4] = param_1 * in_ECX[3];
  in_EAX[5] = param_1 * in_ECX[4];
  fVar1 = in_ECX[5];
  in_EAX[7] = 0.0;
  in_EAX[6] = param_1 * fVar1;
  in_EAX[8] = param_1 * in_ECX[6];
  in_EAX[9] = param_1 * in_ECX[7];
  fVar1 = in_ECX[8];
  in_EAX[0xb] = 0.0;
  in_EAX[10] = param_1 * fVar1;
  in_EAX[0xc] = *in_EDX;
  in_EAX[0xd] = in_EDX[1];
  in_EAX[0xe] = in_EDX[2];
  in_EAX[0xf] = 1.0;
  return;
}


