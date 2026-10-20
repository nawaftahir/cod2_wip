
undefined4 * FUN_0041e640(undefined4 *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525f38;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0040b3e0(param_1);
  local_8 = 0;
  *param_1 = &PTR_FUN_005412e4;
  FUN_0041eab0(param_1 + 0xf);
  param_1[7] = 2;
  ExceptionList = local_10;
  return param_1;
}

