// 1001e6e0 size=552 FUN_1001e6e0

void FUN_1001e6e0(void)

{
  byte *pbVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
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
  float *pfVar31;
  int in_ECX;
  int iVar32;
  int iVar33;
  int in_EDX;
  uint uVar34;
  int unaff_ESI;
  float *pfVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  float fVar39;
  
  pfVar31 = *(float **)(in_ECX + 0xc);
  iVar32 = (int)*(short *)(in_ECX + 2);
  if (0 < iVar32) {
    pfVar35 = (float *)(in_EDX + 0x20);
    do {
      fVar7 = pfVar31[0xc];
      fVar8 = pfVar31[0xd];
      fVar9 = pfVar31[0xe];
      iVar33 = (int)*(short *)((int)pfVar31 + 0x3e);
      pfVar3 = (float *)(iVar33 + 0x20 + unaff_ESI);
      fVar10 = *pfVar3;
      fVar11 = pfVar3[1];
      fVar12 = pfVar3[2];
      pfVar4 = (float *)(iVar33 + 0x10 + unaff_ESI);
      fVar13 = *pfVar4;
      fVar14 = pfVar4[1];
      fVar15 = pfVar4[2];
      pfVar5 = (float *)(iVar33 + 0x30 + unaff_ESI);
      pfVar2 = (float *)(iVar33 + unaff_ESI);
      fVar16 = *pfVar2;
      fVar17 = pfVar2[1];
      fVar18 = pfVar2[2];
      fVar27 = *pfVar31;
      fVar28 = pfVar31[1];
      fVar29 = pfVar31[2];
      fVar30 = pfVar31[3];
      fVar19 = pfVar31[8];
      fVar20 = pfVar31[9];
      fVar21 = pfVar31[10];
      fVar22 = pfVar31[0xb];
      fVar36 = fVar16 * fVar7 + fVar13 * fVar8 + fVar10 * fVar9 + *pfVar5;
      fVar37 = fVar17 * fVar7 + fVar14 * fVar8 + fVar11 * fVar9 + pfVar5[1];
      fVar38 = fVar18 * fVar7 + fVar15 * fVar8 + fVar12 * fVar9 + pfVar5[2];
      fVar39 = pfVar2[3] * fVar7 + pfVar4[3] * fVar8 + pfVar3[3] * fVar9 + pfVar5[3];
      fVar7 = pfVar31[4];
      fVar8 = pfVar31[5];
      fVar9 = pfVar31[6];
      fVar23 = pfVar31[7];
      uVar34 = (uint)*(byte *)(pfVar31 + 0xf);
      if (uVar34 == 0) {
        pfVar31 = pfVar31 + 0x10;
      }
      else {
        pbVar1 = (byte *)((int)pfVar31 + 0x3d);
        pfVar31 = pfVar31 + 0x10;
        fVar6 = (float)*pbVar1 * 0.00390625;
        fVar36 = fVar36 * fVar6;
        fVar37 = fVar37 * fVar6;
        fVar38 = fVar38 * fVar6;
        fVar39 = fVar39 * fVar6;
        do {
          fVar24 = *pfVar31;
          fVar25 = pfVar31[1];
          fVar26 = pfVar31[2];
          iVar33 = (int)*(short *)(pfVar31 + 3);
          pfVar3 = (float *)(iVar33 + 0x20 + unaff_ESI);
          pfVar2 = (float *)(iVar33 + unaff_ESI);
          pfVar4 = (float *)(iVar33 + 0x10 + unaff_ESI);
          iVar33 = iVar33 + unaff_ESI;
          fVar6 = (float)*(ushort *)((int)pfVar31 + 0xe) * 1.5258789e-05;
          uVar34 = uVar34 - 1;
          pfVar31 = pfVar31 + 4;
          fVar36 = fVar36 + fVar6 * (*pfVar2 * fVar24 + *pfVar4 * fVar25 +
                                    *pfVar3 * fVar26 + *(float *)(iVar33 + 0x30));
          fVar37 = fVar37 + fVar6 * (pfVar2[1] * fVar24 + pfVar4[1] * fVar25 +
                                    pfVar3[1] * fVar26 + *(float *)(iVar33 + 0x34));
          fVar38 = fVar38 + fVar6 * (pfVar2[2] * fVar24 + pfVar4[2] * fVar25 +
                                    pfVar3[2] * fVar26 + *(float *)(iVar33 + 0x38));
          fVar39 = fVar39 + fVar6 * (pfVar2[3] * fVar24 + pfVar4[3] * fVar25 +
                                    pfVar3[3] * fVar26 + *(float *)(iVar33 + 0x3c));
        } while (uVar34 != 0);
      }
      pfVar35[-8] = fVar36;
      pfVar35[-7] = fVar37;
      pfVar35[-6] = fVar38;
      pfVar35[-5] = fVar39;
      pfVar35[-4] = fVar16 * fVar27 + fVar13 * fVar28 + fVar10 * fVar29;
      pfVar35[-3] = fVar17 * fVar27 + fVar14 * fVar28 + fVar11 * fVar29;
      pfVar35[-2] = fVar18 * fVar27 + fVar15 * fVar28 + fVar12 * fVar29;
      pfVar35[-1] = fVar30;
      *pfVar35 = fVar23;
      pfVar35[1] = fVar22;
      pfVar35[2] = fVar16 * fVar7 + fVar13 * fVar8 + fVar10 * fVar9;
      pfVar35[3] = fVar17 * fVar7 + fVar14 * fVar8 + fVar11 * fVar9;
      pfVar35[4] = fVar18 * fVar7 + fVar15 * fVar8 + fVar12 * fVar9;
      pfVar35[5] = fVar16 * fVar19 + fVar13 * fVar20 + fVar10 * fVar21;
      pfVar35[6] = fVar17 * fVar19 + fVar14 * fVar20 + fVar11 * fVar21;
      pfVar35[7] = fVar18 * fVar19 + fVar15 * fVar20 + fVar12 * fVar21;
      pfVar35 = pfVar35 + 0x10;
      iVar32 = iVar32 + -1;
    } while (iVar32 != 0);
  }
  return;
}


