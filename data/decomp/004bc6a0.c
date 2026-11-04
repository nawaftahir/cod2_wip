
void __fastcall FUN_004bc6a0(undefined4 *param_1)

{
  void *_Memory;
  
  _Memory = (void *)*param_1;
  if (_Memory != (void *)0x0) {
    FUN_004c86f0();
    _free(_Memory);
  }
  return;
}

