// 1008149e size=80 FUN_1008149e

int FUN_1008149e(int param_1,int param_2,uint param_3)

{
  int iVar1;
  
  if (param_2 == 0) {
    if (*(uint *)(param_1 + 0x18) <= param_3) {
      return 0;
    }
    iVar1 = *(int *)(*(int *)(param_1 + 0x14) + param_3 * 4);
  }
  else {
    if (param_2 < 0) {
      param_1 = -param_2;
    }
    else {
      iVar1 = FUN_100811b0(param_2,&param_1);
      if (iVar1 < 0) {
        return 0;
      }
    }
    iVar1 = FUN_1007da77(param_3);
    if (iVar1 == 0) {
      return 0;
    }
  }
  return -iVar1;
}


