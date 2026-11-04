// 100185b0 size=346 FUN_100185b0

uint FUN_100185b0(undefined4 *param_1,undefined4 param_2)

{
  uint uVar1;
  char *pcVar2;
  int iVar3;
  char *in_EDX;
  char *pcVar4;
  char *pcVar5;
  bool bVar6;
  
  iVar3 = 8;
  bVar6 = true;
  pcVar4 = "default";
  do {
    if (iVar3 == 0) break;
    iVar3 = iVar3 + -1;
    bVar6 = *in_EDX == *pcVar4;
    in_EDX = in_EDX + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar6);
  if (bVar6) {
    iVar3 = FUN_1005faf0(&DAT_10195880,1);
    return (iVar3 != 0) - 1 & 2;
  }
  uVar1 = FUN_100184d0(param_1,param_2);
  if (uVar1 == 0) {
    do {
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        (&DAT_101a6ab4)[iVar3] = 0;
        *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
        *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
      }
      pcVar2 = (char *)FUN_1005f690(param_1);
      iVar3 = 2;
      bVar6 = true;
      pcVar4 = pcVar2;
      pcVar5 = ":";
      do {
        if (iVar3 == 0) break;
        iVar3 = iVar3 + -1;
        bVar6 = *pcVar4 == *pcVar5;
        pcVar4 = pcVar4 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar6);
      if (bVar6) {
        return 0;
      }
      iVar3 = 3;
      bVar6 = true;
      pcVar4 = pcVar2;
      pcVar5 = "&&";
      do {
        if (iVar3 == 0) break;
        iVar3 = iVar3 + -1;
        bVar6 = *pcVar4 == *pcVar5;
        pcVar4 = pcVar4 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar6);
      if (!bVar6) {
        FUN_1005f360("expected \':\' or \'&&\', found \'%s\'\n",pcVar2);
        goto LAB_10018700;
      }
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        (&DAT_101a6ab4)[iVar3] = 0;
        *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
        *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
      }
      FUN_1005f690(param_1);
      iVar3 = FUN_100184d0(param_1,param_2);
    } while (iVar3 == 0);
    if (iVar3 == 1) {
      FUN_1005f360("failed parsing conditional after \'&&\'\n");
      return 2;
    }
LAB_10018700:
    uVar1 = 2;
  }
  return uVar1;
}


