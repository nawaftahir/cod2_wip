// 10081eec size=42 FUN_10081eec

undefined4 FUN_10081eec(int param_1,undefined4 *param_2)

{
  undefined4 uVar1;
  
  if (param_2 == (undefined4 *)0x0) {
    uVar1 = 0x8876086c;
  }
  else {
    *param_2 = *(undefined4 *)(param_1 + 8);
    (**(code **)(**(int **)(param_1 + 8) + 4))(*(int **)(param_1 + 8));
    uVar1 = 0;
  }
  return uVar1;
}


