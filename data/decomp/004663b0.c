
size_t FUN_004663b0(void)

{
  undefined4 *_Memory;
  void *in_EAX;
  size_t sVar1;
  size_t sVar2;
  size_t sVar3;
  size_t sVar4;
  
  sVar1 = __msize(in_EAX);
  for (_Memory = *(undefined4 **)((int)in_EAX + 100); _Memory != (undefined4 *)0x0;
      _Memory = (undefined4 *)*_Memory) {
    sVar2 = __msize((void *)_Memory[1]);
    sVar3 = __msize((void *)_Memory[2]);
    sVar4 = __msize(_Memory);
    sVar1 = sVar1 + sVar2 + sVar3 + sVar4;
  }
  return sVar1;
}

