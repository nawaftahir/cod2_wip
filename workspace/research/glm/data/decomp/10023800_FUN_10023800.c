// 10023800 size=183 FUN_10023800

int FUN_10023800(int *param_1,int *param_2)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  iVar5 = *param_1;
  iVar6 = *param_2;
  piVar1 = (int *)(iVar5 * 0x74 + 0xa0010 + DAT_101da9c8);
  iVar2 = *piVar1;
  iVar4 = iVar2 - *(int *)(iVar6 * 0x74 + 0xa0010 + DAT_101da9c8);
  if (iVar4 == 0) {
    switch(iVar2) {
    case 0:
      uVar3 = (&DAT_10678ac8)[iVar5 * 0xd];
      iVar5 = (*(code *)RI_RI_unk123)((&DAT_10678ac8)[iVar6 * 0xd],0);
      iVar6 = (*(code *)RI_RI_unk123)(uVar3,0);
      return iVar6 - iVar5;
    case 1:
    case 2:
      return (&DAT_10678ac8)[iVar5 * 0xd] - (&DAT_10678ac8)[iVar6 * 0xd];
    case 3:
      return (int)((&DAT_10678ac8)[iVar5 * 0xd] - (&DAT_10678ac8)[iVar6 * 0xd]) >> 5;
    default:
      iVar4 = (piVar1[0x15] - *(int *)(iVar6 * 0x74 + DAT_101da9c8 + 0xa0064)) / 0x44;
    }
  }
  return iVar4;
}


