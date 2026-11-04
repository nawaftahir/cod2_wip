extern unsigned int DAT_101d1b9c;
extern int FUN_10004dc0();


void R_AddLightToScene_s27(void)

{
  int iVar1;
  
  FUN_10004dc0();
  iVar1 = g_101d1b9c;
 
	int g_101d1b9c = DAT_101d1b9c; *(unsigned int *)(g_101d1b9c + 0xe0) = *(unsigned int *)(g_101d1b9c + 200);
  *(unsigned int *)(iVar1 + 0xe4) = *(unsigned int *)(iVar1 + 0xcc);
  *(unsigned int *)(iVar1 + 0xe8) = *(unsigned int *)(iVar1 + 0xd0);
  return;
}


