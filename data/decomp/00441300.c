
void FUN_00441300(void)

{
  int iVar1;
  HMENU pHVar2;
  uint unaff_EBX;
  
  FUN_00441460();
  if ((((int)unaff_EBX < 0) || (0x16 < unaff_EBX)) && (DAT_0124a1d4 == '\0')) {
    iVar1 = FUN_0047d980("index >= 0 && index < ARRAY_COUNT( surfaceTypes )",".\\TexWnd.cpp",0x1ff,0
                         ,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1d4 = '\x01';
    }
  }
  if (unaff_EBX != DAT_01234d66) {
    iVar1 = 5;
    pHVar2 = GetMenu(DAT_010bcd54);
    pHVar2 = GetSubMenu(pHVar2,iVar1);
    CheckMenuItem(pHVar2,DAT_01234d66 + 0xec60,0);
    CheckMenuItem(pHVar2,unaff_EBX + 0xec60,8);
    DAT_01234d66 = (byte)unaff_EBX;
    if (((unaff_EBX & 0xff) != unaff_EBX) && (DAT_0124a1d3 == '\0')) {
      iVar1 = FUN_0047d980("texWndGlobals.surfaceTypeFilter == index",".\\TexWnd.cpp",0x208,1,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a1d3 = 1;
        DAT_0123348c = DAT_0123348c | 0x10;
        return;
      }
    }
    DAT_0123348c = DAT_0123348c | 0x10;
  }
  return;
}

