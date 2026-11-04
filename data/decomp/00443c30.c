
bool FUN_00443c30(void)

{
  int in_EAX;
  int iVar1;
  int unaff_EDI;
  
  if ((in_EAX == 0) && (DAT_0124a1f6 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00549cec,".\\Undo.cpp",0x14f,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1f6 = '\x01';
    }
  }
  if ((unaff_EDI == 0) && (DAT_0124a1f5 == '\0')) {
    iVar1 = FUN_0047d980("brush",".\\Undo.cpp",0x150);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1f5 = 1;
      return iRam00000010 == *(int *)(DAT_0109fdcc + 8);
    }
  }
  return *(int *)(unaff_EDI + 0x10) == *(int *)(DAT_0109fdcc + 8);
}

