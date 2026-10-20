
void FUN_004965d0(int param_1,int param_2)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a502 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00553e3c,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x260,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a502 = '\x01';
    }
  }
  if ((param_2 == 0) && (DAT_0124a501 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00553e38,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x261,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a501 = 1;
      FUN_00496530();
      return;
    }
  }
  FUN_00496530();
  return;
}

