
int FUN_00458d40(void)

{
  void *_Memory;
  size_t sVar1;
  int iVar2;
  int iVar3;
  int unaff_ESI;
  int iVar4;
  undefined4 local_8;
  
  local_8 = 0x48;
  if (*(void **)(unaff_ESI + 0x44) != (void *)0x0) {
    sVar1 = __msize(*(void **)(unaff_ESI + 0x44));
    local_8 = sVar1 + 0x48;
  }
  iVar3 = 0;
  if (0 < *(int *)(unaff_ESI + 0x38)) {
    iVar4 = 0;
    do {
      _Memory = *(void **)(*(int *)(unaff_ESI + 0x3c) + iVar4 + 0xa0);
      iVar2 = 0xa8;
      if (_Memory != (void *)0x0) {
        sVar1 = __msize(_Memory);
        iVar2 = sVar1 + 0xa8;
      }
      local_8 = local_8 + iVar2;
      iVar3 = iVar3 + 1;
      iVar4 = iVar4 + 0xa8;
    } while (iVar3 < *(int *)(unaff_ESI + 0x38));
  }
  return local_8;
}

