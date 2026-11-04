
void __fastcall FUN_0040b930(undefined4 *param_1)

{
  int *piVar1;
  void *_Memory;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_0052553e;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *param_1 = &PTR_FUN_0053fa4c;
  local_8 = 2;
  *(undefined1 *)(param_1 + 9) = 0;
  (*(code *)PTR_FUN_0053fa6c)();
  local_8._0_1_ = 1;
  if ((void *)param_1[0xd] != (void *)0x0) {
    _free((void *)param_1[0xd]);
  }
  param_1[0xd] = 0;
  param_1[10] = 0;
  param_1[0xb] = 0;
  local_8 = (uint)local_8._1_3_ << 8;
  _Memory = (void *)param_1[8];
  if (_Memory != (void *)0x0) {
    piVar1 = (int *)((int)_Memory + 4);
    *piVar1 = *piVar1 + -1;
    if (*piVar1 < 0) {
      if (*(void **)((int)_Memory + 8) != (void *)0x0) {
        _free(*(void **)((int)_Memory + 8));
      }
      _free(_Memory);
    }
    param_1[8] = 0;
  }
  local_8 = 0xffffffff;
  *param_1 = &PTR_FUN_0053f9d0;
  if ((void *)param_1[4] != (void *)0x0) {
    _free((void *)param_1[4]);
  }
  param_1[4] = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  ExceptionList = local_10;
  return;
}

