// 1005a430 size=219 FUN_1005a430

void FUN_1005a430(void)

{
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  *in_EDX = in_EAX[6] * in_ECX[2] + in_ECX[1] * in_EAX[3] + *in_ECX * *in_EAX;
  in_EDX[1] = in_EAX[1] * *in_ECX + in_EAX[7] * in_ECX[2] + in_ECX[1] * in_EAX[4];
  in_EDX[2] = in_EAX[2] * *in_ECX + in_EAX[8] * in_ECX[2] + in_ECX[1] * in_EAX[5];
  in_EDX[3] = in_ECX[5] * in_EAX[6] + in_ECX[3] * *in_EAX + in_ECX[4] * in_EAX[3];
  in_EDX[4] = in_ECX[3] * in_EAX[1] + in_ECX[4] * in_EAX[4] + in_ECX[5] * in_EAX[7];
  in_EDX[5] = in_ECX[3] * in_EAX[2] + in_ECX[4] * in_EAX[5] + in_ECX[5] * in_EAX[8];
  in_EDX[6] = in_ECX[7] * in_EAX[3] + in_EAX[6] * in_ECX[8] + in_ECX[6] * *in_EAX;
  in_EDX[7] = in_EAX[1] * in_ECX[6] + in_EAX[4] * in_ECX[7] + in_EAX[7] * in_ECX[8];
  in_EDX[8] = in_EAX[2] * in_ECX[6] + in_EAX[5] * in_ECX[7] + in_EAX[8] * in_ECX[8];
  return;
}


