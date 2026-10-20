
void __fastcall FUN_00440620(undefined4 param_1)

{
  int iVar1;
  
  switch(param_1) {
  case 0x80df:
    iVar1 = 0;
    break;
  case 0x80e0:
    iVar1 = 1;
    break;
  case 0x80e1:
    iVar1 = 2;
    break;
  case 0x80e2:
    iVar1 = 3;
    break;
  default:
    if (DAT_012334f8 != 0) {
      return;
    }
    if (DAT_0124a1de != '\0') {
      return;
    }
    iVar1 = FUN_0047d980("unhandled case",".\\TexWnd.cpp",0x86,1,1);
    if (iVar1 == 0) {
                    /* WARNING: Could not recover jumptable at 0x004406aa. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      DebugBreak();
      return;
    }
    if (iVar1 != 2) {
      return;
    }
    DAT_0124a1de = 1;
    return;
  }
  DAT_01129604 = param_1;
  if (*(int *)(*(int *)(DAT_01233488 + 0x78c) + 0x78) != iVar1) {
    *(int *)(*(int *)(DAT_01233488 + 0x78c) + 0x78) = iVar1;
    DAT_0123348c = DAT_0123348c | 1;
  }
  return;
}

