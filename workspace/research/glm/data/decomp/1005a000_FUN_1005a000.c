// 1005a000 size=165 FUN_1005a000

void FUN_1005a000(float *param_1)

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
  float *unaff_EBX;
  float *unaff_EDI;
  
  fVar1 = *unaff_EDI;
  fVar2 = *in_EAX;
  fVar3 = unaff_EDI[1];
  fVar4 = in_EAX[1];
  fVar5 = unaff_EDI[2];
  fVar6 = in_EAX[2];
  FUN_100590b0();
  fVar7 = *unaff_EDI;
  fVar8 = *param_1;
  fVar9 = unaff_EDI[1];
  fVar10 = param_1[1];
  fVar11 = unaff_EDI[2];
  fVar12 = param_1[2];
  FUN_100590b0();
  *unaff_EBX = (fVar11 - fVar12) * (fVar3 - fVar4) - (fVar9 - fVar10) * (fVar5 - fVar6);
  unaff_EBX[1] = (fVar5 - fVar6) * (fVar7 - fVar8) - (fVar11 - fVar12) * (fVar1 - fVar2);
  unaff_EBX[2] = (fVar9 - fVar10) * (fVar1 - fVar2) - (fVar7 - fVar8) * (fVar3 - fVar4);
  FUN_100590b0();
  return;
}


