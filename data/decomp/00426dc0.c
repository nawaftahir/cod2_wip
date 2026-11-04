
void FUN_00426dc0(void)

{
  undefined4 uVar1;
  int unaff_ESI;
  
  FUN_00426c90();
  if (DAT_01128d94 == 1) {
    *(undefined1 *)(unaff_ESI + 0x382f) = 0;
  }
  if (*(void **)(unaff_ESI + 0x3824) != (void *)0x0) {
    _free(*(void **)(unaff_ESI + 0x3824));
  }
  uVar1 = FUN_004267d0(DAT_01128d94,0,0);
  *(short *)(unaff_ESI + 0x382c) = *(short *)(unaff_ESI + 0x382c) + 1;
  *(undefined4 *)(unaff_ESI + 0x3824) = uVar1;
  return;
}

