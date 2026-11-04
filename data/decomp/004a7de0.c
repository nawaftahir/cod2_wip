
uint FUN_004a7de0(void)

{
  int iVar1;
  int iVar2;
  int unaff_ESI;
  
  if ((unaff_ESI < 1) && (DAT_0124a6ee == '\0')) {
    iVar1 = FUN_0047d980("numBytes > 0","\\trees\\cod2src\\src\\script\\scr_memorytree.cpp",0x22e,0,
                         1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a6ee = '\x01';
    }
  }
  if (unaff_ESI < 0x10000) {
    iVar1 = (int)(unaff_ESI + 7 + (unaff_ESI + 7 >> 0x1f & 7U)) >> 3;
    iVar2 = iVar1 + -1;
    if (iVar2 < 0x100) {
      return (uint)(byte)(&DAT_012030ff)[iVar1];
    }
    return (byte)(&DAT_01203100)[iVar2 >> 8] + 8;
  }
  FUN_0047ae50(1,"%s: failed allocation of %d bytes for script usage",
               "MT_GetSize: max allocation exceeded");
  return 0;
}

