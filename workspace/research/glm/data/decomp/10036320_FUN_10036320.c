// 10036320 size=121 FUN_10036320

undefined4 FUN_10036320(void)

{
  int in_ECX;
  undefined4 *unaff_EBX;
  int *unaff_ESI;
  
  if (((DAT_101d1b9c == 0) || (*(char *)(DAT_101ce758 + 8) == '\0')) && (*unaff_ESI != 0)) {
    FUN_10035fb0();
    FUN_10036100(0x3f800000);
    if ((*(byte *)(unaff_ESI[1] + 4 + in_ECX * 8) & 1) != 0) {
      *unaff_EBX = 0x3f800000;
      return 1;
    }
    *unaff_EBX = 0;
    return 1;
  }
  return 0;
}


