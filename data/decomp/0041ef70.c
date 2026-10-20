
int __thiscall FUN_0041ef70(int param_1,int param_2)

{
  int iVar1;
  
  if (((param_2 < 0) || (1 < param_2)) && (DAT_0124a0fb == '\0')) {
    iVar1 = FUN_0047d980("index >= 0 && index < 2",
                         "e:\\trees\\cod2src\\radiant\\../src/universal/splines/splines.h",0x2b0,0,1
                        );
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0fb = '\x01';
    }
  }
  iVar1 = param_1 + 0x40;
  if (param_2 != 0) {
    iVar1 = param_1 + 0x4c;
  }
  return iVar1;
}

