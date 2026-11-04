
int * FUN_0041eab0(int *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525d99;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *param_1 = 0;
  FUN_004a0380(1,1);
  **(undefined1 **)(*param_1 + 8) = 0;
  param_1[3] = 0x10;
  param_1[4] = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  param_1[7] = 0x10;
  param_1[8] = 0;
  param_1[5] = 0;
  param_1[6] = 0;
  param_1[0xb] = 0x10;
  param_1[0xc] = 0;
  param_1[9] = 0;
  param_1[10] = 0;
  local_8 = 3;
  FUN_0041ec80();
  ExceptionList = local_10;
  return param_1;
}

