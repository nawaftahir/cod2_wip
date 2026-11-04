
void FUN_0048dee0(int param_1)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a49d == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x437,0,1);
    if (iVar1 != 0) {
      uRam00000007 = 0;
      if (iVar1 != 2) {
        uRam00000007 = 0;
        return;
      }
      DAT_0124a49d = 1;
      return;
    }
    DebugBreak();
  }
  *(undefined1 *)(param_1 + 7) = 0;
  return;
}

