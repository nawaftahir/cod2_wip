// 1002faf0 size=619 FUN_1002faf0

void FUN_1002faf0(int *param_1)

{
  int iVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  int iVar5;
  int iVar6;
  float *pfVar7;
  int local_18;
  
  iVar1 = *param_1;
  if ((DAT_1072d9bc != DAT_101d1b34) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  local_18 = 0;
  if (0 < *(int *)(iVar1 + 8)) {
    pfVar7 = (float *)(iVar1 + 0xc);
    do {
      iVar5 = DAT_1072d9cc;
      if ((0x154a < DAT_1072d9d4 + 4) || (iVar6 = iVar5, 0x100000 < DAT_1072d9d0 + 6)) {
        FUN_1003a8d0();
        FUN_1003a5f0(DAT_1072d9c4);
        iVar6 = DAT_1072d9cc;
        if ((DAT_1072d9cc != iVar5) && ((DAT_1072d9d0 != 0 || (iVar6 = iVar5, DAT_1072d9e0 != 0))))
        {
          FUN_1003a8d0();
          iVar6 = iVar5;
        }
      }
      DAT_1072d9cc = iVar6;
      fVar2 = *pfVar7;
      fVar3 = *pfVar7 - *(float *)(iVar1 + 4);
      fVar4 = -fVar2;
      FUN_1002e640(fVar4,fVar4,fVar3,fVar2,0,0);
      FUN_1002e640(fVar4,fVar2,fVar3,fVar2,0,0);
      FUN_1002e640(fVar2,fVar2,fVar3,fVar2,0,0);
      FUN_1002e640(fVar2,fVar4,fVar3,fVar2,0,0);
      *(undefined2 *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 1;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 3;
      *(undefined2 *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      DAT_1072d9d4 = DAT_1072d9d4 + 4;
      DAT_1072d9d0 = DAT_1072d9d0 + 6;
      pfVar7 = pfVar7 + 1;
      local_18 = local_18 + 1;
    } while (local_18 < *(int *)(iVar1 + 8));
  }
  FUN_1003a8d0();
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


