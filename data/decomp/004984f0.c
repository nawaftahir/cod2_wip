
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_004984f0(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  undefined1 local_220 [256];
  byte local_120 [20];
  undefined1 local_10c [260];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  FUN_00496980(&DAT_00553f1c,param_1);
  iVar1 = __findfirst(local_220,local_120);
  if (iVar1 == -1) {
    return 0;
  }
  while( true ) {
    if ((local_120[0] & 0x10) == 0) {
      return 1;
    }
    iVar2 = FUN_004965d0(local_10c,&DAT_00553f10);
    if (((iVar2 != 0) && (iVar2 = FUN_004965d0(local_10c,&DAT_00551674), iVar2 != 0)) &&
       (iVar2 = FUN_004965d0(local_10c,&PTR_DAT_00553f0c), iVar2 != 0)) break;
    iVar2 = __findnext(iVar1,local_120);
    if (iVar2 == -1) {
      return 0;
    }
  }
  return 1;
}

