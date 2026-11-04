// 1000e330 size=515 FUN_1000e330

void FUN_1000e330(undefined4 *param_1,code *param_2)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  
  iVar2 = (int)param_1 - (int)unaff_ESI >> 2;
  if (iVar2 < 0x29) {
    iVar2 = (*param_2)(*unaff_EDI,*unaff_ESI);
    if (iVar2 != 0) {
      uVar1 = *unaff_EDI;
      *unaff_EDI = *unaff_ESI;
      *unaff_ESI = uVar1;
    }
    iVar2 = (*param_2)(*param_1,*unaff_EDI);
    if (iVar2 != 0) {
      uVar1 = *param_1;
      *param_1 = *unaff_EDI;
      *unaff_EDI = uVar1;
    }
    iVar2 = (*param_2)(*unaff_EDI,*unaff_ESI);
    if (iVar2 != 0) {
      uVar1 = *unaff_EDI;
      *unaff_EDI = *unaff_ESI;
      *unaff_ESI = uVar1;
    }
  }
  else {
    iVar2 = iVar2 + 1;
    iVar2 = (int)(iVar2 + (iVar2 >> 0x1f & 7U)) >> 3;
    iVar3 = (*param_2)(unaff_ESI[iVar2],*unaff_ESI);
    if (iVar3 != 0) {
      uVar1 = unaff_ESI[iVar2];
      unaff_ESI[iVar2] = *unaff_ESI;
      *unaff_ESI = uVar1;
    }
    iVar3 = (*param_2)(unaff_ESI[iVar2 * 2],unaff_ESI[iVar2]);
    if (iVar3 != 0) {
      uVar1 = unaff_ESI[iVar2 * 2];
      unaff_ESI[iVar2 * 2] = unaff_ESI[iVar2];
      unaff_ESI[iVar2] = uVar1;
    }
    iVar3 = (*param_2)(unaff_ESI[iVar2],*unaff_ESI);
    if (iVar3 != 0) {
      uVar1 = unaff_ESI[iVar2];
      unaff_ESI[iVar2] = *unaff_ESI;
      *unaff_ESI = uVar1;
    }
    puVar4 = unaff_EDI + -iVar2;
    iVar3 = (*param_2)(*unaff_EDI,*puVar4);
    if (iVar3 != 0) {
      uVar1 = *unaff_EDI;
      *unaff_EDI = *puVar4;
      *puVar4 = uVar1;
    }
    iVar3 = (*param_2)(unaff_EDI[iVar2],*unaff_EDI);
    if (iVar3 != 0) {
      uVar1 = unaff_EDI[iVar2];
      unaff_EDI[iVar2] = *unaff_EDI;
      *unaff_EDI = uVar1;
    }
    iVar3 = (*param_2)(*unaff_EDI,*puVar4);
    if (iVar3 != 0) {
      uVar1 = *unaff_EDI;
      *unaff_EDI = *puVar4;
      *puVar4 = uVar1;
    }
    puVar4 = param_1 + iVar2 * -2;
    puVar5 = param_1 + -iVar2;
    iVar3 = (*param_2)(*puVar5,*puVar4);
    if (iVar3 != 0) {
      uVar1 = *puVar5;
      *puVar5 = *puVar4;
      *puVar4 = uVar1;
    }
    iVar3 = (*param_2)(*param_1,*puVar5);
    if (iVar3 != 0) {
      uVar1 = *param_1;
      *param_1 = *puVar5;
      *puVar5 = uVar1;
    }
    iVar3 = (*param_2)(*puVar5,*puVar4);
    if (iVar3 != 0) {
      uVar1 = *puVar5;
      *puVar5 = *puVar4;
      *puVar4 = uVar1;
    }
    iVar3 = (*param_2)(*unaff_EDI,unaff_ESI[iVar2]);
    if (iVar3 != 0) {
      uVar1 = *unaff_EDI;
      *unaff_EDI = unaff_ESI[iVar2];
      unaff_ESI[iVar2] = uVar1;
    }
    iVar3 = (*param_2)(*puVar5,*unaff_EDI);
    if (iVar3 != 0) {
      uVar1 = *puVar5;
      *puVar5 = *unaff_EDI;
      *unaff_EDI = uVar1;
    }
    iVar3 = (*param_2)(*unaff_EDI,unaff_ESI[iVar2]);
    if (iVar3 != 0) {
      uVar1 = *unaff_EDI;
      *unaff_EDI = unaff_ESI[iVar2];
      unaff_ESI[iVar2] = uVar1;
      return;
    }
  }
  return;
}


