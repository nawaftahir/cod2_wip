
undefined1 FUN_004aa670(int param_1)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a734 == '\0')) {
    iVar1 = FUN_0047d980("model","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",0x27,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a734 = 1;
      return uRam0000008d;
    }
  }
  return *(undefined1 *)(param_1 + 0x8d);
}

