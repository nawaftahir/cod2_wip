extern unsigned int DAT_10193358;
extern unsigned int DAT_101a6ab0;
extern unsigned int DAT_101a6acc;
extern unsigned int DAT_101aac70;
extern int FUN_10061c80();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_1005f360(char *param_1)

{
  int iVar1;
  int iVar2;
  char local_1000 [4092];
  unsigned int uStack_4;
  
  iVar1 = g_101aac70;
 
	int g_101aac70 = DAT_101aac70; uStack_4 = 0x1005f36a;
  iVar2 = g_101aac70 * 0x45c;
  _vsprintf(local_1000,param_1,&stack0x00000008);
  if (g_101aac70 != 0) {
    FUN_10061c80("%sFile %s, line %i: %s",(&PTR_DAT_101a6ac0)[iVar1 * 0x117],&DAT_101a6acc + iVar2,
                 *(unsigned int *)(&DAT_101a6ab0 + iVar2),local_1000);
    return;
  }
  FUN_10061c80(&DAT_10193358,local_1000);
  return;
}


