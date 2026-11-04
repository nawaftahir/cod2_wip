
void FUN_004979e0(int param_1,int param_2,int param_3)

{
  int iVar1;
  
  if ((param_3 == param_1) && (DAT_0124a4e4 == '\0')) {
    iVar1 = FUN_0047d980("out != orFirst","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x609,0,1
                        );
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4e4 = '\x01';
    }
  }
  if ((param_3 == param_2) && (DAT_0124a4e3 == '\0')) {
    iVar1 = FUN_0047d980("out != orSecond","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x60a,0,
                         1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4e3 = '\x01';
    }
  }
  FUN_004977a0();
  FUN_004977a0();
  FUN_004977a0();
  FUN_00497700();
  return;
}

