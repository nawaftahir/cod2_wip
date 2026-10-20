
void __fastcall FUN_0042a3f0(int param_1)

{
  char in_AL;
  int iVar1;
  int iVar2;
  int unaff_EDI;
  
  if (in_AL == '\0') {
    DAT_010c4d84 = 0;
  }
  iVar1 = 0;
  if (0 < *(int *)(unaff_EDI + 4)) {
    iVar2 = param_1 * 0x380 + 0x24 + unaff_EDI;
    do {
      if ((*(byte *)(iVar2 + 0x34) & 2) == 0) {
        FUN_0042a0a0();
      }
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x38;
    } while (iVar1 < *(int *)(unaff_EDI + 4));
  }
  return;
}

