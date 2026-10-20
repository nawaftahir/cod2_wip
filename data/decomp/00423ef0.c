
void FUN_00423ef0(void)

{
  int iVar1;
  int iVar2;
  int *unaff_EDI;
  
  iVar1 = *unaff_EDI;
  iVar2 = *(int *)(iVar1 + -0xc);
  if ((int)(1U - *(int *)(iVar1 + -4) | *(int *)(iVar1 + -8) - iVar2) < 0) {
    FUN_00402d30(iVar2);
  }
  __mbslwr((uchar *)*unaff_EDI);
  if ((-1 < iVar2) && (iVar2 <= *(int *)(*unaff_EDI + -8))) {
    *(int *)(*unaff_EDI + -0xc) = iVar2;
    *(undefined1 *)(iVar2 + *unaff_EDI) = 0;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

