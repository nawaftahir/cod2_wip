
void FUN_0041e6d0(undefined4 *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  puStack_c = &LAB_00525b38;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *param_1 = &PTR_FUN_005412e4;
  local_8 = 0;
  FUN_0041ed90(param_1 + 0xf);
  local_8 = 0xffffffff;
  FUN_0040b930();
  ExceptionList = local_10;
  return;
}

