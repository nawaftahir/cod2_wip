
void FUN_004162c0(void)

{
  undefined1 local_17c [364];
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005264dd;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_004433b0();
  FUN_00443a90();
  FUN_00443ec0();
  FUN_0043c0d0(local_17c,0);
  local_8 = 0;
  FUN_004fa9b3();
  FUN_00443f80();
  FUN_00444150();
  local_8 = 0xffffffff;
  FUN_00416350(local_17c);
  ExceptionList = local_10;
  return;
}

