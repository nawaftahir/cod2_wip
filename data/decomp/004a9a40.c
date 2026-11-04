
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

int FUN_004a9a40(int param_1,undefined4 param_2,undefined4 param_3)

{
  char *pcVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  char local_2008 [8192];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar2 = FUN_004a8920();
  uVar4 = iVar2 + 1;
  if (uVar4 < 0x2001) {
    if (param_1 == 0) {
      iVar2 = 0;
    }
    else {
      iVar2 = FUN_004a87b0();
      iVar2 = iVar2 + 4;
    }
    uVar5 = 0;
    if (uVar4 != 0) {
      do {
        pcVar1 = local_2008 + uVar5;
        iVar3 = _tolower((int)pcVar1[iVar2 - (int)local_2008]);
        uVar5 = uVar5 + 1;
        *pcVar1 = (char)iVar3;
      } while (uVar5 < uVar4);
    }
    iVar2 = FUN_004a9080(local_2008,param_2,uVar4,param_3);
    FUN_004a9ed0();
    return iVar2;
  }
  return param_1;
}

