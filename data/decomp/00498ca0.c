
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00498ca0(float *param_1)

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
  
  fVar8 = *in_EAX + *in_EAX;
  fVar9 = in_EAX[1] + in_EAX[1];
  fVar10 = in_EAX[2] + in_EAX[2];
  fVar11 = fVar8 * *in_EAX;
  fVar1 = *in_EAX;
  fVar2 = *in_EAX;
  fVar3 = in_EAX[1];
  fVar4 = in_EAX[1];
  fVar5 = in_EAX[2];
  fVar8 = fVar8 * in_EAX[3];
  fVar6 = in_EAX[3];
  fVar7 = in_EAX[3];
  *param_1 = _DAT_00556a58 - (fVar10 * fVar5 + fVar9 * fVar3);
  param_1[1] = fVar9 * fVar1 - fVar10 * fVar7;
  param_1[2] = fVar9 * fVar6 + fVar10 * fVar2;
  param_1[3] = fVar10 * fVar7 + fVar9 * fVar1;
  param_1[4] = _DAT_00556a58 - (fVar10 * fVar5 + fVar11);
  param_1[5] = fVar10 * fVar4 - fVar8;
  param_1[6] = fVar10 * fVar2 - fVar9 * fVar6;
  param_1[7] = fVar8 + fVar10 * fVar4;
  param_1[8] = _DAT_00556a58 - (fVar9 * fVar3 + fVar11);
  return;
}

