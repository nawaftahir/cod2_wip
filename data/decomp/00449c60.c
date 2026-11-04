
void FUN_00449c60(void)

{
  int iVar1;
  int unaff_EDI;
  
  iVar1 = *(int *)(unaff_EDI + 4);
  while ((iVar1 != 0 && (iVar1 != unaff_EDI))) {
    iVar1 = *(int *)(iVar1 + 4);
    FUN_00458c00();
  }
  return;
}

