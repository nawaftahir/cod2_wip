
void FUN_0040bbe0(void)

{
  int iVar1;
  int unaff_ESI;
  int unaff_EDI;
  
  if (((unaff_ESI < 0) || (*(int *)(unaff_EDI + 0x1c) <= unaff_ESI)) && (DAT_0124a0b6 == '\0')) {
    iVar1 = FUN_0047d980("index >= 0 && index < targetPositions.Num()",
                         "e:\\trees\\cod2src\\radiant\\../src/universal/splines/splines.h",0x486,0,1
                        );
    if (iVar1 != 0) {
      *(int *)(unaff_EDI + 0x54) = unaff_ESI;
      if (iVar1 != 2) {
        return;
      }
      DAT_0124a0b6 = 1;
      return;
    }
    DebugBreak();
  }
  *(int *)(unaff_EDI + 0x54) = unaff_ESI;
  return;
}

