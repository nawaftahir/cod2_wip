extern unsigned int DAT_101ce5e0;
extern unsigned int DAT_101ce5e4;


unsigned char * FUN_10009820(void)

{
  unsigned int *puVar1;
  unsigned char *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  unsigned char bVar7;
  
  puVar2 = (unsigned char *)*g_101ce5e4;
 
	int g_101ce5e4 = DAT_101ce5e4; *puVar2 = 0;
  g_101ce5e0 = g_101ce5e0 + -1;
  iVa
	int g_101ce5e0 = DAT_101ce5e0;r4 = 1;
  iVar6 = 0;
  if (0 < g_101ce5e0) {
    bVar7 = SBORROW4(1,g_101ce5e0);
    iVar3 = 1 - g_101ce5e0;
    do {
      iVar5 = iVar4;
      if ((bVar7 != iVar3 < 0) &&
         ((float)g_101ce5e4[iVar4 * 2 + 3] < (float)g_101ce5e4[iVar4 * 2 + 1])) {
        iVar5 = iVar4 + 1;
      }
      puVar1 = g_101ce5e4 + iVar5 * 2;
      if ((float)g_101ce5e4[g_101ce5e0 * 2 + 1] < (float)puVar1[1] !=
          ((float)g_101ce5e4[g_101ce5e0 * 2 + 1] == (float)puVar1[1])) break;
      g_101ce5e4[iVar6 * 2] = *puVar1;
      g_101ce5e4[iVar6 * 2 + 1] = puVar1[1];
      iVar4 = iVar5 * 2 + 1;
      bVar7 = SBORROW4(iVar4,g_101ce5e0);
      iVar3 = iVar4 - g_101ce5e0;
      iVar6 = iVar5;
    } while (iVar4 <= g_101ce5e0);
  }
  puVar1 = g_101ce5e4;
  g_101ce5e4[iVar6 * 2] = g_101ce5e4[g_101ce5e0 * 2];
  g_101ce5e4[iVar6 * 2 + 1] = puVar1[g_101ce5e0 * 2 + 1];
  return puVar2;
}


