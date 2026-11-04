extern unsigned int DAT_101a6ab4;
extern unsigned int DAT_101aac70;
extern unsigned int DAT_101aac74;
extern unsigned int DAT_101aac78;
extern int FUN_1005f2d0();


void FUN_1005f3f0(void)

{
  int iVar1;
  
  iVar1 = DAT_101aac70 * 0x45c;
  if ((&g_101a6ab4)[iVar1] != '\0') {
 
	int g_101a6ab4 = DAT_101a6ab4;   FUN_1005f2d0("UngetToken called twice");
    (&g_101a6ab4)[iVar1] = 1;
    g_101aac74 = g_101aac78;
 
	int g_101aac78 = DAT_101aac78;  
	int g_101aac74 = DAT_101aac74; return;
  }
  (&g_101a6ab4)[iVar1] = 1;
  g_101aac74 = g_101aac78;
  return;
}


