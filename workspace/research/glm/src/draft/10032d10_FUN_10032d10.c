extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d4958;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_10032d10(void)

{
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s","dx.flushGpuQuery->Issue( (1 << 0) )\n");
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d494c + 0x18))(g_101d494c,1);
  } while
	int g_101d494c = DAT_101d494c; (DAT_1076a830 != 0);
  DAT_101d4958 = 1;
  return;
}


