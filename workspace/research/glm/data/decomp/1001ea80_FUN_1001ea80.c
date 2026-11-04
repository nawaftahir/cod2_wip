// 1001ea80 size=408 FUN_1001ea80

void FUN_1001ea80(void)

{
  float *pfVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  float *pfVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  int in_EAX;
  int iVar14;
  float *in_ECX;
  uint uVar15;
  float *pfVar16;
  float *pfVar17;
  int unaff_EBX;
  float *pfVar18;
  float *local_4c;
  int local_48;
  float local_40 [4];
  float fStack_30;
  float fStack_2c;
  float local_28;
  float local_24;
  float local_20;
  
  pfVar16 = *(float **)(in_EAX + 0xc);
  local_48 = (int)*(short *)(in_EAX + 2);
  local_4c = in_ECX;
  if (0 < local_48) {
    do {
      fVar7 = pfVar16[0xc];
      fVar8 = pfVar16[0xd];
      fVar9 = pfVar16[0xe];
      iVar14 = (int)*(short *)((int)pfVar16 + 0x3e);
      pfVar2 = (float *)(iVar14 + 0x20 + unaff_EBX);
      pfVar17 = (float *)(iVar14 + 0x30 + unaff_EBX);
      pfVar3 = (float *)(iVar14 + 0x10 + unaff_EBX);
      fVar10 = *pfVar16;
      fVar11 = pfVar16[1];
      fVar12 = pfVar16[2];
      pfVar18 = (float *)(iVar14 + unaff_EBX);
      uVar15 = (uint)*(byte *)(pfVar16 + 0xf);
      local_40[0] = *pfVar18 * fVar7 + *pfVar3 * fVar8 + *pfVar2 * fVar9 + *pfVar17;
      local_40[1] = pfVar18[1] * fVar7 + pfVar3[1] * fVar8 + pfVar2[1] * fVar9 + pfVar17[1];
      local_40[2] = pfVar18[2] * fVar7 + pfVar3[2] * fVar8 + pfVar2[2] * fVar9 + pfVar17[2];
      if (uVar15 == 0) {
        pfVar17 = pfVar16 + 0x10;
      }
      else {
        pfVar17 = pfVar16 + 0x10;
        fVar7 = (float)*(byte *)((int)pfVar16 + 0x3d) * 0.00390625;
        local_40[0] = local_40[0] * fVar7;
        local_40[1] = local_40[1] * fVar7;
        local_40[2] = local_40[2] * fVar7;
        do {
          iVar14 = (int)*(short *)(pfVar17 + 3);
          pfVar4 = (float *)(iVar14 + 0x30 + unaff_EBX);
          pfVar1 = (float *)(iVar14 + unaff_EBX);
          pfVar5 = (float *)(iVar14 + 0x10 + unaff_EBX);
          pfVar6 = (float *)(iVar14 + 0x20 + unaff_EBX);
          fVar8 = *pfVar17;
          fVar9 = pfVar17[1];
          fVar13 = pfVar17[2];
          fVar7 = (float)*(ushort *)((int)pfVar17 + 0xe) * 1.5258789e-05;
          uVar15 = uVar15 - 1;
          pfVar17 = pfVar17 + 4;
          local_40[0] = local_40[0] +
                        fVar7 * (*pfVar1 * fVar8 + *pfVar5 * fVar9 + *pfVar6 * fVar13 + *pfVar4);
          local_40[1] = local_40[1] +
                        fVar7 * (pfVar1[1] * fVar8 + pfVar5[1] * fVar9 +
                                pfVar6[1] * fVar13 + pfVar4[1]);
          local_40[2] = local_40[2] +
                        fVar7 * (pfVar1[2] * fVar8 + pfVar5[2] * fVar9 +
                                pfVar6[2] * fVar13 + pfVar4[2]);
        } while (uVar15 != 0);
      }
      local_40[3] = *pfVar18 * fVar10 + *pfVar3 * fVar11 + *pfVar2 * fVar12;
      fStack_30 = pfVar18[1] * fVar10 + pfVar3[1] * fVar11 + pfVar2[1] * fVar12;
      fStack_2c = pfVar18[2] * fVar10 + pfVar3[2] * fVar11 + pfVar2[2] * fVar12;
      local_28 = pfVar16[3];
      local_20 = pfVar16[0xb];
      local_24 = pfVar16[7];
      pfVar16 = local_40;
      pfVar18 = local_4c;
      for (iVar14 = 9; iVar14 != 0; iVar14 = iVar14 + -1) {
        *pfVar18 = *pfVar16;
        pfVar16 = pfVar16 + 1;
        pfVar18 = pfVar18 + 1;
      }
      local_4c = local_4c + 9;
      local_48 = local_48 + -1;
      pfVar16 = pfVar17;
    } while (local_48 != 0);
  }
  return;
}


