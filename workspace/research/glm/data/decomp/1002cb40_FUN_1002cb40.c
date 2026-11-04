// 1002cb40 size=445 FUN_1002cb40

void FUN_1002cb40(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  int iVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  int iVar10;
  int iVar11;
  int unaff_ESI;
  int iVar12;
  float10 fVar13;
  float10 fVar14;
  float10 fVar15;
  float10 fVar16;
  int local_28;
  float local_10;
  float local_c [2];
  
  iVar5 = *(int *)(unaff_ESI + 0x10);
  fVar6 = *(float *)(unaff_ESI + 0x20) * *(float *)(unaff_ESI + 0x20);
  iVar10 = *(int *)(unaff_ESI + 0xc);
  fVar1 = *(float *)(unaff_ESI + 0x1c);
  local_28 = -(iVar5 / 2);
  fVar2 = *(float *)(unaff_ESI + 0x14);
  fVar7 = (float)iVar10;
  fVar3 = *(float *)(unaff_ESI + 0x18);
  if (local_28 < *(int *)(unaff_ESI + 0x10) / 2) {
    iVar12 = 0;
    do {
      fVar8 = (float)local_28 * (6.2831855 / ((float)iVar5 * fVar2));
      iVar11 = -(iVar10 / 2);
      if (iVar11 < iVar10 / 2) {
        do {
          fVar9 = (float)iVar11 * (6.2831855 / (fVar7 * fVar3));
          FUN_100583d0(&local_10,local_c);
          fVar13 = (float10)fVar9 * (float10)fVar9 + (float10)(fVar8 * fVar8);
          fVar4 = *(float *)(unaff_ESI + 0x1c);
          fVar15 = (float10)fVar8 * (float10)*(float *)(unaff_ESI + 0x24) +
                   (float10)fVar9 * (float10)*(float *)(unaff_ESI + 0x28);
          if (fVar15 < (float10)0.0 == (fVar15 == (float10)0.0)) {
            fVar16 = (float10)1.4426950408889634 *
                     ((float10)-1.0 / (fVar13 * (float10)((fVar6 / fVar1) * fVar6)));
            fVar14 = ROUND(fVar16);
            fVar16 = (float10)f2xm1(fVar16 - fVar14);
            fVar14 = (float10)fscale((float10)1 + fVar16,fVar14);
            fVar15 = SQRT(fVar15 * fVar15 *
                          ((fVar14 * (float10)*(float *)(unaff_ESI + 0x2c)) /
                          (fVar13 * fVar13 * fVar13)) * (float10)0.5) *
                     (float10)*(float *)(unaff_ESI + 0x2c);
            *(float *)(*(int *)(unaff_ESI + 4) + iVar12 * 8) = (float)((float10)local_10 * fVar15);
            *(float *)(*(int *)(unaff_ESI + 4) + 4 + iVar12 * 8) =
                 (float)((float10)local_c[0] * fVar15);
            *(float *)(*(int *)(unaff_ESI + 8) + iVar12 * 4) =
                 SQRT((float)(SQRT(fVar13) * (float10)fVar4));
          }
          else {
            *(undefined4 *)(*(int *)(unaff_ESI + 4) + iVar12 * 8) = 0;
            *(undefined4 *)(*(int *)(unaff_ESI + 4) + 4 + iVar12 * 8) = 0;
            *(undefined4 *)(*(int *)(unaff_ESI + 8) + iVar12 * 4) = 0;
          }
          iVar10 = *(int *)(unaff_ESI + 0xc);
          iVar12 = iVar12 + 1;
          iVar11 = iVar11 + 1;
        } while (iVar11 < iVar10 / 2);
      }
      local_28 = local_28 + 1;
    } while (local_28 < *(int *)(unaff_ESI + 0x10) / 2);
  }
  return;
}


