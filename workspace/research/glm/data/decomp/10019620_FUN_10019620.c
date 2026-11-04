// 10019620 size=211 FUN_10019620

undefined1 FUN_10019620(undefined2 *param_1)

{
  undefined1 uVar1;
  int iVar2;
  char *pcVar3;
  undefined4 *unaff_EBX;
  char *pcVar4;
  char *pcVar5;
  bool bVar6;
  
  iVar2 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar2] != '\0') {
    (&DAT_101a6ab4)[iVar2] = 0;
    *unaff_EBX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
    *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
  }
  pcVar3 = (char *)FUN_1005f690();
  iVar2 = 8;
  bVar6 = true;
  pcVar4 = pcVar3;
  pcVar5 = "sampler";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar6 = *pcVar4 == *pcVar5;
    pcVar4 = pcVar4 + 1;
    pcVar5 = pcVar5 + 1;
  } while (bVar6);
  if (bVar6) {
    *param_1 = 3;
    uVar1 = FUN_100194f0();
    return uVar1;
  }
  iVar2 = 9;
  bVar6 = true;
  pcVar4 = pcVar3;
  pcVar5 = "material";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar6 = *pcVar4 == *pcVar5;
    pcVar4 = pcVar4 + 1;
    pcVar5 = pcVar5 + 1;
  } while (bVar6);
  if (bVar6) {
    iVar2 = FUN_1005faf0(&DAT_10195640,1);
    if (iVar2 != 0) {
      FUN_1005fa50();
      *param_1 = 4;
      iVar2 = FUN_10016440();
      *(int *)(param_1 + 2) = iVar2;
      return iVar2 != 0;
    }
  }
  else {
    FUN_1005f360("expected \'sampler\' or \'material\', found \'%s\' instead\n",pcVar3);
  }
  return false;
}


