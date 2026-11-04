// 10010cb0 size=120 FUN_10010cb0

void FUN_10010cb0(int param_1)

{
  char cVar1;
  char *in_EAX;
  int unaff_EBX;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar3 = 0;
  if (*(int *)(unaff_EBX + 0x10) != *(int *)(unaff_EBX + 0x14)) {
    do {
      iVar2 = *(int *)(unaff_EBX + 0x10);
      do {
        iVar4 = iVar3;
        cVar1 = FUN_10010c00(&DAT_1018a988,9,0xff);
        in_EAX[iVar4] = in_EAX[iVar4] + cVar1;
        iVar2 = iVar2 + -1;
        iVar3 = iVar4 + 1;
      } while (iVar2 != 0);
      in_EAX[iVar4 + 1] = -1;
      iVar3 = iVar4 + 2;
      param_1 = param_1 + -1;
    } while (param_1 != 0);
    return;
  }
  param_1 = *(int *)(unaff_EBX + 0x10) * param_1;
  do {
    cVar1 = FUN_10010c00(&DAT_1018a988,9,0xff);
    *in_EAX = *in_EAX + cVar1;
    in_EAX = in_EAX + 1;
    param_1 = param_1 + -1;
  } while (param_1 != 0);
  return;
}


