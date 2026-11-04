// 1007e28e size=44 FUN_1007e28e

undefined4 FUN_1007e28e(int param_1,uint param_2,uint param_3)

{
  undefined4 uVar1;
  
  if (param_3 < 5) {
    uVar1 = *(undefined4 *)
             (*(int *)(param_1 + (param_2 & 0xfffffffc)) + ((param_2 & 3) + param_3 * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


