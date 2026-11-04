// 1001ad80 size=393 FUN_1001ad80

uint FUN_1001ad80(int param_1,uint *param_2)

{
  int iVar1;
  char *pcVar2;
  uint uVar3;
  undefined4 *unaff_EBX;
  char *pcVar4;
  char *pcVar5;
  bool bVar6;
  
  *param_2 = 0;
LAB_1001ad90:
  do {
    iVar1 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar1] != '\0') {
      (&DAT_101a6ab4)[iVar1] = 0;
      *unaff_EBX = *(undefined4 *)(&DAT_101a6ac8 + iVar1);
      *(undefined4 *)(&DAT_101a6ab0 + iVar1) = *(undefined4 *)(&DAT_101a6ac4 + iVar1);
    }
    pcVar2 = (char *)FUN_1005f690();
    iVar1 = 0xb;
    bVar6 = true;
    pcVar4 = pcVar2;
    pcVar5 = "complement";
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar6 = *pcVar4 == *pcVar5;
      pcVar4 = pcVar4 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (bVar6) {
      *param_2 = *param_2 | 8;
      goto LAB_1001ad90;
    }
    iVar1 = 0xf;
    bVar6 = true;
    pcVar4 = pcVar2;
    pcVar5 = "alphaReplicate";
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar6 = *pcVar4 == *pcVar5;
      pcVar4 = pcVar4 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (!bVar6) break;
    *param_2 = *param_2 | 0x10;
  } while( true );
  iVar1 = 7;
  bVar6 = true;
  pcVar4 = pcVar2;
  pcVar5 = "vertex";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar6 = *pcVar4 == *pcVar5;
    pcVar4 = pcVar4 + 1;
    pcVar5 = pcVar5 + 1;
  } while (bVar6);
  if (bVar6) {
    iVar1 = FUN_1005faf0(&DAT_10195640,1);
    uVar3 = 0;
    if (iVar1 != 0) {
      iVar1 = FUN_1005faf0("color",1);
      uVar3 = 0;
      if (iVar1 != 0) {
        uVar3 = *param_2;
        *param_2 = uVar3 | 2;
        return CONCAT31((int3)(uVar3 >> 8),1);
      }
    }
  }
  else {
    iVar1 = 8;
    bVar6 = true;
    pcVar4 = pcVar2;
    pcVar5 = "texture";
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar6 = *pcVar4 == *pcVar5;
      pcVar4 = pcVar4 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (bVar6) {
      uVar3 = FUN_10018370();
      if ((char)uVar3 != '\0') {
        uVar3 = *param_2;
        *param_2 = uVar3 | 5;
        return CONCAT31((int3)(uVar3 >> 8),1);
      }
    }
    else {
      iVar1 = 6;
      bVar6 = true;
      pcVar4 = pcVar2;
      pcVar5 = "stage";
      do {
        if (iVar1 == 0) break;
        iVar1 = iVar1 + -1;
        bVar6 = *pcVar4 == *pcVar5;
        pcVar4 = pcVar4 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar6);
      if (bVar6) {
        if (param_1 == 0) {
          uVar3 = FUN_1005f360(
                              "\'stage\' is not valid for the first texture.  Use \'vertex.color\' instead.\n"
                              );
          return uVar3 & 0xffffff00;
        }
        uVar3 = FUN_10018370();
        if ((char)uVar3 != '\0') {
          uVar3 = *param_2;
          *param_2 = uVar3 | 1;
          return CONCAT31((int3)(uVar3 >> 8),1);
        }
      }
      else {
        iVar1 = 9;
        bVar6 = true;
        pcVar4 = pcVar2;
        pcVar5 = "constant";
        do {
          if (iVar1 == 0) break;
          iVar1 = iVar1 + -1;
          bVar6 = *pcVar4 == *pcVar5;
          pcVar4 = pcVar4 + 1;
          pcVar5 = pcVar5 + 1;
        } while (bVar6);
        if (bVar6) {
          uVar3 = *param_2;
          *param_2 = uVar3 | 6;
          return CONCAT31((int3)(uVar3 >> 8),1);
        }
        uVar3 = FUN_1005f360("unknown texture function argument \'%s\'\n",pcVar2);
      }
    }
  }
  return uVar3 & 0xffffff00;
}


