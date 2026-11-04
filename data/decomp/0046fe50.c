
void __fastcall FUN_0046fe50(undefined4 param_1)

{
  int iVar1;
  
  if ((*(int *)(DAT_01233488 + 0x7e0) == 0) && (DAT_0124a37a == '\0')) {
    iVar1 = FUN_0047d980("g_pParentWnd->ActiveXY()",".\\select.cpp",0x319,0,1,param_1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a37a = '\x01';
    }
  }
  DAT_0058fbed = 0;
  FUN_00452e30(*(undefined4 *)(DAT_01233488 + 0x7e0));
  FUN_00452f50(*(undefined4 *)(DAT_01233488 + 0x7e0));
  FUN_0041a010(DAT_010bcd2c);
  FUN_0041a010(DAT_010bcd2c);
  DAT_0058fbed = 1;
  DAT_0123348c = 0xffffffff;
  return;
}

