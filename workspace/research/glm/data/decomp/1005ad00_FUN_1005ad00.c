// 1005ad00 size=1513 FUN_1005ad00

void FUN_1005ad00(void)

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
  float *in_EAX;
  float *pfVar29;
  float *in_ECX;
  int iVar30;
  
  fVar1 = *in_EAX;
  fVar2 = in_EAX[1];
  fVar3 = in_EAX[2];
  fVar4 = in_EAX[3];
  fVar5 = in_EAX[4];
  fVar6 = in_EAX[5];
  fVar7 = in_EAX[6];
  fVar8 = in_EAX[7];
  fVar9 = in_EAX[8];
  fVar10 = in_EAX[9];
  fVar11 = in_EAX[10];
  fVar12 = in_EAX[0xb];
  fVar13 = in_EAX[0xc];
  fVar14 = in_EAX[0xd];
  fVar15 = in_EAX[0xe];
  fVar16 = in_EAX[0xf];
  fVar17 = fVar16 * fVar11;
  fVar18 = fVar12 * fVar15;
  fVar19 = fVar7 * fVar16;
  fVar20 = fVar8 * fVar15;
  fVar21 = fVar7 * fVar12;
  fVar22 = fVar8 * fVar11;
  fVar23 = fVar3 * fVar16;
  fVar24 = fVar4 * fVar15;
  fVar25 = fVar3 * fVar12;
  fVar26 = fVar4 * fVar11;
  fVar27 = fVar3 * fVar8;
  fVar28 = fVar4 * fVar7;
  pfVar29 = in_ECX + 2;
  *in_ECX = (fVar6 * fVar17 + fVar10 * fVar20 + fVar14 * fVar21) -
            (fVar6 * fVar18 + fVar10 * fVar19 + fVar14 * fVar22);
  in_ECX[1] = (fVar2 * fVar18 + fVar10 * fVar23 + fVar14 * fVar26) -
              (fVar2 * fVar17 + fVar10 * fVar24 + fVar14 * fVar25);
  *pfVar29 = (fVar2 * fVar19 + fVar6 * fVar24 + fVar14 * fVar27) -
             (fVar2 * fVar20 + fVar6 * fVar23 + fVar14 * fVar28);
  in_ECX[3] = (fVar2 * fVar22 + fVar6 * fVar25 + fVar10 * fVar28) -
              (fVar2 * fVar21 + fVar6 * fVar26 + fVar10 * fVar27);
  in_ECX[4] = (fVar5 * fVar18 + fVar9 * fVar19 + fVar13 * fVar22) -
              (fVar5 * fVar17 + fVar9 * fVar20 + fVar13 * fVar21);
  in_ECX[5] = (fVar9 * fVar24 + fVar1 * fVar17 + fVar13 * fVar25) -
              (fVar9 * fVar23 + fVar1 * fVar18 + fVar13 * fVar26);
  in_ECX[6] = (fVar5 * fVar23 + fVar1 * fVar20 + fVar13 * fVar28) -
              (fVar5 * fVar24 + fVar1 * fVar19 + fVar13 * fVar27);
  in_ECX[7] = (fVar5 * fVar26 + fVar9 * fVar27 + fVar1 * fVar21) -
              (fVar5 * fVar25 + fVar9 * fVar28 + fVar1 * fVar22);
  fVar17 = fVar9 * fVar14;
  fVar18 = fVar13 * fVar10;
  fVar19 = fVar5 * fVar14;
  fVar20 = fVar13 * fVar6;
  fVar21 = fVar5 * fVar10;
  fVar22 = fVar9 * fVar6;
  fVar14 = fVar1 * fVar14;
  fVar23 = fVar13 * fVar2;
  fVar10 = fVar1 * fVar10;
  fVar24 = fVar9 * fVar2;
  fVar6 = fVar1 * fVar6;
  fVar2 = fVar5 * fVar2;
  in_ECX[8] = (fVar21 * fVar16 + fVar8 * fVar17 + fVar20 * fVar12) -
              (fVar22 * fVar16 + fVar19 * fVar12 + fVar8 * fVar18);
  in_ECX[9] = (fVar24 * fVar16 + fVar14 * fVar12 + fVar4 * fVar18) -
              (fVar10 * fVar16 + fVar4 * fVar17 + fVar23 * fVar12);
  in_ECX[10] = (fVar6 * fVar16 + fVar4 * fVar19 + fVar23 * fVar8) -
               (fVar2 * fVar16 + fVar14 * fVar8 + fVar4 * fVar20);
  in_ECX[0xb] = (fVar2 * fVar12 + fVar10 * fVar8 + fVar4 * fVar22) -
                (fVar6 * fVar12 + fVar24 * fVar8 + fVar4 * fVar21);
  in_ECX[0xc] = (fVar19 * fVar11 + fVar7 * fVar18 + fVar22 * fVar15) -
                (fVar20 * fVar11 + fVar7 * fVar17 + fVar21 * fVar15);
  in_ECX[0xd] = (fVar23 * fVar11 + fVar3 * fVar17 + fVar10 * fVar15) -
                (fVar14 * fVar11 + fVar3 * fVar18 + fVar24 * fVar15);
  in_ECX[0xe] = (fVar2 * fVar15 + fVar14 * fVar7 + fVar3 * fVar20) -
                (fVar6 * fVar15 + fVar3 * fVar19 + fVar23 * fVar7);
  in_ECX[0xf] = (fVar6 * fVar11 + fVar24 * fVar7 + fVar3 * fVar21) -
                (fVar2 * fVar11 + fVar10 * fVar7 + fVar3 * fVar22);
  iVar30 = 2;
  fVar1 = 1.0 / (fVar5 * in_ECX[1] + fVar1 * *in_ECX + fVar13 * in_ECX[3] + fVar9 * *pfVar29);
  do {
    iVar30 = iVar30 + -1;
    pfVar29[-2] = fVar1 * pfVar29[-2];
    pfVar29[-1] = fVar1 * pfVar29[-1];
    *pfVar29 = fVar1 * *pfVar29;
    pfVar29[1] = fVar1 * pfVar29[1];
    pfVar29[2] = fVar1 * pfVar29[2];
    pfVar29[3] = fVar1 * pfVar29[3];
    pfVar29[4] = fVar1 * pfVar29[4];
    pfVar29[5] = fVar1 * pfVar29[5];
    pfVar29 = pfVar29 + 8;
  } while (iVar30 != 0);
  return;
}


