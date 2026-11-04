// 100813b7 size=36 FUN_100813b7

undefined4 FUN_100813b7(int param_1,int *param_2)

{
  undefined4 uVar1;
  
  if (param_1 < 0) {
    *param_2 = -param_1;
    uVar1 = 0;
  }
  else {
    uVar1 = FUN_100811b0(param_1,param_2);
  }
  return uVar1;
}


