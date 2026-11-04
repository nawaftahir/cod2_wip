// 100f936c size=69 FUN_100f936c

void FUN_100f936c(void)

{
  ushort in_FPUControlWord;
  
  if ((DAT_1076adb0 != 0) && ((MXCSR & 0x1f80) == 0x1f80 && (in_FPUControlWord & 0x7f) == 0x7f)) {
    FUN_101051d0();
    return;
  }
  __cintrindisp1();
  return;
}


