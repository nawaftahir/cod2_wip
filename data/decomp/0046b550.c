
bool FUN_0046b550(void)

{
  int iVar1;
  
  if ((DAT_012334f0 < 0) && (DAT_0124a315 == '\0')) {
    iVar1 = FUN_0047d980("prefabStackLevel >= 0",".\\map.cpp",0x5d3,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a315 = 1;
      return 0 < DAT_012334f0;
    }
  }
  return 0 < DAT_012334f0;
}

