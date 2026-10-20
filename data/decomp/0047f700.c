
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047f700(undefined4 param_1,char *param_2)

{
  char cVar1;
  char *pcVar2;
  char local_1008 [4096];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  __vsnprintf(local_1008,0x1000,param_2,&stack0x0000000c);
  pcVar2 = local_1008;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_0047f660(local_1008,(int)pcVar2 - (int)(local_1008 + 1),param_1);
  return;
}

