// 1005f3f0 size=82 FUN_1005f3f0

void FUN_1005f3f0(void)

{
  int iVar1;
  
  iVar1 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar1] != '\0') {
    FUN_1005f2d0("UngetToken called twice");
    (&DAT_101a6ab4)[iVar1] = 1;
    DAT_101aac74 = DAT_101aac78;
    return;
  }
  (&DAT_101a6ab4)[iVar1] = 1;
  DAT_101aac74 = DAT_101aac78;
  return;
}


