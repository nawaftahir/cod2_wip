// 10019ca0 size=358 FUN_10019ca0

bool FUN_10019ca0(int param_1,undefined2 *param_2)

{
  char cVar1;
  undefined1 uVar2;
  undefined4 *in_EAX;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  char *pcVar6;
  bool bVar7;
  
  iVar3 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar3] != '\0') {
    (&DAT_101a6ab4)[iVar3] = 0;
    *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
    *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
  }
  pcVar4 = (char *)FUN_1005f690();
  cVar1 = FUN_100198c0();
  if (cVar1 != '\0') {
    if (1 < *(byte *)(param_1 + 5)) {
      FUN_1005f360("Each element of the array must be set to a float individually.\n");
      return false;
    }
    *param_2 = 0;
    iVar3 = FUN_10016390();
    *(int *)(param_2 + 2) = iVar3;
    return iVar3 != 0;
  }
  iVar3 = 9;
  bVar7 = true;
  pcVar5 = pcVar4;
  pcVar6 = "constant";
  do {
    if (iVar3 == 0) break;
    iVar3 = iVar3 + -1;
    bVar7 = *pcVar5 == *pcVar6;
    pcVar5 = pcVar5 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar7);
  if (bVar7) {
    *param_2 = 1;
    uVar2 = FUN_10019a80();
    return (bool)uVar2;
  }
  iVar3 = 9;
  bVar7 = true;
  pcVar5 = pcVar4;
  pcVar6 = "material";
  do {
    if (iVar3 == 0) break;
    iVar3 = iVar3 + -1;
    bVar7 = *pcVar5 == *pcVar6;
    pcVar5 = pcVar5 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar7);
  if (bVar7) {
    if (1 < *(byte *)(param_1 + 5)) {
      FUN_1005f360("Each element of the array must be set to a material constant individually.\n");
      return false;
    }
    iVar3 = FUN_1005faf0(&DAT_10195640,1);
    if (iVar3 != 0) {
      FUN_1005fa50();
      *param_2 = 2;
      iVar3 = FUN_10016440();
      *(int *)(param_2 + 2) = iVar3;
      return iVar3 != 0;
    }
  }
  else {
    FUN_1005f360("expected \'sampler\' or \'material\', found \'%s\' instead\n",pcVar4);
  }
  return false;
}


