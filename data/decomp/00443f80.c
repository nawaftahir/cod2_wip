
void FUN_00443f80(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int unaff_ESI;
  
  iVar3 = DAT_0109fdcc;
  if ((DAT_0109fdcc != 0) && (*(int *)(DAT_0109fdcc + 0xc) == 0)) {
    for (iVar1 = *(int *)(unaff_ESI + 4); (iVar1 != 0 && (iVar1 != unaff_ESI));
        iVar1 = *(int *)(iVar1 + 4)) {
      iVar2 = *(int *)(iVar1 + 0x14);
      *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)(iVar3 + 8);
      iVar2 = *(int *)(iVar2 + 8);
      if (*(int *)(*(int *)(iVar2 + 0x50) + 8) != 0) {
        *(undefined4 *)(iVar2 + 0x6c) = *(undefined4 *)(iVar3 + 8);
      }
    }
  }
  return;
}

