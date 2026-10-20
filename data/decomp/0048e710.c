
undefined1 * FUN_0048e710(undefined4 param_1)

{
  int iVar1;
  undefined1 *puVar2;
  undefined4 *puVar3;
  
  iVar1 = FUN_0048b7e0();
  puVar3 = (undefined4 *)(&DAT_01148e30)[iVar1];
  if (puVar3 != (undefined4 *)0x0) {
    while (iVar1 = FUN_004965d0(param_1,*puVar3), iVar1 != 0) {
      puVar3 = (undefined4 *)puVar3[8];
      if (puVar3 == (undefined4 *)0x0) {
        return &DAT_0053d753;
      }
    }
    if (puVar3 != (undefined4 *)0x0) {
      puVar2 = (undefined1 *)FUN_0048c1a0(puVar3[2]);
      return puVar2;
    }
  }
  return &DAT_0053d753;
}

