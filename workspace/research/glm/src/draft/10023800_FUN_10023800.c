extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678ac8;


int FUN_10023800(int *param_1,int *param_2)

{
  int *piVar1;
  int iVar2;
  unsigned int uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  iVar5 = *param_1;
  iVar6 = *param_2;
  piVar1 = (int *)(iVar5 * 0x74 + 0xa0010 + g_101da9c8);
 
	int g_101da9c8 = DAT_101da9c8; iVar2 = *piVar1;
  iVar4 = iVar2 - *(int *)(iVar6 * 0x74 + 0xa0010 + g_101da9c8);
  if (iVar4 == 0) {
    switch(iVar2) {
    case 0:
      uVar3 = (&g_10678ac8)[iVar5 * 0xd];
 
	int g_10678ac8 = DAT_10678ac8;     iVar5 = (*(void *)RI_RI_unk123)((&g_10678ac8)[iVar6 * 0xd],0);
      iVar6 = (*(void *)RI_RI_unk123)(uVar3,0);
      return iVar6 - iVar5;
    case 1:
    case 2:
      return (&g_10678ac8)[iVar5 * 0xd] - (&g_10678ac8)[iVar6 * 0xd];
    case 3:
      return (int)((&g_10678ac8)[iVar5 * 0xd] - (&g_10678ac8)[iVar6 * 0xd]) >> 5;
    default:
      iVar4 = (piVar1[0x15] - *(int *)(iVar6 * 0x74 + g_101da9c8 + 0xa0064)) / 0x44;
    }
  }
  return iVar4;
}


