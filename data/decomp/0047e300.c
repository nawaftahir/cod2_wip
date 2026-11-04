
void FUN_0047e300(int param_1)

{
  undefined4 *_Memory;
  FILE *_File;
  int iVar1;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  iVar1 = param_1 * 0x11c;
  if (*(int *)(&DAT_011436cc + iVar1) != 0) {
    FUN_004b3ba0();
    if ((*(int *)(&DAT_011436bc + iVar1) != 0) &&
       (_Memory = *(undefined4 **)(&DAT_011436b8 + iVar1), _Memory != (undefined4 *)0x0)) {
      if (_Memory[0x1f] != 0) {
        FUN_004b3ba0();
      }
      _fclose((FILE *)*_Memory);
      _free(_Memory);
    }
    FUN_0048b5a0(&DAT_011436b8 + iVar1,0,0x11c);
    return;
  }
  if (param_1 != 0) {
    _File = (FILE *)FUN_0047dc40();
    _fclose(_File);
  }
  FUN_0048b5a0(&DAT_011436b8 + iVar1,0,0x11c);
  return;
}

