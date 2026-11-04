
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 * __thiscall FUN_00464770(char *param_1,int param_2)

{
  int iVar1;
  undefined4 *puVar2;
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  puVar2 = DAT_012334dc;
  if (param_1 == (char *)0x0) {
    return DAT_012334e0;
  }
  while( true ) {
    if (puVar2 == (undefined4 *)0x0) {
      if (param_2 == 0) {
        _sprintf(local_408,"/*QUAKED %s (0 0.5 0) (-8 -8 -8) (8 8 8)\nNot found in source.\n",
                 param_1);
      }
      else {
        _sprintf(local_408,"/*QUAKED %s (0 0.5 0) ?\nNot found in source.\n",param_1);
      }
      puVar2 = (undefined4 *)FUN_00463860(local_408);
      FUN_00463e40();
      return puVar2;
    }
    iVar1 = __stricmp(param_1,(char *)puVar2[1]);
    if (iVar1 == 0) break;
    puVar2 = (undefined4 *)*puVar2;
  }
  return puVar2;
}

