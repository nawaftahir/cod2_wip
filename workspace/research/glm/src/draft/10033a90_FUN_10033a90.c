extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d4810;
extern unsigned int DAT_101d492d;
extern unsigned int DAT_1072ddb0;
extern unsigned int DAT_10764584;
extern int FUN_10032cd0();
extern int FUN_10032d10();
extern int FUN_10032e80();


void FUN_10033a90(void)

{
  if (g_101d4810 == 3) {
 
	int g_101d4810 = DAT_101d4810;   FUN_10032e80();
  }
  else if (g_101d4810 == 1) {
    FUN_10032cd0();
    FUN_10032d10();
  }
  DAT_101d492d = 1;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s","dx.device->BeginScene()\n");
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0xa4))(g_101d1bf8);
  } while (DA
	int g_101d1bf8 = DAT_101d1bf8;T_1076a830 != 0);
  g_1072ddb0 = g_1072ddb0 + 1;
  return;
	int g_1072ddb0 = DAT_1072ddb0;
}


