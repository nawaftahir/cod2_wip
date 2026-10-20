
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_0047e430(void)

{
  int iVar1;
  undefined4 uVar2;
  undefined1 local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  FUN_0047de30(*(undefined4 *)(DAT_011436b0 + 8),&DAT_01143388);
  if (*(int *)(DAT_01143498 + 8) != 0) {
    FUN_00408f20("FS_FOpenFileWrite: %s\n",local_108);
  }
  iVar1 = FUN_0047e000();
  if (iVar1 != 0) {
    return 0;
  }
  uVar2 = FUN_0047e3c0(0);
  return uVar2;
}

