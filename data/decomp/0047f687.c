
undefined4 FUN_0047f687(void)

{
  FILE *_File;
  size_t sVar1;
  int unaff_EBP;
  size_t _Count;
  void *_Str;
  
  _File = (FILE *)FUN_0047dc40();
  _Count = *(size_t *)(unaff_EBP + 0xc);
  _Str = *(void **)(unaff_EBP + 8);
  *(undefined4 *)(unaff_EBP + -4) = 0;
  do {
    if (_Count == 0) {
      if (*(int *)(&DAT_011436c0 + *(int *)(unaff_EBP + 0x10) * 0x11c) != 0) {
        _fflush(_File);
      }
      return *(undefined4 *)(unaff_EBP + 0xc);
    }
    sVar1 = _fwrite(_Str,1,_Count,_File);
    if (sVar1 == 0) {
      if (*(int *)(unaff_EBP + -4) != 0) {
        return 0;
      }
      *(undefined4 *)(unaff_EBP + -4) = 1;
    }
    else if (sVar1 == 0xffffffff) {
      return 0;
    }
    _Count = _Count - sVar1;
    _Str = (void *)((int)_Str + sVar1);
  } while( true );
}

