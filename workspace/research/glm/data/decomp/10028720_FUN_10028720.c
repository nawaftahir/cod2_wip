// 10028720 size=100 FUN_10028720

void FUN_10028720(code *param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  char cVar3;
  undefined4 *unaff_EBX;
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  
  cVar3 = (*param_1)();
  if (cVar3 != '\0') {
    uVar1 = *unaff_ESI;
    uVar2 = unaff_ESI[1];
    *unaff_ESI = *unaff_EDI;
    unaff_ESI[1] = unaff_EDI[1];
    *unaff_EDI = uVar1;
    unaff_EDI[1] = uVar2;
  }
  cVar3 = (*param_1)();
  if (cVar3 != '\0') {
    uVar1 = *unaff_EBX;
    uVar2 = unaff_EBX[1];
    *unaff_EBX = *unaff_ESI;
    unaff_EBX[1] = unaff_ESI[1];
    *unaff_ESI = uVar1;
    unaff_ESI[1] = uVar2;
  }
  cVar3 = (*param_1)();
  if (cVar3 != '\0') {
    uVar1 = *unaff_ESI;
    uVar2 = unaff_ESI[1];
    *unaff_ESI = *unaff_EDI;
    unaff_ESI[1] = unaff_EDI[1];
    *unaff_EDI = uVar1;
    unaff_EDI[1] = uVar2;
  }
  return;
}


