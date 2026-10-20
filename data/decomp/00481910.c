
void FUN_00481910(void)

{
  undefined4 *puVar1;
  undefined4 *_Memory;
  undefined4 *in_EAX;
  
  while (in_EAX != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)*in_EAX;
    if (in_EAX[1] != 0) {
      _Memory = *(undefined4 **)(in_EAX[1] + 0x300);
      if (_Memory != (undefined4 *)0x0) {
        if (_Memory[0x1f] != 0) {
          FUN_004b3ba0();
        }
        _fclose((FILE *)*_Memory);
        _free(_Memory);
      }
      _free(*(void **)(in_EAX[1] + 0x314));
      _free((void *)in_EAX[1]);
    }
    if ((void *)in_EAX[2] != (void *)0x0) {
      _free((void *)in_EAX[2]);
    }
    _free(in_EAX);
    in_EAX = puVar1;
  }
  return;
}

