


void FUN_1004a8a0(int *param_1)

{
  int iVar1;
  size_t sVar2;
  size_t _Count;
  
  iVar1 = param_1[8];
  _Count = 0x1000 - *(int *)(iVar1 + 4);
  if (_Count != 0) {
    sVar2 = _fwrite(*(void **)(iVar1 + 0x18),1,_Count,*(FILE **)(iVar1 + 0x14));
    if (sVar2 != _Count) {
      *(unsigned int *)(*param_1 + 0x14) = 0x25;
      (**(void **)*param_1)(param_1);
    }
  }
  _fflush(*(FILE **)(iVar1 + 0x14));
  if ((*(byte *)(*(int *)(iVar1 + 0x14) + 0xc) & 0x20) != 0) {
    *(unsigned int *)(*param_1 + 0x14) = 0x25;
    (**(void **)*param_1)(param_1);
  }
  return;
}


