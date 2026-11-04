// 1001e3a0 size=151 FUN_1001e3a0

void FUN_1001e3a0(void)

{
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  
  unaff_ESI[3] = in_ECX[2] * in_EAX[8] + in_ECX[1] * in_EAX[4] + *in_ECX * *in_EAX;
  unaff_ESI[4] = in_ECX[1] * in_EAX[5] + in_EAX[9] * in_ECX[2] + *in_ECX * in_EAX[1];
  unaff_ESI[5] = in_EAX[6] * in_ECX[1] + in_EAX[10] * in_ECX[2] + *in_ECX * in_EAX[2];
  *unaff_ESI = *in_EDX * *in_EAX + in_EDX[1] * in_EAX[4] + in_EDX[2] * in_EAX[8] + in_EAX[0xc];
  unaff_ESI[1] = in_EDX[1] * in_EAX[5] + in_EDX[2] * in_EAX[9] + *in_EDX * in_EAX[1] + in_EAX[0xd];
  unaff_ESI[2] = in_EDX[1] * in_EAX[6] + in_EDX[2] * in_EAX[10] + *in_EDX * in_EAX[2] + in_EAX[0xe];
  return;
}


