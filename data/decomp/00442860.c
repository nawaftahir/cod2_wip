
undefined4 __fastcall FUN_00442860(undefined4 param_1)

{
  int iVar1;
  undefined4 uVar2;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005256da;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  iVar1 = FUN_004ff450(0x100,param_1);
  local_8 = 0;
  if (iVar1 != 0) {
    uVar2 = FUN_004428d0(iVar1);
    ExceptionList = local_10;
    return uVar2;
  }
  ExceptionList = local_10;
  return 0;
}

