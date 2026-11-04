extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d49b0;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1001e540(void)

{
  int *piVar1;
  
  if (g_101d49b0 != 0) {
 
	int g_101d49b0 = DAT_101d49b0;   g_101d49b0 = 0;
    piVar1 = *(int **)(*(int *)(DAT_101da9c8 + 0x217c78) + 8);
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s","vb->Unlock()\n");
        _fflush(g_10764584);
      }
      (**(void **)(*piVar1 + 0x30))(piVar1);
    } while (DAT_1076a830 != 0);
  }
  return;
}


