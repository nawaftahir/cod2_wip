
undefined4 * __fastcall FUN_004bc5a0(undefined4 *param_1)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FUN_004ff450(0xc);
  if (iVar1 != 0) {
    uVar2 = FUN_004c86b0();
    *param_1 = uVar2;
    return param_1;
  }
  *param_1 = 0;
  return param_1;
}

