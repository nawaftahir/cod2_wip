// 1007e0a4 size=33 FUN_1007e0a4

undefined4 FUN_1007e0a4(int param_1,int param_2,uint param_3)

{
  undefined4 uVar1;
  
  if (param_3 < 5) {
    uVar1 = *(undefined4 *)(param_1 + (param_3 + param_2 * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


