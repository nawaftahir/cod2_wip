
void FUN_00468030(void)

{
  int iVar1;
  
  while (DAT_010a44e0 != &DAT_010a44dc) {
    FUN_00458c00();
  }
  DAT_010a44e0 = &DAT_010a44dc;
  while (DAT_010a44b8 != &DAT_010a44b4) {
    FUN_00458c00();
  }
  DAT_010a44b8 = &DAT_010a44b4;
  while (DAT_010a4490 != &DAT_010a448c) {
    FUN_00458c00();
  }
  DAT_010a4490 = &DAT_010a448c;
  while (DAT_010a43d4 != &DAT_010a43d0) {
    FUN_004678c0();
  }
  if ((DAT_010a4414 != &DAT_010a4410) && (DAT_0124a32f == '\0')) {
    iVar1 = FUN_0047d980("entities.next == &entities",".\\map.cpp",0x9d,1,1);
    if (iVar1 == 0) {
                    /* WARNING: Could not recover jumptable at 0x004680f5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      DebugBreak();
      return;
    }
    if (iVar1 == 2) {
      DAT_0124a32f = '\x01';
    }
  }
  return;
}

