
void FUN_00447f60(void)

{
  int *in_EAX;
  int *piVar1;
  uint uVar2;
  int iVar3;
  
  iVar3 = *in_EAX;
  if (0x40 < iVar3) {
    FUN_0047a760("Winding_Alloc: %i points",iVar3);
  }
  piVar1 = (int *)thunk_FUN_004ff450(iVar3 * 0xc + 4);
  iVar3 = *in_EAX;
  *piVar1 = iVar3;
  uVar2 = iVar3 * 3 & 0x3fffffff;
  while( true ) {
    piVar1 = piVar1 + 1;
    in_EAX = in_EAX + 1;
    if (uVar2 == 0) break;
    uVar2 = uVar2 - 1;
    *piVar1 = *in_EAX;
  }
  for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
    *(char *)piVar1 = (char)*in_EAX;
    in_EAX = (int *)((int)in_EAX + 1);
    piVar1 = (int *)((int)piVar1 + 1);
  }
  return;
}

