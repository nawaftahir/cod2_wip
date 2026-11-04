
void FUN_00408440(undefined4 param_1)

{
  FILE *_File;
  undefined4 *puVar1;
  
  _File = (FILE *)FUN_004d8616();
  if (_File == (FILE *)0x0) {
    puVar1 = (undefined4 *)FUN_004d83aa();
    _strerror((char *)*puVar1);
    FUN_00408020("Error opening %s: %s");
  }
  FUN_00408290(_File,param_1);
  _fclose(_File);
  return;
}

