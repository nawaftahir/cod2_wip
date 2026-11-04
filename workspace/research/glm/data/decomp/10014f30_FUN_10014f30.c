// 10014f30 size=131 FUN_10014f30

void FUN_10014f30(int param_1,int param_2)

{
  undefined4 uVar1;
  char cVar2;
  undefined4 *in_EAX;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar4 = param_1;
LAB_10014f36:
  param_1 = iVar4;
  iVar3 = param_1;
  iVar4 = 0;
LAB_10014f40:
  iVar5 = iVar4;
  iVar4 = iVar5 + 1;
  if (iVar4 < iVar3) goto code_r0x10014f45;
  goto LAB_10014f53;
code_r0x10014f45:
  cVar2 = FUN_10014e50();
  if (cVar2 == '\0') {
LAB_10014f53:
    do {
      iVar3 = iVar3 + -1;
      if (iVar3 < iVar4) goto LAB_10014f78;
      cVar2 = FUN_10014e50();
    } while (cVar2 != '\0');
    if (iVar3 < iVar4) goto LAB_10014f78;
    uVar1 = in_EAX[iVar4];
    in_EAX[iVar4] = in_EAX[iVar3];
    in_EAX[iVar3] = uVar1;
  }
  goto LAB_10014f40;
LAB_10014f78:
  if (iVar4 == param_1) {
    uVar1 = *in_EAX;
    *in_EAX = in_EAX[iVar3];
    in_EAX[iVar3] = uVar1;
    iVar4 = iVar5;
  }
  if (iVar4 == param_2) {
    return;
  }
  if (iVar4 < param_2) {
    param_2 = param_2 - iVar4;
    in_EAX = in_EAX + iVar4;
    iVar4 = param_1 - iVar4;
  }
  goto LAB_10014f36;
}


