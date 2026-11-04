// 1001d230 size=190 FUN_1001d230

void FUN_1001d230(code *param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  char cVar4;
  undefined4 *in_EAX;
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  
  cVar4 = (*param_1)();
  if (cVar4 != '\0') {
    uVar1 = *unaff_ESI;
    uVar2 = unaff_ESI[1];
    uVar3 = unaff_ESI[2];
    *unaff_ESI = *unaff_EDI;
    unaff_ESI[1] = unaff_EDI[1];
    unaff_ESI[2] = unaff_EDI[2];
    *unaff_EDI = uVar1;
    unaff_EDI[1] = uVar2;
    unaff_EDI[2] = uVar3;
  }
  cVar4 = (*param_1)();
  if (cVar4 != '\0') {
    uVar1 = *in_EAX;
    uVar2 = in_EAX[1];
    uVar3 = in_EAX[2];
    *in_EAX = *unaff_ESI;
    in_EAX[1] = unaff_ESI[1];
    in_EAX[2] = unaff_ESI[2];
    *unaff_ESI = uVar1;
    unaff_ESI[1] = uVar2;
    unaff_ESI[2] = uVar3;
  }
  cVar4 = (*param_1)();
  if (cVar4 != '\0') {
    uVar1 = *unaff_ESI;
    uVar2 = unaff_ESI[1];
    uVar3 = unaff_ESI[2];
    *unaff_ESI = *unaff_EDI;
    unaff_ESI[1] = unaff_EDI[1];
    unaff_ESI[2] = unaff_EDI[2];
    *unaff_EDI = uVar1;
    unaff_EDI[1] = uVar2;
    unaff_EDI[2] = uVar3;
  }
  return;
}


