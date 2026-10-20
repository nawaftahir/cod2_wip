
void __fastcall FUN_004be690(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_00529cc0;
  if ((undefined1 *)param_1[0x16] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x16]);
  }
  if ((undefined1 *)param_1[0x13] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x13]);
  }
  FUN_004bdcc0();
  return;
}

