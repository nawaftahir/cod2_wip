// 1001d660 size=181 FUN_1001d660

void FUN_1001d660(void)

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
  
  fVar1 = in_EAX[7];
  fVar10 = fVar1 * *in_EAX;
  fVar9 = fVar1 * in_EAX[1];
  fVar2 = *in_EAX;
  fVar3 = in_EAX[1];
  fVar4 = in_EAX[2];
  fVar5 = in_EAX[3];
  fVar6 = in_EAX[1];
  fVar7 = in_EAX[2];
  fVar8 = in_EAX[3];
  fVar11 = fVar1 * in_EAX[2] * in_EAX[2];
  fVar1 = fVar1 * in_EAX[2] * in_EAX[3];
  *in_ECX = 1.0 - (fVar11 + fVar9 * fVar6);
  in_ECX[1] = fVar10 * fVar3 + fVar1;
  in_ECX[2] = fVar10 * fVar4 - fVar9 * fVar8;
  in_ECX[3] = fVar10 * fVar3 - fVar1;
  in_ECX[4] = 1.0 - (fVar11 + fVar10 * fVar2);
  in_ECX[5] = fVar9 * fVar7 + fVar10 * fVar5;
  in_ECX[6] = fVar9 * fVar8 + fVar10 * fVar4;
  in_ECX[7] = fVar9 * fVar7 - fVar10 * fVar5;
  in_ECX[8] = 1.0 - (fVar9 * fVar6 + fVar10 * fVar2);
  return;
}


