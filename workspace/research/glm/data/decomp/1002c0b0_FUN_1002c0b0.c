// 1002c0b0 size=78 FUN_1002c0b0

void FUN_1002c0b0(void)

{
  undefined1 uVar1;
  int unaff_ESI;
  undefined4 *unaff_EDI;
  
  if (unaff_ESI == 0) {
    *unaff_EDI = 0xffffffff;
    return;
  }
  uVar1 = FUN_1010a8a8();
  *(undefined1 *)unaff_EDI = uVar1;
  uVar1 = FUN_1010a8a8();
  *(undefined1 *)((int)unaff_EDI + 1) = uVar1;
  uVar1 = FUN_1010a8a8();
  *(undefined1 *)((int)unaff_EDI + 2) = uVar1;
  uVar1 = FUN_1010a8a8();
  *(undefined1 *)((int)unaff_EDI + 3) = uVar1;
  return;
}


