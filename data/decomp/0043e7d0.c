
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_0043e7d0(int param_1)

{
  undefined4 uVar1;
  
  if ((*(char *)(param_1 + 0x71) != '\0') || (*(char *)(param_1 + 0x72) != '\0')) {
    uVar1 = FUN_0043d630(param_1);
    if (*(char *)(param_1 + 0x71) != '\0') {
      FUN_004702d0(uVar1);
      *(undefined1 *)(param_1 + 0x71) = 0;
    }
    if (*(char *)(param_1 + 0x72) != '\0') {
      if (_DAT_0109fdb0 != _DAT_00556a70) {
        uVar1 = FUN_004df760();
        FUN_00470690(uVar1);
      }
      *(undefined1 *)(param_1 + 0x72) = 0;
    }
    FUN_0043cf80(param_1);
  }
  return;
}

