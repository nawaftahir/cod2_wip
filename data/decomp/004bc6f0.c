
undefined4 * __thiscall FUN_004bc6f0(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_FUN_005299f8;
  if ((undefined1 *)param_1[1] != &DAT_00598c80) {
    _free((undefined1 *)param_1[1]);
  }
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

