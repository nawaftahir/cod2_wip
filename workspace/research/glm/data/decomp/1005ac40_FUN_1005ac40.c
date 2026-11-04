// 1005ac40 size=177 FUN_1005ac40

void FUN_1005ac40(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float *in_EAX;
  float *in_ECX;
  
  *in_EAX = *in_ECX;
  in_EAX[1] = in_ECX[3];
  in_EAX[2] = in_ECX[6];
  in_EAX[3] = in_ECX[1];
  in_EAX[4] = in_ECX[4];
  in_EAX[5] = in_ECX[7];
  in_EAX[6] = in_ECX[2];
  in_EAX[7] = in_ECX[5];
  in_EAX[8] = in_ECX[8];
  fVar1 = 0.0 - in_ECX[9];
  fVar2 = 0.0 - in_ECX[10];
  fVar3 = 0.0 - in_ECX[0xb];
  in_EAX[9] = fVar1 * *in_EAX + fVar3 * in_EAX[6] + fVar2 * in_EAX[3];
  in_EAX[10] = fVar1 * in_EAX[1] + fVar3 * in_EAX[7] + fVar2 * in_EAX[4];
  in_EAX[0xb] = fVar2 * in_EAX[5] + fVar1 * in_EAX[2] + fVar3 * in_EAX[8];
  return;
}


