
void FUN_0042fad0(int param_1)

{
  undefined4 uVar1;
  int unaff_ESI;
  
  if ((*(byte *)(unaff_ESI + 0x10) & 0x40) == 0) {
    FUN_00426f20();
  }
  else {
    FUN_00426e80(1,(float)param_1);
  }
  *(float *)(unaff_ESI + 0x3834) = (float)param_1;
  *(undefined1 *)(unaff_ESI + 0x382f) = 1;
  if (DAT_01128d90 == 1) {
    if (*(void **)(unaff_ESI + 0x3824) != (void *)0x0) {
      _free(*(void **)(unaff_ESI + 0x3824));
    }
    uVar1 = FUN_004267d0(DAT_01128d94,0,0);
    *(short *)(unaff_ESI + 0x382c) = *(short *)(unaff_ESI + 0x382c) + 1;
    *(undefined4 *)(unaff_ESI + 0x3824) = uVar1;
  }
  return;
}

