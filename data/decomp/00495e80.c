
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __thiscall FUN_00495e80(char *param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  char *pcVar2;
  undefined1 local_48 [64];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  cVar1 = param_1[(int)(pcVar2 + (-1 - (int)(param_1 + 1)))];
  for (pcVar2 = param_1 + (int)(pcVar2 + (-1 - (int)(param_1 + 1)));
      (cVar1 != '/' && (pcVar2 != param_1)); pcVar2 = pcVar2 + -1) {
    if (cVar1 == '.') {
      return;
    }
    cVar1 = pcVar2[-1];
  }
  FUN_00496430();
  FUN_00496980(&DAT_0053f2e0,local_48,param_3);
  return;
}

