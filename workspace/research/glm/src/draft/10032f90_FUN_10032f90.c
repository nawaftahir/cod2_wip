extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d492d;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;
extern int FUN_10032cd0();
extern int FUN_10032d10();


void FUN_10032f90(LARGE_INTEGER *param_1)

{
  FUN_10032cd0();
  FUN_10032d10();
  FUN_10032cd0();
  QueryPerformanceCounter(param_1);
  DAT_101d492d = 1;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s","dx.device->BeginScene()\n");
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0xa4))(g_101d1bf8);
  } while
	int g_101d1bf8 = DAT_101d1bf8; (DAT_1076a830 != 0);
  return;
}


