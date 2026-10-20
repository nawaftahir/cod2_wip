
void FUN_00456fb0(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  int unaff_EDI;
  
  iVar2 = 0;
  if (0 < *(int *)(unaff_EDI + 0x38)) {
    iVar1 = 0;
    do {
      FUN_00456f30(*(int *)(unaff_EDI + 0x3c) + iVar1,param_1,param_2);
      iVar2 = iVar2 + 1;
      iVar1 = iVar1 + 0xa8;
    } while (iVar2 < *(int *)(unaff_EDI + 0x38));
  }
  return;
}

