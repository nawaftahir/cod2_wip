// 10021f40 size=70 R_DrawSprite

void R_DrawSprite(void)

{
  if (DAT_101d4d00 != '\0') {
    if (DAT_101d0b00 != 0) {
      DAT_101d0b00 = 0;
      FUN_10016e70();
    }
    FUN_10021e50();
    (*(code *)RI_CL_UpdateDebugData)(0);
    if (*(char *)(DAT_101ce70c + 8) != '\0') {
      FUN_1001e4b0(0);
    }
  }
  return;
}


