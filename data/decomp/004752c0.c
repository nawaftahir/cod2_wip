
void FUN_004752c0(undefined4 param_1)

{
  int *_Memory;
  undefined4 uVar1;
  int iVar2;
  undefined4 auStack_20c [128];
  int local_c;
  int *local_8;
  
  _Memory = (int *)FUN_00455800(param_1);
  if (_Memory != (int *)0x0) {
    iVar2 = 0;
    local_8 = _Memory;
    if (0 < *_Memory) {
      do {
        uVar1 = FUN_00475190();
        auStack_20c[iVar2] = uVar1;
        iVar2 = iVar2 + 1;
      } while (iVar2 < *_Memory);
    }
    iVar2 = 0;
    if (0 < *_Memory) {
      do {
        local_c = iVar2 + 1;
        FUN_00475250();
        iVar2 = local_c;
        _Memory = local_8;
      } while (local_c < *local_8);
    }
    _free(_Memory);
  }
  return;
}

