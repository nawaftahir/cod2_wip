// 10017190 size=88 FUN_10017190

void FUN_10017190(void)

{
  DAT_101d1b30 = FUN_10017100(0);
  if ((((*(int *)(DAT_101d1b30 + 0x3c) != *(int *)(DAT_101d1b2c + 0x3c)) ||
       (*(int *)(DAT_101d1b30 + 0x40) != *(int *)(DAT_101d1b2c + 0x40))) ||
      (*(int *)(DAT_101d1b30 + 0x38) != *(int *)(DAT_101d1b2c + 0x38))) &&
     (*(short *)(DAT_101d1b30 + 0x34) != 1)) {
    (*(code *)RI_Printf)(3,"material \'$raw\' doesn\'t use just one image");
    DAT_101d1b30 = DAT_101d1b2c;
  }
  return;
}


