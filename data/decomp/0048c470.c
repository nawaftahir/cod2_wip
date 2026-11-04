
bool FUN_0048c470(void)

{
  int iVar1;
  long lVar2;
  char *unaff_ESI;
  
  if ((unaff_ESI == (char *)0x0) && (DAT_0124a4bb == '\0')) {
    iVar1 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x14e);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4bb = 1;
      lVar2 = _atol((char *)0x0);
      return lVar2 != 0;
    }
  }
  lVar2 = _atol(unaff_ESI);
  return lVar2 != 0;
}

