
void FUN_004a10f0(byte param_1)

{
  int *piVar1;
  void *_Memory;
  undefined4 *unaff_EDI;
  
  _Memory = (void *)*unaff_EDI;
  if (_Memory != (void *)0x0) {
    piVar1 = (int *)((int)_Memory + 4);
    *piVar1 = *piVar1 + -1;
    if (*piVar1 < 0) {
      if (*(void **)((int)_Memory + 8) != (void *)0x0) {
        _free(*(void **)((int)_Memory + 8));
      }
      _free(_Memory);
    }
    *unaff_EDI = 0;
  }
  if ((param_1 & 1) != 0) {
    _free(unaff_EDI);
  }
  return;
}

