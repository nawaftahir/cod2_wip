
long FUN_004083a0(undefined4 *param_1)

{
  FILE *_File;
  long _Offset;
  long lVar1;
  undefined4 *puVar2;
  uint uVar3;
  undefined4 *puVar4;
  
  _File = (FILE *)FUN_004d8616();
  if (_File == (FILE *)0x0) {
    return -1;
  }
  _Offset = _ftell(_File);
  _fseek(_File,0,2);
  lVar1 = _ftell(_File);
  _fseek(_File,_Offset,0);
  puVar2 = _malloc(lVar1 + 2);
  puVar4 = puVar2;
  for (uVar3 = lVar1 + 1U >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  for (uVar3 = lVar1 + 1U & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
    *(undefined1 *)puVar4 = 0;
    puVar4 = (undefined4 *)((int)puVar4 + 1);
  }
  *(undefined1 *)((int)puVar2 + lVar1) = 0;
  FUN_00408210(_File,puVar2);
  _fclose(_File);
  *param_1 = puVar2;
  return lVar1;
}

