
undefined4 * FUN_0040b3e0(undefined4 *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525dce;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0040b460(param_1);
  local_8 = 0;
  *param_1 = &PTR_FUN_0053fa4c;
  param_1[8] = 0;
  FUN_004a0380(1,1);
  **(undefined1 **)(param_1[8] + 8) = 0;
  param_1[0xc] = 0x10;
  param_1[0xd] = 0;
  param_1[10] = 0;
  param_1[0xb] = 0;
  local_8 = CONCAT31(local_8._1_3_,2);
  param_1[6] = 0;
  FUN_0040b010();
  ExceptionList = local_10;
  return param_1;
}

