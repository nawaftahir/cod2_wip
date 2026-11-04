// 1008191f size=75 FUN_1008191f

int FUN_1008191f(undefined4 param_1,undefined4 param_2,int param_3,undefined4 param_4)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  
  if (param_3 < 0) {
    iVar3 = -param_3;
  }
  else {
    iVar2 = FUN_100811b0(param_3,&param_3);
    iVar3 = param_3;
    if (iVar2 < 0) {
      return iVar2;
    }
  }
  do {
    iVar2 = FUN_1007ff1d(iVar3,param_2,param_4,1,0);
    if (iVar2 < 0) {
      return iVar2;
    }
    piVar1 = (int *)(iVar3 + 0x24);
    iVar3 = *piVar1;
  } while (*piVar1 != 0);
  return 0;
}


