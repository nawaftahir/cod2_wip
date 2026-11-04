
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00490df0(undefined4 param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  int iVar2;
  undefined1 local_28 [32];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar2 = FUN_0048b7e0();
  puVar1 = (undefined4 *)(&DAT_01148e30)[iVar2];
  do {
    if (puVar1 == (undefined4 *)0x0) {
LAB_00490e2c:
      FUN_00496980(&DAT_00545f4c,param_2);
      FUN_0048fa50(param_1,local_28,0x4000);
      return;
    }
    iVar2 = FUN_004965d0(param_1,*puVar1);
    if (iVar2 == 0) {
      if (puVar1 != (undefined4 *)0x0) {
        FUN_0048ffa0(0);
        return;
      }
      goto LAB_00490e2c;
    }
    puVar1 = (undefined4 *)puVar1[8];
  } while( true );
}

