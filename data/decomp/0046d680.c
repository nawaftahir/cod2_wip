
undefined4 FUN_0046d680(void)

{
  undefined4 *puVar1;
  FILE *_File;
  
  _File = (FILE *)FUN_004d8616();
  if (_File == (FILE *)0x0) {
    FUN_0047a760("Could not open project file!");
  }
  _fprintf(_File,"{\n");
  for (puVar1 = *(undefined4 **)(DAT_010bcd34 + 100); puVar1 != (undefined4 *)0x0;
      puVar1 = (undefined4 *)*puVar1) {
    FUN_004668f0();
    _fputc(0x20,_File);
    FUN_004668f0();
    _fputc(10,_File);
  }
  _fprintf(_File,"}\n");
  _fclose(_File);
  return 1;
}

