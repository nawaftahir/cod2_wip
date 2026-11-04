extern unsigned int DAT_101d49c0;
extern unsigned int DAT_101d49c4;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101da9c8;
extern int FUN_1001e540();


void R_SyncRenderThread(void)

{
  int iVar1;
  
  if (DAT_101d4d00 != '\0') {
    FUN_1001e540();
    iVar1 = g_101da9c8;
 
	int g_101da9c8 = DAT_101da9c8;   *(unsigned int *)(g_101da9c8 + 0x249d0c) = 0;
    *(unsigned int *)(iVar1 + 0x249d10) = 0;
    *(unsigned int *)(iVar1 + 0x249d14) = 0;
    if (g_101d49c4 != 0) {
     
	int g_101d49c4 = DAT_101d49c4; (*(void *)RI_Z_VirtualDecommitInternal)(DAT_101d49c0,g_101d49c4);
      g_101d49c4 = 0;
    }
  }
  return;
}


