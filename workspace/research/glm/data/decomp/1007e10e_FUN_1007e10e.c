// 1007e10e size=44 FUN_1007e10e

undefined4 FUN_1007e10e(int param_1,uint param_2,uint param_3)

{
  undefined4 uVar1;
  
  if (param_3 < 5) {
    uVar1 = *(undefined4 *)(param_1 + (param_3 + ((param_2 & 3) + (param_2 & 0xfffffffc)) * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


