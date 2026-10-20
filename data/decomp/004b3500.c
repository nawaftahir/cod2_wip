
undefined4 FUN_004b3500(undefined4 param_1)

{
  int iVar1;
  int unaff_ESI;
  
  if (unaff_ESI == 0) {
    return 0xffffff9a;
  }
  *(undefined4 *)(unaff_ESI + 0x14) = param_1;
  iVar1 = FUN_004b30a0(unaff_ESI + 0x28,unaff_ESI + 0x78,0,0,0,0,0,0);
  *(uint *)(unaff_ESI + 0x18) = (uint)(iVar1 == 0);
  return 0;
}

