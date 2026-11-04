
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047ae50(undefined4 param_1,char *param_2)

{
  undefined4 uVar1;
  char local_8008 [32768];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  _vsprintf(local_8008,param_2,&stack0x0000000c);
  uVar1 = FUN_0047a4f0();
  FUN_0047a760("FATAL ERROR: %s",uVar1);
  return;
}

