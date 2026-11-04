// 1006512c size=26 FUN_1006512c

void FUN_1006512c(void)

{
  void *_Memory;
  int in_ECX;
  
  _Memory = *(void **)(in_ECX + 0xc);
  if (_Memory != (void *)0x0) {
    FUN_1006512c();
    _free(_Memory);
  }
  return;
}


