// 10031470 size=760 FUN_10031470

void FUN_10031470(int param_1,int param_2)

{
  float fVar1;
  int iVar2;
  int iVar3;
  float10 fVar4;
  float local_8;
  float local_4;
  
  if ((DAT_1072d9bc != DAT_101d1b38) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if (0 < param_1) {
    param_2 = param_2 + 0xc;
    do {
      local_8 = *(float *)(param_2 + 8) - *(float *)(param_2 + -8);
      local_4 = *(float *)(param_2 + -0xc) - *(float *)(param_2 + 4);
      fVar4 = (float10)FUN_1010a920();
      iVar2 = DAT_1072d9cc;
      if ((float)fVar4 != 0.0) {
        fVar1 = 1.0 / (float)fVar4;
        local_8 = fVar1 * local_8;
        local_4 = fVar1 * local_4;
      }
      local_8 = local_8 * 0.5;
      local_4 = local_4 * 0.5;
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
      FUN_1002e550(*(float *)(param_2 + -0xc) - local_8,*(float *)(param_2 + -8) - local_4,
                   *(undefined4 *)(param_2 + -4),0,0);
      FUN_1002e550(*(float *)(param_2 + 4) - local_8,*(float *)(param_2 + 8) - local_4,
                   *(undefined4 *)(param_2 + 0xc),0,0x3f800000);
      FUN_1002e550(local_8 + *(float *)(param_2 + 4),local_4 + *(float *)(param_2 + 8),
                   *(undefined4 *)(param_2 + 0xc),0x3f800000,0x3f800000);
      FUN_1002e550(local_8 + *(float *)(param_2 + -0xc),local_4 + *(float *)(param_2 + -8),
                   *(undefined4 *)(param_2 + -4),0x3f800000,0);
      DAT_1072d9d4 = DAT_1072d9d4 + 4;
      param_2 = param_2 + 0x20;
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


