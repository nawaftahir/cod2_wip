// 1003bf00 size=87 FUN_1003bf00

void FUN_1003bf00(int param_1)

{
  float fVar1;
  
  fVar1 = *(float *)(DAT_101d1b9c + 0x1b4) * *(float *)(DAT_1072ddc8 + 0xc) +
          *(float *)(DAT_101d1b9c + 0x1b8) * *(float *)(DAT_1072ddc8 + 0x10) +
          *(float *)(DAT_101d1b9c + 0x1bc) * *(float *)(DAT_1072ddc8 + 0x14);
  *(float *)(param_1 + 0x1c) = fVar1;
  if (fVar1 < 0.0 != (fVar1 == 0.0)) {
    return;
  }
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1003b750();
    return;
  }
  FUN_1003b990();
  return;
}


