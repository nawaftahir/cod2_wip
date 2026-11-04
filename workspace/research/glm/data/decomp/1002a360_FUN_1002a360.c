// 1002a360 size=438 FUN_1002a360

void FUN_1002a360(float *param_1)

{
  float fVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  float *pfVar6;
  int iVar7;
  float *unaff_ESI;
  float *unaff_EDI;
  int iStack_18;
  int local_8;
  
  *unaff_EDI = 3.4028235e+38;
  unaff_EDI[1] = 3.4028235e+38;
  unaff_EDI[2] = 3.4028235e+38;
  *param_1 = -3.4028235e+38;
  param_1[1] = -3.4028235e+38;
  param_1[2] = -3.4028235e+38;
  iVar2 = (*(code *)RI_XModelPrecache)();
  uVar3 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(0x2000);
  iVar4 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(0xff78);
  iVar5 = (*(code *)RI_XModelGetFlags)();
  (*(code *)RI_XModelGetLodName)();
  if (0 < iVar5) {
    do {
      FUN_1001d720();
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
  }
  iStack_18 = 0;
  if (0 < iVar2) {
    do {
      iVar5 = *(int *)(local_8 + iStack_18 * 4);
      iVar7 = (int)*(short *)(iVar5 + 2);
      R_RegisterXModelSurfs(iVar5,uVar3,iVar4,0,0);
      if (0 < iVar7) {
        pfVar6 = (float *)(iVar4 + 4);
        do {
          fVar1 = pfVar6[1] * unaff_ESI[6] + pfVar6[-1] * *unaff_ESI + unaff_ESI[3] * *pfVar6;
          if (fVar1 < *unaff_EDI) {
            *unaff_EDI = fVar1;
          }
          if (*param_1 < fVar1) {
            *param_1 = fVar1;
          }
          fVar1 = pfVar6[-1] * unaff_ESI[1] + unaff_ESI[7] * pfVar6[1] + *pfVar6 * unaff_ESI[4];
          if (fVar1 < unaff_EDI[1]) {
            unaff_EDI[1] = fVar1;
          }
          if (param_1[1] < fVar1) {
            param_1[1] = fVar1;
          }
          fVar1 = pfVar6[-1] * unaff_ESI[2] + pfVar6[1] * unaff_ESI[8] + unaff_ESI[5] * *pfVar6;
          if (fVar1 < unaff_EDI[2]) {
            unaff_EDI[2] = fVar1;
          }
          if (param_1[2] < fVar1) {
            param_1[2] = fVar1;
          }
          pfVar6 = pfVar6 + 3;
          iVar7 = iVar7 + -1;
        } while (iVar7 != 0);
      }
      iStack_18 = iStack_18 + 1;
    } while (iStack_18 < iVar2);
  }
  (*(code *)RI_Hunk_FreeTempMemory)(iVar4);
  (*(code *)RI_Hunk_FreeTempMemory)(uVar3);
  return;
}


