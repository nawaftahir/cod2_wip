// 1010abb0 size=79 FUN_1010abb0

void FUN_1010abb0(void)

{
  ushort in_FPUControlWord;
  float10 in_ST0;
  
  if ((DAT_1076adb0 != 0) && ((MXCSR & 0x1f80) == 0x1f80 && (in_FPUControlWord & 0x7f) == 0x7f)) {
    FUN_1010ae20();
    return;
  }
  FUN_10102fb8((double)in_ST0);
  FUN_1010ac08();
  return;
}


