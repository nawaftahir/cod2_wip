
undefined4 * __thiscall FUN_004bcbd0(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_LAB_00529a9c;
  FUN_004bd410();
  if ((undefined1 *)param_1[6] != &DAT_00598c80) {
    _free((undefined1 *)param_1[6]);
  }
  if ((undefined1 *)param_1[3] != &DAT_00598c80) {
    _free((undefined1 *)param_1[3]);
  }
  FUN_004bc6c0();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

