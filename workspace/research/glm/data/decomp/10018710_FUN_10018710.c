// 10018710 size=375 FUN_10018710

bool FUN_10018710(undefined4 *param_1,int param_2,int param_3)

{
  char *in_EAX;
  char *pcVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  int *piVar8;
  char *pcVar9;
  bool bVar10;
  
  iVar2 = 0xc;
  bVar10 = true;
  pcVar7 = "passthrough";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar10 = *in_EAX == *pcVar7;
    in_EAX = in_EAX + 1;
    pcVar7 = pcVar7 + 1;
  } while (bVar10);
  if (bVar10) {
    iVar2 = FUN_1005faf0(&DAT_10195820,1);
    return iVar2 != 0;
  }
  FUN_1005f3f0();
  iVar2 = FUN_10018420();
  if (iVar2 != 0) {
    iVar6 = 0;
    piVar8 = (int *)(param_2 + 8);
    iVar5 = param_2 + 4;
    do {
      iVar3 = 0;
      if (*piVar8 == 0) {
        piVar4 = (int *)(iVar5 + 4);
        do {
          piVar4 = piVar4 + 1;
          iVar3 = iVar3 + 1;
        } while (*piVar4 == 0);
      }
      *(uint *)(param_3 + 0x10 + iVar3 * 4) =
           *(uint *)(param_3 + 0x10 + iVar3 * 4) | *(uint *)(iVar2 + 4);
      *(uint *)(param_3 + 0x18 + iVar3 * 4) =
           *(uint *)(param_3 + 0x18 + iVar3 * 4) | *(uint *)(param_2 + 8 + (iVar6 + iVar3) * 4);
      iVar6 = iVar6 + 4;
      piVar8 = piVar8 + 4;
      if (*(int *)(iVar5 + 0xc) == 0) {
        iVar2 = FUN_1005faf0(&DAT_10195820,1);
        return iVar2 != 0;
      }
      iVar2 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar2] != '\0') {
        (&DAT_101a6ab4)[iVar2] = 0;
        *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
        *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
      }
      pcVar1 = (char *)FUN_1005f690(param_1);
      iVar2 = 2;
      bVar10 = true;
      pcVar7 = pcVar1;
      pcVar9 = ",";
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar10 = *pcVar7 == *pcVar9;
        pcVar7 = pcVar7 + 1;
        pcVar9 = pcVar9 + 1;
      } while (bVar10);
      if (!bVar10) {
        FUN_1005f360("MatchToken: %s != %s\n",pcVar1,&DAT_1019581c);
        return false;
      }
      iVar2 = FUN_10018420();
      iVar5 = iVar5 + 0x10;
    } while (iVar2 != 0);
  }
  return false;
}


