// 1005b340 size=127 FUN_1005b340

void FUN_1005b340(void)

{
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  *in_EDX = *in_ECX * *in_EAX +
            in_EAX[8] * in_ECX[2] + in_EAX[4] * in_ECX[1] + in_EAX[0xc] * in_ECX[3];
  in_EDX[1] = in_EAX[9] * in_ECX[2] +
              in_EAX[5] * in_ECX[1] + in_EAX[0xd] * in_ECX[3] + in_EAX[1] * *in_ECX;
  in_EDX[2] = in_EAX[10] * in_ECX[2] +
              in_EAX[6] * in_ECX[1] + in_EAX[0xe] * in_ECX[3] + in_EAX[2] * *in_ECX;
  in_EDX[3] = in_EAX[0xb] * in_ECX[2] +
              in_EAX[7] * in_ECX[1] + in_EAX[0xf] * in_ECX[3] + in_EAX[3] * *in_ECX;
  return;
}


