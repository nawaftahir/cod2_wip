
void FUN_0041ed90(undefined4 *param_1)

{
  int *piVar1;
  void *_Memory;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_00525b19;
  local_10 = ExceptionList;
  local_8 = 3;
  ExceptionList = &local_10;
  FUN_0041ec80();
  local_8._0_1_ = 2;
  if ((void *)param_1[0xc] != (void *)0x0) {
    _free((void *)param_1[0xc]);
  }
  param_1[0xc] = 0;
  param_1[9] = 0;
  param_1[10] = 0;
  local_8._0_1_ = 1;
  if ((void *)param_1[8] != (void *)0x0) {
    _free((void *)param_1[8]);
  }
  param_1[8] = 0;
  param_1[5] = 0;
  param_1[6] = 0;
  local_8 = (uint)local_8._1_3_ << 8;
  if ((void *)param_1[4] != (void *)0x0) {
    _free((void *)param_1[4]);
  }
  param_1[4] = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  local_8 = 0xffffffff;
  _Memory = (void *)*param_1;
  if (_Memory != (void *)0x0) {
    piVar1 = (int *)((int)_Memory + 4);
    *piVar1 = *piVar1 + -1;
    if (*piVar1 < 0) {
      if (*(void **)((int)_Memory + 8) != (void *)0x0) {
        _free(*(void **)((int)_Memory + 8));
      }
      _free(_Memory);
    }
    *param_1 = 0;
  }
  ExceptionList = local_10;
  return;
}

