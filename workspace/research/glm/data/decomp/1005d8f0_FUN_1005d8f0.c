// 1005d8f0 size=184 FUN_1005d8f0

undefined4 FUN_1005d8f0(void)

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
  float *in_ECX;
  float *in_EDX;
  float *unaff_EDI;
  float10 fVar13;
  
  fVar1 = *in_ECX;
  fVar2 = *unaff_EDI;
  fVar3 = in_ECX[1];
  fVar4 = unaff_EDI[1];
  fVar5 = in_ECX[2];
  fVar6 = unaff_EDI[2];
  fVar7 = *in_EAX;
  fVar8 = *unaff_EDI;
  fVar9 = in_EAX[1];
  fVar10 = unaff_EDI[1];
  fVar11 = in_EAX[2];
  fVar12 = unaff_EDI[2];
  *in_EDX = (fVar9 - fVar10) * (fVar5 - fVar6) - (fVar11 - fVar12) * (fVar3 - fVar4);
  in_EDX[1] = (fVar11 - fVar12) * (fVar1 - fVar2) - (fVar5 - fVar6) * (fVar7 - fVar8);
  in_EDX[2] = (fVar7 - fVar8) * (fVar3 - fVar4) - (fVar9 - fVar10) * (fVar1 - fVar2);
  fVar13 = (float10)FUN_100590b0();
  if ((float10)0.0 == fVar13) {
    return 0;
  }
  in_EDX[3] = in_EDX[2] * unaff_EDI[2] + unaff_EDI[1] * in_EDX[1] + *in_EDX * *unaff_EDI;
  return 1;
}


