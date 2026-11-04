extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072de40;
extern unsigned int DAT_1072dee0;
extern unsigned int DAT_1072ebb0;
extern unsigned int DAT_10730550;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076674c;
extern unsigned int DAT_10766750;
extern unsigned int DAT_10766754;
extern unsigned int DAT_10766758;
extern int FUN_1003a580();
extern int FUN_1003a8d0();
extern int FUN_1003e4b0();
extern int FUN_1003ecb0();
extern int FUN_1003ed20();
extern int FUN_1003eea0();
extern int FUN_10060c70();


void FUN_100413c0(int param_1)

{
  unsigned int uVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  unsigned int local_1c;
  int local_18;
  int local_14;
  unsigned int local_10;
  unsigned int local_c;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (*(int *)(g_101ce7ec + 8) != 0) {
 
	int g_101ce7ec = DAT_101ce7ec;   uVar1 = FUN_10060c70("--- RB_TessXModelRigid( %s ) ---\n",*DAT_1072d9bc);
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s",uVar1);
      _fflush(g_10764584);
    }
  }
  iVar2 = *(int *)(param_1 + 4);
  local_18 = (int)*(short *)(iVar2 + 2);
  local_14 = (int)*(short *)(iVar2 + 4);
  local_c = 0;
  local_10 = 0;
  local_1c = 0;
  if (DAT_1076674c != *(int *)(iVar2 + 0x14)) {
    FUN_1003ecb0();
  }
  if (((DAT_10766750 != *(int *)(iVar2 + 0x10)) || (DAT_10766754 != 0)) ||
     (DAT_10766758 != ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40)) {
    FUN_1003ed20(*(int *)(iVar2 + 0x10));
  }
  puVar3 = (unsigned int *)(&DAT_1072dee0 + g_10730550 * 0xcd0);
  puVar
	int g_10730550 = DAT_10730550;4 = (unsigned int *)(&DAT_1072ebb0 + g_10730550 * 0xcd0);
  for (iVar2 = 0x334; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  g_10730550 = g_10730550 + 1;
  FUN_1003eea0(DAT_1072de40);
  FUN_1003a580(0,&local_1c);
  FUN_1003e4b0();
  return;
}


