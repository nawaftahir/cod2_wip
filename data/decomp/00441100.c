
void FUN_00441100(void)

{
  int iVar1;
  HMENU pHVar2;
  uint unaff_EBX;
  
  FUN_00441460();
  if ((((int)unaff_EBX < 0) || (DAT_01234d5c <= (int)unaff_EBX)) && (DAT_0124a1d8 == '\0')) {
    iVar1 = FUN_0047d980("index >= 0 && index < texWndGlobals.usageCount",".\\TexWnd.cpp",0x1d7,0,1)
    ;
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1d8 = '\x01';
    }
  }
  if (unaff_EBX != DAT_01234d64) {
    iVar1 = 5;
    pHVar2 = GetMenu(DAT_010bcd54);
    pHVar2 = GetSubMenu(pHVar2,iVar1);
    CheckMenuItem(pHVar2,DAT_01234d64 + 60000,0);
    CheckMenuItem(pHVar2,unaff_EBX + 60000,8);
    DAT_01234d64 = (byte)unaff_EBX;
    if (((unaff_EBX & 0xff) != unaff_EBX) && (DAT_0124a1d7 == '\0')) {
      iVar1 = FUN_0047d980("texWndGlobals.usageFilter == index",".\\TexWnd.cpp",0x1e0,1,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a1d7 = 1;
        DAT_0123348c = DAT_0123348c | 0x10;
        return;
      }
    }
    DAT_0123348c = DAT_0123348c | 0x10;
  }
  return;
}

