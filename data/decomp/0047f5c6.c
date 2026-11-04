
int FUN_0047f5c6(void)

{
  undefined4 uVar1;
  size_t sVar2;
  void *_DstBuf;
  int unaff_EBP;
  size_t _Count;
  
  uVar1 = FUN_0047dc40();
  _DstBuf = *(void **)(unaff_EBP + 8);
  *(undefined4 *)(unaff_EBP + -8) = uVar1;
  _Count = *(size_t *)(unaff_EBP + 0xc);
  *(undefined4 *)(unaff_EBP + -4) = 0;
  if (_Count == 0) {
    return 0;
  }
  do {
    sVar2 = _fread(_DstBuf,1,_Count,*(FILE **)(unaff_EBP + -8));
    if (sVar2 == 0) {
      if (*(int *)(unaff_EBP + -4) != 0) {
        return *(int *)(unaff_EBP + 0xc) - _Count;
      }
      *(undefined4 *)(unaff_EBP + -4) = 1;
    }
    else if (sVar2 == 0xffffffff) {
      if ((0x32 < *(int *)(unaff_EBP + 0x10)) && (*(int *)(unaff_EBP + 0x10) < 0x40)) {
        return -1;
      }
      FUN_0047ae50(0,"FS_Read: -1 bytes read");
    }
    _Count = _Count - sVar2;
    _DstBuf = (void *)((int)_DstBuf + sVar2);
    if (_Count == 0) {
      return *(int *)(unaff_EBP + 0xc);
    }
  } while( true );
}

