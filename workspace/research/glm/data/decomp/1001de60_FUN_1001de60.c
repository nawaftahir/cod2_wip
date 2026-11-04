// 1001de60 size=959 FUN_1001de60

void FUN_1001de60(int param_1)

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
  float *pfVar34;
  int *piVar35;
  float *pfVar36;
  int unaff_ESI;
  float *pfVar37;
  int iStack_1a8;
  int iStack_19c;
  float afStack_198 [4];
  int iStack_188;
  undefined4 local_184;
  float local_180 [9];
  float fStack_15c;
  float fStack_158;
  float fStack_154;
  float fStack_150;
  float fStack_14c;
  float fStack_148;
  float fStack_144;
  float fStack_140;
  float fStack_13c;
  float fStack_138;
  float fStack_134;
  float fStack_130;
  float fStack_12c;
  float fStack_128;
  float fStack_124;
  float fStack_120;
  float fStack_11c;
  uint local_118 [4];
  undefined1 local_108 [8];
  undefined1 local_100 [256];
  
  FUN_1001d9f0(local_100,local_118,local_108);
  if (*(int *)(param_1 + 8) != 0) {
    (*(code *)RI_DObjCreateSkel)(*(int *)(param_1 + 8));
  }
  local_184 = 0x40c00000;
  local_180[0] = 0.0;
  local_180[1] = 0.0;
  local_180[2] = 0.0;
  local_180[3] = 6.0;
  local_180[4] = 0.0;
  local_180[5] = 0.0;
  local_180[6] = 0.0;
  local_180[7] = 6.0;
  iVar32 = (*(code *)RI_DObjGetSurfaces)();
  iStack_188 = iVar32;
  iVar33 = (*(code *)RI_RI_unk120)();
  if ((iVar33 != 0) && (iStack_19c = 0, 0 < iVar32)) {
    pfVar36 = (float *)(iVar33 + 0x14);
    do {
      if ((local_118[iStack_19c >> 5] & 1 << ((byte)iStack_19c & 0x1f)) != 0) {
        iStack_1a8 = 0;
        pfVar37 = local_180;
        do {
          afStack_198[0] = 0.0;
          afStack_198[1] = 0.0;
          afStack_198[2] = 0.0;
          afStack_198[3] = 0.0;
          afStack_198[iStack_1a8] = 1.0;
          FUN_1001d660();
          fVar26 = (fStack_124 + fStack_130 + fStack_13c) * 0.0 + pfVar36[-1];
          fVar27 = (fStack_120 + fStack_12c + fStack_138) * 0.0 + *pfVar36;
          fVar28 = (fStack_11c + fStack_128 + fStack_134) * 0.0 + pfVar36[1];
          fVar2 = *(float *)(unaff_ESI + 0x2c);
          fVar3 = *(float *)(unaff_ESI + 0x20);
          fVar4 = *(float *)(unaff_ESI + 0x14);
          fVar5 = *(float *)(unaff_ESI + 0x30);
          fVar6 = *(float *)(unaff_ESI + 0x24);
          fVar7 = *(float *)(unaff_ESI + 0x18);
          fVar8 = *(float *)(unaff_ESI + 0x34);
          fVar9 = *(float *)(unaff_ESI + 0x28);
          fVar10 = *(float *)(unaff_ESI + 0x1c);
          fVar11 = *(float *)(unaff_ESI + 0x3c);
          fVar12 = *(float *)(unaff_ESI + 0x40);
          fVar13 = *(float *)(unaff_ESI + 0x44);
          FUN_1001d660();
          fVar29 = local_180[8] * pfVar37[-1] + fStack_148 * pfVar37[1] + fStack_154 * *pfVar37 +
                   pfVar36[-1];
          fVar30 = fStack_15c * pfVar37[-1] + fStack_144 * pfVar37[1] + fStack_150 * *pfVar37 +
                   *pfVar36;
          fVar31 = fStack_158 * pfVar37[-1] + fStack_140 * pfVar37[1] + fStack_14c * *pfVar37 +
                   pfVar36[1];
          piVar1 = (int *)(DAT_101da9c8 + 0x249d4c);
          fVar14 = *(float *)(unaff_ESI + 0x2c);
          fVar15 = *(float *)(unaff_ESI + 0x20);
          fVar16 = *(float *)(unaff_ESI + 0x14);
          fVar17 = *(float *)(unaff_ESI + 0x18);
          fVar18 = *(float *)(unaff_ESI + 0x30);
          fVar19 = *(float *)(unaff_ESI + 0x24);
          fVar20 = *(float *)(unaff_ESI + 0x1c);
          fVar21 = *(float *)(unaff_ESI + 0x34);
          fVar22 = *(float *)(unaff_ESI + 0x28);
          fVar23 = *(float *)(unaff_ESI + 0x3c);
          fVar24 = *(float *)(unaff_ESI + 0x40);
          fVar25 = *(float *)(unaff_ESI + 0x44);
          if (*(int *)(DAT_101da9c8 + 0x249d4c) + 1 <= *(int *)(DAT_101da9c8 + 0x249d50)) {
            piVar35 = (int *)(DAT_101da9c8 + 0x249d48);
            if (*(int *)(DAT_101da9c8 + 0x249d48) == 0) {
              iVar32 = (*(code *)RI_Z_MallocInternal)(*(int *)(DAT_101da9c8 + 0x249d50) * 0x2c);
              *piVar35 = iVar32;
            }
            pfVar34 = (float *)(*piVar1 * 0x2c + *piVar35);
            *pfVar34 = fVar26 * fVar4 + fVar27 * fVar3 + fVar28 * fVar2 + fVar11;
            pfVar34[1] = fVar26 * fVar7 + fVar27 * fVar6 + fVar28 * fVar5 + fVar12;
            pfVar34[2] = fVar26 * fVar10 + fVar27 * fVar9 + fVar28 * fVar8 + fVar13;
            pfVar34[3] = fVar29 * fVar16 + fVar30 * fVar15 + fVar31 * fVar14 + fVar23;
            pfVar34[4] = fVar30 * fVar19 + fVar31 * fVar18 + fVar29 * fVar17 + fVar24;
            pfVar34[5] = fVar30 * fVar22 + fVar31 * fVar21 + fVar29 * fVar20 + fVar25;
            pfVar34[6] = afStack_198[0];
            pfVar34[7] = afStack_198[1];
            pfVar34[8] = afStack_198[2];
            pfVar34[9] = afStack_198[3];
            pfVar34[10] = 0.0;
            *piVar1 = *piVar1 + 1;
          }
          iStack_1a8 = iStack_1a8 + 1;
          pfVar37 = pfVar37 + 3;
          iVar32 = iStack_188;
        } while (iStack_1a8 < 3);
      }
      iStack_19c = iStack_19c + 1;
      pfVar36 = pfVar36 + 8;
    } while (iStack_19c < iVar32);
  }
  return;
}


