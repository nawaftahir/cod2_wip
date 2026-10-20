
undefined4 * __thiscall FUN_004b4e70(undefined4 *param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  *param_1 = &PTR_FUN_00528ac4;
  iVar1 = FUN_004ff450(400);
  if (iVar1 != 0) {
    uVar2 = FUN_004b5b40();
    param_1[1] = uVar2;
    param_1[2] = param_2;
    return param_1;
  }
  param_1[1] = 0;
  param_1[2] = param_2;
  return param_1;
}

