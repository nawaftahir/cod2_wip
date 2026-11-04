
uint __thiscall FUN_004b3b10(uint param_1,void *param_2)

{
  int iVar1;
  int in_EAX;
  int iVar2;
  size_t sVar3;
  uint _ElementSize;
  
  if (in_EAX == 0) {
    return 0xffffff9a;
  }
  iVar1 = *(int *)(in_EAX + 0x7c);
  if (iVar1 == 0) {
    return 0xffffff9a;
  }
  _ElementSize = *(int *)(iVar1 + 0x48) - *(int *)(iVar1 + 0x4c);
  if (param_2 == (void *)0x0) {
    return _ElementSize;
  }
  if (_ElementSize < param_1) {
    param_1 = _ElementSize;
  }
  if (param_1 == 0) {
    return 0;
  }
  iVar2 = _fseek(*(FILE **)(iVar1 + 0x58),*(int *)(iVar1 + 0x44) + *(int *)(iVar1 + 0x4c),0);
  if (iVar2 == 0) {
    sVar3 = _fread(param_2,_ElementSize,1,*(FILE **)(iVar1 + 0x58));
    if (sVar3 == 1) {
      return param_1;
    }
  }
  return 0xffffffff;
}

