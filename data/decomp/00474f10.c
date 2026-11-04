
int FUN_00474f10(void)

{
  undefined4 *puVar1;
  int iVar2;
  int in_EAX;
  undefined4 *unaff_EDI;
  
  iVar2 = *(int *)(in_EAX + 8);
  if (iVar2 < 0) {
                    /* WARNING: Subroutine does not return */
    FUN_004f3bd2();
  }
  FUN_00474d60(iVar2 + 1);
  puVar1 = (undefined4 *)(*(int *)(in_EAX + 4) + iVar2 * 0xc);
  *puVar1 = *unaff_EDI;
  puVar1[1] = unaff_EDI[1];
  puVar1[2] = unaff_EDI[2];
  return iVar2;
}

