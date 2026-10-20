
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 __fastcall FUN_004a8f20(char *param_1)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  char local_2008 [8192];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  pcVar3 = param_1;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  pcVar3 = pcVar3 + (1 - (int)(param_1 + 1));
  if ((int)pcVar3 < 0x2001) {
    iVar6 = 0;
    if (0 < (int)pcVar3) {
      do {
        pcVar1 = local_2008 + iVar6;
        iVar4 = _tolower((int)pcVar1[(int)param_1 - (int)local_2008]);
        iVar6 = iVar6 + 1;
        *pcVar1 = (char)iVar4;
      } while (iVar6 < (int)pcVar3);
    }
    uVar5 = FUN_004a8b80(local_2008,pcVar3);
    return uVar5;
  }
  return 0;
}

