
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_004aa160(float *param_1)

{
  char cVar1;
  char *pcVar2;
  char local_88 [128];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  _sprintf(local_88,"(%g, %g, %g)",(double)*param_1,(double)param_1[1],(double)param_1[2]);
  pcVar2 = local_88;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_004a9080(local_88,0,pcVar2 + (1 - (int)(local_88 + 1)),0xe);
  return;
}

