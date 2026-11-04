
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

bool FUN_0047f3d0(void)

{
  int iVar1;
  char *unaff_ESI;
  undefined1 local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if ((unaff_ESI == (char *)0x0) && (DAT_0124a3ad == '\0')) {
    iVar1 = FUN_0047d980("filename","\\trees\\cod2src\\src\\universal\\com_files.cpp",0x6c2);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3ad = '\x01';
    }
  }
  if (*unaff_ESI == '\0') {
    return false;
  }
  FUN_0047de30(*(undefined4 *)(DAT_011436b0 + 8),&DAT_01143388);
  iVar1 = FUN_004dad56(local_108);
  return iVar1 != -1;
}

