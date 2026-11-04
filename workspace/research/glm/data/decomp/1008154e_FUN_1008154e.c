// 1008154e size=61 FUN_1008154e

int FUN_1008154e(undefined4 param_1,int param_2,undefined4 param_3)

{
  int iVar1;
  
  if (param_2 < 0) {
    param_2 = -param_2;
  }
  else {
    iVar1 = FUN_100811b0(param_2,&param_2);
    if (iVar1 < 0) {
      return 0;
    }
  }
  iVar1 = FUN_10080c7b(param_3);
  if (iVar1 == 0) {
    return 0;
  }
  return -iVar1;
}


