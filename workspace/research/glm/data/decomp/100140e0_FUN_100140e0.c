// 100140e0 size=250 FUN_100140e0

void FUN_100140e0(code *param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  char cVar5;
  undefined4 *in_EAX;
  undefined4 *unaff_ESI;
  undefined4 *unaff_EDI;
  
  cVar5 = (*param_1)();
  if (cVar5 != '\0') {
    uVar1 = *unaff_ESI;
    uVar2 = unaff_ESI[1];
    uVar3 = unaff_ESI[2];
    uVar4 = unaff_ESI[3];
    *unaff_ESI = *unaff_EDI;
    unaff_ESI[1] = unaff_EDI[1];
    unaff_ESI[2] = unaff_EDI[2];
    unaff_ESI[3] = unaff_EDI[3];
    *unaff_EDI = uVar1;
    unaff_EDI[1] = uVar2;
    unaff_EDI[2] = uVar3;
    unaff_EDI[3] = uVar4;
  }
  cVar5 = (*param_1)();
  if (cVar5 != '\0') {
    uVar1 = *in_EAX;
    uVar2 = in_EAX[1];
    uVar3 = in_EAX[2];
    uVar4 = in_EAX[3];
    *in_EAX = *unaff_ESI;
    in_EAX[1] = unaff_ESI[1];
    in_EAX[2] = unaff_ESI[2];
    in_EAX[3] = unaff_ESI[3];
    *unaff_ESI = uVar1;
    unaff_ESI[1] = uVar2;
    unaff_ESI[2] = uVar3;
    unaff_ESI[3] = uVar4;
  }
  cVar5 = (*param_1)();
  if (cVar5 != '\0') {
    uVar1 = *unaff_ESI;
    uVar2 = unaff_ESI[1];
    uVar3 = unaff_ESI[2];
    uVar4 = unaff_ESI[3];
    *unaff_ESI = *unaff_EDI;
    unaff_ESI[1] = unaff_EDI[1];
    unaff_ESI[2] = unaff_EDI[2];
    unaff_ESI[3] = unaff_EDI[3];
    *unaff_EDI = uVar1;
    unaff_EDI[1] = uVar2;
    unaff_EDI[2] = uVar3;
    unaff_EDI[3] = uVar4;
  }
  return;
}


