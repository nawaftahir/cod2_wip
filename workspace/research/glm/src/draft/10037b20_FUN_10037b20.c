extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_10764584;
extern int FUN_10060c70();


void FUN_10037b20(void)

{
  unsigned int uVar1;
  
  uVar1 = FUN_10060c70();
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;   _fprintf(g_10764584,"%s",uVar1);
    _fflush(g_10764584);
  }
  return;
}


