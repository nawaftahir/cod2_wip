
float10 FUN_0048c530(void)

{
  int iVar1;
  char *unaff_ESI;
  double dVar2;
  
  if ((unaff_ESI == (char *)0x0) && (DAT_0124a4b9 == '\0')) {
    iVar1 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x15c);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4b9 = 1;
      dVar2 = _atof((char *)0x0);
      return (float10)(float)dVar2;
    }
  }
  dVar2 = _atof(unaff_ESI);
  return (float10)(float)dVar2;
}

