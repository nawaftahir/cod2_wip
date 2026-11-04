// 100284e0 size=130 FUN_100284e0

void FUN_100284e0(int param_1,int param_2,code *param_3)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  if ((param_1 != param_2) && (iVar3 = param_1 + 8, iVar3 != param_2)) {
    iVar2 = param_1 + 0x10;
    do {
      cVar1 = (*param_3)(iVar3,param_1);
      iVar4 = param_1;
      if (cVar1 == '\0') {
        cVar1 = (*param_3)(iVar3,iVar2 + -0x10);
        iVar5 = iVar2 + -0x10;
        if (cVar1 != '\0') {
          do {
            iVar4 = iVar5;
            iVar5 = iVar4 + -8;
            cVar1 = (*param_3)(iVar3,iVar5);
          } while (cVar1 != '\0');
          goto joined_r0x1002853c;
        }
      }
      else {
joined_r0x1002853c:
        if ((iVar4 != iVar3) && (iVar3 != iVar2)) {
          FUN_10028930(iVar4);
        }
      }
      iVar3 = iVar3 + 8;
      iVar2 = iVar2 + 8;
    } while (iVar3 != param_2);
  }
  return;
}


