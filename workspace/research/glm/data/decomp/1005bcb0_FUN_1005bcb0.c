// 1005bcb0 size=177 FUN_1005bcb0

void FUN_1005bcb0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  
  *in_EAX = -in_ECX[3];
  in_EAX[4] = -in_ECX[4];
  fVar1 = in_ECX[5];
  in_EAX[8] = -fVar1;
  in_EAX[0xc] = -(in_EDX[1] * in_EAX[4] + -fVar1 * in_EDX[2] + *in_EAX * *in_EDX);
  in_EAX[1] = in_ECX[6];
  in_EAX[5] = in_ECX[7];
  fVar1 = in_ECX[8];
  in_EAX[9] = fVar1;
  in_EAX[0xd] = -(in_EAX[1] * *in_EDX + fVar1 * in_EDX[2] + in_EAX[5] * in_EDX[1]);
  in_EAX[2] = *in_ECX;
  in_EAX[6] = in_ECX[1];
  fVar4 = in_ECX[2];
  in_EAX[10] = fVar4;
  fVar1 = in_EDX[2];
  fVar2 = *in_EDX;
  fVar3 = in_EDX[1];
  in_EAX[3] = 0.0;
  in_EAX[7] = 0.0;
  in_EAX[0xb] = 0.0;
  in_EAX[0xf] = 1.0;
  in_EAX[0xe] = -(fVar3 * in_EAX[6] + fVar2 * in_EAX[2] + fVar4 * fVar1);
  return;
}


