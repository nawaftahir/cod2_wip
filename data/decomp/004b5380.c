
undefined4 * __thiscall FUN_004b5380(undefined4 *param_1,byte param_2)

{
  *param_1 = &PTR_FUN_00528ac4;
  if ((undefined4 *)param_1[1] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[1])(1);
  }
  FUN_004bdcc0();
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

