extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d49b4;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1002b920(void)

{
  int iVar1;
  
  iVar1 = *(int *)(DAT_101ce708 + 8);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s",
               "dx.device->CreateVertexBuffer( size, (0x00000200L) | (0x00000008L), 0, D3DPOOL_DEFAULT, &dx.smodelCacheVb, 0 )\n"
              );
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0x68))
       
	int g_101d1bf8 = DAT_101d1bf8;       (g_101d1bf8,(((iVar1 != 2) - 1 & 0xffffffe4) + 0x40) * 0x10000,0x208,0,0,
               &DAT_101d49b4,0);
  } while (DAT_1076a830 != 0);
  return;
}


