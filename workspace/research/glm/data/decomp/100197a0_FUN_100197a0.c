// 100197a0 size=270 FUN_100197a0

bool FUN_100197a0(undefined4 *param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  bool bVar6;
  double dVar7;
  
  iVar1 = FUN_1005faf0(&DAT_10195544,1);
  if (iVar1 == 0) {
    return false;
  }
  iVar1 = 0;
  do {
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar3 = (char *)FUN_1005f690(param_1);
    dVar7 = _atof(pcVar3);
    *(float *)(param_3 + iVar1 * 4) = (float)dVar7;
    iVar1 = iVar1 + 1;
    if (iVar1 == param_2) {
      iVar1 = FUN_1005faf0(&DAT_10195540,1);
      return iVar1 != 0;
    }
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar4 = (char *)FUN_1005f690(param_1);
    iVar2 = 2;
    bVar6 = true;
    pcVar3 = pcVar4;
    pcVar5 = ",";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar6 = *pcVar3 == *pcVar5;
      pcVar3 = pcVar3 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (!bVar6) {
      FUN_1005f360("MatchToken: %s != %s\n",pcVar4,&DAT_1019581c);
      return false;
    }
  } while( true );
}


