// 1000dd70 size=122 FUN_1000dd70

undefined * FUN_1000dd70(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = DAT_101d5d28;
  iVar3 = 0;
  if (0 < DAT_101d5d28) {
    do {
      iVar2 = FUN_1002ca50();
      if (iVar2 != 0) {
        return &DAT_101d5d2c + iVar3 * 0x44;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
    if (iVar3 == 0x10) {
      FUN_10061c80("^1ERROR: map uses more than %i waterMap textures\n",0x10);
      return (undefined *)0x0;
    }
  }
  FUN_1002cd00(param_1,iVar3);
  DAT_101d5d28 = DAT_101d5d28 + 1;
  return &DAT_101d5d2c + iVar3 * 0x44;
}


