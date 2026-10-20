
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047d4b0(void)

{
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  __getcwd(local_408,0x400);
  __chdir(&DAT_01141f78);
  FUN_0047d270(&DAT_0053d753);
  __chdir(local_408);
  return;
}

