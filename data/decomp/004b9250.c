
undefined4 * __thiscall FUN_004b9250(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_FUN_00529128;
  FUN_004c2250();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

