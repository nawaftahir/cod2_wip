// 1003a8d0 size=202 FUN_1003a8d0

void FUN_1003a8d0(void)

{
  ushort uVar1;
  int iVar2;
  
  iVar2 = *(int *)(*(int *)(DAT_1072d9bc + 0x38) + 4 + DAT_1072d9c0 * 4);
  if (iVar2 != 0) {
    if (DAT_1072debc != '\0') {
      FUN_1003e9b0();
    }
    if (((DAT_10766748 == '\0') &&
        ((uVar1 = *(ushort *)(iVar2 + 4), (uVar1 & 1) == 0 || (DAT_10730554 != 0xe)))) &&
       (((uVar1 & 2) == 0 || (DAT_10730558 != 0xe)))) {
      if (DAT_1072d9e0 != 0) {
        FUN_1003a690();
      }
      if (DAT_1072d9d0 != 0) {
        FUN_1003a7b0();
      }
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s","---------- RB_EndSurface\n");
        _fflush(DAT_10764584);
      }
      return;
    }
  }
  DAT_1072d9e0 = 0;
  DAT_1072d9d0 = 0;
  DAT_1072d9d4 = 0;
  return;
}


