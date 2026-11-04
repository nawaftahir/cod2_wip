// 1007e079 size=43 FUN_1007e079

undefined4 FUN_1007e079(int param_1,int param_2,uint param_3,uint param_4)

{
  undefined4 uVar1;
  
  if ((param_3 < 2) && (param_4 < 5)) {
    uVar1 = *(undefined4 *)(param_1 + (param_4 + (param_2 + param_3) * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


