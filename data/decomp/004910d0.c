
void FUN_004910d0(undefined4 param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  int iVar2;
  
  iVar2 = FUN_0048b7e0();
  puVar1 = (undefined4 *)(&DAT_01148e30)[iVar2];
  do {
    if (puVar1 == (undefined4 *)0x0) {
LAB_00491107:
      FUN_0048fa50(param_1,param_2,0x4000);
      return;
    }
    iVar2 = FUN_004965d0(param_1,*puVar1);
    if (iVar2 == 0) {
      if (puVar1 != (undefined4 *)0x0) {
        FUN_00490650(puVar1,0);
        return;
      }
      goto LAB_00491107;
    }
    puVar1 = (undefined4 *)puVar1[8];
  } while( true );
}

