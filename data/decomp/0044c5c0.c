
void __fastcall FUN_0044c5c0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  undefined4 *extraout_ECX;
  undefined4 *unaff_ESI;
  
  iVar1 = FUN_0044c330(param_3,param_2);
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  unaff_ESI[2] = 0;
  if (*(int *)(iVar1 + 0xf4) == 2) {
    extraout_ECX[2] = 0x48000000;
    unaff_ESI[2] = 0xbf800000;
    return;
  }
  if (*(int *)(iVar1 + 0xf4) == 0) {
    *extraout_ECX = 0x48000000;
    *unaff_ESI = 0xbf800000;
    return;
  }
  extraout_ECX[1] = 0x48000000;
  unaff_ESI[1] = 0xbf800000;
  return;
}

