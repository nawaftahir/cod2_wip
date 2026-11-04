
int FUN_004a87b0(void)

{
  int in_EAX;
  int iVar1;
  uint uVar2;
  
  if ((in_EAX == 0) && (DAT_0124a72d == '\0')) {
    iVar1 = FUN_0047d980("stringValue","\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x88,0,1)
    ;
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a72d = '\x01';
    }
  }
  uVar2 = in_EAX * 8;
  if ((0x7ffff < uVar2) && (DAT_0124a72c == '\0')) {
    iVar1 = FUN_0047d980("stringValue * MT_NODE_SIZE < MT_SIZE",
                         "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x89,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a72c = 1;
      return DAT_01223280 + uVar2;
    }
  }
  return DAT_01223280 + uVar2;
}

