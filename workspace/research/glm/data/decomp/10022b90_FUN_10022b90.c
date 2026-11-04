// 10022b90 size=160 FUN_10022b90

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10022b90(void)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 *unaff_EDI;
  
  _DAT_101ce8d4 = PTR_s__shadow_cookie_101a59cc;
  DAT_101ce8d2 = 6;
  DAT_101ce8be = 0;
  DAT_101ce8c0 = 0;
  iVar1 = FUN_1000cb40();
  (&DAT_101cea68)[iVar1] = &DAT_101ce8b4;
  *unaff_EDI = &DAT_101ce8b4;
  FUN_1000ce80(1,1,0);
  FUN_1000ca70(&DAT_101ce8b4,3,0x80,0x80,1);
  uVar2 = FUN_1000d4b0();
  unaff_EDI[1] = uVar2;
  unaff_EDI[3] = 0x80;
  unaff_EDI[4] = 0x80;
  FUN_1000ca70(*unaff_EDI,3,0x80,0x80,1);
  uVar2 = FUN_100228d0();
  unaff_EDI[2] = uVar2;
  return;
}


