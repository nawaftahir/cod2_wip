
void FUN_00489fc0(void)

{
  int iVar1;
  
  if ((DAT_01233514 == 0) && (DAT_0124a445 == '\0')) {
    iVar1 = FUN_0047d980("s_hunkData","\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x370,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a445 = '\x01';
    }
  }
  if ((DAT_01233518 == (LPVOID)0x0) && (DAT_0124a444 == '\0')) {
    iVar1 = FUN_0047d980("s_origHunkData","\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x371,0
                         ,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a444 = '\x01';
    }
  }
  VirtualFree(DAT_01233518,0,0x8000);
  DAT_01147dd0 = 0;
  DAT_01147dc8 = 0;
  DAT_01233514 = 0;
  DAT_01233518 = (LPVOID)0x0;
  DAT_01147dc0 = 0;
  DAT_01147dd4 = 0;
  DAT_01147dcc = 0;
  return;
}

