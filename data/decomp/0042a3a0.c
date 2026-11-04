
void __fastcall FUN_0042a3a0(int param_1)

{
  char in_AL;
  int iVar1;
  int *piVar2;
  int *unaff_EDI;
  
  if (in_AL == '\0') {
    DAT_010c4d84 = 0;
  }
  iVar1 = 0;
  if (0 < *unaff_EDI) {
    piVar2 = unaff_EDI + param_1 * 0xe + 9;
    do {
      if ((*(byte *)(piVar2 + 0xd) & 2) == 0) {
        FUN_0042a0a0();
      }
      iVar1 = iVar1 + 1;
      piVar2 = piVar2 + 0xe0;
    } while (iVar1 < *unaff_EDI);
  }
  return;
}

