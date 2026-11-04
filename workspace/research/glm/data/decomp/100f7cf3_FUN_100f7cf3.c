// 100f7cf3 size=35 FUN_100f7cf3

undefined1 * FUN_100f7cf3(void)

{
  bool bVar1;
  int iVar2;
  undefined **ppuVar3;
  undefined **ppuVar4;
  
  bVar1 = true;
  if (DAT_101a47c4 == (undefined1 *)0x0) {
    DAT_101a47c4 = _malloc(0x351);
    if (DAT_101a47c4 == (undefined1 *)0x0) {
      return (undefined1 *)0x0;
    }
  }
  *DAT_101a47c4 = 0;
  __strcats(DAT_101a47c4,3,PTR_s_LC_COLLATE_101a47cc,&DAT_1019563c,PTR_DAT_101a47d0);
  ppuVar3 = &PTR_DAT_101a47d0;
  do {
    FUN_100fe8a0(DAT_101a47c4,&DAT_10195820);
    ppuVar4 = ppuVar3 + 3;
    iVar2 = _strcmp(*ppuVar3,*ppuVar4);
    if (iVar2 != 0) {
      bVar1 = false;
    }
    __strcats(DAT_101a47c4,3,ppuVar3[2],&DAT_1019563c,*ppuVar4);
    ppuVar3 = ppuVar4;
  } while ((int)ppuVar4 < 0x101a4800);
  if (!bVar1) {
    return DAT_101a47c4;
  }
  _free(DAT_101a47c4);
  DAT_101a47c4 = (undefined1 *)0x0;
  return PTR_DAT_101a47dc;
}


