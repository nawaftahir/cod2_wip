// 100267e0 size=89 FUN_100267e0

void FUN_100267e0(void)

{
  uint uVar1;
  int iVar2;
  int in_ECX;
  ushort uVar3;
  int iVar4;
  int unaff_ESI;
  int iVar5;
  
  uVar1 = (uint)DAT_101d4928;
  iVar4 = 0;
  uVar3 = DAT_101d4928;
  if (uVar1 != 0) {
    do {
      iVar5 = 0;
      if (uVar1 != 0) {
        do {
          iVar2 = (uVar1 * iVar4 + iVar5) * 4;
          *(undefined1 *)(in_ECX + 0x14 + iVar2) = *(undefined1 *)(unaff_ESI + 2 + iVar2);
          *(undefined1 *)(in_ECX + 0x13 + iVar2) = *(undefined1 *)(unaff_ESI + 1 + iVar2);
          *(undefined1 *)(iVar2 + 0x12 + in_ECX) = *(undefined1 *)(iVar2 + unaff_ESI);
          *(undefined1 *)(in_ECX + 0x15 + iVar2) = *(undefined1 *)(unaff_ESI + 3 + iVar2);
          uVar1 = (uint)DAT_101d4928;
          iVar5 = iVar5 + 1;
          uVar3 = DAT_101d4928;
        } while (iVar5 < (int)uVar1);
      }
      uVar1 = (uint)uVar3;
      iVar4 = iVar4 + 1;
    } while (iVar4 < (int)uVar1);
  }
  return;
}


