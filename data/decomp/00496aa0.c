
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

char * __fastcall FUN_00496aa0(char *param_1)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  int unaff_EBX;
  char local_2008 [8192];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if ((param_1 == (char *)0x0) || (unaff_EBX == 0)) {
    return "";
  }
  pcVar3 = param_1;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  if (0x1fff < (uint)((int)pcVar3 - (int)(param_1 + 1))) {
    FUN_0047ae50(1,"Info_ValueForKey: oversize infostring");
  }
  DAT_0124a4f4 = DAT_0124a4f4 ^ 1;
  if (*param_1 == '\\') {
    param_1 = param_1 + 1;
  }
  while( true ) {
    pcVar3 = local_2008;
    cVar2 = *param_1;
    while (cVar2 != '\\') {
      if (cVar2 == '\0') goto LAB_00496b6b;
      *pcVar3 = cVar2;
      pcVar1 = param_1 + 1;
      pcVar3 = pcVar3 + 1;
      param_1 = param_1 + 1;
      cVar2 = *pcVar1;
    }
    cVar2 = param_1[1];
    iVar5 = DAT_0124a4f4 * 0x2000;
    *pcVar3 = '\0';
    pcVar3 = &DAT_0116f468 + iVar5;
    while ((cVar2 != '\\' && (cVar2 != '\0'))) {
      *pcVar3 = cVar2;
      pcVar3 = pcVar3 + 1;
      cVar2 = param_1[2];
      param_1 = param_1 + 1;
    }
    *pcVar3 = '\0';
    iVar4 = FUN_004965d0();
    if (iVar4 == 0) {
      return &DAT_0116f468 + iVar5;
    }
    if (param_1[1] == '\0') break;
    param_1 = param_1 + 2;
  }
LAB_00496b6b:
  return "";
}

