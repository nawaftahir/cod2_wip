
void FUN_00448060(int param_1)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int *unaff_EBX;
  int iVar4;
  int *unaff_EDI;
  char *pcVar5;
  
  if (*unaff_EDI < param_1) {
    pcVar5 = "Winding_InsertPoint: pointIndex > w->pointCount";
  }
  else {
    if (-1 < param_1) goto LAB_00448082;
    pcVar5 = "Winding_InsertPoint: pointIndex < 0";
  }
  FUN_0047a760(pcVar5);
LAB_00448082:
  iVar4 = *unaff_EDI + 1;
  if (0x40 < iVar4) {
    FUN_0047a760("Winding_Alloc: %i points",iVar4);
  }
  piVar1 = (int *)thunk_FUN_004ff450(iVar4 * 0xc + 4);
  iVar4 = *unaff_EDI;
  iVar3 = 0;
  *piVar1 = iVar4 + 1;
  if (0 < iVar4 + 1) {
    piVar2 = unaff_EDI + 1;
    do {
      if (param_1 == 0) {
        piVar1[1] = *unaff_EBX;
        piVar1[2] = unaff_EBX[1];
        iVar4 = unaff_EBX[2];
      }
      else {
        piVar1[1] = *piVar2;
        piVar1[2] = piVar2[1];
        iVar4 = piVar2[2];
        iVar3 = iVar3 + 1;
        piVar2 = piVar2 + 3;
      }
      piVar1[3] = iVar4;
      iVar3 = iVar3 + 1;
      piVar2 = piVar2 + 3;
    } while (iVar3 < *piVar1);
  }
  return;
}

