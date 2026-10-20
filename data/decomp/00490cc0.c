
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00490cc0(undefined4 *param_1,undefined4 param_2)

{
  int iVar1;
  undefined1 local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  FUN_00496430();
  iVar1 = FUN_0048ca50(*(undefined1 *)((int)param_1 + 6),param_1[5],param_1[6]);
  if ((*(char *)((int)param_1 + 6) == '\x06') && (iVar1 == -0x539)) {
    FUN_00408f20("\'%s\' is not a valid value for dvar \'%s\'\n",local_408,*param_1);
    FUN_0048d780(param_1[5],param_1[6]);
    iVar1 = param_1[4];
  }
  FUN_0048da90(iVar1,param_2);
  return;
}

