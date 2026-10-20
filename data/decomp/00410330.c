
void FUN_00410330(undefined4 *param_1)

{
  int iVar1;
  
  if (DAT_012334f8 != 0) {
LAB_00410382:
    *param_1 = 0x3f800000;
    return;
  }
  if (DAT_0124a0f2 == '\0') {
    iVar1 = FUN_0047d980("not handled",".\\GfxWrapper.cpp",0x86,0,1);
    if (iVar1 == 0) {
      DebugBreak();
      goto LAB_00410382;
    }
    if (iVar1 != 2) {
      *param_1 = 0x3f800000;
      return;
    }
    DAT_0124a0f2 = '\x01';
  }
  *param_1 = 0x3f800000;
  return;
}

