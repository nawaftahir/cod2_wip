// 100128b0 size=271 FUN_100128b0

uint FUN_100128b0(void)

{
  int iVar1;
  undefined4 uVar2;
  uint uVar3;
  undefined4 *unaff_EDI;
  
  uVar2 = *unaff_EDI;
  FUN_100114d0();
  iVar1 = FUN_100126d0(uVar2,0x40);
  __controlfp(0x20000,0x30000);
  __controlfp(0x8001f,0x8001f);
  if (iVar1 < 0) {
    uVar2 = FUN_100efe3c(iVar1);
    uVar3 = (*(code *)RI_Printf)(0,"Couldn\'t create a Direct3D device: %s\n",uVar2);
  }
  else {
    DAT_101d492c = 0;
    if (*(char *)(DAT_101ce6b0 + 8) == '\0') {
      DAT_101d4810 = *(undefined4 *)(DAT_101ce6c8 + 8);
    }
    else {
      DAT_101d4810 = 0;
    }
    FUN_100115f0();
    DAT_1072dde8 = DAT_101d4c6c;
    DAT_1072ddec = DAT_101d4c70;
    uVar3 = FUN_10012100();
    if ((char)uVar3 != '\0') {
      (*(code *)RI_Dvar_ClearModified)(DAT_101ce62c);
      FUN_10012040();
      (&DAT_101d493c)[DAT_101d4938 * 4] = *unaff_EDI;
      (&DAT_101d4944)[DAT_101d4938 * 4] = unaff_EDI[5];
      (&DAT_101d4948)[DAT_101d4938 * 4] = unaff_EDI[6];
      DAT_101d4938 = DAT_101d4938 + 1;
      return CONCAT31((int3)((uint)DAT_101d4938 >> 8),1);
    }
  }
  return uVar3 & 0xffffff00;
}


