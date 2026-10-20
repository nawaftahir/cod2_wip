
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

UINT FUN_00407bb0(void)

{
  LCID Locale;
  int iVar1;
  char *pcVar2;
  UINT UVar3;
  char local_c;
  char local_b [7];
  undefined4 local_4;
  
  local_4 = DAT_0058ea68;
  UVar3 = 0;
  Locale = GetThreadLocale();
  iVar1 = GetLocaleInfoA(Locale,0x1004,&local_c,7);
  if (iVar1 != 0) {
    pcVar2 = &local_c;
    if (local_c != '\0') {
      do {
        pcVar2 = pcVar2 + 1;
        UVar3 = local_c + -0x30 + UVar3 * 10;
        local_c = *pcVar2;
      } while (local_c != '\0');
      if (UVar3 != 0) {
        return UVar3;
      }
    }
  }
  UVar3 = GetACP();
  return UVar3;
}

