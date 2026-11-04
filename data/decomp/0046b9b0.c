
void FUN_0046b9b0(void)

{
  int iVar1;
  bool bVar2;
  
  while( true ) {
    bVar2 = false;
    if (DAT_012334f0 < 0) {
      if (DAT_0124a315 == '\0') {
        iVar1 = FUN_0047d980("prefabStackLevel >= 0",".\\map.cpp",0x5d3,0,1);
        if (iVar1 == 0) {
          DebugBreak();
        }
        else if (iVar1 == 2) {
          DAT_0124a315 = '\x01';
        }
      }
      bVar2 = DAT_012334f0 < 0;
    }
    if (DAT_012334f0 == 0 || bVar2) break;
    FUN_0046b5b0();
  }
  return;
}

