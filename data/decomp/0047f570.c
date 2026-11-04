
size_t FUN_0047f570(void *param_1,size_t param_2,int param_3)

{
  bool bVar1;
  size_t sVar2;
  FILE *_File;
  size_t sVar3;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if (param_3 == 0) {
    return 0;
  }
  if (*(int *)(&DAT_011436cc + param_3 * 0x11c) != 0) {
    sVar2 = FUN_004b3920(param_1);
    return sVar2;
  }
  _File = (FILE *)FUN_0047dc40();
  bVar1 = false;
  sVar2 = param_2;
  if (param_2 == 0) {
    return 0;
  }
  do {
    sVar3 = _fread(param_1,1,sVar2,_File);
    if (sVar3 == 0) {
      if (bVar1) {
        return param_2 - sVar2;
      }
      bVar1 = true;
    }
    else if (sVar3 == 0xffffffff) {
      if ((0x32 < param_3) && (param_3 < 0x40)) {
        return 0xffffffff;
      }
      FUN_0047ae50(0,"FS_Read: -1 bytes read");
    }
    sVar2 = sVar2 - sVar3;
    param_1 = (void *)((int)param_1 + sVar3);
    if (sVar2 == 0) {
      return param_2;
    }
  } while( true );
}

