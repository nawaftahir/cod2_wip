
void FUN_00410120(int *param_1)

{
  int iVar1;
  
  if ((param_1 == (int *)0x0) && (DAT_0124a0f6 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0053fb8c,".\\GfxWrapper.cpp",0x25,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0f6 = '\x01';
    }
  }
  if ((*param_1 == 0) && (DAT_0124a0f5 == '\0')) {
    iVar1 = FUN_0047d980("*text",".\\GfxWrapper.cpp",0x26,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0f5 = '\x01';
    }
  }
  if (*(char *)*param_1 != '\0') {
    *param_1 = (int)((char *)*param_1 + 1);
  }
  return;
}

