
void FUN_00463e40(void)

{
  int *piVar1;
  int iVar2;
  undefined4 *unaff_EBX;
  int *unaff_EDI;
  
  piVar1 = (int *)*unaff_EBX;
  if (piVar1 != (int *)0x0) {
    iVar2 = __stricmp((char *)unaff_EDI[1],(char *)piVar1[1]);
    if (-1 < iVar2) {
      iVar2 = *piVar1;
      while ((iVar2 != 0 &&
             (iVar2 = __stricmp((char *)unaff_EDI[1],*(char **)(*piVar1 + 4)), -1 < iVar2))) {
        piVar1 = (int *)*piVar1;
        iVar2 = *piVar1;
      }
      *unaff_EDI = *piVar1;
      *piVar1 = (int)unaff_EDI;
      return;
    }
    *unaff_EDI = (int)piVar1;
  }
  *unaff_EBX = unaff_EDI;
  return;
}

