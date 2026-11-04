// 1003a690 size=273 FUN_1003a690

void FUN_1003a690(void)

{
  undefined4 uVar1;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  local_8 = DAT_1072d9e8;
  local_10 = DAT_1072d9e4;
  local_c = DAT_1072d9e0 / 3;
  local_14 = 0;
  local_4 = FUN_100386b0(DAT_1072d9b4);
  if (DAT_1072d9b8 == 1) {
    if (((DAT_10766750 != *(int *)(DAT_101d1b9c + 0x30)) || (DAT_10766754 != 0)) ||
       (DAT_10766758 != ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffdc) + 0x44)) {
      FUN_1003ed20(*(int *)(DAT_101d1b9c + 0x30));
    }
    uVar1 = 1;
  }
  else {
    if (((DAT_10766750 != DAT_101d49b4) || (DAT_10766754 != 0)) ||
       (DAT_10766758 != ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffd8) + 0x40)) {
      FUN_1003ed20(DAT_101d49b4);
    }
    uVar1 = 3;
  }
  FUN_1003a580(uVar1,&local_14);
  DAT_1072d9e0 = 0;
  DAT_1072d9b8 = 0;
  return;
}


