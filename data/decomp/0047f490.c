
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_0047f490(int param_1)

{
  int iVar1;
  DWORD DVar2;
  DWORD dwFileAttributes;
  char *unaff_ESI;
  CHAR local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if (((unaff_ESI == (char *)0x0) || (*unaff_ESI == '\0')) && (DAT_0124a3ac == '\0')) {
    iVar1 = FUN_0047d980("filename && filename[0]","\\trees\\cod2src\\src\\universal\\com_files.cpp"
                         ,0x6e6,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3ac = '\x01';
    }
  }
  FUN_0047de30(*(undefined4 *)(DAT_011436b0 + 8),&DAT_01143388);
  DVar2 = GetFileAttributesA(local_108);
  if (param_1 == 0) {
    dwFileAttributes = DVar2 & 0xfffffffe;
  }
  else {
    dwFileAttributes = DVar2 | 1;
  }
  if (dwFileAttributes == DVar2) {
    return 0;
  }
  SetFileAttributesA(local_108,dwFileAttributes);
  return 1;
}

