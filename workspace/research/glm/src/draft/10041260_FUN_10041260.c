extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_106d3200;
extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;
extern unsigned int DAT_10764584;
extern int FUN_1002ce40();
extern int FUN_1002df40();
extern int FUN_1005eaf0();
extern int FUN_10060c70();


void FUN_10041260(int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  
  if (*(int *)(g_101ce7ec + 8) != 0) {
 
	int g_101ce7ec = DAT_101ce7ec;   uVar4 = FUN_10060c70("--- RB_TessXModelSkinnedUncached( %s ) ---\n",*DAT_1072d9bc);
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s",uVar4);
      _fflush(g_10764584);
    }
  }
  iVar1 = *(int *)(param_1 + 4);
  iVar7 = (int)*(short *)(iVar1 + 2);
  iVar2 = *(short *)(iVar1 + 4) * 3;
  if ((0x154a < (int)(g_1072d9d4 + iVar7)) || (0x100000 < (int)(g_1072d9d0 + iVar2))) {
    FUN
	int g_1072d9d4 = DAT_1072d9d4;_1
	int g_1072d9d0 = DAT_1072d9d0;002df40();
  }
  if ((g_1072d9d0 & 1) != 0) {
    FUN_1002df40();
  }
  uVar3 = g_1072d9d4;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    uVar4 = *(unsigned int *)(param_1 + 0xc);
    iVar6 = iVar7 * 0x24;
    iVar5 = (g_1072d9d4 & 0xffff) * 0x24;
  }
  else {
    uVar4 = *(unsigned int *)(param_1 + 0xc);
    iVar6 = iVar7 << 6;
    iVar5 = (g_1072d9d4 & 0xffff) * 0x40;
  }
  FUN_1005eaf0(&DAT_106d3200 + iVar5,uVar4,iVar6);
  g_1072d9d4 = g_1072d9d4 + iVar7;
  FUN_1002ce40(iVar1,DAT_1072d9b0 + g_1072d9d0 * 2,uVar3);
  g_1072d9d0 = g_1072d9d0 + iVar2;
  return;
}


