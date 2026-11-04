// 1007e18e size=44 FUN_1007e18e

undefined4 FUN_1007e18e(int param_1,uint param_2,uint param_3)

{
  undefined4 uVar1;
  
  if (param_3 < 5) {
    uVar1 = *(undefined4 *)
             (*(int *)(param_1 + (param_2 & 0xfffffffc)) + (param_3 + (param_2 & 3) * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


