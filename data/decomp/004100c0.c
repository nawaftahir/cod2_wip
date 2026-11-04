
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_004100c0(undefined4 param_1,char *param_2)

{
  char local_1008 [4096];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  _vsprintf(local_1008,param_2,&stack0x0000000c);
  FUN_0047a5b0(&DAT_00540fac,local_1008);
  return;
}

