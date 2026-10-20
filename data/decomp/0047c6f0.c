
undefined4 * __thiscall FUN_0047c6f0(undefined4 *param_1,byte param_2)

{
  if (param_1[2] != 0) {
    FUN_0047c6f0(1);
  }
  _free((void *)*param_1);
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

