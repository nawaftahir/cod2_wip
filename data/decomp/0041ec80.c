
void FUN_0041ec80(void)

{
  int unaff_ESI;
  
  FUN_0041ecf0();
  FUN_0041ed40();
  if (*(void **)(unaff_ESI + 0x30) != (void *)0x0) {
    _free(*(void **)(unaff_ESI + 0x30));
  }
  *(undefined4 *)(unaff_ESI + 0x30) = 0;
  *(undefined4 *)(unaff_ESI + 0x24) = 0;
  *(undefined4 *)(unaff_ESI + 0x28) = 0;
  *(undefined4 *)(unaff_ESI + 0x34) = 0;
  *(undefined4 *)(unaff_ESI + 0x70) = 0;
  *(undefined1 *)(unaff_ESI + 0x6d) = 1;
  *(undefined4 *)(unaff_ESI + 0x68) = 0x3ccccccd;
  *(undefined4 *)(unaff_ESI + 0x40) = 0;
  *(undefined4 *)(unaff_ESI + 0x3c) = 0x3f000000;
  *(undefined4 *)(unaff_ESI + 0x38) = 0x3f800000;
  *(undefined4 *)(unaff_ESI + 0x54) = 0;
  *(undefined4 *)(unaff_ESI + 0x50) = 0x3f333333;
  *(undefined4 *)(unaff_ESI + 0x58) = 0x3f800000;
  *(undefined4 *)(unaff_ESI + 0x44) = 0;
  *(undefined4 *)(unaff_ESI + 0x48) = 0;
  *(undefined4 *)(unaff_ESI + 0x4c) = 0x3f800000;
  *(undefined4 *)(unaff_ESI + 0x60) = 0;
  *(undefined4 *)(unaff_ESI + 100) = 0;
  *(undefined4 *)(unaff_ESI + 0x5c) = 0x3f800000;
  return;
}

