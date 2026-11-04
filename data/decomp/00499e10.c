
void __fastcall FUN_00499e10(undefined4 *param_1)

{
  int *piVar1;
  void *_Memory;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_00525cce;
  local_10 = ExceptionList;
  local_8 = 2;
  ExceptionList = &local_10;
  FUN_0040aaa0();
  local_8._0_1_ = 1;
  if ((void *)param_1[0xe] != (void *)0x0) {
    _free((void *)param_1[0xe]);
  }
  param_1[0xe] = 0;
  param_1[0xb] = 0;
  param_1[0xc] = 0;
  local_8 = (uint)local_8._1_3_ << 8;
  if ((void *)param_1[10] != (void *)0x0) {
    _free((void *)param_1[10]);
  }
  param_1[10] = 0;
  param_1[7] = 0;
  param_1[8] = 0;
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

