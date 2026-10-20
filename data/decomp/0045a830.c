
void FUN_0045a830(void)

{
  int iVar1;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a25a == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0x9b3,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a25a = '\x01';
    }
  }
  if ((*(int *)(unaff_ESI + 0x14) == 0) && (DAT_0124a259 == '\0')) {
    iVar1 = FUN_0047d980("b->def",".\\brush.cpp",0x9b4,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a259 = '\x01';
    }
  }
  if (*(short *)(unaff_ESI + 0x24) != *(short *)(*(int *)(unaff_ESI + 0x14) + 0x42)) {
    FUN_0045a600();
    if ((*(short *)(unaff_ESI + 0x24) != *(short *)(*(int *)(unaff_ESI + 0x14) + 0x42)) &&
       (DAT_0124a258 == '\0')) {
      iVar1 = FUN_0047d980("b->version == b->def->version",".\\brush.cpp",0x9ba,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a258 = 1;
        return;
      }
    }
  }
  return;
}

