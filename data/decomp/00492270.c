
undefined4 FUN_00492270(void)

{
  short sVar1;
  short sVar2;
  short unaff_SI;
  short unaff_DI;
  
  if ((-1 < unaff_SI) && (-1 < unaff_DI)) {
    sVar2 = 0;
    sVar1 = unaff_SI;
    if (0 < DAT_01154630) {
      do {
        sVar1 = (&DAT_011546c4)[sVar1 * 0x24];
        sVar2 = sVar2 + 1;
        if (sVar1 == unaff_DI) {
          return 1;
        }
      } while (((-1 < sVar1) && (sVar1 != unaff_SI)) && (sVar2 < DAT_01154630));
    }
  }
  return 0;
}

