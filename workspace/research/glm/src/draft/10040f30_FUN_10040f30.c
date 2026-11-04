extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d49a8;
extern unsigned int DAT_101d49ac;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076674c;
extern unsigned int DAT_10766750;
extern unsigned int DAT_10766754;
extern unsigned int DAT_10766758;
extern int FUN_1003a580();
extern int FUN_1003a8d0();
extern int FUN_1003ecb0();
extern int FUN_10040df0();
extern int FUN_10060c70();


void FUN_10040f30(void)

{
  unsigned int uVar1;
  unsigned int local_14;
  unsigned int local_10;
  unsigned int local_c;
  unsigned int local_8;
  unsigned int local_4;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (*(int *)(g_101ce7ec + 8) != 0) {
 
	int g_101ce7ec = DAT_101ce7ec;   uVar1 = FUN_10060c70("--- RB_TessParticleCloud( %s ) ---\n",*DAT_1072d9bc);
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s",uVar1);
      _fflush(g_10764584);
    }
  }
  local_8 = 0;
  local_4 = 0;
  local_14 = 0;
  local_10 = 0x1000;
  local_c = 0x800;
  FUN_10040df0();
  if (DAT_1076674c != DAT_101d49ac) {
    FUN_1003ecb0();
  }
  if (((DAT_10766750 != g_101d49a8) || (DAT_10766754 != 0)) || (DAT_10766758 != 0x14)) {
    FUN
	int g_101d49a8 = DAT_101d49a8;_1003ed20(g_101d49a8);
  }
  FUN_1003a580(2,&local_14);
  return;
}


