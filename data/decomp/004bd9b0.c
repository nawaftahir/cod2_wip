
undefined4 * __thiscall FUN_004bd9b0(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_FUN_00529bd4;
  if (-1 < (int)param_1[4]) {
    Ordinal_3(param_1[4]);
    param_1[4] = 0xffffffff;
  }
  Ordinal_116();
  if ((undefined1 *)param_1[5] != &DAT_00598c80) {
    _free((undefined1 *)param_1[5]);
  }
  FUN_004bc6d0();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

