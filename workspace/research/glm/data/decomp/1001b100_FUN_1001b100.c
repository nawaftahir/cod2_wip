// 1001b100 size=364 FUN_1001b100

bool FUN_1001b100(int param_1,undefined1 *param_2)

{
  int iVar1;
  char *pcVar2;
  char *pcVar3;
  undefined4 *unaff_EBX;
  char *pcVar4;
  bool bVar5;
  
  *param_2 = 0;
  iVar1 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar1] != '\0') {
    (&DAT_101a6ab4)[iVar1] = 0;
    *unaff_EBX = *(undefined4 *)(&DAT_101a6ac8 + iVar1);
    *(undefined4 *)(&DAT_101a6ab0 + iVar1) = *(undefined4 *)(&DAT_101a6ac4 + iVar1);
  }
  pcVar2 = (char *)FUN_1005f690();
  iVar1 = 9;
  bVar5 = true;
  pcVar4 = "texcoord";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar5 = *pcVar2 == *pcVar4;
    pcVar2 = pcVar2 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (!bVar5) {
    FUN_1005f3f0();
    return true;
  }
  iVar1 = FUN_1005faf0(&DAT_101958cc,1);
  if (iVar1 != 0) {
    iVar1 = FUN_1005ff30();
    if (iVar1 != param_1) {
      FUN_1005f360("expected %i, found %i instead\n",param_1,iVar1);
      return false;
    }
    iVar1 = FUN_1005faf0(&DAT_101958a8,1);
    if ((iVar1 != 0) && (iVar1 = FUN_1005faf0(&DAT_1019563c,1), iVar1 != 0)) {
      pcVar3 = (char *)FUN_1005fa50();
      iVar1 = 0x10;
      bVar5 = true;
      pcVar2 = pcVar3;
      pcVar4 = "genEyeDirCoords";
      do {
        if (iVar1 == 0) break;
        iVar1 = iVar1 + -1;
        bVar5 = *pcVar2 == *pcVar4;
        pcVar2 = pcVar2 + 1;
        pcVar4 = pcVar4 + 1;
      } while (bVar5);
      if (bVar5) {
        *param_2 = 1;
      }
      else {
        iVar1 = 10;
        bVar5 = true;
        pcVar2 = pcVar3;
        pcVar4 = "texScroll";
        do {
          if (iVar1 == 0) break;
          iVar1 = iVar1 + -1;
          bVar5 = *pcVar2 == *pcVar4;
          pcVar2 = pcVar2 + 1;
          pcVar4 = pcVar4 + 1;
        } while (bVar5);
        if (!bVar5) {
          FUN_1005f360("expected \'genEyeDirCoords\', \'genEyeFacingDotCoords\', or \'texScroll\', found \'%s\' instead.\n"
                       ,pcVar3);
          return false;
        }
        *param_2 = 2;
      }
      iVar1 = FUN_1005faf0(&DAT_10195544,1);
      if ((iVar1 != 0) && (iVar1 = FUN_1005faf0(&DAT_10195540,1), iVar1 != 0)) {
        iVar1 = FUN_1005faf0(&DAT_10195820,1);
        return iVar1 != 0;
      }
    }
  }
  return false;
}


