extern unsigned int DAT_101ce738;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d7e94;
extern unsigned int DAT_10678500;
extern unsigned int DAT_10678510;
extern unsigned int DAT_10678ac4;
extern unsigned int DAT_10678ad0;
extern int FUN_10005680();
extern int FUN_1001f6f0();
extern int FUN_10023b90();
extern int FUN_10024680();
extern int FUN_10058d20();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10009480(int param_1)

{
  unsigned int uVar1;
  int iVar2;
  float *pfVar3;
  float fVar4;
  
  if (*(int *)(g_101d7e94 + param_1 * 8) != g_10678500) {
 
	int g_10678500 = DAT_10678500;  
	int g_101d7e94 = DAT_101d7e94; *(int *)(g_101d7e94 + param_1 * 8) = g_10678500;
    pfVar3 = (float *)(param_1 * 0x60 + *(int *)(g_101d1b9c + 0xf8));
    if ((
	int g_101d1b9c = DAT_101d1b9c;*(float *)(param_1 * 0x60 + *(int *)(g_101d1b9c + 0xf8)) != 0.0) &&
       (fVar4 = (float)FUN_10058d20(),
       (float)*pfVar3 < fVar4 * (float)_DAT_101d7e88 + (float)_DAT_101d7e8c)) {
      return;
    }
    if (*(char *)(DAT_101ce738 + 8) != '\0') {
      uVar1 = (*(void *)RI_XModelGetSurfaceName)(pfVar3[4]);
      FUN_10005680(pfVar3 + 1,0x3e99999a,uVar1);
    }
    iVar2 = FUN_10023b90(param_1);
    if (iVar2 >= 0) {
      FUN_1001f6f0(&DAT_10678ac4 + iVar2 * 0x34,iVar2 * 0x74 + DAT_10678510,param_1);
      *(unsigned int *)(&DAT_10678ad0 + iVar2 * 0x34) = 5;
      FUN_10024680(iVar2);
    }
  }
  return;
}


