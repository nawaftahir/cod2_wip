// 10063a5c size=26 FUN_10063a5c

void FUN_10063a5c(void)

{
  void *_Memory;
  int in_ECX;
  
  _Memory = *(void **)(in_ECX + 0xc);
  if (_Memory != (void *)0x0) {
    FUN_10063a5c();
    _free(_Memory);
  }
  return;
}


