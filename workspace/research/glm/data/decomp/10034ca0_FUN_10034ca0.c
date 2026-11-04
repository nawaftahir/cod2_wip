// 10034ca0 size=530 FUN_10034ca0

int FUN_10034ca0(float param_1,float param_2,int param_3)

{
  float fVar1;
  float fVar2;
  int in_EAX;
  int iVar3;
  int iVar4;
  int iVar5;
  int in_EDX;
  float *pfVar6;
  undefined4 *unaff_EDI;
  float10 fVar7;
  float10 fVar8;
  float10 fVar9;
  float10 fVar10;
  float10 fVar11;
  
  iVar5 = (int)param_2;
  fVar1 = (float)(int)param_2;
  param_2 = 0.0;
  if (((int)ROUND(fVar1 / (float)param_3 + 9.313226e-10) & 1U) == 0) {
    param_2 = 0.5;
  }
  iVar3 = 0;
  fVar1 = -0.5 / (param_1 * param_1);
  fVar2 = 0.0;
  if (0 < in_EAX) {
    do {
      fVar7 = (float10)(iVar3 * 2) + (float10)param_2;
      fVar8 = (float10)(iVar3 * 2 + 1) + (float10)param_2;
      fVar10 = (float10)1.4426950408889634 * fVar7 * fVar7 * (float10)fVar1;
      fVar9 = ROUND(fVar10);
      fVar10 = (float10)f2xm1(fVar10 - fVar9);
      fVar9 = (float10)fscale((float10)1 + fVar10,fVar9);
      fVar11 = (float10)1.4426950408889634 * fVar8 * fVar8 * (float10)fVar1;
      fVar10 = ROUND(fVar11);
      fVar11 = (float10)f2xm1(fVar11 - fVar10);
      fVar10 = (float10)fscale((float10)1 + fVar11,fVar10);
      if ((iVar3 == 0) && (param_2 == 0.0)) {
        fVar9 = fVar9 * (float10)0.5;
      }
      fVar11 = fVar10 + fVar9;
      unaff_EDI[iVar3] = (float)fVar11;
      if (fVar11 == (float10)0.0) {
        *(float *)(in_EDX + iVar3 * 4) = (float)(((fVar8 + fVar7) * (float10)0.5) / (float10)iVar5);
      }
      else {
        *(float *)(in_EDX + iVar3 * 4) =
             (float)((fVar9 * fVar7 + fVar10 * fVar8) / (fVar11 * (float10)iVar5));
      }
      iVar4 = iVar3 + 1;
      fVar2 = fVar2 + (float)unaff_EDI[iVar3];
      iVar3 = iVar4;
    } while (iVar4 < in_EAX);
    if (fVar2 < 0.001 == (fVar2 == 0.001)) {
      iVar5 = in_EAX + -1;
      fVar2 = 0.5 / fVar2;
      if (3 < in_EAX) {
        pfVar6 = (float *)(unaff_EDI + in_EAX + -3);
        do {
          fVar1 = pfVar6[2];
          pfVar6[2] = fVar2 * fVar1;
          if (fVar2 * fVar1 < 0.01) {
            in_EAX = iVar5 + 1;
          }
          fVar1 = pfVar6[1];
          pfVar6[1] = fVar2 * fVar1;
          if (fVar2 * fVar1 < 0.01) {
            in_EAX = iVar5;
          }
          fVar1 = *pfVar6;
          *pfVar6 = fVar2 * fVar1;
          if (fVar2 * fVar1 < 0.01) {
            in_EAX = iVar5 + -1;
          }
          fVar1 = pfVar6[-1];
          pfVar6[-1] = fVar2 * fVar1;
          if (fVar2 * fVar1 < 0.01) {
            in_EAX = iVar5 + -2;
          }
          iVar5 = iVar5 + -4;
          pfVar6 = pfVar6 + -4;
        } while (2 < iVar5);
      }
      for (; -1 < iVar5; iVar5 = iVar5 + -1) {
        fVar1 = (float)unaff_EDI[iVar5];
        unaff_EDI[iVar5] = fVar2 * fVar1;
        if (fVar2 * fVar1 < 0.01) {
          in_EAX = iVar5 + 1;
        }
      }
      return in_EAX;
    }
  }
  *unaff_EDI = 0x3f000000;
  return 1;
}


