// 10016e70 size=80 FUN_10016e70

void FUN_10016e70(void)

{
  int iVar1;
  
  FUN_100179a0(&DAT_101d0b08,&DAT_101d0b08 + DAT_101d0b04,DAT_101d0b04 * 4 >> 2,&LAB_10016890);
  iVar1 = 0;
  if (0 < DAT_101d0b04) {
    do {
      *(short *)((&DAT_101d0b08)[iVar1] + 10) = (short)iVar1;
      iVar1 = iVar1 + 1;
    } while (iVar1 < DAT_101d0b04);
  }
  return;
}


