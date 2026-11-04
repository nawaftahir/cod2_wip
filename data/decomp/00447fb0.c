
void FUN_00447fb0(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int *unaff_EDI;
  
  iVar2 = *unaff_EDI;
  if (0x40 < iVar2) {
    FUN_0047a760("Winding_Alloc: %i points",iVar2);
  }
  piVar1 = (int *)thunk_FUN_004ff450(iVar2 * 0xc + 4);
  *piVar1 = *unaff_EDI;
  iVar2 = *unaff_EDI;
  iVar3 = 0;
  if (0 < iVar2) {
    do {
      iVar2 = iVar2 - iVar3;
      piVar1[1] = unaff_EDI[iVar2 * 3 + -2];
      piVar1[2] = unaff_EDI[iVar2 * 3 + -1];
      piVar1[3] = unaff_EDI[iVar2 * 3];
      iVar2 = *unaff_EDI;
      iVar3 = iVar3 + 1;
      piVar1 = piVar1 + 3;
    } while (iVar3 < iVar2);
  }
  return;
}

