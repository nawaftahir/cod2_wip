// 1005b660 size=351 FUN_1005b660

void FUN_1005b660(void)

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
  float *in_EAX;
  float *in_ECX;
  
  fVar4 = *in_EAX * *in_EAX;
  fVar5 = in_EAX[1] * in_EAX[1];
  fVar6 = in_EAX[2] * in_EAX[2];
  fVar7 = 2.0 / (in_EAX[3] * in_EAX[3] + fVar6 + fVar5 + fVar4);
  fVar4 = fVar7 * fVar4;
  fVar5 = fVar7 * fVar5;
  fVar6 = fVar7 * fVar6;
  fVar8 = fVar7 * *in_EAX;
  fVar1 = in_EAX[1];
  fVar2 = in_EAX[2];
  fVar3 = in_EAX[3];
  fVar9 = fVar7 * in_EAX[1] * in_EAX[2];
  fVar10 = fVar7 * in_EAX[1] * in_EAX[3];
  fVar7 = in_EAX[3] * in_EAX[2] * fVar7;
  *in_ECX = 1.0 - (fVar6 + fVar5);
  in_ECX[1] = fVar7 + fVar8 * fVar1;
  in_ECX[2] = fVar8 * fVar2 - fVar10;
  in_ECX[3] = fVar8 * fVar1 - fVar7;
  in_ECX[4] = 1.0 - (fVar6 + fVar4);
  in_ECX[5] = fVar9 + fVar8 * fVar3;
  in_ECX[6] = fVar10 + fVar8 * fVar2;
  in_ECX[7] = fVar9 - fVar8 * fVar3;
  in_ECX[8] = 1.0 - (fVar5 + fVar4);
  return;
}


