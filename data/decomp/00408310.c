
int __fastcall FUN_00408310(undefined4 param_1,char *param_2,int *param_3)

{
  char cVar1;
  char *pcVar2;
  FILE *_File;
  int iVar3;
  int iVar4;
  
  *param_3 = 0;
  if (param_2 != (char *)0x0) {
    pcVar2 = param_2;
    do {
      cVar1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    if (pcVar2 != param_2 + 1) {
      _File = (FILE *)FUN_004d8616(param_2,&DAT_0053f4b8);
      if (_File == (FILE *)0x0) {
        return -1;
      }
      iVar3 = FUN_00408160();
      iVar4 = FUN_004080e0();
      *(undefined1 *)(iVar4 + iVar3) = 0;
      FUN_00408210(_File,iVar4);
      _fclose(_File);
      *param_3 = iVar4;
      return iVar3;
    }
  }
  return -1;
}

