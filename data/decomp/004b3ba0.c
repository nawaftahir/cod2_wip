
undefined4 FUN_004b3ba0(void)

{
  undefined4 *_Memory;
  int unaff_EDI;
  
  if (unaff_EDI == 0) {
    return 0xffffff9a;
  }
  _Memory = *(undefined4 **)(unaff_EDI + 0x7c);
  if (_Memory == (undefined4 *)0x0) {
    return 0xffffff9a;
  }
  _free((void *)*_Memory);
  *_Memory = 0;
  if (_Memory[0x10] != 0) {
    FUN_004b0180(_Memory + 1);
  }
  _Memory[0x10] = 0;
  _free(_Memory);
  *(undefined4 *)(unaff_EDI + 0x7c) = 0;
  return 0;
}

