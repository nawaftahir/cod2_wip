// 10038c60 size=131 FUN_10038c60

void FUN_10038c60(float param_1)

{
  float *in_EAX;
  float *in_ECX;
  
  *in_EAX = param_1 * *in_ECX;
  in_EAX[1] = param_1 * in_ECX[1];
  in_EAX[2] = param_1 * in_ECX[2];
  in_EAX[3] = in_ECX[3];
  in_EAX[4] = param_1 * in_ECX[4];
  in_EAX[5] = param_1 * in_ECX[5];
  in_EAX[6] = param_1 * in_ECX[6];
  in_EAX[7] = in_ECX[7];
  in_EAX[8] = param_1 * in_ECX[8];
  in_EAX[9] = param_1 * in_ECX[9];
  in_EAX[10] = param_1 * in_ECX[10];
  in_EAX[0xb] = in_ECX[0xb];
  in_EAX[0xc] = in_ECX[0xc];
  in_EAX[0xd] = in_ECX[0xd];
  in_EAX[0xe] = in_ECX[0xe];
  in_EAX[0xf] = in_ECX[0xf];
  return;
}


