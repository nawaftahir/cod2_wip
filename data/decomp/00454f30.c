
undefined4 FUN_00454f30(void)

{
  int iVar1;
  int unaff_EBX;
  int iVar2;
  
  iVar2 = 0;
  if (0 < unaff_EBX) {
    do {
      iVar1 = FUN_0045f860(0x3c23d70a);
      if (iVar1 != 0) {
        return 1;
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 < unaff_EBX);
  }
  return 0;
}

