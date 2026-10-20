
void FUN_0040ad20(void)

{
  int *piVar1;
  void *_Memory;
  int unaff_EDI;
  
  _Memory = *(void **)(unaff_EDI + 4);
  if (_Memory != (void *)0x0) {
    piVar1 = (int *)((int)_Memory + 4);
    *piVar1 = *piVar1 + -1;
    if (*piVar1 < 0) {
      if (*(void **)((int)_Memory + 8) != (void *)0x0) {
        _free(*(void **)((int)_Memory + 8));
      }
      _free(_Memory);
    }
    *(undefined4 *)(unaff_EDI + 4) = 0;
  }
  return;
}

