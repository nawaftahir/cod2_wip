// 1001da80 size=985 FUN_1001da80

void FUN_1001da80(int param_1)

{
  int *piVar1;
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
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  float fVar30;
  float fVar31;
  int iVar32;
  int iVar33;
  int iVar34;
  float *pfVar35;
  int *piVar36;
  float *pfVar37;
  int unaff_ESI;
  int *piVar38;
  int iStack_370;
  int iStack_36c;
  float fStack_360;
  float fStack_35c;
  float fStack_358;
  float fStack_354;
  float fStack_350;
  float fStack_34c;
  float fStack_348;
  float fStack_344;
  float fStack_340;
  float fStack_33c;
  float fStack_338;
  float fStack_334;
  float fStack_330;
  float fStack_32c;
  float fStack_328;
  float fStack_324;
  float fStack_320;
  float fStack_31c;
  uint local_318 [4];
  undefined1 local_308 [8];
  undefined1 local_300 [256];
  int aiStack_200 [128];
  
  FUN_1001d9f0(local_300,local_318,local_308);
  if (*(int *)(param_1 + 8) != 0) {
    (*(code *)RI_DObjCreateSkel)(*(int *)(param_1 + 8));
  }
  iVar32 = (*(code *)RI_DObjGetSurfaces)();
  (*(code *)RI_DObjGetPartBits)();
  iVar33 = (*(code *)RI_RI_unk120)();
  if ((iVar33 != 0) && (iStack_36c = 0, 0 < iVar32)) {
    pfVar37 = (float *)(iVar33 + 0x14);
    do {
      if ((local_318[iStack_36c >> 5] & 1 << ((byte)iStack_36c & 0x1f)) != 0) {
        iVar33 = aiStack_200[iStack_36c];
        piVar38 = &DAT_10190278;
        iStack_370 = 0xc;
        do {
          fVar20 = *(float *)(iVar33 + *piVar38 * 0xc);
          fVar21 = *(float *)(iVar33 + 4 + piVar38[1] * 0xc);
          fVar22 = *(float *)(iVar33 + 8 + piVar38[2] * 0xc);
          FUN_1001d660();
          fVar26 = fStack_360 * fVar20 + fStack_354 * fVar21 + fStack_348 * fVar22 + pfVar37[-1];
          fVar27 = fStack_35c * fVar20 + fStack_350 * fVar21 + fStack_344 * fVar22 + *pfVar37;
          fVar28 = fStack_358 * fVar20 + fStack_34c * fVar21 + fStack_340 * fVar22 + pfVar37[1];
          fVar20 = *(float *)(unaff_ESI + 0x2c);
          fVar21 = *(float *)(unaff_ESI + 0x20);
          fVar22 = *(float *)(unaff_ESI + 0x14);
          fVar2 = *(float *)(unaff_ESI + 0x30);
          fVar3 = *(float *)(unaff_ESI + 0x24);
          fVar4 = *(float *)(unaff_ESI + 0x18);
          fVar5 = *(float *)(unaff_ESI + 0x34);
          fVar6 = *(float *)(unaff_ESI + 0x28);
          fVar7 = *(float *)(unaff_ESI + 0x1c);
          fVar8 = *(float *)(unaff_ESI + 0x3c);
          fVar9 = *(float *)(unaff_ESI + 0x40);
          fVar10 = *(float *)(unaff_ESI + 0x44);
          fVar23 = *(float *)(iVar33 + piVar38[3] * 0xc);
          fVar24 = *(float *)(iVar33 + 4 + piVar38[4] * 0xc);
          fVar25 = *(float *)(iVar33 + 8 + piVar38[5] * 0xc);
          FUN_1001d660();
          fVar29 = fStack_33c * fVar23 + fStack_330 * fVar24 + fStack_324 * fVar25 + pfVar37[-1];
          fVar30 = fStack_338 * fVar23 + fStack_32c * fVar24 + fStack_320 * fVar25 + *pfVar37;
          fVar31 = fStack_334 * fVar23 + fStack_328 * fVar24 + fStack_31c * fVar25 + pfVar37[1];
          fVar23 = *(float *)(unaff_ESI + 0x14);
          fVar24 = *(float *)(unaff_ESI + 0x2c);
          fVar25 = *(float *)(unaff_ESI + 0x20);
          fVar11 = *(float *)(unaff_ESI + 0x18);
          fVar12 = *(float *)(unaff_ESI + 0x30);
          fVar13 = *(float *)(unaff_ESI + 0x24);
          fVar14 = *(float *)(unaff_ESI + 0x1c);
          fVar15 = *(float *)(unaff_ESI + 0x34);
          fVar16 = *(float *)(unaff_ESI + 0x28);
          fVar17 = *(float *)(unaff_ESI + 0x3c);
          fVar18 = *(float *)(unaff_ESI + 0x40);
          fVar19 = *(float *)(unaff_ESI + 0x44);
          piVar1 = (int *)(DAT_101da9c8 + 0x249d4c);
          piVar38 = piVar38 + 6;
          if (*(int *)(DAT_101da9c8 + 0x249d4c) + 1 <= *(int *)(DAT_101da9c8 + 0x249d50)) {
            piVar36 = (int *)(DAT_101da9c8 + 0x249d48);
            if (*piVar36 == 0) {
              iVar34 = (*(code *)RI_Z_MallocInternal)(*(int *)(DAT_101da9c8 + 0x249d50) * 0x2c);
              *piVar36 = iVar34;
            }
            pfVar35 = (float *)(*piVar1 * 0x2c + *piVar36);
            *pfVar35 = fVar26 * fVar22 + fVar27 * fVar21 + fVar28 * fVar20 + fVar8;
            pfVar35[1] = fVar26 * fVar4 + fVar27 * fVar3 + fVar28 * fVar2 + fVar9;
            pfVar35[2] = fVar26 * fVar7 + fVar27 * fVar6 + fVar28 * fVar5 + fVar10;
            pfVar35[3] = fVar30 * fVar25 + fVar31 * fVar24 + fVar29 * fVar23 + fVar17;
            pfVar35[4] = fVar30 * fVar13 + fVar31 * fVar12 + fVar29 * fVar11 + fVar18;
            pfVar35[5] = fVar30 * fVar16 + fVar31 * fVar15 + fVar29 * fVar14 + fVar19;
            pfVar35[6] = 1.0;
            pfVar35[7] = 1.0;
            pfVar35[8] = 1.0;
            pfVar35[9] = 0.0;
            pfVar35[10] = 0.0;
            *piVar1 = *piVar1 + 1;
          }
          iStack_370 = iStack_370 + -1;
        } while (iStack_370 != 0);
      }
      iStack_36c = iStack_36c + 1;
      pfVar37 = pfVar37 + 8;
    } while (iStack_36c < iVar32);
  }
  return;
}


