
void FUN_0049c5c0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int *piVar1;
  int iVar2;
  int unaff_EBX;
  undefined4 uVar3;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525efb;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  iVar2 = FUN_004ff450(0x10);
  uVar3 = 0;
  local_8 = 0;
  if (iVar2 != 0) {
    uVar3 = FUN_00499cd0(iVar2,param_1,param_2,param_3);
  }
  piVar1 = (int *)(unaff_EBX + 0x2c);
  local_8 = 0xffffffff;
  if (*(int *)(unaff_EBX + 0x38) == 0) {
    FUN_0049f580();
  }
  if (*piVar1 == *(int *)(unaff_EBX + 0x30)) {
    FUN_0049f580();
  }
  *(undefined4 *)(*(int *)(unaff_EBX + 0x38) + *piVar1 * 4) = uVar3;
  *piVar1 = *piVar1 + 1;
  FUN_0049b7a0(unaff_EBX);
  ExceptionList = local_10;
  return;
}

