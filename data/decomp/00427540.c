
void __fastcall FUN_00427540(int *param_1)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *unaff_EDI;
  
  iVar4 = 0;
  if (0 < *unaff_EDI) {
    piVar1 = unaff_EDI + 0xb;
    iVar5 = unaff_EDI[1];
    do {
      iVar3 = 0;
      piVar2 = piVar1;
      if (0 < iVar5) {
        do {
          piVar2[-2] = *param_1;
          piVar2[-1] = param_1[1];
          *piVar2 = param_1[2];
          iVar5 = unaff_EDI[1];
          iVar3 = iVar3 + 1;
          piVar2 = piVar2 + 0xe;
        } while (iVar3 < iVar5);
      }
      iVar4 = iVar4 + 1;
      piVar1 = piVar1 + 0xe0;
    } while (iVar4 < *unaff_EDI);
  }
  return;
}

