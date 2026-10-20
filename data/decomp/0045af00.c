
void FUN_0045af00(void)

{
  int iVar1;
  int unaff_EDI;
  
  if ((unaff_EDI == 0) && (DAT_0124a255 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0xa34,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a255 = '\x01';
    }
  }
  if ((*(int *)(unaff_EDI + 0x14) == 0) && (DAT_0124a254 == '\0')) {
    iVar1 = FUN_0047d980("b->def",".\\brush.cpp",0xa35,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a254 = '\x01';
    }
  }
  if (*(int *)(unaff_EDI + 0x1c) != 0) {
    FUN_00454810();
    *(undefined4 *)(unaff_EDI + 0x1c) = 0;
    *(undefined4 *)(unaff_EDI + 0x18) = 0;
  }
  if (*(int *)(unaff_EDI + 0x20) != 0) {
    FUN_0042cc50();
  }
  *(short *)(unaff_EDI + 0x24) = *(short *)(*(int *)(unaff_EDI + 0x14) + 0x42) + -1;
  return;
}

