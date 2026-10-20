
void FUN_004ac3e0(void)

{
  int iVar1;
  
  if ((DAT_0059c4dc == (code *)0x0) && (DAT_0124a741 == '\0')) {
    iVar1 = FUN_0047d980("re.XModelReadSurface","\\trees\\cod2src\\src\\xanim\\xmodel_load_obj.cpp",
                         0x208,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a741 = '\x01';
    }
  }
                    /* WARNING: Could not recover jumptable at 0x004ac42a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*DAT_0059c4dc)();
  return;
}

