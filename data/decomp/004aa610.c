
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_004aa610(void)

{
  char cVar1;
  char *pcVar2;
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  FUN_004aa560(0x400);
  pcVar2 = local_408;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_004a9080(local_408,0,pcVar2 + (1 - (int)(local_408 + 1)),7);
  return;
}

