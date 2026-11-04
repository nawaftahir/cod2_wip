// 1005a510 size=271 FUN_1005a510

void FUN_1005a510(void)

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
  float *in_EAX;
  float *in_ECX;
  
  fVar1 = in_ECX[1];
  fVar2 = *in_ECX;
  fVar3 = in_EAX[6];
  fVar4 = in_ECX[2];
  fVar5 = in_EAX[7];
  fVar6 = in_ECX[2];
  fVar7 = in_ECX[1];
  fVar8 = *in_ECX;
  fVar9 = in_EAX[8];
  fVar10 = in_ECX[2];
  fVar11 = *in_ECX;
  fVar12 = in_ECX[1];
  fVar13 = in_ECX[5];
  fVar14 = in_EAX[6];
  fVar15 = in_ECX[3];
  fVar16 = *in_EAX;
  fVar17 = in_ECX[4];
  fVar18 = in_ECX[5];
  fVar19 = in_EAX[7];
  fVar20 = in_ECX[4];
  fVar21 = in_ECX[3];
  fVar22 = in_EAX[1];
  fVar23 = in_ECX[3];
  fVar24 = in_EAX[2];
  fVar25 = in_EAX[8];
  fVar26 = in_ECX[5];
  fVar27 = in_ECX[4];
  in_EAX[6] = in_ECX[7] * in_EAX[3] + in_ECX[6] * *in_EAX + in_ECX[8] * in_EAX[6];
  in_EAX[7] = in_ECX[6] * in_EAX[1] + in_ECX[7] * in_EAX[4] + in_ECX[8] * in_EAX[7];
  in_EAX[8] = in_EAX[5] * in_ECX[7] + in_EAX[8] * in_ECX[8] + in_ECX[6] * in_EAX[2];
  *in_EAX = fVar3 * fVar4 + fVar2 * *in_EAX + fVar1 * in_EAX[3];
  in_EAX[1] = in_EAX[1] * fVar8 + fVar7 * in_EAX[4] + fVar5 * fVar6;
  in_EAX[2] = fVar12 * in_EAX[5] + fVar11 * in_EAX[2] + fVar9 * fVar10;
  in_EAX[3] = fVar17 * in_EAX[3] + fVar15 * fVar16 + fVar13 * fVar14;
  in_EAX[4] = fVar21 * fVar22 + fVar20 * in_EAX[4] + fVar18 * fVar19;
  in_EAX[5] = in_EAX[5] * fVar27 + fVar25 * fVar26 + fVar23 * fVar24;
  return;
}


