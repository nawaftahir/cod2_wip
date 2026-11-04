extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_10764584;
extern unsigned int DAT_10764680;
extern int FUN_10060c70();


void FUN_10039130(int param_1,char *param_2,unsigned int param_3)

{
  float *pfVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  unsigned char bVar5;
  
  if ((*(int *)(g_101ce7ec + 8) != 0) && (iVar3 = 0, 0 < (int)param_3)) {
 
	int g_101ce7ec = DAT_101ce7ec;   pfVar1 = (float *)(param_2 + 8);
    do {
      FUN_10060c70("---------- const %i value %g %g %g %g\n",iVar3 + param_1,(double)pfVar1[-2],
                   (double)pfVar1[-1],(double)*pfVar1,(double)pfVar1[1]);
      if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s");
        _fflush(g_10764584);
      }
      iVar3 = iVar3 + 1;
      pfVar1 = pfVar1 + 4;
    } while (iVar3 < (int)param_3);
  }
  iVar3 = param_3 << 4;
  bVar5 = true;
  pcVar2 = (char *)(&g_10764680 + param_1 * 4);
 
	int g_10764680 = DAT_10764680; pcVar4 = param_2;
  do {
    if (iVar3 == 0) break;
    iVar3 = iVar3 + -1;
    bVar5 = *pcVar2 == *pcVar4;
    pcVar2 = pcVar2 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (!bVar5) {
    pcVar2 = param_2;
    pcVar4 = (char *)(&g_10764680 + param_1 * 4);
    for (iVar3 = (param_3 & 0xfffffff) << 2; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(unsigned int *)pcVar4 = *(unsigned int *)pcVar2;
      pcVar2 = pcVar2 + 4;
      pcVar4 = pcVar4 + 4;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *pcVar4 = *pcVar2;
      pcVar2 = pcVar2 + 1;
      pcVar4 = pcVar4 + 1;
    }
    do {
      if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
        _fprintf(g_10764584,"%s");
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0x178))(g_101d1bf8,param_1,param_2);
    } while (DAT_10
	int g_101d1bf8 = DAT_101d1bf8;76a830 != 0);
  }
  return;
}


