// 10019f10 size=285 FUN_10019f10

bool FUN_10019f10(void)

{
  ushort uVar1;
  byte bVar2;
  int iVar3;
  char *pcVar4;
  int unaff_ESI;
  undefined4 *unaff_EDI;
  
  iVar3 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar3] != '\0') {
    (&DAT_101a6ab4)[iVar3] = 0;
    *unaff_EDI = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
    *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
  }
  pcVar4 = (char *)FUN_1005f690();
  if (*pcVar4 != '[') {
    FUN_1005f3f0();
    *(undefined1 *)(unaff_ESI + 4) = 0;
    *(undefined1 *)(unaff_ESI + 5) = *(undefined1 *)(*(int *)(unaff_ESI + 0xc) + 8);
    return true;
  }
  bVar2 = FUN_1005ff30();
  *(byte *)(unaff_ESI + 4) = bVar2;
  uVar1 = *(ushort *)(*(int *)(unaff_ESI + 0xc) + 8);
  if (uVar1 <= bVar2) {
    FUN_1005f360("row index \'%i\' is not in the range [0, %i]\n",bVar2,uVar1 - 1);
    return false;
  }
  pcVar4 = (char *)FUN_1005fa50();
  if (*pcVar4 == ']') {
    *(undefined1 *)(unaff_ESI + 5) = 1;
    return true;
  }
  if (*pcVar4 != ',') {
    FUN_1005f360("expected \',\' or \']\', found \'%s\' instead\n",pcVar4);
    return false;
  }
  iVar3 = FUN_1005ff30();
  bVar2 = *(byte *)(unaff_ESI + 4);
  if (((int)(uint)bVar2 <= iVar3) && (iVar3 < (int)(uint)*(ushort *)(*(int *)(unaff_ESI + 0xc) + 8))
     ) {
    *(byte *)(unaff_ESI + 5) = ((char)iVar3 - bVar2) + '\x01';
    iVar3 = FUN_1005faf0(&DAT_101958a8,1);
    return iVar3 != 0;
  }
  FUN_1005f360("end row index \'%i\' is not in the range [%i, %i]\n",iVar3,(uint)bVar2,
               *(ushort *)(*(int *)(unaff_ESI + 0xc) + 8) - 1);
  return false;
}


