
void __fastcall FUN_0047c6c0(undefined4 *param_1)

{
  void *_Memory;
  
  _Memory = (void *)param_1[2];
  if (_Memory != (void *)0x0) {
    FUN_0047c6c0();
    _free(_Memory);
  }
  _free((void *)*param_1);
  return;
}

