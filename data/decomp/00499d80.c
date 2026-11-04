
int * __fastcall FUN_00499d80(int *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525cfe;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *param_1 = 0;
  FUN_004a0380(1,1);
  **(undefined1 **)(*param_1 + 8) = 0;
  param_1[9] = 0x10;
  param_1[10] = 0;
  param_1[7] = 0;
  param_1[8] = 0;
  param_1[0xd] = 0x10;
  param_1[0xe] = 0;
  param_1[0xb] = 0;
  param_1[0xc] = 0;
  local_8 = 2;
  param_1[0x13] = 0;
  param_1[0x14] = 0;
  param_1[0xf] = 0x42b40000;
  param_1[6] = 0;
  FUN_0040aaa0();
  ExceptionList = local_10;
  return param_1;
}

