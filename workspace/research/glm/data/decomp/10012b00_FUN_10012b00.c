// 10012b00 size=131 FUN_10012b00

int FUN_10012b00(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int unaff_EBX;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  iVar3 = DAT_101d1c04 + -1;
  if (-1 < iVar3) {
    do {
      iVar1 = (iVar3 + iVar4) / 2;
      iVar2 = (&DAT_101d1c08)[iVar1 * 4] - unaff_EBX;
      if (((iVar2 == 0) && (iVar2 = (&DAT_101d1c0c)[iVar1 * 4] - param_1, iVar2 == 0)) &&
         (iVar2 = (&DAT_101d1c10)[iVar1 * 4] - param_2, iVar2 == 0)) {
        return param_2;
      }
      if (iVar2 < 0) {
        iVar4 = iVar1 + 1;
      }
      else {
        iVar3 = iVar1 + -1;
      }
    } while (iVar4 <= iVar3);
  }
  if (((&DAT_101d1c08)[iVar3 * 4] == unaff_EBX) && ((&DAT_101d1c0c)[iVar3 * 4] == param_1)) {
    return (&DAT_101d1c10)[iVar3 * 4];
  }
  return (&DAT_101d1c10)[iVar4 * 4];
}


