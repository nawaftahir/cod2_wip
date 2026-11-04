// 100367b0 size=236 FUN_100367b0

void FUN_100367b0(void)

{
  float *in_EAX;
  float *in_ECX;
  
  *in_EAX = 0.0;
  in_EAX[1] = 0.0;
  in_EAX[2] = 0.0;
  *in_EAX = *in_ECX;
  in_EAX[1] = in_ECX[8];
  in_EAX[2] = in_ECX[0x10];
  *in_EAX = in_ECX[1] + *in_EAX;
  in_EAX[1] = in_ECX[9] + in_EAX[1];
  in_EAX[2] = in_ECX[0x11] + in_EAX[2];
  *in_EAX = in_ECX[2] + *in_EAX;
  in_EAX[1] = in_ECX[10] + in_EAX[1];
  in_EAX[2] = in_ECX[0x12] + in_EAX[2];
  *in_EAX = in_ECX[3] + *in_EAX;
  in_EAX[1] = in_ECX[0xb] + in_EAX[1];
  in_EAX[2] = in_ECX[0x13] + in_EAX[2];
  *in_EAX = in_ECX[4] + *in_EAX;
  in_EAX[1] = in_ECX[0xc] + in_EAX[1];
  in_EAX[2] = in_ECX[0x14] + in_EAX[2];
  *in_EAX = in_ECX[5] + *in_EAX;
  in_EAX[1] = in_ECX[0xd] + in_EAX[1];
  in_EAX[2] = in_ECX[0x15] + in_EAX[2];
  *in_EAX = in_ECX[6] + *in_EAX;
  in_EAX[1] = in_ECX[0xe] + in_EAX[1];
  in_EAX[2] = in_ECX[0x16] + in_EAX[2];
  *in_EAX = in_ECX[7] + *in_EAX;
  in_EAX[1] = in_ECX[0xf] + in_EAX[1];
  in_EAX[2] = in_ECX[0x17] + in_EAX[2];
  *in_EAX = *in_EAX * 0.125;
  in_EAX[1] = in_EAX[1] * 0.125;
  in_EAX[2] = in_EAX[2] * 0.125;
  return;
}


