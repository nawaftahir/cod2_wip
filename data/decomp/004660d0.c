
void FUN_004660d0(void)

{
  undefined4 *puVar1;
  undefined4 *_Memory;
  int unaff_EBX;
  
  _Memory = *(undefined4 **)(unaff_EBX + 100);
  while (_Memory != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)*_Memory;
    _free((void *)_Memory[1]);
    _free((void *)_Memory[2]);
    _free(_Memory);
    _Memory = puVar1;
  }
  *(undefined4 *)(unaff_EBX + 100) = 0;
  return;
}

