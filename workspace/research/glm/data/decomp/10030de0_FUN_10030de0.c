// 10030de0 size=655 FUN_10030de0

void FUN_10030de0(int param_1)

{
  float fVar1;
  int iVar2;
  int iVar3;
  float *pfVar4;
  int iVar5;
  
  if ((DAT_1072d9bc != DAT_101d1b38) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  iVar5 = 0;
  pfVar4 = (float *)(param_1 + 8);
  fVar1 = (float)(int)*(short *)(param_1 + 6) * 0.5;
  if (0 < *(short *)(param_1 + 4)) {
    do {
      iVar2 = DAT_1072d9cc;
      if ((0x154a < DAT_1072d9d4 + 4) || (iVar3 = iVar2, 0x100000 < DAT_1072d9d0 + 6)) {
        FUN_1003a8d0();
        FUN_1003a5f0(DAT_1072d9c4);
        iVar3 = DAT_1072d9cc;
        if ((DAT_1072d9cc != iVar2) && ((DAT_1072d9d0 != 0 || (iVar3 = iVar2, DAT_1072d9e0 != 0))))
        {
          FUN_1003a8d0();
          iVar3 = iVar2;
        }
      }
      DAT_1072d9cc = iVar3;
      *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 1;
      *(undefined2 *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 2;
      *(undefined2 *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
      *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + 3;
      DAT_1072d9d0 = DAT_1072d9d0 + 6;
      FUN_1002e640(*pfVar4 - fVar1,pfVar4[1] - fVar1,pfVar4[2],0x3f800000,0,0);
      FUN_1002e640(*pfVar4 - fVar1,fVar1 + pfVar4[1],pfVar4[2],0x3f800000,0,0x3f800000);
      FUN_1002e640(fVar1 + *pfVar4,fVar1 + pfVar4[1],pfVar4[2],0x3f800000,0x3f800000,0x3f800000);
      FUN_1002e640(fVar1 + *pfVar4,pfVar4[1] - fVar1,pfVar4[2],0x3f800000,0x3f800000,0);
      DAT_1072d9d4 = DAT_1072d9d4 + 4;
      iVar5 = iVar5 + 1;
      pfVar4 = pfVar4 + 4;
    } while (iVar5 < *(short *)(param_1 + 4));
  }
  return;
}


