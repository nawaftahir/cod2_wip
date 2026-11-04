
void __fastcall FUN_004a1750(float *param_1)

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
  
  fVar1 = param_1[3];
  fVar2 = *param_1;
  fVar3 = param_1[1];
  fVar4 = param_1[2];
  fVar5 = *in_EAX;
  fVar6 = param_1[3];
  fVar7 = in_EAX[1];
  fVar8 = *param_1;
  fVar9 = param_1[1];
  fVar10 = *in_EAX;
  fVar11 = param_1[2];
  fVar12 = param_1[3];
  fVar13 = *in_EAX;
  fVar14 = *param_1;
  fVar15 = in_EAX[1];
  fVar16 = param_1[1];
  fVar17 = param_1[2];
  fVar18 = in_EAX[2];
  *in_EAX = (param_1[3] * *in_EAX + param_1[1] * in_EAX[2] + in_EAX[3] * *param_1) -
            param_1[2] * in_EAX[1];
  in_EAX[1] = fVar4 * fVar5 + in_EAX[3] * fVar3 + (fVar1 * in_EAX[1] - fVar2 * in_EAX[2]);
  in_EAX[2] = in_EAX[3] * fVar11 + ((fVar7 * fVar8 + fVar6 * in_EAX[2]) - fVar9 * fVar10);
  in_EAX[3] = ((fVar12 * in_EAX[3] - fVar13 * fVar14) - fVar15 * fVar16) - fVar17 * fVar18;
  return;
}

