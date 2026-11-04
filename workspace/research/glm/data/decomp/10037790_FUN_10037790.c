// 10037790 size=94 FUN_10037790

void FUN_10037790(void)

{
  undefined1 local_40 [64];
  
  if ((DAT_10764578 != 0) && (DAT_101d1b9c != 0)) {
    FUN_10037670();
    (*(code *)RI_FS_FileExists)(local_40,DAT_10764578,DAT_1076457c * 6);
    (*(code *)RI_Z_FreeInternal)(DAT_10764578);
    DAT_10764578 = 0;
    DAT_1076457c = 0;
  }
  return;
}


