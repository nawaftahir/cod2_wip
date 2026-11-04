
void FUN_004ac430(void)

{
  int iVar1;
  
  if ((DAT_0059c4e0 == (code *)0x0) && (DAT_0124a740 == '\0')) {
    iVar1 = FUN_0047d980("re.R_LoadXSkins","\\trees\\cod2src\\src\\xanim\\xmodel_load_obj.cpp",0x20f
                         ,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a740 = '\x01';
    }
  }
                    /* WARNING: Could not recover jumptable at 0x004ac47a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*DAT_0059c4e0)();
  return;
}

