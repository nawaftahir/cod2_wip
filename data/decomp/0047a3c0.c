
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047a3c0(void)

{
  char *pcVar1;
  char *pcVar2;
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_010a4908 != 1) {
    DAT_010a4908 = 1;
    _sprintf(local_408,"%s *",&DAT_010a4508);
    pcVar2 = local_408;
    while (local_408[0] != '\0') {
      if (*pcVar2 == '\\') {
        *pcVar2 = '/';
      }
      else {
        *pcVar2 = *pcVar2;
      }
      pcVar1 = pcVar2 + 1;
      pcVar2 = pcVar2 + 1;
      local_408[0] = *pcVar1;
    }
    *pcVar2 = '\0';
    SetWindowTextA(DAT_010bcd54,local_408);
  }
  return;
}

