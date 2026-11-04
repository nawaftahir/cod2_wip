
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_0047f320(void)

{
  int iVar1;
  undefined4 *puVar2;
  FILE *_File;
  undefined4 uVar3;
  undefined1 local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  puVar2 = DAT_01233508;
  do {
    if (puVar2 == (undefined4 *)0x0) {
      return 0;
    }
    if (((puVar2[3] == 0) || (*(char *)(DAT_01143488 + 8) == '\0')) &&
       (iVar1 = puVar2[2], iVar1 != 0)) {
      FUN_0047de30(iVar1,iVar1 + 0x100);
      _File = (FILE *)FUN_004d8616(local_108,&DAT_0053f4b8);
      if (_File != (FILE *)0x0) {
        _fclose(_File);
        uVar3 = FUN_004969e0("%s/%s",iVar1 + 0x100);
        return uVar3;
      }
    }
    puVar2 = (undefined4 *)*puVar2;
  } while( true );
}

