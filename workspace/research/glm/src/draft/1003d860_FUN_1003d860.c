extern unsigned int DAT_101ce6f0;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d495c;
extern unsigned int DAT_101d4960;
extern unsigned int DAT_101d4c88;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1003d860(void)

{
  int iVar1;
  int iVar2;
  
  g_101d495c = *(int *)(g_101ce6f0 + 8);
 
	int g_101d495c = DAT_101d495c; i
	int g_101ce6f0 = DAT_101ce6f0;f (g_101d4960 < *(int *)(g_101ce6f0 + 8)) {
 
	int g_101d4960 = DAT_101d4960;   g_101d495c = g_101d4960;
  }
  if (g_101d495c < 2) {
    g_101d495c = 0;
  }
  iVar2 = 1;
  if (1 - g_101d495c < 0) {
    iVar2 = g_101d495c;
  }
  iVar1 = 0;
  if (0 < g_101d4c88) {
 
	int g_101d4c88 = DAT_101d4c88;   do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s",
                 "dx.device->SetSamplerState( samplerIndex, D3DSAMP_MAXANISOTROPY, anisotropy )\n");
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0x114))(g_101d1bf8,iVar1,10,iVar2);
    } while ((DAT_1076a830 
	int g_101d1bf8 = DAT_101d1bf8;!= 0) || (iVar1 = iVar1 + 1, iVar1 < g_101d4c88));
  }
  return;
}


