
undefined4 * __thiscall FUN_004bb200(undefined4 *param_1,byte param_2)

{
  FUN_004c5e60();
  FUN_004c57d0();
  if ((undefined1 *)*param_1 != &DAT_00598c80) {
    _free((undefined1 *)*param_1);
  }
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

