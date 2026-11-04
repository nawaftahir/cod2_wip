// 1007df36 size=32 FUN_1007df36

undefined4 FUN_1007df36(int param_1,int param_2,uint param_3)

{
  undefined4 uVar1;
  
  if (param_3 < 2) {
    uVar1 = *(undefined4 *)(param_1 + (param_2 + param_3) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


