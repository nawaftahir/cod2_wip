// 10039270 size=304 FUN_10039270

void FUN_10039270(int param_1,char *param_2,uint param_3)

{
  float *pfVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  bool bVar5;
  
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (iVar3 = 0, 0 < (int)param_3)) {
    pfVar1 = (float *)(param_2 + 8);
    do {
      FUN_10060c70("---------- const %i value %g %g %g %g\n",iVar3 + param_1,(double)pfVar1[-2],
                   (double)pfVar1[-1],(double)*pfVar1,(double)pfVar1[1]);
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s");
        _fflush(DAT_10764584);
      }
      iVar3 = iVar3 + 1;
      pfVar1 = pfVar1 + 4;
    } while (iVar3 < (int)param_3);
  }
  iVar3 = param_3 << 4;
  bVar5 = true;
  pcVar2 = (char *)(&DAT_10765680 + param_1 * 4);
  pcVar4 = param_2;
  do {
    if (iVar3 == 0) break;
    iVar3 = iVar3 + -1;
    bVar5 = *pcVar2 == *pcVar4;
    pcVar2 = pcVar2 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (!bVar5) {
    pcVar2 = param_2;
    pcVar4 = (char *)(&DAT_10765680 + param_1 * 4);
    for (iVar3 = (param_3 & 0xfffffff) << 2; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined4 *)pcVar4 = *(undefined4 *)pcVar2;
      pcVar2 = pcVar2 + 4;
      pcVar4 = pcVar4 + 4;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *pcVar4 = *pcVar2;
      pcVar2 = pcVar2 + 1;
      pcVar4 = pcVar4 + 1;
    }
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0x1b4))(DAT_101d1bf8,param_1,param_2);
    } while (DAT_1076a830 != 0);
  }
  return;
}


