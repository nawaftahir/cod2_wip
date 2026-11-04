
undefined4 * __thiscall FUN_004be980(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_FUN_00529cc0;
  if ((undefined1 *)param_1[0x16] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x16]);
  }
  if ((undefined1 *)param_1[0x13] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x13]);
  }
  FUN_004bdcc0();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

