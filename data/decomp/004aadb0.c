
void FUN_004aadb0(undefined4 param_1)

{
  int iVar1;
  
  if ((DAT_0059c4b8 == (code *)0x0) && (DAT_0124a72e == '\0')) {
    iVar1 = FUN_0047d980("re.Load_XSurfaceGlue","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",0x272,0,1
                        );
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a72e = '\x01';
    }
  }
  (*DAT_0059c4b8)(param_1,DAT_01233438);
  return;
}

