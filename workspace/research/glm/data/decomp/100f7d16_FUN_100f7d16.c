// 100f7d16 size=156 FUN_100f7d16

undefined * FUN_100f7d16(void)

{
  undefined1 *in_EAX;
  int iVar1;
  int unaff_EBP;
  undefined **ppuVar2;
  undefined **ppuVar3;
  
  *in_EAX = 0;
  __strcats(DAT_101a47c4,3,PTR_s_LC_COLLATE_101a47cc,&DAT_1019563c,PTR_DAT_101a47d0);
  ppuVar2 = &PTR_DAT_101a47d0;
  do {
    FUN_100fe8a0(DAT_101a47c4,&DAT_10195820);
    ppuVar3 = ppuVar2 + 3;
    iVar1 = _strcmp(*ppuVar2,*ppuVar3);
    if (iVar1 != 0) {
      unaff_EBP = 0;
    }
    __strcats(DAT_101a47c4,3,ppuVar2[2],&DAT_1019563c,*ppuVar3);
    ppuVar2 = ppuVar3;
  } while ((int)ppuVar3 < 0x101a4800);
  if (unaff_EBP == 0) {
    return DAT_101a47c4;
  }
  _free(DAT_101a47c4);
  DAT_101a47c4 = (undefined *)0x0;
  return PTR_DAT_101a47dc;
}


