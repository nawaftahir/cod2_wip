
void FUN_00424920(void)

{
  int iVar1;
  undefined1 local_12c [112];
  undefined4 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052643d;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0043f710(local_12c,0);
  local_8 = 0;
  iVar1 = FUN_004fa9b3();
  if (iVar1 == 1) {
    FUN_00432f60(local_bc,local_b8,local_b4);
  }
  DAT_0123348c = 0xffffffff;
  local_8 = 0xffffffff;
  FUN_004249b0(local_12c);
  ExceptionList = local_10;
  return;
}

