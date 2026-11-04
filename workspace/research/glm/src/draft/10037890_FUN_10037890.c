extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_10764584;
extern int FUN_10037810();


void FUN_10037890(void)

{
  if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;  
	int g_101ce7ec = DAT_101ce7ec; (*(void *)RI_Dvar_SetBool)(g_101ce7ec,*(int *)(g_101ce7ec + 8) + -1);
  }
  if (*(int *)(g_101ce7ec + 8) == 0) {
    if (g_10764584 != (FILE *)0x0) {
      _fclose(g_10764584);
      g_10764584 = (FILE *)0x0;
    }
    return;
  }
  FUN_10037810();
  return;
}


