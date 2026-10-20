
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00494c10(char *param_1)

{
  int iVar1;
  int iVar2;
  char local_1008 [4096];
  undefined4 local_8;
  
  iVar1 = DAT_00596d48;
  local_8 = DAT_0058ea68;
  iVar2 = DAT_00596d48 * 0x45c;
  __vsnprintf(local_1008,0x1000,param_1,&stack0x00000008);
  if (DAT_00596d48 != 0) {
    FUN_00408f20("%sFile %s, line %i: %s",(&PTR_DAT_00592b98)[iVar1 * 0x117],&DAT_00592ba4 + iVar2,
                 *(undefined4 *)(&DAT_00592b88 + iVar2),local_1008);
    return;
  }
  FUN_00408f20(&DAT_00540fac,local_1008);
  return;
}

