
uint __thiscall FUN_00451fe0(int param_1,int param_2)

{
  float fVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  float fVar5;
  uint uVar6;
  float *pfVar7;
  float fVar8;
  float *local_14;
  uint local_10;
  
  local_14 = (float *)(param_1 + 0xd8);
  bVar4 = true;
  local_10 = 0;
  pfVar7 = (float *)(param_1 + 0xc0);
  bVar3 = true;
  uVar6 = 0;
  while( true ) {
    iVar2 = *(int *)(param_2 + 0x14);
    if ((uVar6 & 1) == 0) {
      fVar8 = *(float *)(iVar2 + 0x2c + *(int *)(param_1 + 0xa4) * 4);
    }
    else {
      fVar8 = *(float *)(iVar2 + 0x20 + *(int *)(param_1 + 0xa4) * 4);
    }
    if ((uVar6 & 2) == 0) {
      fVar5 = *(float *)(iVar2 + 0x2c + *(int *)(param_1 + 0xa8) * 4);
    }
    else {
      fVar5 = *(float *)(iVar2 + 0x20 + *(int *)(param_1 + 0xa8) * 4);
    }
    fVar8 = fVar5 * pfVar7[1] + fVar8 * *pfVar7;
    if (local_14[-2] < fVar8) break;
LAB_0045207c:
    fVar1 = *local_14;
    if (fVar8 < fVar1) {
      if (!bVar4) goto LAB_004520a1;
      bVar3 = false;
    }
    uVar6 = uVar6 + 1;
    if (3 < (int)uVar6) {
      if ((bVar4) || (bVar3)) {
        return CONCAT31((int3)(CONCAT22((short)((uint)fVar5 >> 0x10),
                                        (ushort)(fVar8 < fVar1) << 8 |
                                        (ushort)(NAN(fVar8) || NAN(fVar1)) << 10 |
                                        (ushort)(fVar8 == fVar1) << 0xe) >> 8),1);
      }
LAB_004520a1:
      local_10 = local_10 + 1;
      local_14 = local_14 + 1;
      pfVar7 = pfVar7 + 2;
      if (1 < (int)local_10) {
        return local_10 & 0xffffff00;
      }
      bVar4 = true;
      bVar3 = true;
      uVar6 = 0;
    }
  }
  if (bVar3) {
    bVar4 = false;
    goto LAB_0045207c;
  }
  goto LAB_004520a1;
}

