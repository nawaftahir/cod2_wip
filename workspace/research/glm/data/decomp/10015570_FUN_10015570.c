// 10015570 size=35 FUN_10015570

void FUN_10015570(void)

{
  int iVar1;
  int *in_ECX;
  int unaff_ESI;
  int unaff_EDI;
  
  iVar1 = 0;
  if (0 < *in_ECX) {
    do {
      if (*(int *)(unaff_ESI + iVar1 * 4) == unaff_EDI) {
        return;
      }
      iVar1 = iVar1 + 1;
    } while (iVar1 < *in_ECX);
  }
  *(int *)(unaff_ESI + *in_ECX * 4) = unaff_EDI;
  *in_ECX = *in_ECX + 1;
  return;
}


