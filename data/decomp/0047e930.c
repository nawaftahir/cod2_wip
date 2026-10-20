
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047e930(char *param_1,char *param_2,char param_3)

{
  int iVar1;
  char cVar2;
  int iVar3;
  char local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  cVar2 = *param_2;
  iVar3 = 0;
  if (cVar2 != '\0') {
    iVar1 = -(int)param_2;
    do {
      param_2[(int)(local_108 + iVar1)] = cVar2 + param_3;
      cVar2 = param_2[1];
      iVar3 = iVar3 + 1;
      param_2 = param_2 + 1;
    } while (cVar2 != '\0');
  }
  local_108[iVar3] = '\0';
  _strstr(param_1,local_108);
  return;
}

