
void __fastcall FUN_00486530(float *param_1)

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
  
  fVar1 = in_EAX[4];
  fVar2 = in_EAX[1];
  fVar3 = *param_1;
  fVar4 = in_EAX[7];
  fVar5 = in_EAX[10];
  fVar6 = in_EAX[5];
  fVar7 = param_1[1];
  fVar8 = in_EAX[2];
  fVar9 = *param_1;
  fVar10 = in_EAX[8];
  fVar11 = in_EAX[0xb];
  *param_1 = *param_1 * *in_EAX + in_EAX[6] * param_1[2] + in_EAX[3] * param_1[1] + in_EAX[9];
  param_1[1] = fVar4 * param_1[2] + fVar2 * fVar3 + fVar1 * param_1[1] + fVar5;
  param_1[2] = fVar10 * param_1[2] + fVar8 * fVar9 + fVar6 * fVar7 + fVar11;
  return;
}

