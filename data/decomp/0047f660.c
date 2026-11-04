
size_t __thiscall FUN_0047f660(undefined4 param_1,void *param_2,size_t param_3,int param_4)

{
  FILE *_File;
  size_t sVar1;
  size_t _Count;
  int iVar2;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n",param_1);
  }
  if (param_4 != 0) {
    _File = (FILE *)FUN_0047dc40();
    iVar2 = 0;
    _Count = param_3;
    do {
      if (_Count == 0) {
        if (*(int *)(&DAT_011436c0 + param_4 * 0x11c) != 0) {
          _fflush(_File);
        }
        return param_3;
      }
      sVar1 = _fwrite(param_2,1,_Count,_File);
      if (sVar1 == 0) {
        if (iVar2 != 0) {
          return 0;
        }
        iVar2 = 1;
      }
      else if (sVar1 == 0xffffffff) {
        return 0;
      }
      _Count = _Count - sVar1;
      param_2 = (void *)((int)param_2 + sVar1);
    } while( true );
  }
  return 0;
}

