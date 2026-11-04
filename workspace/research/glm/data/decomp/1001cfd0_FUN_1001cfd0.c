// 1001cfd0 size=144 FUN_1001cfd0

void FUN_1001cfd0(int param_1,int param_2,code *param_3)

{
  int iVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  if ((param_1 != param_2) && (iVar4 = param_1 + 0xc, iVar4 != param_2)) {
    iVar3 = param_1 + 0x18;
    do {
      cVar2 = (*param_3)(iVar4,param_1);
      if (cVar2 == '\0') {
        cVar2 = (*param_3)(iVar4,iVar3 + -0x18);
        iVar1 = iVar3 + -0x18;
        if (cVar2 != '\0') {
          do {
            iVar5 = iVar1;
            cVar2 = (*param_3)(iVar4,iVar5 + -0xc);
            iVar1 = iVar5 + -0xc;
          } while (cVar2 != '\0');
          if ((iVar5 != iVar4) && (iVar4 != iVar3)) {
            FUN_1001d550(iVar5,iVar3);
          }
        }
      }
      else if ((param_1 != iVar4) && (iVar4 != iVar3)) {
        FUN_1001d550(param_1,iVar3);
      }
      iVar4 = iVar4 + 0xc;
      iVar3 = iVar3 + 0xc;
    } while (iVar4 != param_2);
  }
  return;
}


