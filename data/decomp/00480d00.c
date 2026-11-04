
void FUN_00480d00(undefined4 *param_1)

{
  undefined4 *puVar1;
  void *_Memory;
  undefined4 *puVar2;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if (param_1 != (undefined4 *)0x0) {
    _Memory = (void *)*param_1;
    puVar2 = param_1;
    while (_Memory != (void *)0x0) {
      _free(_Memory);
      puVar1 = puVar2 + 1;
      puVar2 = puVar2 + 1;
      _Memory = (void *)*puVar1;
    }
    _free(param_1);
  }
  return;
}

