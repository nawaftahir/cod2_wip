
void FUN_004958e0(int param_1,int param_2)

{
  undefined4 *in_EAX;
  int iVar1;
  char *pcVar2;
  char *pcVar3;
  int iVar4;
  char *pcVar5;
  bool bVar6;
  double dVar7;
  
  FUN_004954e0(0);
  iVar4 = 0;
  if (0 < param_1) {
    do {
      iVar1 = DAT_00596d48 * 0x45c;
      if ((&DAT_00592b8c)[iVar1] != '\0') {
        (&DAT_00592b8c)[iVar1] = 0;
        *in_EAX = *(undefined4 *)(&DAT_00592ba0 + iVar1);
        *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
      }
      pcVar2 = (char *)FUN_00495060();
      dVar7 = _atof(pcVar2);
      *(float *)(param_2 + iVar4 * 4) = (float)dVar7;
      iVar4 = iVar4 + 1;
    } while (iVar4 < param_1);
  }
  iVar4 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar4] != '\0') {
    (&DAT_00592b8c)[iVar4] = 0;
    *in_EAX = *(undefined4 *)(&DAT_00592ba0 + iVar4);
    *(undefined4 *)(&DAT_00592b88 + iVar4) = *(undefined4 *)(&DAT_00592b9c + iVar4);
  }
  pcVar3 = (char *)FUN_00495060();
  iVar4 = 2;
  bVar6 = true;
  pcVar2 = pcVar3;
  pcVar5 = ")";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar6 = *pcVar2 == *pcVar5;
    pcVar2 = pcVar2 + 1;
    pcVar5 = pcVar5 + 1;
  } while (bVar6);
  if (!bVar6) {
    FUN_00494b60("MatchToken: %s != %s\n",pcVar3,&DAT_00546b28);
  }
  return;
}

