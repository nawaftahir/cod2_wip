
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_0047e170(undefined4 param_1)

{
  FILE *_File;
  undefined1 local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  FUN_0047de30(*(undefined4 *)(DAT_011436b0 + 8),&DAT_01143388,param_1,local_108,0);
  _File = (FILE *)FUN_004d8616(local_108,&DAT_0053f4b8);
  if (_File != (FILE *)0x0) {
    _fclose(_File);
    return 1;
  }
  return 0;
}

