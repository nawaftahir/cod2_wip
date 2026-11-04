// 1005ee60 size=529 FUN_1005ee60

void FUN_1005ee60(float *param_1,int param_2,int param_3,int param_4)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  uint uVar12;
  byte in_DL;
  float *pfVar13;
  byte bVar14;
  int iVar15;
  float *pfVar16;
  int local_18;
  int local_10;
  
  uVar9 = 1 << (in_DL & 0x1f);
  iVar15 = 0;
  pfVar13 = param_1;
  if (0 < (int)uVar9) {
    do {
      iVar10 = *(int *)(param_3 + iVar15 * 4) >> (8 - in_DL & 0x1f);
      if (iVar10 < iVar15) {
        fVar7 = *pfVar13;
        fVar8 = pfVar13[1];
        pfVar16 = param_1 + iVar10 * param_2 * 2;
        *pfVar13 = *pfVar16;
        pfVar13[1] = pfVar16[1];
        *pfVar16 = fVar7;
        pfVar16[1] = fVar8;
      }
      pfVar13 = pfVar13 + param_2 * 2;
      iVar15 = iVar15 + 1;
    } while (iVar15 < (int)uVar9);
  }
  uVar12 = uVar9 >> 2;
  pfVar13 = param_1 + param_2 * 2;
  pfVar16 = param_1;
  do {
    fVar7 = pfVar16[1];
    fVar8 = pfVar16[param_2 * 4];
    fVar1 = pfVar16[param_2 * 4 + 1];
    fVar2 = *pfVar16;
    fVar3 = *pfVar16;
    fVar4 = pfVar16[param_2 * 4];
    fVar5 = *pfVar13;
    fVar6 = pfVar13[param_2 * 4];
    *pfVar16 = fVar4 + fVar6 + fVar3 + fVar5;
    pfVar16[param_2 * 4] = (fVar3 + fVar5) - (fVar4 + fVar6);
    fVar3 = pfVar16[1];
    fVar4 = pfVar16[param_2 * 4 + 1];
    fVar5 = pfVar13[1];
    fVar6 = pfVar13[param_2 * 4 + 1];
    pfVar16[1] = fVar4 + fVar6 + fVar3 + fVar5;
    pfVar16[param_2 * 4 + 1] = (fVar3 + fVar5) - (fVar4 + fVar6);
    fVar3 = *pfVar13;
    fVar4 = pfVar13[param_2 * 4 + 1];
    *pfVar13 = (fVar3 - fVar2) - (fVar4 - fVar1);
    fVar5 = pfVar13[param_2 * 4];
    pfVar13[param_2 * 4] = (fVar3 - fVar2) + (fVar4 - fVar1);
    fVar1 = pfVar13[1];
    pfVar13[1] = (fVar1 - fVar7) + (fVar5 - fVar8);
    pfVar13[param_2 * 4 + 1] = (fVar1 - fVar7) - (fVar5 - fVar8);
    uVar12 = uVar12 - 1;
    pfVar16 = pfVar16 + param_2 * 8;
    pfVar13 = pfVar13 + param_2 * 8;
  } while (uVar12 != 0);
  local_10 = 4;
  bVar14 = 5;
  if (4 < (int)uVar9) {
    do {
      iVar15 = local_10 * 2;
      local_18 = 0;
      if (0 < local_10) {
        uVar12 = 0;
        do {
          iVar10 = local_18 << (bVar14 & 0x1f);
          fVar7 = *(float *)(param_4 + iVar10 * 8);
          fVar8 = *(float *)(param_4 + 4 + iVar10 * 8);
          if (uVar12 < uVar9 * param_2) {
            pfVar13 = param_1 + (local_10 * param_2 + uVar12) * 2;
            uVar11 = uVar12;
            do {
              fVar1 = fVar7 * *pfVar13 - fVar8 * pfVar13[1];
              fVar2 = fVar7 * pfVar13[1] + fVar8 * *pfVar13;
              *pfVar13 = param_1[uVar11 * 2] - fVar1;
              pfVar13[1] = param_1[uVar11 * 2 + 1] - fVar2;
              pfVar13 = pfVar13 + iVar15 * param_2 * 2;
              param_1[uVar11 * 2] = fVar1 + param_1[uVar11 * 2];
              param_1[uVar11 * 2 + 1] = fVar2 + param_1[uVar11 * 2 + 1];
              uVar11 = uVar11 + iVar15 * param_2;
            } while (uVar11 < uVar9 * param_2);
          }
          local_18 = local_18 + 1;
          uVar12 = uVar12 + param_2;
        } while (local_18 < local_10);
      }
      bVar14 = bVar14 - 1;
      local_10 = iVar15;
    } while (iVar15 < (int)uVar9);
  }
  return;
}


