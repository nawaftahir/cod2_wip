
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00498ad0(undefined4 param_1)

{
  ushort uVar1;
  float *unaff_ESI;
  
  uVar1 = FUN_004df760(param_1);
  *unaff_ESI = (float)uVar1 * _DAT_00556a74;
  uVar1 = FUN_004df760();
  unaff_ESI[1] = (float)uVar1 * _DAT_00556a74;
  uVar1 = FUN_004df760();
  unaff_ESI[2] = (float)uVar1 * _DAT_00556a74;
  return;
}

