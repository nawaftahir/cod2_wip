// 10003810 size=97 FUN_10003810

void FUN_10003810(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = 0;
  if (0 < DAT_101ae384) {
    iVar2 = 0;
    do {
      FUN_100298a0(*(undefined4 *)(iVar2 + 0x1c + DAT_101ae388));
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x3c;
    } while (iVar1 < DAT_101ae384);
  }
  iVar1 = 0;
  if (0 < DAT_101ae384) {
    iVar2 = 0;
    do {
      FUN_10029bf0(&DAT_101ae288,*(undefined4 *)(iVar2 + 0x1c + DAT_101ae388));
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x3c;
    } while (iVar1 < DAT_101ae384);
  }
  return;
}


