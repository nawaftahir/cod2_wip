
void FUN_0048c4d0(void)

{
  int iVar1;
  char *unaff_ESI;
  
  if ((unaff_ESI == (char *)0x0) && (DAT_0124a4ba == '\0')) {
    iVar1 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x155);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4ba = 1;
      _atol((char *)0x0);
      return;
    }
  }
  _atol(unaff_ESI);
  return;
}

