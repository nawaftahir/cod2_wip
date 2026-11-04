
undefined4 * FUN_00499c60(undefined4 *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525d3b;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  param_1[1] = 0;
  FUN_004a0380(1,1);
  **(undefined1 **)(param_1[1] + 8) = 0;
  local_8 = 0;
  FUN_0040b010();
  *param_1 = 0;
  param_1[2] = 0;
  ExceptionList = local_10;
  return param_1;
}

