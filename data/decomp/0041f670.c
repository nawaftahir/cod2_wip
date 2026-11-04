
void FUN_0041f670(void)

{
  int iVar1;
  int unaff_ESI;
  int *unaff_EDI;
  
  if ((unaff_ESI == 0) && (DAT_0124a12a == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\MapInfo.cpp",0x1e);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a12a = '\x01';
    }
  }
  if ((unaff_EDI == (int *)0x0) && (DAT_0124a129 == '\0')) {
    iVar1 = FUN_0047d980("stats",".\\MapInfo.cpp",0x1f);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a129 = '\x01';
    }
  }
  if (*(int **)(unaff_ESI + 0x20) != (int *)0x0) {
    if ((*(byte *)(**(int **)(unaff_ESI + 0x20) + 0x10) & 0x40) != 0) {
      unaff_EDI[2] = unaff_EDI[2] + 1;
      return;
    }
    unaff_EDI[1] = unaff_EDI[1] + 1;
    return;
  }
  *unaff_EDI = *unaff_EDI + 1;
  return;
}

