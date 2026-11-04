
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __fastcall FUN_00488ac0(float *param_1,float *param_2)

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
  float *in_EAX;
  float *unaff_EDI;
  float10 fVar13;
  
  fVar1 = *param_1;
  fVar2 = *unaff_EDI;
  fVar3 = param_1[1];
  fVar4 = unaff_EDI[1];
  fVar5 = param_1[2];
  fVar6 = unaff_EDI[2];
  fVar7 = *in_EAX;
  fVar8 = *unaff_EDI;
  fVar9 = in_EAX[1];
  fVar10 = unaff_EDI[1];
  fVar11 = in_EAX[2];
  fVar12 = unaff_EDI[2];
  *param_2 = (fVar9 - fVar10) * (fVar5 - fVar6) - (fVar11 - fVar12) * (fVar3 - fVar4);
  param_2[1] = (fVar11 - fVar12) * (fVar1 - fVar2) - (fVar5 - fVar6) * (fVar7 - fVar8);
  param_2[2] = (fVar7 - fVar8) * (fVar3 - fVar4) - (fVar9 - fVar10) * (fVar1 - fVar2);
  fVar13 = (float10)FUN_00483b50();
  if ((float10)_DAT_00556a70 == fVar13) {
    return 0;
  }
  param_2[3] = param_2[2] * unaff_EDI[2] + unaff_EDI[1] * param_2[1] + *param_2 * *unaff_EDI;
  return 1;
}

