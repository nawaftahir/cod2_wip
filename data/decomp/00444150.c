
void FUN_00444150(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = DAT_012334d4;
  iVar3 = DAT_0109fdcc;
  iVar1 = DAT_00591b28;
  if ((DAT_0109fdcc != 0) && (*(int *)(DAT_0109fdcc + 0xc) == 0)) {
    *(undefined4 *)(DAT_0109fdcc + 0xc) = 1;
    if (iVar1 < iVar2) {
      do {
        if (DAT_0109fdd0 == iVar3) break;
        FUN_00443860();
        iVar3 = DAT_0109fdcc;
      } while (DAT_00591b28 < DAT_012334d4);
    }
    FUN_0047a3c0();
    FUN_0041e160();
  }
  return;
}

