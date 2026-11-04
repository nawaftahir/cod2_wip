// 100f8f20 size=84 FUN_100f8f20

void FUN_100f8f20(void)

{
  ushort in_FPUControlWord;
  float10 in_ST0;
  float10 in_ST1;
  
  if ((DAT_1076adb0 != 0) && ((MXCSR & 0x1f80) == 0x1f80 && (in_FPUControlWord & 0x7f) == 0x7f)) {
    FUN_101030c0();
    return;
  }
  FUN_100f8f7d((double)in_ST1,(double)in_ST0);
  return;
}


