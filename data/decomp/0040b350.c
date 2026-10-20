
undefined4 FUN_0040b350(void)

{
  undefined4 *puVar1;
  int unaff_EBX;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525deb;
  local_10 = ExceptionList;
  if (*(int *)(unaff_EBX + 0x18) == 0) {
    ExceptionList = &local_10;
    puVar1 = (undefined4 *)FUN_004ff450(0x48);
    local_8 = 0;
    if (puVar1 == (undefined4 *)0x0) {
      puVar1 = (undefined4 *)0x0;
    }
    else {
      FUN_0040b3e0(puVar1);
      *puVar1 = &PTR_FUN_0053f9f4;
      puVar1[0xf] = 0;
      puVar1[0x10] = 0;
      puVar1[0x11] = 0;
      puVar1[7] = 0;
    }
    *(undefined4 **)(unaff_EBX + 0x18) = puVar1;
  }
  ExceptionList = local_10;
  return *(undefined4 *)(unaff_EBX + 0x18);
}

