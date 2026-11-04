extern unsigned int DAT_101ce810;
extern unsigned int DAT_101d7e90;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678510;
extern unsigned int DAT_10678ab8;
extern unsigned int DAT_10678ac4;
extern unsigned int DAT_10678acc;
extern unsigned int DAT_10678ad8;
extern unsigned int DAT_10678adc;
extern unsigned int DAT_10678ae0;
extern unsigned int DAT_10678ae4;
extern unsigned int DAT_10678ae8;
extern unsigned int DAT_10678aec;
extern int FUN_1001f6f0();
extern int FUN_1001fa70();
extern int FUN_1001ffc0();
extern int FUN_10024680();
extern int FUN_10027290();
extern int FUN_10027590();


void FUN_100276d0(unsigned int param_1,unsigned int param_2,int param_3,unsigned int param_4,int param_5)

{
  float *pfVar1;
  int iVar2;
  unsigned int *puVar3;
  int iVar4;
  unsigned int *puVar5;
  int *piVar6;
  unsigned int *puVar7;
  unsigned int *puVar8;
  
  iVar4 = param_3 * 0x34;
  puVar5 = &DAT_10678ac4 + iVar4;
  piVar6 = (int *)(param_3 * 0x74 + DAT_10678510);
  (*(void *)RI_DObjCalcAnim)(*(unsigned int *)(&g_10678acc + iVar4));
 
	int g_10678acc = DAT_10678acc; FUN_1001ffc0(puVar5);
  if ((*(float *)(&g_10678ae4 + iVar4) - *(float *)(&g_10678ad8 + iVar4)) *
 
	int g_10678ae4 = DAT_10678ae4;  
	int g_10678ad8 = DAT_10678ad8;   (*(float *)(&g_10678ae4 + iVar4) - *(float *)(&g_10678ad8 + iVar4)) +
      (*(float *)(&g_10678ae8 + iVar4) - *(float *)(&g_10678adc + iVar4)) *
 
	int g_10678ae8 = DAT_10678ae8;     (
	int g_10678adc = DAT_10678adc;*(float *)(&g_10678ae8 + iVar4) - *(float *)(&g_10678adc + iVar4)) +
      (*(float *)(&g_10678aec + iVar4) - *(float *)(&g_10678ae0 + iVar4)) *
 
	int g_10678aec = DAT_10678aec;     (*(fl
	int g_10678ae0 = DAT_10678ae0;oat *)(&g_10678aec + iVar4) - *(float *)(&g_10678ae0 + iVar4)) != 0.0) {
    puVar3 = (unsigned int *)(*(int *)(param_5 + 0xa20) * 0x6c + param_5);
    *(int *)(param_5 + 0xa20) = *(int *)(param_5 + 0xa20) + 1;
    iVar2 = *(int *)(g_101da9c8 + 0x217c7c) * 0x14c + 0x217c80 + g_101da9c8;
    *(int *)(g_101da9c8 + 0x2
	int g_101da9c8 = DAT_101da9c8;17c7c) = *(int *)(g_101da9c8 + 0x217c7c) + 1;
    puVar3[0x19] = iVar2;
    FUN_10027290(&g_10678ad8 + iVar4,&g_10678ae4 + iVar4);
    puVar3[0x1a] = param_4;
    puVar7 = (unsigned int *)(puVar3[0x19] + 200);
    puVar8 = puVar3 + 3;
    for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar8 = *puVar7;
      puVar7 = puVar7 + 1;
      puVar8 = puVar8 + 1;
    }
    puVar3[4] = (float)puVar3[4] * -1.0;
    puVar3[8] = (float)puVar3[8] * -1.0;
    iVar2 = 2;
    puVar3[0xc] = (float)puVar3[0xc] * -1.0;
    puVar3[0x10] = (float)puVar3[0x10] * -1.0;
    pfVar1 = (float *)(puVar3 + 7);
    do {
      iVar2 = iVar2 + -1;
      pfVar1[-4] = pfVar1[-4] * 0.5;
      *pfVar1 = *pfVar1 * 0.5;
      pfVar1[4] = pfVar1[4] * 0.5;
      pfVar1[8] = (pfVar1[8] + 1.0) * 0.5;
      pfVar1 = pfVar1 + 1;
    } while (iVar2 != 0);
    puVar3[0x13] = *(unsigned int *)(&g_10678ad8 + iVar4);
    puVar3[0x14] = *(unsigned int *)(&g_10678adc + iVar4);
    puVar3[0x15] = *(unsigned int *)(&g_10678ae0 + iVar4);
    puVar3[0x16] = *(unsigned int *)(&g_10678ae4 + iVar4);
    puVar3[0x17] = *(unsigned int *)(&g_10678ae8 + iVar4);
    puVar3[0x18] = *(unsigned int *)(&g_10678aec + iVar4);
    *puVar3 = DAT_10678ab8;
    if (*(int *)(param_5 + 0xa20) <= *(int *)(DAT_101ce810 + 8)) {
      DAT_101d7e90 = param_1;
      (*(void *)RI_DObjCalcSkel)(*(unsigned int *)(&g_10678acc + iVar4));
      if (*piVar6 == 1) {
        FUN_1001f6f0(puVar5,piVar6,0xffffffff);
      }
      else {
        FUN_1001fa70(puVar5,piVar6);
      }
      FUN_10024680(param_3);
    }
    FUN_10027590(param_2,param_3);
  }
  return;
}


