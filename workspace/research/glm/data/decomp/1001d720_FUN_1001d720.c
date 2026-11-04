// 1001d720 size=217 FUN_1001d720

void FUN_1001d720(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float *in_EAX;
  float *in_ECX;
  
  fVar1 = in_ECX[7];
  fVar10 = fVar1 * *in_ECX;
  fVar9 = fVar1 * in_ECX[1];
  fVar2 = *in_ECX;
  fVar3 = in_ECX[1];
  fVar4 = in_ECX[2];
  fVar5 = in_ECX[3];
  fVar6 = in_ECX[1];
  fVar7 = in_ECX[2];
  fVar8 = in_ECX[3];
  fVar11 = fVar1 * in_ECX[2] * in_ECX[2];
  fVar1 = fVar1 * in_ECX[2] * in_ECX[3];
  in_EAX[3] = 0.0;
  in_EAX[7] = 0.0;
  in_EAX[0xb] = 0.0;
  *in_EAX = 1.0 - (fVar11 + fVar9 * fVar6);
  in_EAX[1] = fVar10 * fVar3 + fVar1;
  in_EAX[2] = fVar10 * fVar4 - fVar9 * fVar8;
  in_EAX[4] = fVar10 * fVar3 - fVar1;
  in_EAX[5] = 1.0 - (fVar11 + fVar10 * fVar2);
  in_EAX[6] = fVar9 * fVar7 + fVar10 * fVar5;
  in_EAX[8] = fVar9 * fVar8 + fVar10 * fVar4;
  in_EAX[9] = fVar9 * fVar7 - fVar10 * fVar5;
  in_EAX[10] = 1.0 - (fVar9 * fVar6 + fVar10 * fVar2);
  in_EAX[0xc] = in_ECX[4];
  in_EAX[0xd] = in_ECX[5];
  in_EAX[0xe] = in_ECX[6];
  in_EAX[0xf] = 1.0;
  return;
}


