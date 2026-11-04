// 100814ee size=96 FUN_100814ee

int FUN_100814ee(int param_1,int param_2,int param_3)

{
  int iVar1;
  
  if (param_2 == 0) {
    if (param_3 < 0) {
      param_1 = -param_3;
    }
    else {
      iVar1 = FUN_100811b0(param_3,&param_1);
      if (iVar1 < 0) {
        return 0;
      }
    }
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
    param_1 = FUN_10081062(param_3,1);
    if (param_1 == 0) {
      return 0;
    }
  }
  return -param_1;
}


