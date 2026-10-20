
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0046ae10(char *param_1)

{
  char cVar1;
  char *pcVar2;
  int *unaff_ESI;
  char local_1008 [4096];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  _vsprintf(local_1008,param_1,&stack0x00000008);
  pcVar2 = local_1008;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  (**(code **)(*unaff_ESI + 0x38))(local_1008,(int)pcVar2 - (int)(local_1008 + 1));
  return;
}

