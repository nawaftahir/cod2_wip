
int FUN_004803e0(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int unaff_EDI;
  
  if (unaff_EDI == 0xfff) {
    return 0xfff;
  }
  iVar3 = 0;
  if (0 < unaff_EDI) {
    do {
      iVar1 = FUN_004965d0();
      if (iVar1 == 0) {
        return unaff_EDI;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < unaff_EDI);
  }
  uVar2 = FUN_00489dd0();
  *(undefined4 *)(param_1 + unaff_EDI * 4) = uVar2;
  return unaff_EDI + 1;
}

