// 10021ff0 size=73 R_EndFrame

void R_EndFrame(void)

{
  if (DAT_101d4d00 != '\0') {
    DAT_101e4a00 = DAT_1042e778;
    DAT_101e4a04 = DAT_101da9c8;
    if (DAT_101d49b0 != 0) {
      DAT_101e4a08 = 1;
      FUN_1001e540();
    }
    DAT_1042e778 = &DAT_103fe718;
    DAT_101da9c8 = &DAT_101e4a0c;
  }
  return;
}


