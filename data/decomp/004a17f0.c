
void __fastcall FUN_004a17f0(float *param_1)

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
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float *in_EAX;
  
  fVar1 = param_1[1];
  fVar2 = *in_EAX;
  fVar3 = param_1[2];
  fVar4 = param_1[3];
  fVar5 = *param_1;
  fVar6 = param_1[2];
  fVar7 = param_1[1];
  fVar8 = *in_EAX;
  fVar9 = in_EAX[1];
  fVar10 = *param_1;
  fVar11 = param_1[3];
  fVar12 = param_1[3];
  fVar13 = *param_1;
  fVar14 = *in_EAX;
  fVar15 = param_1[1];
  fVar16 = in_EAX[1];
  fVar17 = in_EAX[2];
  fVar18 = param_1[2];
  *in_EAX = (in_EAX[3] * *param_1 + in_EAX[1] * param_1[2] + param_1[3] * *in_EAX) -
            in_EAX[2] * param_1[1];
  in_EAX[1] = in_EAX[2] * fVar5 + fVar4 * in_EAX[1] + (in_EAX[3] * fVar1 - fVar2 * fVar3);
  in_EAX[2] = fVar11 * in_EAX[2] + ((fVar7 * fVar8 + in_EAX[3] * fVar6) - fVar9 * fVar10);
  in_EAX[3] = ((in_EAX[3] * fVar12 - fVar13 * fVar14) - fVar15 * fVar16) - fVar17 * fVar18;
  return;
}

