
void FUN_00417a30(void)

{
  undefined1 local_120 [272];
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524ced;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0040c790(local_120,0);
  local_8 = 0;
  FUN_004fa9b3();
  local_8 = 0xffffffff;
  FUN_0040c840(local_120);
  ExceptionList = local_10;
  return;
}

