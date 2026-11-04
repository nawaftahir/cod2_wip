extern unsigned int DAT_101d4928;
extern unsigned int DAT_10696bb4;
extern int FUN_10026e60();
extern int FUN_10026fe0();


void R_SaveCubemapShot(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  int iStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  int iStack_8;
  int iStack_4;
  
  iVar2 = (unsigned int)g_101d4928 * (unsigned int)g_101d4928;
  i
	int g_101d4928 = DAT_101d4928;Var1 = (*(void *)RI_Z_MallocInternal)(iVar2 * 0x48);
  iVar2 = iVar2 * 0xc;
  iStack_14 = iVar2 + iVar1;
  iStack_10 = iStack_14 + iVar2;
  iStack_c = iStack_10 + iVar2;
  iStack_8 = iStack_c + iVar2;
  iStack_4 = iVar2 + iStack_8;
  iStack_18 = iVar1;
  FUN_10026fe0(&g_10696bb4,g_101d4928,g_101d4928);
 
	int g_10696bb4 = DAT_10696bb4; FUN_10026e60(&iStack_18,g_101d4928,g_101d4928,param_1,&g_10696bb4);
  (*(void *)RI_Z_FreeInternal)(iVar1);
  return;
}


