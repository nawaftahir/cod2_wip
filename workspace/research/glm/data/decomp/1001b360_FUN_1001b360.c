// 1001b360 size=764 FUN_1001b360

undefined4 FUN_1001b360(int param_1)

{
  char cVar1;
  undefined4 *in_EAX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  uint uVar5;
  undefined2 *puVar6;
  undefined1 *puVar7;
  ushort uVar8;
  char *pcVar9;
  bool bVar10;
  
  uVar8 = 0;
  do {
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar3 = (char *)FUN_1005f690();
    iVar2 = 8;
    bVar10 = true;
    pcVar4 = pcVar3;
    pcVar9 = "texture";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar10 = *pcVar4 == *pcVar9;
      pcVar4 = pcVar4 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar10);
    if (!bVar10) {
      pcVar4 = "texture";
LAB_1001b650:
      FUN_1005f360("MatchToken: %s != %s\n",pcVar3,pcVar4);
      return 0;
    }
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar3 = (char *)FUN_1005f690();
    iVar2 = 2;
    bVar10 = true;
    pcVar4 = pcVar3;
    pcVar9 = "[";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar10 = *pcVar4 == *pcVar9;
      pcVar4 = pcVar4 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar10);
    if (!bVar10) {
      pcVar4 = "[";
      goto LAB_1001b650;
    }
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar4 = (char *)FUN_1005f690();
    uVar5 = _atol(pcVar4);
    if (uVar5 != uVar8) {
      FUN_1005f360("expected %i, found %i instead\n",(uint)uVar8,uVar5);
      return 0;
    }
    iVar2 = FUN_1005faf0(&DAT_101958a8,1);
    if (iVar2 == 0) {
      return 0;
    }
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar3 = (char *)FUN_1005f690();
    iVar2 = 2;
    bVar10 = true;
    pcVar4 = pcVar3;
    pcVar9 = "=";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar10 = *pcVar4 == *pcVar9;
      pcVar4 = pcVar4 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar10);
    if (!bVar10) {
      pcVar4 = "=";
      goto LAB_1001b650;
    }
    uVar5 = (uint)uVar8;
    cVar1 = FUN_10019620(param_1 + 0xc + uVar5 * 8);
    if (cVar1 == '\0') {
      return 0;
    }
    iVar2 = FUN_1005faf0(&DAT_10195820,1);
    if (iVar2 == 0) {
      return 0;
    }
    cVar1 = FUN_1001b100(uVar5,uVar5 + 9 + param_1);
    if (cVar1 == '\0') {
      return 0;
    }
    uVar8 = uVar8 + 1;
    if (uVar8 == 2) {
      return 1;
    }
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      (&DAT_101a6ab4)[iVar2] = 0;
      *in_EAX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar4 = (char *)FUN_1005f690();
    bVar10 = true;
    iVar2 = 8;
    pcVar9 = "texture";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar10 = *pcVar4 == *pcVar9;
      pcVar4 = pcVar4 + 1;
      pcVar9 = pcVar9 + 1;
    } while (bVar10);
    iVar2 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      FUN_1005f2d0("UngetToken called twice");
    }
    (&DAT_101a6ab4)[iVar2] = 1;
    DAT_101aac74 = DAT_101aac78;
    if (!bVar10) {
      if (uVar8 < 2) {
        puVar7 = (undefined1 *)(uVar8 + 9 + param_1);
        puVar6 = (undefined2 *)(param_1 + 0xc + (uint)uVar8 * 8);
        do {
          puVar6[1] = uVar8;
          *puVar6 = 3;
          *(undefined4 *)(puVar6 + 2) = 1;
          uVar8 = uVar8 + 1;
          puVar6 = puVar6 + 4;
          *puVar7 = 0;
          puVar7 = puVar7 + 1;
        } while (uVar8 < 2);
      }
      return 1;
    }
  } while( true );
}


