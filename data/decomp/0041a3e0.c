
void FUN_0041a3e0(void)

{
  undefined1 local_120 [272];
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052649d;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_004433b0();
  FUN_00443a90();
  FUN_00443ec0();
  FUN_004242c0(local_120,0);
  local_8 = 0;
  FUN_004fa9b3();
  FUN_00443f80();
  FUN_00444150();
  local_8 = 0xffffffff;
  FUN_0041a470(local_120);
  ExceptionList = local_10;
  return;
}

