
void FUN_00495a80(int param_1,int param_2,int param_3,int param_4)

{
  undefined4 *in_EAX;
  int iVar1;
  char *pcVar2;
  char *pcVar3;
  char *pcVar4;
  bool bVar5;
  
  FUN_004954e0(0);
  if (0 < param_1) {
    do {
      FUN_004959d0(param_2,param_3,param_4);
      param_4 = param_4 + param_2 * param_3 * 4;
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  iVar1 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar1] != '\0') {
    (&DAT_00592b8c)[iVar1] = 0;
    *in_EAX = *(undefined4 *)(&DAT_00592ba0 + iVar1);
    *(undefined4 *)(&DAT_00592b88 + iVar1) = *(undefined4 *)(&DAT_00592b9c + iVar1);
  }
  pcVar2 = (char *)FUN_00495060();
  iVar1 = 2;
  bVar5 = true;
  pcVar3 = pcVar2;
  pcVar4 = ")";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (!bVar5) {
    FUN_00494b60("MatchToken: %s != %s\n",pcVar2,&DAT_00546b28);
  }
  return;
}

