// 100840a3 size=56 FUN_100840a3

void FUN_100840a3(void)

{
  int iVar1;
  undefined4 *_Memory;
  int in_ECX;
  
  iVar1 = *(int *)(in_ECX + 8);
  while (iVar1 != 0) {
    _Memory = *(undefined4 **)(in_ECX + 8);
    *(undefined4 *)(in_ECX + 8) = _Memory[4];
    if (((_Memory[2] & 8) != 0) || ((_Memory[2] & 1) == 0)) {
      _free((void *)*_Memory);
    }
    _free(_Memory);
    iVar1 = *(int *)(in_ECX + 8);
  }
  return;
}


