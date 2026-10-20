
void __fastcall FUN_004bb440(int param_1)

{
  void *_Memory;
  undefined4 *_Memory_00;
  
  _Memory = *(void **)(param_1 + 4);
  if (_Memory != (void *)0x0) {
    FUN_004bc6a0();
    _free(_Memory);
  }
  if (*(undefined4 **)(param_1 + 8) != (undefined4 *)0x0) {
    (**(code **)**(undefined4 **)(param_1 + 8))(1);
  }
  _Memory_00 = *(undefined4 **)(param_1 + 0xc);
  if (_Memory_00 != (undefined4 *)0x0) {
    if ((undefined1 *)*_Memory_00 != &DAT_00598c80) {
      _free((undefined1 *)*_Memory_00);
    }
    _free(_Memory_00);
  }
  return;
}

