
void FUN_004270a0(undefined4 param_1)

{
  int unaff_EBX;
  int unaff_ESI;
  
  if ((*(byte *)(unaff_ESI + 0x10) & 0x40) == 0) {
    FUN_00426f20();
  }
  else {
    FUN_00426e80();
  }
  if (unaff_EBX == 1) {
    *(undefined1 *)(unaff_ESI + 0x382f) = 1;
    *(undefined4 *)(unaff_ESI + 0x3834) = param_1;
  }
  return;
}

