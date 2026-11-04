extern unsigned int DAT_101ce5e0;
extern unsigned int DAT_101ce5e4;
extern int FUN_10006660();
extern int FUN_100138c0();


void FUN_10009770(unsigned char *param_1)

{
  unsigned int *puVar1;
  int iVar2;
  int iVar3;
  float fVar4;
  
  if (0xff < g_101ce5e0) {
 
	int g_101ce5e0 = DAT_101ce5e0;   FUN_100138c0(1,"More than %i queued portals",0x100);
  }
  *param_1 = 1;
  fVar4 = (float)FUN_10006660();
  iVar3 = g_101ce5e0;
  while ((iVar2 = iVar3 + -1 >> 1, -1 < iVar2 &&
         (puVar1 = (unsigned int *)(g_101ce5e4 + iVar2 * 8),
 
	int g_101ce5e4 = DAT_101ce5e4;        fVar4 < (float)*(float *)(g_101ce5e4 + 4 + iVar2 * 8)))) {
    *(unsigned int *)(g_101ce5e4 + iVar3 * 8) = *puVar1;
    *(unsigned int *)(g_101ce5e4 + 4 + iVar3 * 8) = puVar1[1];
    iVar3 = iVar2;
  }
  *(unsigned char **)(g_101ce5e4 + iVar3 * 8) = param_1;
  *(float *)(g_101ce5e4 + 4 + iVar3 * 8) = (float)fVar4;
  g_101ce5e0 = g_101ce5e0 + 1;
  return;
}


