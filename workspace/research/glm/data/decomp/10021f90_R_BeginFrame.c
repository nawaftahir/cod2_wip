// 10021f90 size=86 R_BeginFrame

void R_BeginFrame(void)

{
  if (DAT_101d4d00 != '\0') {
    FUN_10032e20();
    FUN_1001e540();
    (*(code *)RI_SEH_ReadCharFromString)();
    FUN_100058b0(DAT_101da9c8 + 0x249d18);
    FUN_10020d50();
    if (DAT_101d49c4 != 0) {
      (*(code *)RI_Z_VirtualDecommitInternal)(DAT_101d49c0,DAT_101d49c4);
      DAT_101d49c4 = 0;
    }
  }
  return;
}


