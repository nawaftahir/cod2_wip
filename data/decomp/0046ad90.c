
void FUN_0046ad90(void)

{
  FILE *_File;
  
  _File = (FILE *)FUN_004d8616();
  if (_File == (FILE *)0x0) {
    FUN_0047a5b0("ERROR!!!! Couldn\'t open %s\n");
    return;
  }
  _fprintf(_File,"iwmap %i\n",4);
  FUN_0046acb0();
  _fclose(_File);
  return;
}

