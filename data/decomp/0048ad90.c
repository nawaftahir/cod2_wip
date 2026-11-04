
void FUN_0048ad90(void)

{
  int iVar1;
  
  if ((DAT_01233514 == 0) && (DAT_0124a417 == '\0')) {
    iVar1 = FUN_0047d980("s_hunkData","\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x6dc,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a417 = '\x01';
    }
  }
  if ((DAT_01147dd4 != DAT_01147dd0) && (DAT_0124a416 == '\0')) {
    iVar1 = FUN_0047d980("hunk_low.temp == hunk_low.permanent",
                         "\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x6dd,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a416 = 1;
      return;
    }
  }
  return;
}

