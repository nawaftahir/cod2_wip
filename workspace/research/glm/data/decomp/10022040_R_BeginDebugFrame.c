// 10022040 size=114 R_BeginDebugFrame

void R_BeginDebugFrame(void)

{
  int iVar1;
  
  if (DAT_101d4d00 != '\0') {
    FUN_10020ec0();
    iVar1 = DAT_101da9c8;
    *(undefined4 *)(DAT_101da9c8 + 0x249d0c) = 0;
    *(undefined4 *)(iVar1 + 0x249d10) = 0;
    *(undefined4 *)(iVar1 + 0x249d14) = 0;
    FUN_10033d20(iVar1);
    FUN_10033b20();
    DAT_1042e778 = DAT_101e4a00;
    DAT_101da9c8 = DAT_101e4a04;
    if (DAT_101e4a08 != '\0') {
      DAT_101e4a08 = '\0';
      FUN_1001e4b0(1);
    }
    DAT_101e4a00 = 0;
    DAT_101e4a04 = 0;
  }
  return;
}


