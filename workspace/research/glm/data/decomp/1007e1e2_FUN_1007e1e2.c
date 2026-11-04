// 1007e1e2 size=44 FUN_1007e1e2

undefined4 FUN_1007e1e2(int param_1,int param_2,uint param_3,uint param_4)

{
  undefined4 uVar1;
  
  if ((param_3 < 5) && (param_4 < 5)) {
    uVar1 = *(undefined4 *)(param_1 + (param_3 + (param_4 + param_2 * 4) * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


