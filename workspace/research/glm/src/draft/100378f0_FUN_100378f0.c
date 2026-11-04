extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_10764584;


void FUN_100378f0(void)

{
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
	int g_10764584 = DAT_10764584;
    _fprintf(g_10764584,"%s");
    _fflush(g_10764584);
  }
  return;
}


