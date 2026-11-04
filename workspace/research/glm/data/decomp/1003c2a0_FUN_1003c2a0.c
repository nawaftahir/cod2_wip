// 1003c2a0 size=252 FUN_1003c2a0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003c2a0(void)

{
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = &DAT_10764680;
  for (iVar1 = 0x85c; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  DAT_1072debe = (&DAT_101906b0)[*(int *)(DAT_101ce644 + 8)];
  FUN_1003d860();
  DAT_1076668c = 0xe00e0007;
  DAT_10766684 = 0xe00e0007;
  DAT_1072dde8 = DAT_101d4c6c;
  DAT_10766738 = DAT_101d4c6c;
  DAT_10766688 = 0x19128912;
  DAT_10766680 = 0x18128812;
  DAT_10766690 = 0;
  DAT_1072dde0 = 0;
  DAT_1072dde4 = 0;
  DAT_1072ddec = DAT_101d4c70;
  DAT_10766730 = 0;
  DAT_10766734 = 0;
  DAT_1076673c = DAT_101d4c70;
  _DAT_10766740 = 0;
  _DAT_10766744 = 0x3f800000;
  DAT_10766718 = 0xe;
  FUN_1003ea30();
  DAT_10766748 = 0;
  FUN_1003c100();
  iVar1 = 0;
  do {
    (&DAT_10766774)[iVar1] = 0;
    (&DAT_10766764)[iVar1] = 1;
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0x10);
  _DAT_107667b4 = 1;
  DAT_107667cc = 0xffffffff;
  puVar2 = &DAT_10764680;
  for (iVar1 = 0x400; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xffffffff;
    puVar2 = puVar2 + 1;
  }
  puVar2 = &DAT_10765680;
  for (iVar1 = 0x400; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xffffffff;
    puVar2 = puVar2 + 1;
  }
  return;
}


