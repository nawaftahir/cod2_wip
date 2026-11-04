extern unsigned int DAT_101ce738;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d7e94;
extern unsigned int DAT_10678500;
extern unsigned int DAT_10678510;
extern unsigned int DAT_10678ac4;
extern unsigned int DAT_10678ad0;
extern int FUN_10005680();
extern int FUN_10006300();
extern int FUN_1001f6f0();
extern int FUN_10023b90();
extern int FUN_10024680();
extern int FUN_10058d20();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10009570(int param_1,unsigned int param_2,unsigned int param_3)

{
  int *piVar1;
  char cVar2;
  unsigned int uVar3;
  int iVar4;
  float *pfVar5;
  float fVar6;
  
  iVar4 = g_10678500;
 
	int g_10678500 = DAT_10678500; piVar1 = (int *)(DAT_101d7e94 + param_1 * 8);
  if (*piVar1 != g_10678500) {
    pfVar5 = (float *)(param_1 * 0x60 + *(int *)(g_101d1b9c + 0xf8));
    i
	int g_101d1b9c = DAT_101d1b9c;f (*(float *)(param_1 * 0x60 + *(int *)(g_101d1b9c + 0xf8)) != 0.0) {
      fVar6 = (float)FUN_10058d20();
      if ((float)*pfVar5 < fVar6 * (float)_DAT_101d7e88 + (float)_DAT_101d7e8c) {
        *piVar1 = iVar4;
        return;
      }
    }
    cVar2 = FUN_10006300(param_3);
    iVar4 = DAT_101ce738;
    if (cVar2 == '\0') {
      *piVar1 = g_10678500;
      if (*(char *)(iVar4 + 8) != '\0') {
        uVar3 = (*(void *)RI_XModelGetSurfaceName)(pfVar5[4]);
        FUN_10005680(pfVar5 + 1,0x3e99999a,uVar3);
      }
      iVar4 = FUN_10023b90(param_1);
      if (iVar4 >= 0) {
        FUN_1001f6f0(&DAT_10678ac4 + iVar4 * 0x34,iVar4 * 0x74 + DAT_10678510,param_1);
        *(unsigned int *)(&DAT_10678ad0 + iVar4 * 0x34) = 5;
        FUN_10024680(iVar4);
      }
    }
  }
  return;
}


