
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00487300(void)

{
  ushort uVar1;
  float fStack00000004;
  
  uVar1 = FUN_004df760();
  fStack00000004 = (float)uVar1 * _DAT_00556a74;
  if (_DAT_00556a90 < fStack00000004) {
    fStack00000004 = fStack00000004 - _DAT_00556a94;
  }
  return (float10)fStack00000004;
}

