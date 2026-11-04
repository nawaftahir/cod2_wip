// 1007dfc3 size=41 FUN_1007dfc3

undefined4 FUN_1007dfc3(int param_1,int param_2,uint param_3,uint param_4)

{
  undefined4 uVar1;
  
  if ((param_3 < 2) && (param_4 < 2)) {
    uVar1 = *(undefined4 *)(param_1 + (param_2 + param_3 + param_4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


