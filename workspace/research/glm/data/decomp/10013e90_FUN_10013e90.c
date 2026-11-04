// 10013e90 size=144 FUN_10013e90

void FUN_10013e90(int param_1,int param_2,code *param_3)

{
  int iVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  if ((param_1 != param_2) && (iVar4 = param_1 + 0x10, iVar4 != param_2)) {
    iVar3 = param_1 + 0x20;
    do {
      cVar2 = (*param_3)(iVar4,param_1);
      if (cVar2 == '\0') {
        cVar2 = (*param_3)(iVar4,iVar3 + -0x20);
        iVar1 = iVar3 + -0x20;
        if (cVar2 != '\0') {
          do {
            iVar5 = iVar1;
            cVar2 = (*param_3)(iVar4,iVar5 + -0x10);
            iVar1 = iVar5 + -0x10;
          } while (cVar2 != '\0');
          if ((iVar5 != iVar4) && (iVar4 != iVar3)) {
            FUN_10014480(iVar5,iVar3);
          }
        }
      }
      else if ((param_1 != iVar4) && (iVar4 != iVar3)) {
        FUN_10014480(param_1,iVar3);
      }
      iVar4 = iVar4 + 0x10;
      iVar3 = iVar3 + 0x10;
    } while (iVar4 != param_2);
  }
  return;
}


