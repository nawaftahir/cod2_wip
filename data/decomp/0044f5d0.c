
undefined4 FUN_0044f5d0(void)

{
  int iVar1;
  undefined4 uVar2;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a21c == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\XYWnd.cpp",0xa0e);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a21c = '\x01';
    }
  }
  if (*(char *)(unaff_ESI + 0x26) != '\0') {
    return 1;
  }
  uVar2 = FUN_0044f630(*(undefined4 *)(unaff_ESI + 0x14));
  return uVar2;
}

