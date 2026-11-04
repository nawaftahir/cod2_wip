
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_004a9920(int param_1,undefined4 param_2)

{
  char *pcVar1;
  int iVar2;
  undefined4 uVar3;
  uint unaff_EBX;
  uint uVar4;
  char local_2008 [8192];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (unaff_EBX < 0x2001) {
    uVar4 = 0;
    if (unaff_EBX != 0) {
      do {
        pcVar1 = local_2008 + uVar4;
        iVar2 = _tolower((int)pcVar1[param_1 - (int)local_2008]);
        uVar4 = uVar4 + 1;
        *pcVar1 = (char)iVar2;
      } while (uVar4 < unaff_EBX);
    }
    uVar3 = FUN_004a9080(local_2008,param_2);
    return uVar3;
  }
  FUN_0047ae50(1,"max string length exceeded: \"%s\"",param_1);
  return 0;
}

