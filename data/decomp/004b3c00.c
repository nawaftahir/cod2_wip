
size_t FUN_004b3c00(uint param_1)

{
  undefined4 *in_EAX;
  int iVar1;
  size_t sVar2;
  undefined1 *unaff_EBX;
  uint _ElementSize;
  
  if (in_EAX == (undefined4 *)0x0) {
    return 0xffffff9a;
  }
  _ElementSize = param_1;
  if ((uint)in_EAX[2] < param_1) {
    _ElementSize = in_EAX[2];
  }
  iVar1 = _fseek((FILE *)*in_EAX,in_EAX[7] + 0x16,0);
  if (iVar1 == 0) {
    if (_ElementSize != 0) {
      *unaff_EBX = 0;
      sVar2 = _fread(unaff_EBX,_ElementSize,1,(FILE *)*in_EAX);
      if (sVar2 != 1) {
        return 0xffffffff;
      }
    }
    if ((unaff_EBX != (undefined1 *)0x0) && ((uint)in_EAX[2] < param_1)) {
      unaff_EBX[in_EAX[2]] = 0;
    }
    return _ElementSize;
  }
  return 0xffffffff;
}

