
void FUN_0048df40(int param_1)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a49c == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x43e,0,1);
    if (iVar1 != 0) {
      uRam00000007 = 1;
      if (iVar1 == 2) {
        DAT_0124a49c = '\x01';
      }
      return;
    }
    DebugBreak();
    uRam00000007 = 1;
    return;
  }
  *(undefined1 *)(param_1 + 7) = 1;
  return;
}

