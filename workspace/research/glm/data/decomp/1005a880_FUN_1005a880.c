// 1005a880 size=520 FUN_1005a880

void FUN_1005a880(void)

{
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  *in_EDX = in_ECX[3] * in_EAX[0xc] +
            in_ECX[1] * in_EAX[4] + in_EAX[8] * in_ECX[2] + *in_ECX * *in_EAX;
  in_EDX[1] = in_EAX[0xd] * in_ECX[3] +
              in_ECX[1] * in_EAX[5] + *in_ECX * in_EAX[1] + in_EAX[9] * in_ECX[2];
  in_EDX[2] = in_EAX[0xe] * in_ECX[3] +
              in_ECX[1] * in_EAX[6] + in_EAX[10] * in_ECX[2] + *in_ECX * in_EAX[2];
  in_EDX[3] = in_EAX[0xb] * in_ECX[2] +
              in_EAX[3] * *in_ECX + in_ECX[3] * in_EAX[0xf] + in_ECX[1] * in_EAX[7];
  in_EDX[4] = in_ECX[4] * *in_EAX +
              in_ECX[7] * in_EAX[0xc] + in_EAX[8] * in_ECX[6] + in_ECX[5] * in_EAX[4];
  in_EDX[5] = in_EAX[0xd] * in_ECX[7] +
              in_EAX[9] * in_ECX[6] + in_EAX[5] * in_ECX[5] + in_ECX[4] * in_EAX[1];
  in_EDX[6] = in_ECX[4] * in_EAX[2] +
              in_EAX[0xe] * in_ECX[7] + in_EAX[10] * in_ECX[6] + in_ECX[5] * in_EAX[6];
  in_EDX[7] = in_ECX[5] * in_EAX[7] +
              in_ECX[6] * in_EAX[0xb] + in_ECX[7] * in_EAX[0xf] + in_ECX[4] * in_EAX[3];
  in_EDX[8] = in_ECX[8] * *in_EAX +
              in_ECX[0xb] * in_EAX[0xc] + in_EAX[8] * in_ECX[10] + in_ECX[9] * in_EAX[4];
  in_EDX[9] = in_EAX[9] * in_ECX[10] +
              in_EAX[0xd] * in_ECX[0xb] + in_EAX[5] * in_ECX[9] + in_ECX[8] * in_EAX[1];
  in_EDX[10] = in_ECX[8] * in_EAX[2] +
               in_EAX[10] * in_ECX[10] + in_EAX[0xe] * in_ECX[0xb] + in_ECX[9] * in_EAX[6];
  in_EDX[0xb] = in_ECX[9] * in_EAX[7] +
                in_ECX[10] * in_EAX[0xb] + in_ECX[0xb] * in_EAX[0xf] + in_ECX[8] * in_EAX[3];
  in_EDX[0xc] = in_ECX[0xc] * *in_EAX +
                in_ECX[0xe] * in_EAX[8] + in_ECX[0xf] * in_EAX[0xc] + in_ECX[0xd] * in_EAX[4];
  in_EDX[0xd] = in_EAX[0xd] * in_ECX[0xf] +
                in_EAX[5] * in_ECX[0xd] + in_ECX[0xc] * in_EAX[1] + in_ECX[0xe] * in_EAX[9];
  in_EDX[0xe] = in_ECX[0xc] * in_EAX[2] +
                in_ECX[0xe] * in_EAX[10] + in_EAX[0xe] * in_ECX[0xf] + in_ECX[0xd] * in_EAX[6];
  in_EDX[0xf] = in_ECX[0xd] * in_EAX[7] +
                in_ECX[0xf] * in_EAX[0xf] + in_ECX[0xc] * in_EAX[3] + in_ECX[0xe] * in_EAX[0xb];
  return;
}


