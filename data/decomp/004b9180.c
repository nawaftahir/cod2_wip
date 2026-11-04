
undefined4 * FUN_004b9180(undefined4 param_1,undefined4 param_2,int param_3)

{
  int iVar1;
  undefined4 *puVar2;
  
  if (param_3 == 0) {
    iVar1 = FUN_004ff450(0x54);
    if (iVar1 != 0) {
      puVar2 = (undefined4 *)FUN_004ba790(param_1,param_2);
      return puVar2;
    }
  }
  else {
    if (param_3 == 2) {
      puVar2 = (undefined4 *)FUN_004ff450(0xb8);
      if (puVar2 != (undefined4 *)0x0) {
        FUN_004b9b60(param_1,param_2);
        *puVar2 = &PTR_FUN_005290d0;
        return puVar2;
      }
      return (undefined4 *)0x0;
    }
    iVar1 = FUN_004ff450(0xb8);
    if (iVar1 != 0) {
      puVar2 = (undefined4 *)FUN_004b9b60(param_1,param_2);
      return puVar2;
    }
  }
  return (undefined4 *)0x0;
}

