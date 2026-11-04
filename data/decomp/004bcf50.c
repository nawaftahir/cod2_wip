
undefined4 * __thiscall FUN_004bcf50(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_LAB_00529ac4;
  FUN_004bce40();
  FUN_004bcb80();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

