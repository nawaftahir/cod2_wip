extern unsigned int DAT_101d7fc8;
extern unsigned int DAT_101d7fcc;
extern int FUN_100138c0();


unsigned int * FUN_10016780(char *param_1,unsigned int param_2,unsigned char *param_3)

{
  unsigned int *puVar1;
  unsigned int uVar2;
  char *pcVar3;
  int iVar4;
  unsigned int uVar5;
  unsigned int uVar6;
  char *pcVar7;
  unsigned char bVar8;
  
  uVar5 = param_2 * 2;
  uVar2 = 0;
  if (0 < (int)uVar5) {
    iVar4 = 0x77;
    uVar6 = uVar5;
    do {
      uVar2 = uVar2 + (unsigned int)(byte)param_1[iVar4 + -0x77] * iVar4;
      iVar4 = iVar4 + 1;
      uVar6 = uVar6 - 1;
    } while (uVar6 != 0);
  }
  uVar2 = uVar2 & 0x1f;
  iVar4 = (&g_101d7fcc)[uVar2 * 6];
 
	int g_101d7fcc = DAT_101d7fcc; puVar1 = &g_101d7fcc + uVar2 * 6;
  do {
    if (iVar4 == 0) {
      if (g_101d7fc8 == 0x1f) {
     
	int g_101d7fc8 = DAT_101d7fc8;   FUN_100138c0(1,"More than %i vertex declarations in use",0x1f);
      }
      g_101d7fc8 = g_101d7fc8 + 1;
      pcVar3 = (char *)(*(void *)RI_Hunk_AllocInternal)(uVar5);
      pcVar7 = pcVar3;
      for (uVar2 = (param_2 & 0x7fffffff) >> 1; uVar2 != 0; uVar2 = uVar2 - 1) {
        *(unsigned int *)pcVar7 = *(unsigned int *)param_1;
        param_1 = param_1 + 4;
        pcVar7 = pcVar7 + 4;
      }
      for (uVar5 = uVar5 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
        *pcVar7 = *param_1;
        param_1 = param_1 + 1;
        pcVar7 = pcVar7 + 1;
      }
      *puVar1 = 0;
      puVar1[1] = 0;
      puVar1[2] = 0;
      puVar1[3] = 0;
      puVar1[4] = 0;
      puVar1[5] = 0;
      *puVar1 = pcVar3;
      puVar1[1] = param_2;
      *param_3 = 0;
      return puVar1;
    }
    if (puVar1[1] == param_2) {
      bVar8 = true;
      uVar6 = uVar5;
      pcVar7 = (char *)*puVar1;
      pcVar3 = param_1;
      do {
        if (uVar6 == 0) break;
        uVar6 = uVar6 - 1;
        bVar8 = *pcVar7 == *pcVar3;
        pcVar7 = pcVar7 + 1;
        pcVar3 = pcVar3 + 1;
      } while (bVar8);
      if (bVar8) {
        *param_3 = 1;
        return puVar1;
      }
    }
    uVar2 = uVar2 + 1 & 0x1f;
    iVar4 = (&g_101d7fcc)[uVar2 * 6];
    puVar1 = &g_101d7fcc + uVar2 * 6;
  } while( true );
}


