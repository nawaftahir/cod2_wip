// 1003b990 size=582 FUN_1003b990

void FUN_1003b990(void)

{
  float *pfVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  int iVar11;
  float *pfVar12;
  float local_c;
  float local_8;
  
  iVar11 = DAT_101d1b9c;
  pfVar1 = (float *)(DAT_101d1b9c + 0x1b4);
  if ((DAT_1072d9bc != *(int *)(DAT_101d1b9c + 0x164)) || (DAT_1072d9c0 != 1)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  pfVar12 = (float *)FUN_1003ad40(0xffffffff);
  fVar8 = *(float *)(DAT_101d1b9c + 0x16c) * 0.001311093;
  if (*(float *)(iVar11 + 0x1bc) * *(float *)(iVar11 + 0x1bc) <= 0.99) {
    local_c = *(float *)(iVar11 + 0x1b8);
    local_8 = -*pfVar1;
  }
  else {
    local_c = 1.0;
    local_8 = 0.0;
  }
  fVar2 = *(float *)(iVar11 + 0x1b8);
  fVar3 = *(float *)(iVar11 + 0x1bc);
  fVar4 = *(float *)(iVar11 + 0x1bc);
  fVar5 = *pfVar1;
  fVar6 = *pfVar1;
  fVar7 = *(float *)(iVar11 + 0x1b8);
  FUN_100590b0();
  fVar2 = (fVar2 * 0.0 - local_8 * fVar3) * fVar8;
  fVar3 = (local_c * fVar4 - fVar5 * 0.0) * fVar8;
  fVar8 = (local_8 * fVar6 - local_c * fVar7) * fVar8;
  fVar4 = fVar3 * *(float *)(iVar11 + 0x1bc) - fVar8 * *(float *)(iVar11 + 0x1b8);
  fVar5 = fVar8 * *pfVar1 - fVar2 * *(float *)(iVar11 + 0x1bc);
  fVar6 = fVar2 * *(float *)(iVar11 + 0x1b8) - fVar3 * *pfVar1;
  fVar7 = fVar4 + fVar2;
  fVar9 = fVar5 + fVar3;
  fVar10 = fVar6 + fVar8;
  fVar2 = fVar2 - fVar4;
  fVar3 = fVar3 - fVar5;
  fVar8 = fVar8 - fVar6;
  *pfVar12 = fVar7 + *pfVar1;
  pfVar12[1] = fVar9 + *(float *)(iVar11 + 0x1b8);
  pfVar12[2] = fVar10 + *(float *)(iVar11 + 0x1bc);
  pfVar12[0x10] = fVar2 + *pfVar1;
  pfVar12[0x11] = fVar3 + *(float *)(iVar11 + 0x1b8);
  pfVar12[0x12] = fVar8 + *(float *)(iVar11 + 0x1bc);
  pfVar12[0x20] = *pfVar1 - fVar7;
  pfVar12[0x21] = *(float *)(iVar11 + 0x1b8) - fVar9;
  pfVar12[0x22] = *(float *)(iVar11 + 0x1bc) - fVar10;
  pfVar12[0x30] = *pfVar1 - fVar2;
  pfVar12[0x31] = *(float *)(iVar11 + 0x1b8) - fVar3;
  pfVar12[0x32] = *(float *)(iVar11 + 0x1bc) - fVar8;
  pfVar12[3] = 0.0;
  pfVar12[0x13] = 0.0;
  pfVar12[0x23] = 0.0;
  pfVar12[0x33] = 0.0;
  FUN_1003a8d0();
  return;
}


