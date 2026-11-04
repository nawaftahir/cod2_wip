
void FUN_0048ae30(void)

{
  int iVar1;
  
  if ((DAT_01233514 == 0) && (DAT_0124a414 == '\0')) {
    iVar1 = FUN_0047d980("s_hunkData","\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x6e9,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a414 = '\x01';
    }
  }
  if ((DAT_01147dcc != DAT_01147dc8) && (DAT_0124a413 == '\0')) {
    iVar1 = FUN_0047d980("hunk_high.temp == hunk_high.permanent",
                         "\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x6ea,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a413 = 1;
      return;
    }
  }
  return;
}

