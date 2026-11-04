
undefined4 * FUN_00499ec0(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005260f1;
  local_10 = ExceptionList;
  if (param_1 == 0) {
    ExceptionList = &local_10;
    puVar2 = (undefined4 *)FUN_004ff450(0x48);
    local_8 = 0;
    if (puVar2 != (undefined4 *)0x0) {
      FUN_0040b3e0(puVar2);
      *puVar2 = &PTR_FUN_0053f9f4;
      puVar2[0xf] = 0;
      puVar2[0x10] = 0;
      puVar2[0x11] = 0;
      puVar2[7] = 0;
      ExceptionList = local_10;
      return puVar2;
    }
  }
  else if (param_1 == 1) {
    ExceptionList = &local_10;
    iVar1 = FUN_004ff450(0x60);
    local_8 = 1;
    if (iVar1 != 0) {
      puVar2 = (undefined4 *)FUN_0041ee70();
      ExceptionList = local_10;
      return puVar2;
    }
  }
  else if (param_1 == 2) {
    ExceptionList = &local_10;
    iVar1 = FUN_004ff450(0xc0);
    local_8 = 2;
    if (iVar1 != 0) {
      puVar2 = (undefined4 *)FUN_0041e640(iVar1);
      ExceptionList = local_10;
      return puVar2;
    }
  }
  ExceptionList = local_10;
  return (undefined4 *)0x0;
}

