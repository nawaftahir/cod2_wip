// 1005fc80 size=222 FUN_1005fc80

int FUN_1005fc80(void)

{
  char cVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  char *pcVar8;
  undefined4 *unaff_ESI;
  
  iVar6 = DAT_101aac70 * 0x45c;
  cVar1 = (&DAT_101a6ab4)[iVar6];
  uVar2 = *unaff_ESI;
  uVar3 = *(undefined4 *)(&DAT_101a6ab0 + iVar6);
  uVar4 = *(undefined4 *)(&DAT_101a6ac4 + iVar6);
  uVar5 = *(undefined4 *)(&DAT_101a6ac8 + iVar6);
  iVar6 = 0;
  do {
    iVar7 = DAT_101aac70 * 0x45c;
    pcVar8 = &DAT_101a66b0 + iVar7;
    if ((&DAT_101a6ab4)[iVar7] == '\0') {
LAB_1005fd01:
      pcVar8 = (char *)FUN_1005f690();
    }
    else {
      (&DAT_101a6ab4)[iVar7] = 0;
      if ((&DAT_101a6ab5)[iVar7] != '\0') {
        *unaff_ESI = *(undefined4 *)(&DAT_101a6ac8 + iVar7);
        *(undefined4 *)(&DAT_101a6ab0 + iVar7) = *(undefined4 *)(&DAT_101a6ac4 + iVar7);
        goto LAB_1005fd01;
      }
    }
    if (*pcVar8 == '\0') {
      iVar7 = DAT_101aac70 * 0x45c;
      *(undefined4 *)(&DAT_101a6ab0 + iVar7) = uVar3;
      *unaff_ESI = uVar2;
      (&DAT_101a6ab4)[iVar7] = cVar1 != '\0';
      *(undefined4 *)(&DAT_101a6ac4 + iVar7) = uVar4;
      *(undefined4 *)(&DAT_101a6ac8 + iVar7) = uVar5;
      return iVar6;
    }
    iVar6 = iVar6 + 1;
  } while( true );
}


