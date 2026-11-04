
void FUN_004559f0(char param_1)

{
  int unaff_ESI;
  
  FUN_0045a220();
  if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
    FUN_00475350();
  }
  if (param_1 != '\0') {
    FUN_0047a3c0();
  }
  *(short *)(unaff_ESI + 0x42) = *(short *)(unaff_ESI + 0x42) + 1;
  return;
}

