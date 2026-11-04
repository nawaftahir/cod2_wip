
undefined4 * __fastcall FUN_0041e540(int param_1,int param_2)

{
  int iVar1;
  undefined4 *puVar2;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525f71;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0040aaa0();
  if (param_1 == 2) {
    iVar1 = FUN_004ff450(0xc0);
    local_8 = 0;
    if (iVar1 != 0) {
      puVar2 = (undefined4 *)FUN_0041e640(iVar1);
      *(undefined4 **)(param_2 + 0x18) = puVar2;
      ExceptionList = local_10;
      return puVar2;
    }
  }
  else {
    if (param_1 != 1) {
      puVar2 = (undefined4 *)FUN_004ff450(0x48);
      local_8 = 2;
      if (puVar2 == (undefined4 *)0x0) {
        puVar2 = (undefined4 *)0x0;
      }
      else {
        FUN_0040b3e0(puVar2);
        *puVar2 = &PTR_FUN_0053f9f4;
        puVar2[0xf] = 0;
        puVar2[0x10] = 0;
        puVar2[0x11] = 0;
        puVar2[7] = 0;
      }
      *(undefined4 **)(param_2 + 0x18) = puVar2;
      ExceptionList = local_10;
      return puVar2;
    }
    iVar1 = FUN_004ff450(0x60);
    if (iVar1 != 0) {
      local_8 = param_1;
      puVar2 = (undefined4 *)FUN_0041ee70();
      *(undefined4 **)(param_2 + 0x18) = puVar2;
      ExceptionList = local_10;
      return puVar2;
    }
  }
  *(undefined4 *)(param_2 + 0x18) = 0;
  ExceptionList = local_10;
  return (undefined4 *)0x0;
}

