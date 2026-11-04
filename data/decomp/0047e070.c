
void __fastcall FUN_0047e070(undefined4 param_1)

{
  FILE *pFVar1;
  size_t _Size;
  void *_DstBuf;
  size_t sVar2;
  int iVar3;
  
  pFVar1 = (FILE *)FUN_004d8616();
  if (pFVar1 != (FILE *)0x0) {
    _fseek(pFVar1,0,2);
    _Size = _ftell(pFVar1);
    _fseek(pFVar1,0,0);
    _DstBuf = _malloc(_Size);
    sVar2 = _fread(_DstBuf,1,_Size,pFVar1);
    if (sVar2 != _Size) {
      FUN_0047ae50(0,"Short read in FS_CopyFile()\n");
    }
    _fclose(pFVar1);
    iVar3 = FUN_0047e000();
    if (iVar3 != 0) {
      _free(_DstBuf);
      return;
    }
    pFVar1 = (FILE *)FUN_004d8616(param_1,&DAT_0053f4d4);
    if (pFVar1 == (FILE *)0x0) {
      _free(_DstBuf);
      return;
    }
    sVar2 = _fwrite(_DstBuf,1,_Size,pFVar1);
    if (sVar2 != _Size) {
      FUN_0047ae50(0,"Short write in FS_CopyFile()\n");
    }
    _fclose(pFVar1);
    _free(_DstBuf);
  }
  return;
}

