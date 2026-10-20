
void __fastcall FUN_00498f70(float *param_1,float *param_2)

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
  float *in_EAX;
  
  fVar7 = param_2[2];
  fVar8 = param_2[1];
  fVar9 = *param_2;
  fVar1 = in_EAX[7];
  fVar2 = in_EAX[6];
  fVar3 = in_EAX[4];
  fVar4 = in_EAX[3];
  fVar5 = in_EAX[1];
  fVar6 = *in_EAX;
  param_1[2] = fVar9 * in_EAX[2] + fVar8 * in_EAX[5] + fVar7 * in_EAX[8];
  param_1[1] = fVar9 * fVar5 + fVar8 * fVar3 + fVar7 * fVar1;
  *param_1 = fVar9 * fVar6 + fVar8 * fVar4 + fVar7 * fVar2;
  return;
}

