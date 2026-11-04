
void __fastcall FUN_0047c760(undefined4 *param_1)

{
  void *pvVar1;
  undefined4 *_Memory;
  int iVar2;
  
  pvVar1 = (void *)param_1[0x106];
  if (pvVar1 != (void *)0x0) {
    FUN_0047c760();
    _free(pvVar1);
  }
  _free((void *)*param_1);
  pvVar1 = (void *)param_1[4];
  if (pvVar1 != (void *)0x0) {
    if (*(int *)((int)pvVar1 + 0xc) != 0) {
      FUN_0047c620(1);
    }
    _free(pvVar1);
  }
  pvVar1 = (void *)param_1[3];
  if (pvVar1 != (void *)0x0) {
    if (*(int *)((int)pvVar1 + 0xc) != 0) {
      FUN_0047c5c0(1);
    }
    _free(pvVar1);
  }
  param_1[0x105] = 0;
  do {
    _Memory = (undefined4 *)param_1[param_1[0x105] + 5];
    if (_Memory != (undefined4 *)0x0) {
      if (_Memory[2] != 0) {
        FUN_0047c6f0(1);
      }
      _free((void *)*_Memory);
      _free(_Memory);
    }
    iVar2 = param_1[0x105];
    param_1[0x105] = iVar2 + 1U;
  } while (iVar2 + 1U < 0x100);
  return;
}

